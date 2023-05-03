Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 538076F5471
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:18:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8cf-0002y2-5H; Wed, 03 May 2023 05:18:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pu8cd-0002o3-2m
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:18:03 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pu8ca-0000Lq-RL
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:18:02 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3063afa2372so1369071f8f.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 02:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683105479; x=1685697479;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z+2ARsKrUE4IDGgBP183cB95dxoDFN2S1gyD75E2rZs=;
 b=jhj03op2h/snNh+exJmyTrSNN4Npp7WpHimKm9BFMp3XNtK6tMD9gpceZt4RDFnEAm
 NbWnzFZtVeL1cbyGGsZoK6ZDyNXNQsjV9EdCYfUXepMdz7yEmI2IlzIyMiJ9dzYyf/LT
 DBFo4yNfmQ+o3kl8zOF3jXPt6bzVtEnlI31yAgyyfyd6UIaTme1Zp9fYZLfdAgLJS88v
 cytUh+9gq3yJJblyiqd9vdX34vIo8qWGCWdwhPBnY9EtTVeiPwHIscFAKjJpq19BDCUX
 6RijgNXUGfu4NO0Kzf+DsOcblISL5Ujg734MOBpUcChI7SqIOEm4knVgNmHyDPkGUset
 ylhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683105479; x=1685697479;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z+2ARsKrUE4IDGgBP183cB95dxoDFN2S1gyD75E2rZs=;
 b=AEFhcm1ljk1JHjD+9Sb7aJjnvdHZbO4wdcGONFfj+ltsRFhIRpqnIsC7WOg3fOPwjb
 mdUNOMTkNLauAXf+SuVjr/XQ8c8VjxShd80YwmC7EqB2w1L2cHDFhmALRxX5gpsX98lR
 EihrbC3Vfes2MqsDLbPxgxv5AM/ti8gH0HLtJj0UElCtM643daVU8W/o5GDG1bNPc1cQ
 GKvqh2vq1deM1jhKE4PpasQNzJrFTmx6KVVx99vmG/liCLFy7XRCoLig1Las65y9tX72
 wEpa1jy1MH7SdLa8PpC1AhqzCDw/0QR/sAn7jGFIdcikd/5SWewobRKEFbVseH4YVlS2
 o+QA==
X-Gm-Message-State: AC+VfDxyLBfY7BVQwnLTr7QcEbmRbXTjVVvwkDHzO9nkQm8e/f0wLEv7
 p2DL4XjZUPyF8QugTlqQl5zWcw==
X-Google-Smtp-Source: ACHHUZ5LPs6TN3ZgFRbFM8Ldm/1TJaEF4FNxQ3W0YmVBqGW4exErAOj1PAoR7HhFWrV7F9ASkCfXfQ==
X-Received: by 2002:a5d:6a83:0:b0:2f3:e981:f183 with SMTP id
 s3-20020a5d6a83000000b002f3e981f183mr15789311wru.10.1683105479379; 
 Wed, 03 May 2023 02:17:59 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 r3-20020adfda43000000b003047ae72b14sm24929980wrl.82.2023.05.03.02.17.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 02:17:58 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 70C1D1FFC1;
 Wed,  3 May 2023 10:17:57 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Kyle Evans <kevans@freebsd.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Riku Voipio <riku.voipio@iki.fi>, Yanan Wang <wangyanan55@huawei.com>,
 Eduardo Habkost <eduardo@habkost.net>, Greg Kurz <groug@kaod.org>,
 Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 04/10] scripts/qapi: document the tool that generated the
 file
Date: Wed,  3 May 2023 10:17:50 +0100
Message-Id: <20230503091756.1453057-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230503091756.1453057-1-alex.bennee@linaro.org>
References: <20230503091756.1453057-1-alex.bennee@linaro.org>
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

This makes it a little easier for developers to find where things
where being generated.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 scripts/qapi/gen.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index 8f8f784f4a..e724507e1a 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -162,7 +162,7 @@ def __init__(self, fname: str, blurb: str, pydoc: str):
 
     def _top(self) -> str:
         return mcgen('''
-/* AUTOMATICALLY GENERATED, DO NOT MODIFY */
+/* AUTOMATICALLY GENERATED by QAPIGenC, DO NOT MODIFY */
 
 /*
 %(blurb)s
@@ -195,7 +195,7 @@ def _bottom(self) -> str:
 
 class QAPIGenTrace(QAPIGen):
     def _top(self) -> str:
-        return super()._top() + '# AUTOMATICALLY GENERATED, DO NOT MODIFY\n\n'
+        return super()._top() + '# AUTOMATICALLY GENERATED by QAPIGenTrace, DO NOT MODIFY\n\n'
 
 
 @contextmanager
-- 
2.39.2


