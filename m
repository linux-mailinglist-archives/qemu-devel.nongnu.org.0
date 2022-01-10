Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4447489B97
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 15:51:11 +0100 (CET)
Received: from localhost ([::1]:51198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6w0s-0000Oh-R5
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 09:51:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n6vrL-0002gy-TT
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 09:41:19 -0500
Received: from [2a00:1450:4864:20::533] (port=45893
 helo=mail-ed1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n6vr8-0000Wx-3g
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 09:41:07 -0500
Received: by mail-ed1-x533.google.com with SMTP id z22so9372612edd.12
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 06:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J8eMnnyABy7XSBsmUrNoL+ReTiqaDOWtN2nCCVFhCqs=;
 b=maJn0h64hjCQOoYqNgvGTbJna3KW3OvSf82LpnymGiKute+Ma/R/vZrAPpwQX9vknG
 RJMx0XpFPxfbm4FWakEZoRNSfsRfUJn3Cu3Gv48ZHI/P1fh2n+jKWjqixt22/NrYlfYK
 MAaDMI0XaJNFbJCODg1x1XWgDeThZmv6gWJCctG6TcfHV39032rckOrTWV7pHdT6M1nG
 IJC311p6tORy1zBxa7h4muEDe/zs2hSuy2Zi9dPn7y7crCh50k5feFnoEk83o8Ef8BBz
 6WBRybKRObogbZWArj1Kk2j/Gbuic74pgQ+iZOKdqFmmO6KcoudjOqx01Km+y3Rlf/mD
 1sBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=J8eMnnyABy7XSBsmUrNoL+ReTiqaDOWtN2nCCVFhCqs=;
 b=RyDtsJJ1wzSpJiurMwG1xaTjJZXWhUjTRhD0DLkcWtLmBaOTIcK1tgq4SfOl8Zte8Y
 S2lWFqHaitJTsdkzaw8ynRQpN+bVhcL8d7WWXz61woE0uE19qqjzzJ3l/0ckg6qwHLET
 SOwXCp85+CnvV2/dE7a/wQYXkEwRm8joDwTDtIL0fo273ZpdZCAhHqEDFih4NRz7v115
 wcXOKe2ZyXJxE46ScKeXFes0fTGXCkEwmkDp4JAzvB/6OZfsHQMkVvDMniB6ZGQtZR+6
 iqiZX0JQ/UsGNIwxurXTAzQpTPdZJFT+0xNNODxywgrg3ZAix7WNhjEToTYGBtodYtXq
 Vebg==
X-Gm-Message-State: AOAM533OvsT2YnYooiv1XNl/FMQ0VrW4cDZJTw4rA1Xxh5+V6QCsxzry
 2ia/cV2zVBqouAvE+gts4F+1exFM18s=
X-Google-Smtp-Source: ABdhPJxBQsLlN3q3gLktbz30V0eyDGm30bpmR6VCZ14Eo8Mp/p3jIHv/TbxlZGD7N2OXreYTt8s9CQ==
X-Received: by 2002:a17:906:9b8f:: with SMTP id
 dd15mr63265ejc.480.1641825664966; 
 Mon, 10 Jan 2022 06:41:04 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k25sm2549498ejk.179.2022.01.10.06.41.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 06:41:04 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/18] configure: do not create roms/seabios/config.mak if
 SeaBIOS not present
Date: Mon, 10 Jan 2022 15:40:32 +0100
Message-Id: <20220110144034.67410-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220110144034.67410-1-pbonzini@redhat.com>
References: <20220110144034.67410-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::533
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

If roms/seabios/Makefile is not present, the configure script
is not creating the roms/seabios directory anymore (commit
5dce7b8d8c, "configure: remove DIRS", 2021-12-18); thus, creating
roms/seabios/config.mak fails.

The easiest thing to do is to not create the file, since it will not
be used.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 0026388343..e1a31fb332 100755
--- a/configure
+++ b/configure
@@ -3704,7 +3704,8 @@ export target_list source_path use_containers cpu
 $source_path/tests/tcg/configure.sh)
 
 # temporary config to build submodules
-for rom in seabios; do
+if test -f $source_path/roms/seabios/Makefile; then
+  for rom in seabios; do
     config_mak=roms/$rom/config.mak
     echo "# Automatically generated by configure - do not modify" > $config_mak
     echo "SRC_PATH=$source_path/roms/$rom" >> $config_mak
@@ -3717,7 +3718,8 @@ for rom in seabios; do
     echo "IASL=$iasl" >> $config_mak
     echo "LD=$ld" >> $config_mak
     echo "RANLIB=$ranlib" >> $config_mak
-done
+  done
+fi
 
 config_mak=pc-bios/optionrom/config.mak
 echo "# Automatically generated by configure - do not modify" > $config_mak
-- 
2.33.1



