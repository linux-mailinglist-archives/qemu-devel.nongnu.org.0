Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3FC2174E1
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jul 2020 19:14:55 +0200 (CEST)
Received: from localhost ([::1]:51262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsrBG-0006yE-8d
	for lists+qemu-devel@lfdr.de; Tue, 07 Jul 2020 13:14:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <olaf@aepfle.de>) id 1jsrAG-0005k1-26
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 13:13:52 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.220]:35006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <olaf@aepfle.de>) id 1jsrAB-0001p3-RV
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 13:13:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1594142023;
 s=strato-dkim-0002; d=aepfle.de;
 h=Message-Id:Date:Subject:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=C0nVnbd1P4lUl13aQDiWx97JKdHgCrTn3oNeoR9grGI=;
 b=RAbbYN4yU+XRYJmgu+xOLol1uupsS+Lqs8fl+K+M0kVpo//FoyNi25rKLYZUD/UpKF
 /FzpES1EvtIEk/fTQSIkzQ0S/VrYy+txsPTCqxJ69zidDhJ34tOjucF2u1dyP2bgtlwe
 541FZVMOUK3V95B+qx5h/J3aI0P14X9QPCTXkySay4qrILBRsdmv41dY0lPX2zcADSkd
 SuDVlBpg/Fc4f44uCNovnYG6PJeHkAGZzXa7kSX4OlPDapQBUwArsOMaJ7QU2AgX8kel
 J+FsxDJqSyUsXmEkXXx36bd5GDQi468vJSuNVlRQNL8yNmEDDEe/+VUhRnNKIxnTfgW3
 Vbvg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS1G8g"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 46.10.5 SBL|AUTH)
 with ESMTPSA id m032cfw67HDho0E
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 7 Jul 2020 19:13:43 +0200 (CEST)
From: Olaf Hering <olaf@aepfle.de>
To: Olaf Hering <olaf@aepfle.de>,
	qemu-devel@nongnu.org
Subject: [PATCH v1] configure: fix malloc check
Date: Tue,  7 Jul 2020 19:13:25 +0200
Message-Id: <20200707171326.16422-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=81.169.146.220; envelope-from=olaf@aepfle.de;
 helo=mo4-p00-ob.smtp.rzone.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 13:13:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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

Avoid random return value.

Fixes commit f2dfe54c74f768a5bf78c9e5918918727f9d9459

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 configure | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configure b/configure
index 5d6f5a7f57..85f3662b8e 100755
--- a/configure
+++ b/configure
@@ -6305,6 +6305,7 @@ int main(void) {
     if (tmp != NULL) {
         return *(int *)(tmp + 2);
     }
+    return 1;
 }
 EOF
   if compile_prog "$CPU_CFLAGS -Werror -fsanitize=undefined" ""; then

