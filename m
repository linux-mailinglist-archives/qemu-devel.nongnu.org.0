Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 696A0EA73
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Apr 2019 20:47:41 +0200 (CEST)
Received: from localhost ([127.0.0.1]:33757 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLBJU-0006O0-Jb
	for lists+qemu-devel@lfdr.de; Mon, 29 Apr 2019 14:47:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56808)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1hLBF4-0003Ig-OR
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 14:43:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1hLBF0-0002QU-Od
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 14:43:06 -0400
Received: from fanzine.igalia.com ([91.117.99.155]:54753)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <berto@igalia.com>)
	id 1hLBF0-0002Pe-5t; Mon, 29 Apr 2019 14:43:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=References:In-Reply-To:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=N9Ijrdys9rcn5uS4tPdtWX/PEwV61+M0Lnq/0LHPSa4=; 
	b=bFZ5AH9H+7FNi5Bx/jXnw/r89Hqs+y9rSbVehFhSif8nojjtW0xrVF95poZUWJb+djIatNocG0i1wwd83BSpPISnBjP/2Wtw1XXc9l11wiqbGG9GHecO+cKeuWGufDPw2XgVH9qcot8YX1jaqPcgm9kX2Jij9065bNRfAvBnLhQlMNlb/Jr2dyhtwMsX9/Ssav1trYYGI7fpZbd5slBqMdlK5DVB+oRc1g0oGwrYVN3jvmD+sRcbGnPVRKvrsNl0jilIPI50F6/CY+E2vpNQbtAjtkbSAGsLFgHhea7QdlD+JUTAXkxPPmgO5oNyOJAOSHXwYfslsMHtiMSA7D+/kA==;
Received: from static-191-95-145-212.ipcom.comunitel.net ([212.145.95.191]
	helo=perseus.local) by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
	id 1hLBEx-0006XN-Rd; Mon, 29 Apr 2019 20:42:59 +0200
Received: from berto by perseus.local with local (Exim 4.89)
	(envelope-from <berto@igalia.com>)
	id 1hLBEl-0002ZX-Ax; Mon, 29 Apr 2019 21:42:47 +0300
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Date: Mon, 29 Apr 2019 20:42:40 +0200
Message-Id: <e823a4cb62ef8ab37d3e30773052a5f69393f06c.1556562150.git.berto@igalia.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1556562150.git.berto@igalia.com>
References: <cover.1556562150.git.berto@igalia.com>
In-Reply-To: <cover.1556562150.git.berto@igalia.com>
References: <cover.1556562150.git.berto@igalia.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic] [fuzzy]
X-Received-From: 91.117.99.155
Subject: [Qemu-devel] [PATCH 5/5] qcow2: Remove
 BDRVQcow2State.cluster_sectors
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
Cc: Kevin Wolf <kwolf@redhat.com>, Alberto Garcia <berto@igalia.com>,
	qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The last user of this field disappeared when we replace the
sector-based bdrv_write() with the byte-based bdrv_pwrite().

Signed-off-by: Alberto Garcia <berto@igalia.com>
---
 block/qcow2.c | 1 -
 block/qcow2.h | 1 -
 2 files changed, 2 deletions(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index 3ace3b2209..3a3240fcca 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -1259,7 +1259,6 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
 
     s->cluster_bits = header.cluster_bits;
     s->cluster_size = 1 << s->cluster_bits;
-    s->cluster_sectors = 1 << (s->cluster_bits - BDRV_SECTOR_BITS);
 
     /* Initialise version 3 header fields */
     if (header.version == 2) {
diff --git a/block/qcow2.h b/block/qcow2.h
index fdee297f33..e62508d1ce 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -266,7 +266,6 @@ typedef struct Qcow2BitmapHeaderExt {
 typedef struct BDRVQcow2State {
     int cluster_bits;
     int cluster_size;
-    int cluster_sectors;
     int l2_slice_size;
     int l2_bits;
     int l2_size;
-- 
2.11.0


