Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 705AE2C0F45
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 16:52:18 +0100 (CET)
Received: from localhost ([::1]:43062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khE8X-0002vC-CH
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 10:52:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1khE66-0001MX-Cd
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 10:49:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1khE62-0001lT-Ow
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 10:49:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606146580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XMDJb1lzSSSMgdufPE+Z/MP3yBtHBosn88zq5WxWkok=;
 b=ezdWh/RVr+IfIB66FtOsf9c6LYH563npC6gi9za7Q/uCaybJ06MmkggGRJkV9gAZVAD0eD
 KwhF2Ww6/UFXGWK4ctznBZ/3T1QhkzXRRygPaqNBKisQZMhYh0xsFz/3uomipKK89d5b5X
 UJb8ya8iRC+K4JHUVmvS1j4mTiDXZD0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-U9Kf4dmbP1SijxZCTyKSYg-1; Mon, 23 Nov 2020 10:49:36 -0500
X-MC-Unique: U9Kf4dmbP1SijxZCTyKSYg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE264100C602;
 Mon, 23 Nov 2020 15:49:34 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.206.216])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D11B60864;
 Mon, 23 Nov 2020 15:49:30 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/1] Fix qcow2 corruption after addition of subcluster support
Date: Mon, 23 Nov 2020 17:49:28 +0200
Message-Id: <20201123154929.330338-1-mlevitsk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, vsementsov@virtuozzo.com,
 Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org, zhang_youjia@126.com,
 Max Reitz <mreitz@redhat.com>, andrey.shinkevich@virtuozzo.com,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On this weekend, I had discovered that one of my VMs started to act weird.=
=0D
=0D
Due to this, I found out that it and most of the other VMs I have,=0D
have grown an qcow2 corruption.=0D
=0D
So after some bisecting, digging through dumps, and debugging,=0D
I think I found the root cause and a fix.=0D
=0D
In addition to that I would like to raise few points:=0D
=0D
1. I had to use qcow2-dump from (*)=0D
 (it is also on github but without source. wierd...)=0D
 to examine the L1/L2 tables and refcount tables.=0D
=0D
 It seems that there were few attempts (**), (***) to make an official tool=
 that=0D
 would dump at least L1/L2/refcount tables, but nothing got accepted=0D
 so far.=0D
=0D
 I think that an official tool to dump at least basic qcow2 structure=0D
 would be very helpful to discover/debug qcow2 corruptions.=0D
 I had to study again the qcow2 format for this, so I can help with that.=
=0D
=0D
2. 'qemu-img check -r all' is happy to create clusters that are referenced=
=0D
 from multiple L2 entries.=0D
=0D
 This isn't technically wrong, since write through any of these l2 entries=
=0D
 will COW the cluster.=0D
=0D
 However I would be happy to know that my images don't have such clusters,=
=0D
 so I would like qemu-img check to at least notify about this.=0D
 Can we add some -check-weird-but-legal flag to it to check this?=0D
=0D
Few notes about the condition for this corruption to occur:=0D
=0D
I have a bunch of VMs which are running each using two qcow2 files,=0D
base and a snapshot on top of it, which I 'qemu-img commit' once in a while=
.=0D
Discard is enabled to avoid wasting disk space.=0D
=0D
Since discard is enabled, 'qemu-img commit' often discards data on the base=
 disk.=0D
The corruption happens after such a commit, and manifests in a stale L2=0D
entry that was supposed to be discarded but now points to an unused cluster=
.=0D
=0D
I wasn't able to reproduce this on small test case so far.=0D
=0D
Best regards,=0D
    Maxim Levitsky=0D
=0D
(*)https://lists.gnu.org/archive/html/qemu-devel/2017-08/msg02760.html=0D
(**) https://patchwork.kernel.org/project/qemu-devel/patch/20180328133845.2=
0632-1-berto@igalia.com/=0D
(***) https://patchwork.kernel.org/project/qemu-devel/cover/1578990137-3082=
22-1-git-send-email-andrey.shinkevich@virtuozzo.com/=0D
=0D
Maxim Levitsky (1):=0D
  Fix qcow2 corruption on discard=0D
=0D
 block/qcow2-cluster.c | 2 +-=0D
 1 file changed, 1 insertion(+), 1 deletion(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


