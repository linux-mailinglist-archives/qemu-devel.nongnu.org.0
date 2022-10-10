Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 347045FA43C
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 21:35:31 +0200 (CEST)
Received: from localhost ([::1]:36700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohyYj-0008Hr-Fi
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 15:35:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hpoussin@reactos.org>)
 id 1ohx0D-0006Sg-HT; Mon, 10 Oct 2022 13:55:45 -0400
Received: from iserv.reactos.org ([2a01:4f8:1c17:5ae1::1]:43296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hpoussin@reactos.org>)
 id 1ohx0A-0003tH-7V; Mon, 10 Oct 2022 13:55:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=reactos.org
 ; s=25047;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fwqztHUkQKRjjrrden7wbaSYG99/zQpEUNJ/XxS0Auc=; b=ZGItRIC2nvXSobgFRVBCCYzByF
 4XGNc1Fi/2HAWvOLdHqgnDztuSTGshdWK6N7zVWLKl+1Bgd8tRfAQmnHv2S8WU0txR8GF1j/6GZmw
 ST+GEqEZtnkZcTTwlcjBsAuPr9Oq+YcagfFNYE/SfXALLO8DXs6xAwFDOnbs0Ks9qA6E=;
Received: by iserv.reactos.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hpoussin@reactos.org>)
 id 1ohx06-00015P-AE; Mon, 10 Oct 2022 17:55:38 +0000
From: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
To: kwolf@redhat.com,
	hreitz@redhat.com,
	qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 2/2] vvfat: allow spaces in file names
Date: Mon, 10 Oct 2022 19:55:11 +0200
Message-Id: <20221010175511.3414357-3-hpoussin@reactos.org>
X-Mailer: git-send-email 2.36.2
In-Reply-To: <20221010175511.3414357-1-hpoussin@reactos.org>
References: <20221010175511.3414357-1-hpoussin@reactos.org>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 block/vvfat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/vvfat.c b/block/vvfat.c
index ae53f0d7283..392eab5168b 100644
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


