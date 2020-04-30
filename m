Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1311BF9D0
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Apr 2020 15:44:55 +0200 (CEST)
Received: from localhost ([::1]:58284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jU9Uk-0002jw-IO
	for lists+qemu-devel@lfdr.de; Thu, 30 Apr 2020 09:44:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47744)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jU9KU-00080e-Fu
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 09:37:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jU9Gk-0004Gy-1Q
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 09:34:18 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:52197
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jU9Gj-0004DD-Ib
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 09:30:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588253424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=105jJP1cIj/nupnh+Lwv/ZMPM89A53pmjGhd/E8GrUU=;
 b=XF03xqKv6Ay59s17J9xP5GW/KvQ2kTVRsqfWKSoObFhgUB6yGuM9dGrA46MLLx9B4m27Mz
 Np/Q7PbWnAvHd+3Bw1b0HUK8I5gXqX+3B80Wy1GMhXHf5DeyKTAYFzfYpPlBNiP5O67khs
 jIHWARK0AVkpf4SjZMzP5+XhaA5qVY8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-110-DdLmUWWDPMiDPTYddC3ZMA-1; Thu, 30 Apr 2020 09:30:22 -0400
X-MC-Unique: DdLmUWWDPMiDPTYddC3ZMA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC49E1895A34;
 Thu, 30 Apr 2020 13:30:21 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-114-60.ams2.redhat.com [10.36.114.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EBD9566071;
 Thu, 30 Apr 2020 13:30:20 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 4/6] vmdk: Don't update L2 table for zero write on zero cluster
Date: Thu, 30 Apr 2020 15:30:05 +0200
Message-Id: <20200430133007.170335-5-kwolf@redhat.com>
In-Reply-To: <20200430133007.170335-1-kwolf@redhat.com>
References: <20200430133007.170335-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/30 01:04:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If a cluster is already zeroed, we don't have to call vmdk_L2update(),
which is rather slow because it flushes the image file.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/vmdk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/vmdk.c b/block/vmdk.c
index da25b8992e..dcd30f1419 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -2013,7 +2013,7 @@ static int vmdk_pwritev(BlockDriverState *bs, uint64_=
t offset,
                     offset_in_cluster =3D=3D 0 &&
                     n_bytes >=3D extent->cluster_sectors * BDRV_SECTOR_SIZ=
E) {
                 n_bytes =3D extent->cluster_sectors * BDRV_SECTOR_SIZE;
-                if (!zero_dry_run) {
+                if (!zero_dry_run && ret !=3D VMDK_ZEROED) {
                     /* update L2 tables */
                     if (vmdk_L2update(extent, &m_data, VMDK_GTE_ZEROED)
                             !=3D VMDK_OK) {
--=20
2.25.3


