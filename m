Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A7F180CA
	for <lists+qemu-devel@lfdr.de>; Wed,  8 May 2019 22:02:46 +0200 (CEST)
Received: from localhost ([127.0.0.1]:43195 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hOSm5-0005f3-Gs
	for lists+qemu-devel@lfdr.de; Wed, 08 May 2019 16:02:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43695)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hOSkc-0005Ac-Sp
	for qemu-devel@nongnu.org; Wed, 08 May 2019 16:01:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hOSkb-0005Rl-Mr
	for qemu-devel@nongnu.org; Wed, 08 May 2019 16:01:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37146)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hOSka-0005Qz-45
	for qemu-devel@nongnu.org; Wed, 08 May 2019 16:01:13 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D6E75308620B;
	Wed,  8 May 2019 20:01:10 +0000 (UTC)
Received: from localhost (ovpn-116-61.gru2.redhat.com [10.97.116.61])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4E4E75F7E5;
	Wed,  8 May 2019 20:01:10 +0000 (UTC)
Date: Wed, 8 May 2019 17:01:08 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Tao Xu <tao3.xu@intel.com>
Message-ID: <20190508200108.GE4189@habkost.net>
References: <20190508013153.15412-1-tao3.xu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190508013153.15412-1-tao3.xu@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Wed, 08 May 2019 20:01:10 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3] i386: Add some MSR based features on
 Cascadelake-Server CPU model
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: xiaoyao.li@intel.com, qemu-devel@nongnu.org, pbonzini@redhat.com,
	robert.hu@intel.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 08, 2019 at 09:31:53AM +0800, Tao Xu wrote:
> As noted in "c7a88b52f6 i386: Add new model of Cascadelake-Server"
> Because MSR based feature has been supported by QEMU, we add
> CPUID_7_0_EDX_ARCH_CAPABILITIES on Cascadelake-Server CPU model,
> and add IA32_ARCH_CAPABILITIES MSR based features (RDCL_NO,
> IBRS_ALL and SKIP_L1DFL_VMENTRY).
> 
> And "014018e19b i386: Make arch_capabilities migratable" has been
> in QEMU upstream, the CPUID_7_0_EDX_ARCH_CAPABILITIES can be
> safely added into CPU Model.
> 
> Signed-off-by: Tao Xu <tao3.xu@intel.com>

CPUID_7_0_EDX_ARCH_CAPABILITIES requires Linux >= v4.16.  This
means the patch will make "-cpu Cascadelake-Server" stop working
on Linux < v4.16 hosts, doesn't it?

For additional details, see:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg603291.html
"[PATCH 2/2] i386: Add some MSR based features on
Cascadelake-Server CPU model"

and:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg606373.html
"Cascadelake-Server missing MSR based features ?"

-- 
Eduardo

