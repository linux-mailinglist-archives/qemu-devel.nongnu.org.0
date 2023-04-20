Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 321BB6E97DC
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 17:02:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppVlt-0003oe-0j; Thu, 20 Apr 2023 11:00:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppVli-0003ag-27
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:00:19 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppVlg-00046i-3D
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:00:17 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-2f95231618aso456256f8f.1
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 08:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682002813; x=1684594813;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0vImXH3xRyVec7BYB1TMv5cbFwkjyryrhb38Ec21rN4=;
 b=XRVFqBGN3LI8XVMOOsFnIJsBvm1j90DdXIA+uyWYufuY4e5oZubQRRJcn6OBYezico
 VByO1cMPbDQUuOpu2FOHyB7s2nF4CVv5zXTE9hjEs7gal1VrmQ8HzhK0DM3gj4J1ncUv
 Zh3CfwHm0617JHhb8L9vS18wAAIVO5lq1V0Quh5Csfno7QJZjLr0+CZpmPOOIuPg8HIk
 PBJVoVxVDSNjfIGz/1Zf6lLaH3d9YcHcd34+aK7f3ZRxh+ak0ok2Yz7sLYBIBbhAGKfB
 4x1WNyOZCz0DtQfsDpQTyDScDe+eALFWb+DdOq2cemWyVVExjFTN8Tk3ueQQmD6H4MA1
 6P4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682002813; x=1684594813;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0vImXH3xRyVec7BYB1TMv5cbFwkjyryrhb38Ec21rN4=;
 b=bDqnWvgybETDaWf/bQcR9JzFLHmE5dxFDmeQ7CkBiBgG6LJTsbf7NzWsdYZbixufxz
 31vPQeV9eFpfBlIv1bDpDWyS2wN7XliBs6E5hWURrnavsuuaFD2TTgDYJ8qXolMS55Yr
 R1LyxS2RnOYIYlCpRcUsEyPFRKHQTCXBWlDUBbpscY18voekKyDLPD2DsFyTWGOdYd5U
 w2pRiQtZzDYkmRe0/WNuelne9voF6uqhoE/CGK+caS9MWnGWw2wrGBM5Zo/dQ2kdV504
 izjEr7AsDoSjkiVHItgMppJscvpT5aWvx4EnxaHNDlt8RTtGgbJ5gN5r7NQqa2gbZcyd
 6lHQ==
X-Gm-Message-State: AAQBX9db4fgf0aMHLVWG1iECMmkSfwxprYavYNXmJBJm0ksL1r6n7bLF
 UipOgPq9rjfEleg/vDNuIr3f+w==
X-Google-Smtp-Source: AKy350YGeZEB0UMhww2tbXnm2g3E84SuKMtyL0K2nQSBjyTYvOdQgZUMGPkJfh/yiQh1+Wbj3Qkjsg==
X-Received: by 2002:a5d:6808:0:b0:2f5:d0f:744a with SMTP id
 w8-20020a5d6808000000b002f50d0f744amr1539559wru.12.1682002813697; 
 Thu, 20 Apr 2023 08:00:13 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 w13-20020adff9cd000000b002cea9d931e6sm2146827wrr.78.2023.04.20.08.00.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 08:00:12 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 280F71FFB8;
 Thu, 20 Apr 2023 16:00:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Riku Voipio <riku.voipio@iki.fi>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Yanan Wang <wangyanan55@huawei.com>, Greg Kurz <groug@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kyle Evans <kevans@freebsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 09/10] hw/9pfs: use qemu_xxhash4
Date: Thu, 20 Apr 2023 16:00:08 +0100
Message-Id: <20230420150009.1675181-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230420150009.1675181-1-alex.bennee@linaro.org>
References: <20230420150009.1675181-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

No need to pass zeros as we have helpers that do that for us.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/9pfs/9p.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 9621ec1341..9bf502c45f 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -741,12 +741,12 @@ static VariLenAffix affixForIndex(uint64_t index)
 /* creative abuse of tb_hash_func7, which is based on xxhash */
 static uint32_t qpp_hash(QppEntry e)
 {
-    return qemu_xxhash7(e.ino_prefix, e.dev, 0, 0, 0);
+    return qemu_xxhash4(e.ino_prefix, e.dev);
 }
 
 static uint32_t qpf_hash(QpfEntry e)
 {
-    return qemu_xxhash7(e.ino, e.dev, 0, 0, 0);
+    return qemu_xxhash4(e.ino, e.dev);
 }
 
 static bool qpd_cmp_func(const void *obj, const void *userp)
-- 
2.39.2


