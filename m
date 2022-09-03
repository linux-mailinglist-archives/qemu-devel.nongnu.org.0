Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 707DA5ABFCF
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Sep 2022 18:28:12 +0200 (CEST)
Received: from localhost ([::1]:38454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUW0B-0008VT-KY
	for lists+qemu-devel@lfdr.de; Sat, 03 Sep 2022 12:28:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hpoussin@reactos.org>)
 id 1oUVvR-0003Wy-Q3; Sat, 03 Sep 2022 12:23:17 -0400
Received: from iserv.reactos.org ([2a01:4f8:1c17:5ae1::1]:39098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hpoussin@reactos.org>)
 id 1oUVvP-00064s-B3; Sat, 03 Sep 2022 12:23:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=reactos.org
 ; s=25047;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5ekwVuKp50o20gsLt71Ijg0gPISOwRXBVNkmFAMKTaQ=; b=GkYlKka2bS8qSNd+aY504hEnGy
 9DRQc2V2i45vowDsy091wXITNk/LdNWWiikoO/eRZYaiGAE6wwuX20TbztxyS2Z1k7bg7eBMmbwRA
 AwFQFDbWMnbaEQ2WFKicpB9Kn6T8e3+kcaAVLj6Gcq596+nBDA/ufk20fweh3QNIXv+M=;
Received: by iserv.reactos.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hpoussin@reactos.org>)
 id 1oUVvK-0002VU-Q0; Sat, 03 Sep 2022 16:23:10 +0000
From: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
To: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Subject: [PATCH 2/2] vvfat: allow spaces in file names
Date: Sat,  3 Sep 2022 18:23:02 +0200
Message-Id: <20220903162302.3176003-3-hpoussin@reactos.org>
X-Mailer: git-send-email 2.36.2
In-Reply-To: <20220903162302.3176003-1-hpoussin@reactos.org>
References: <20220903162302.3176003-1-hpoussin@reactos.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a01:4f8:1c17:5ae1::1;
 envelope-from=hpoussin@reactos.org; helo=iserv.reactos.org
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

In R/W mode, files with spaces were never created on host side.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1176
Fixes: c79e243ed67683d6d06692bd7040f7394da178b0
Signed-off-by: Hervé Poussineau <hpoussin@reactos.org>
---
 block/vvfat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/vvfat.c b/block/vvfat.c
index 35057a51c67..9d877028573 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -499,7 +499,7 @@ static bool valid_filename(const unsigned char *name)
               (c >= 'A' && c <= 'Z') ||
               (c >= 'a' && c <= 'z') ||
               c > 127 ||
-              strchr("$%'-_@~`!(){}^#&.+,;=[]", c) != NULL))
+              strchr(" $%'-_@~`!(){}^#&.+,;=[]", c) != NULL))
         {
             return false;
         }
-- 
2.36.2


