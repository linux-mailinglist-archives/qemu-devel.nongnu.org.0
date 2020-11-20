Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 501CF2BB0A3
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 17:34:57 +0100 (CET)
Received: from localhost ([::1]:50546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg9NA-0000NQ-DE
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 11:34:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kg9LL-0007tP-BJ
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 11:33:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kg9LJ-0007hO-6D
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 11:33:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605889979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mteblihx+NKeRNRp1FS1tYjb5IsAO7+6VUhHQUMvCkI=;
 b=ixHqx655d9O/Xr9oWcbAwzy/7UQpcHGX0/hx5CnSCGB/czdidNS3ChDupIVFG7Exziz6F2
 xlZx1RHom7b7OAcDftt7FHRo094rV29Wi1P+NJZ396tineIYNah0CdSkjuQWyCRLfqYGY+
 +gRL6lDtXT8fe/OvubTOTldxkbv6B5s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-9fgFvuxMOYW253SF25B74g-1; Fri, 20 Nov 2020 11:32:56 -0500
X-MC-Unique: 9fgFvuxMOYW253SF25B74g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01ACE190A7A7
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 16:32:56 +0000 (UTC)
Received: from localhost (unknown [10.40.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 11C995D6AD;
 Fri, 20 Nov 2020 16:32:54 +0000 (UTC)
Date: Fri, 20 Nov 2020 17:32:52 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 22/29] vl: initialize displays before preconfig loop
Message-ID: <20201120173252.743b4208@redhat.com>
In-Reply-To: <85980ae2-9da0-d432-6825-85782f4beee5@redhat.com>
References: <20201027182144.3315885-1-pbonzini@redhat.com>
 <20201027182144.3315885-23-pbonzini@redhat.com>
 <20201120161148.0dc2bdcf@redhat.com>
 <85980ae2-9da0-d432-6825-85782f4beee5@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 20 Nov 2020 16:53:41 +0100
Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 20/11/20 16:11, Igor Mammedov wrote:
> > On Tue, 27 Oct 2020 14:21:37 -0400
> > Paolo Bonzini <pbonzini@redhat.com> wrote:
> >   
> >> Displays should be available before the monitor starts, so that
> >> it is possible to use the graphical console to interact with
> >> the monitor itself.
> >>
> >> This patch is quite ugly, but all this is temporary.  The double
> >> call to qemu_init_displays will go away as soon we can unify machine
> >> initialization between the preconfig and "normal" flows, and so will
> >> the preconfig_exit_requested variable (that is only preconfig_requested
> >> remains).
> >>
> >> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>  
> > 
> > Doesn't apply to yer for-6.0 branch  
> 
> I updated the branch.

it probably won't help,
what I do review/test is drop these patches on branch
and reapply them from this thread.
Having v2 on list that applies to master would be better.

> Thanks,
> 
> Paolo
> 
[...]


