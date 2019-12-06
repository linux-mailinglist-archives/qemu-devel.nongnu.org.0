Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9C3115216
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Dec 2019 15:12:16 +0100 (CET)
Received: from localhost ([::1]:37970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1idEL8-00056b-Vj
	for lists+qemu-devel@lfdr.de; Fri, 06 Dec 2019 09:12:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51534)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <amit@kernel.org>) id 1idEGc-0001LH-P2
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:07:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <amit@kernel.org>) id 1idEGb-0007eS-91
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:07:34 -0500
Received: from bombadil.infradead.org ([2607:7c80:54:e::133]:33800)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <amit@kernel.org>) id 1idEGa-0007Qh-L9
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:07:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Mime-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lNGlgqxAiiv13n2OVehD7agKZsyMMGS2LRYC5Jl0Zmc=; b=gNqLkaZRanqXpTc4VisOxk5H8
 mUaJk1QWTE5qm3mttsigSF2TuQlAqhBMgur0N+CrICy19rCd43nLQx9h2GhCh3mVASjXhZnfl4cJC
 TF6RwD6fcaUuim2cFlJQzg+Dz3Up87OIAu1+p/J2fqqc1FdxjhDmmcMHJAAS9KyN+M5ipyBOtRxzQ
 bgqTQ0RFCrOIn51PK4iotFoLCSPfc1HUetSG6flglCNE4p925M/b8u1HAN8zCYXp8gAgEHxMNtNzH
 dt4vIuCkAAnN9jZP7hy/wbaS18WrGNHi1BHYUqWsvv3M6AOQipKHyAGUr6Sij005+G384amfzo0HM
 CTyUPg2eA==;
Received: from [54.239.6.185] (helo=u0c626add9cce5a.ant.amazon.com)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1id9Pu-00059V-Mv; Fri, 06 Dec 2019 08:56:51 +0000
Message-ID: <9e0aba878c29bdda0a8badee3919bc0a46ca0604.camel@kernel.org>
Subject: Re: [PATCH v2 1/3] virtio: add ability to delete vq through a pointer
From: Amit Shah <amit@kernel.org>
To: Pan Nengyuan <pannengyuan@huawei.com>, mst@redhat.com
Date: Fri, 06 Dec 2019 09:56:47 +0100
In-Reply-To: <32796046-ef9b-6157-3bd0-23eef4d4950b@huawei.com>
References: <1575444716-17632-1-git-send-email-pannengyuan@huawei.com>
 <1eaf11e84a6c1cbfbacebe2ae4361925142c1ab6.camel@kernel.org>
 <32796046-ef9b-6157-3bd0-23eef4d4950b@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:7c80:54:e::133
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
Cc: liyiting@huawei.com, kuhn.chenqun@huawei.com, qemu-devel@nongnu.org,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 2019-12-06 at 10:17 +0800, Pan Nengyuan wrote:
> On 2019/12/6 0:45, Amit Shah wrote:
> > On Wed, 2019-12-04 at 15:31 +0800, pannengyuan@huawei.com wrote:
> > > From: Pan Nengyuan <pannengyuan@huawei.com>
> > 
> > Shouldn't this be From: mst?
> > 
> > I didn't find a ref to the original patch to confirm if you had to
> > adapt it in any way, though.
> > 
> 
> Here is the original
> patch:　
> https://lists.nongnu.org/archive/html/qemu-devel/2019-12/msg00402.html
> 
> I just change one line(set used_elems to NULL). In next version, I
> will
> change function name from virtio_delete_queue to virtio_queue_cleanup
> (It's too similar between "virtio_del_queue" and
> "virtio_delete_queue"):
> 
https://lists.nongnu.org/archive/html/qemu-devel/2019-12/msg00877.html
> .
> 
> According to these, should I change it in next version?

Sure, please change it.  Please ensure 'From:' is Michael, but in the
sign-off area, you can mention how you changed the original patch, e.g.
see the "[PMM: ...]" in



https://lore.kernel.org/qemu-devel/20191126141239.8219-5-peter.maydell@linaro.org/

Also, please CC me on the entire series.

Thanks,



