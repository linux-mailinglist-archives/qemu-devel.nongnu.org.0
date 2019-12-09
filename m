Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 758F7116ACC
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Dec 2019 11:20:11 +0100 (CET)
Received: from localhost ([::1]:38196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ieG9C-0007BJ-GB
	for lists+qemu-devel@lfdr.de; Mon, 09 Dec 2019 05:20:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53622)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1ieG6W-0006BA-1W
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 05:17:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1ieG6T-0004Hm-Mo
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 05:17:22 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:58738
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1ieG6T-0004HG-BN
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 05:17:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575886639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4bp+WXqrru2UYsKe+lG/jDclHHOGXm9ZX4UoMOh96is=;
 b=S9al0lOAM0lLEvxxQ/b4PP0tauPMD5VTzJXiSDUdItDRAZHHUM6BL9kmtzbf10eC+kNx0r
 eRd3qLAl4TCRthNzoilvgHuK+pPBvqxD3lfUMedh/STcu6sYbVyBqAX1/pj2+7+jmzyiLu
 1w4haN+RlHczW2e8mp8GFe8pSZVBjeg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-ke64rUOQNbqjsGtEroAIUA-1; Mon, 09 Dec 2019 05:17:16 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E2C48024E7;
 Mon,  9 Dec 2019 10:17:15 +0000 (UTC)
Received: from work-vm (ovpn-116-253.ams2.redhat.com [10.36.116.253])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7214910016E8;
 Mon,  9 Dec 2019 10:17:14 +0000 (UTC)
Date: Mon, 9 Dec 2019 10:17:11 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: colin.xu@intel.com, yu.ning@intel.com
Subject: Re: [Bug 1855617] [NEW] savevm with hax saves wrong register state
Message-ID: <20191209101711.GA3404@work-vm>
References: <157583794032.6937.10802857034135783842.malonedeb@soybean.canonical.com>
MIME-Version: 1.0
In-Reply-To: <157583794032.6937.10802857034135783842.malonedeb@soybean.canonical.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: ke64rUOQNbqjsGtEroAIUA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: qemu-devel@nongnu.org, Bug 1855617 <1855617@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

cc'ing Colin and Yu for Hax info:

* Alex (1855617@bugs.launchpad.net) wrote:
> Public bug reported:
>=20
> I use qemu-i386 with IntelHaxm on Windows 10 x64 host with Windows 7 x86 =
guest. I run the guest till OS loads and create a snapshot with savevm, the=
n close qemu, run it again and try to load the snapshot with loadvm. The gu=
est crashes or freezes. I dumped registers on snapshot creation and loading=
 (in Haxm) and found that they are different.
> When returning from Haxm in hax_vcpu_hax_exec, there is no regular regist=
er read. I found hax_arch_get_registers function which reads registers from=
 Haxm and is called from a synchronization procedure. I placed a breakpoint=
 on it, ran qemu and found that it is hit one time during guest OS boot. Ex=
actly these registers where saved in the snapshot.
>=20
> ** Affects: qemu
>      Importance: Undecided
>          Status: New
>=20
> --=20
> You received this bug notification because you are a member of qemu-
> devel-ml, which is subscribed to QEMU.
> https://bugs.launchpad.net/bugs/1855617
>=20
> Title:
>   savevm with hax saves wrong register state
>=20
> Status in QEMU:
>   New
>=20
> Bug description:
>   I use qemu-i386 with IntelHaxm on Windows 10 x64 host with Windows 7 x8=
6 guest. I run the guest till OS loads and create a snapshot with savevm, t=
hen close qemu, run it again and try to load the snapshot with loadvm. The =
guest crashes or freezes. I dumped registers on snapshot creation and loadi=
ng (in Haxm) and found that they are different.
>   When returning from Haxm in hax_vcpu_hax_exec, there is no regular regi=
ster read. I found hax_arch_get_registers function which reads registers fr=
om Haxm and is called from a synchronization procedure. I placed a breakpoi=
nt on it, ran qemu and found that it is hit one time during guest OS boot. =
Exactly these registers where saved in the snapshot.
>=20
> To manage notifications about this bug go to:
> https://bugs.launchpad.net/qemu/+bug/1855617/+subscriptions
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


