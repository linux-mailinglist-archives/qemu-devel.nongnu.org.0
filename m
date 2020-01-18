Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA0814190A
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Jan 2020 20:12:19 +0100 (CET)
Received: from localhost ([::1]:43828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1istW6-0003EY-2h
	for lists+qemu-devel@lfdr.de; Sat, 18 Jan 2020 14:12:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48512)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1istTs-0001RI-5n
 for qemu-devel@nongnu.org; Sat, 18 Jan 2020 14:10:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1istTr-0004OZ-76
 for qemu-devel@nongnu.org; Sat, 18 Jan 2020 14:10:00 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:48331)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1istTq-0004N1-Ql; Sat, 18 Jan 2020 14:09:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=pw2TwbK9Mz/rKuQHrtIpjSRKPh4TtO2hbBolc7OPVq0=; 
 b=hAfqtAio/7/6coZ1KGphyNULa/THKp2sZ5WO13W2YLMsN7OmTLsMD+ccB3Vyx5anjfO9fZkxz3SKmPTupdljWQDcVU4rX8F/41no/R89r+P276ZMeJdJn+TANVeRlBenjG7BWCJ7cuVTWYvNI0f8yLi/jnm3si9AK7ZIL5g9o+65NvTE9YjG0zANRwORdfmWKM/x65uPA7/R2otzCadIwO8x8/f4wUfXG0ypOgk7URjICRBuJgEVLYwknzo4nh1vlGRuwVeRR/qOPyBSkmbITwCw9QSyPS2cnJY6WZ4PmOHQuW1URxksK4qaHTPvSaDnQ0qM6mxAGuTn2SfO7V1hCw==;
Received: from [80.30.177.7] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1istTn-00065C-Bs; Sat, 18 Jan 2020 20:09:55 +0100
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1istTW-0002Jb-Rl; Sat, 18 Jan 2020 20:09:38 +0100
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/5] qcow2: Don't require aligned offsets in
 qcow2_co_copy_range_from()
Date: Sat, 18 Jan 2020 20:09:29 +0100
Message-Id: <a4264aaee656910c84161a2965f7a501437379ca.1579374329.git.berto@igalia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1579374329.git.berto@igalia.com>
References: <cover.1579374329.git.berto@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic] [fuzzy]
X-Received-From: 178.60.130.6
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
Cc: Kevin Wolf <kwolf@redhat.com>, Alberto Garcia <berto@igalia.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Nir Soffer <nsoffer@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu-img's convert_co_copy_range() operates at the sector level and
block_copy() operates at the cluster level so this condition is always
true, but it is not necessary to restrict this here, so let's leave it
to the driver implementation return an error if there is any.

Signed-off-by: Alberto Garcia <berto@igalia.com>
---
 block/qcow2.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index 100393fd3b..a6b0d4ee1d 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -3829,10 +3829,6 @@ qcow2_co_copy_range_from(BlockDriverState *bs,
         case QCOW2_CLUSTER_NORMAL:
             child = s->data_file;
             copy_offset += offset_into_cluster(s, src_offset);
-            if ((copy_offset & 511) != 0) {
-                ret = -EIO;
-                goto out;
-            }
             break;
 
         default:
-- 
2.20.1


