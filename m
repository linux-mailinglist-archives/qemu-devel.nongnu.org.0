Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF19C43CB9E
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 16:09:14 +0200 (CEST)
Received: from localhost ([::1]:41662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfjc9-0003Yh-W1
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 10:09:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <04a7f9e55e0930b87805f7c97851eea4610e78fc@lizzy.crudebyte.com>)
 id 1mfj00-0006qu-2C
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:29:51 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:57817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <04a7f9e55e0930b87805f7c97851eea4610e78fc@lizzy.crudebyte.com>)
 id 1mfizy-0008HC-GW
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:29:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Subject:Date:From:References:In-Reply-To:Message-Id:Content-ID:
 Content-Description; bh=wExq6n6tGSG/52aiDNI6KOGvSQIXxHPpDtb9tTs8GXw=; b=FCEj1
 VvsRzneL0qPFnmpRWKT7N6+HFn1W6aiYj+CcPxGYFb2rGwFiSYFWmxxinPZOBb97UUvnXHDzEYQoN
 2i5ZWHlUnxdC/BIhotKVFiuUIRS55XFLATFc6kAiQp6TCp0S47TFaVnou638+9z9LexRVPO1tn88V
 wQ3FEfI8UDJIG8Sp2xv5nUrW/Pj4bvcJOb9WyTRmlRogd6FK1MIcjZ4GqJkf7HzkrmrOIynQiyAoc
 Kj5pmUJDNJx/XrNmJnfLGVAWn5eeSj3A9ofVxoC8/KE34R4Od86gQS2Fa5Ll7DSTmMPeL3fVaXr/L
 E8A3ka044dTZit0/g7CQoYAaCLJUw==;
Message-Id: <04a7f9e55e0930b87805f7c97851eea4610e78fc.1635340713.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1635340713.git.qemu_oss@crudebyte.com>
References: <cover.1635340713.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Wed, 27 Oct 2021 15:18:33 +0200
Subject: [PULL 3/8] 9pfs: simplify blksize_to_iounit()
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=04a7f9e55e0930b87805f7c97851eea4610e78fc@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use QEMU_ALIGN_DOWN() macro to reduce code and to make it
more human readable.

Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <b84eb324d2ebdcc6f9c442c97b5b4d01eecb4f43.1632758315.git.qemu_oss@crudebyte.com>
---
 hw/9pfs/9p.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 5c57344667..e874899ef5 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -1280,8 +1280,7 @@ static int32_t blksize_to_iounit(const V9fsPDU *pdu, int32_t blksize)
      * as well as less than (client msize - P9_IOHDRSZ)
      */
     if (blksize) {
-        iounit = blksize;
-        iounit *= (s->msize - P9_IOHDRSZ) / blksize;
+        iounit = QEMU_ALIGN_DOWN(s->msize - P9_IOHDRSZ, blksize);
     }
     if (!iounit) {
         iounit = s->msize - P9_IOHDRSZ;
-- 
2.20.1


