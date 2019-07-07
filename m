Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 189AD60DF3
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Jul 2019 00:42:35 +0200 (CEST)
Received: from localhost ([::1]:56676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hjWuY-0008C2-93
	for lists+qemu-devel@lfdr.de; Fri, 05 Jul 2019 18:42:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55312)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ehabkost@redhat.com>) id 1hjWVk-0008LE-Fk
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 18:16:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1hjWVT-0003vF-1O
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 18:16:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33970)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hjWVM-0003sp-G6
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 18:16:33 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A83C830821C2;
 Fri,  5 Jul 2019 22:16:29 +0000 (UTC)
Received: from localhost (ovpn-116-30.gru2.redhat.com [10.97.116.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 389CC4C7;
 Fri,  5 Jul 2019 22:16:29 +0000 (UTC)
Date: Fri, 5 Jul 2019 19:16:16 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20190705221616.GK5198@habkost.net>
References: <1562079681-19204-1-git-send-email-pbonzini@redhat.com>
 <1562079681-19204-2-git-send-email-pbonzini@redhat.com>
 <20190705203728.GE5198@habkost.net>
 <0c1f3a3f-c59d-9866-7fc9-3d9c99af17e5@redhat.com>
 <20190705214446.GI5198@habkost.net>
 <2cc393a3-1f8c-896b-ed35-64ca58e70407@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2cc393a3-1f8c-896b-ed35-64ca58e70407@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Fri, 05 Jul 2019 22:16:29 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 1/7] target/i386: handle filtered_features
 in a new function mark_unavailable_features
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Liran Alon <liran.alon@oracle.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jul 06, 2019 at 12:07:29AM +0200, Paolo Bonzini wrote:
> On 05/07/19 23:44, Eduardo Habkost wrote:
> > On Fri, Jul 05, 2019 at 11:32:07PM +0200, Paolo Bonzini wrote:
> >> On 05/07/19 22:37, Eduardo Habkost wrote:
> >>> Filtering and reporting is separate because
> >>> x86_cpu_filter_features() is also called from a QMP command
> >>> handler that is not supposed to generate any warnings on stderr
> >>> (query-cpu-model-expansion).
> >>
> >> But that one should not set check_cpuid or enforce_cpuid, should it?
> > 
> > check_cpuid is set to true by default.
> 
> Ok, that's what I missed.
> 
> >>
> >> (I can still split the filtering and reporting if you prefer).
> > 
> > Maybe it will work if we just add a 'bool verbose' parameter to
> > x86_cpu_filter_features().
> > 
> > x86_cpu_realizefn() would call:
> >   x86_cpu_filter_features(cpu, cpu->check_cpuid);
> 
> ... "|| cpu->enforce_cpuid".
> 
> > x86_cpu_class_check_missing_features() would call:
> >   x86_cpu_filter_features(cpu, false);
> 
> Or set check_cpuid to false there after creating the object?

It would work too, but I prefer to make the side effects of
x86_cpu_filter_features() more explicit.

-- 
Eduardo

