Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B404D165F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 12:38:47 +0100 (CET)
Received: from localhost ([::1]:34082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRYAw-0002Oa-Bj
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 06:38:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRY7K-0007kW-3s
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:35:03 -0500
Received: from [2a00:1450:4864:20::636] (port=34477
 helo=mail-ej1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRY7I-0005nZ-Ev
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:35:01 -0500
Received: by mail-ej1-x636.google.com with SMTP id gb39so38477564ejc.1
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 03:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eDGHR6/aw919IHNPsHpNFGiuyOPgK+9XmuHPS650QoQ=;
 b=XtuHDseYvoit2Gdj5iawkX2Q0ma4VwP8DzXfRVoK6hzcOWR35t68o1vxb4op9kg5Yl
 Sffhu+9Hlvn0QqmS0fENXtD2Wz+XmQm6fglcQ9RXMEZR7IYegB9+595qVfoNrqL55DUL
 De07PUAU3mAKJsG4xSpOPRCCFSRAk+L3OfBUSNCpyUWUtjoSZ2WOZUnxeO87bW69TNsQ
 L2rAQMfcvhV9K6Ew4ztlfOCuVfLYqi55ZIS2sMUfZW2BDfEs82l1rREgqw5qgegfzUrs
 zanycDXmi4nGQfh629VujqQGBOu8zUPZRSYTbld21qPrcamIFaU3Z9p8igIoT2c1ER5+
 ahrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=eDGHR6/aw919IHNPsHpNFGiuyOPgK+9XmuHPS650QoQ=;
 b=DQnlXbgfZKJOLHplV96f1oBCbLE4z2sQ45ZRkwOtbA6KO8vAEjCS2+zXzbr0bRnrRb
 AaXhOr3I033ogaf3oA9NpR70EW5mjcG18VQABZx4VRO6R0C/gDdfhFS4/wrDFUo7GLXF
 5knXg87MAO2ylUUqxFzWOXT4qIT9DFJDXXthcP+a5CWWYlhQbCgDO4WnpSkZh3N/HAEj
 t9uI98HSWU1B8QiIxIganBASFiEREUv4FJ8pryysVzllrd8G2Ffb50Me5frqm4PpipOs
 HBiz8CVAV9nTSCo7LGEbVec2vZDzboiXbw2tTEyL7HykqZe89xxGPYYHRb5tSFBMI0kD
 LbmA==
X-Gm-Message-State: AOAM533H7ONaDFR03f2tbE4zv+aZMiOD+tTqdJtnEIaSpB3gnw6/MGnI
 wsd8VUxnVwFiH8/4JLADcijyqsEJzUU=
X-Google-Smtp-Source: ABdhPJx5ZnnmErnzjHt24cKM2UlK97GoTvRe8NV4joaIOo1J62FeYt++JED83XyZ9X2Vh9uVta4gPA==
X-Received: by 2002:a17:907:9605:b0:6d7:24d1:f4ce with SMTP id
 gb5-20020a170907960500b006d724d1f4cemr12627131ejc.524.1646739299132; 
 Tue, 08 Mar 2022 03:34:59 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 l2-20020aa7cac2000000b003f9b3ac68d6sm7491868edt.15.2022.03.08.03.34.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 03:34:58 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/22] qga/vss: update informative message about MinGW
Date: Tue,  8 Mar 2022 12:34:29 +0100
Message-Id: <20220308113445.859669-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220308113445.859669-1-pbonzini@redhat.com>
References: <20220308113445.859669-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::636
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The headers are now all available in MinGW master branch.
(commit 13390dbbf885f and earlier) aiming for 10.0.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220222194008.610377-4-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qga/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qga/meson.build b/qga/meson.build
index 54f2da5b07..62472747f1 100644
--- a/qga/meson.build
+++ b/qga/meson.build
@@ -15,7 +15,7 @@ have_qga_vss = get_option('qga_vss') \
     If your Visual Studio installation doesn't have the VSS headers,
     Please download and install Microsoft VSS SDK:
     http://www.microsoft.com/en-us/download/details.aspx?id=23490
-    On POSIX-systems, MinGW doesn't yet provide working headers.
+    On POSIX-systems, MinGW should provide headers in >=10.0 releases.
     you can extract the SDK headers by:
     $ scripts/extract-vsssdk-headers setup.exe
     The headers are extracted in the directory 'inc/win2003'.
-- 
2.35.1



