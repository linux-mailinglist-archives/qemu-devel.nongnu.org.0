Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F003A4876E9
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 12:54:51 +0100 (CET)
Received: from localhost ([::1]:34820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5npb-0002t6-0o
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 06:54:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n5niM-0006ZO-SE
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:47:22 -0500
Received: from [2a00:1450:4864:20::536] (port=37506
 helo=mail-ed1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n5niL-0002hj-9M
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:47:22 -0500
Received: by mail-ed1-x536.google.com with SMTP id o6so21167915edc.4
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 03:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J8eMnnyABy7XSBsmUrNoL+ReTiqaDOWtN2nCCVFhCqs=;
 b=gBHXKxW/DfnzS/reDZNLPyw6GwuXj5cNKEdFsAn2oosqu4SKIEyWZhjZZ3+3FIVYOj
 Ar1t7yPj/o+cDjV8cBF0pSGctTTDAnluWSzuwm9Af8y2fnJEKDne+zIawoY/ee+kzQt8
 9gBBPn9e3ViXDezpfWwQGHKlzLyaWfgJrfgW6dcltBxIooHHG5PE8/VuT7kh+9fsHJaM
 craKmVJMCiaUBPMh24N8fQ54aYP+s7ASamTtJbZGZGr3GcV4Gv19HzN3eKpxWACg5qBC
 SjZy+suvLKegsNzC7oHKTEn7NNB6YMipGU1c3skx+ls6StgZclnJFcLYGd0YtnvuUtrq
 bbIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=J8eMnnyABy7XSBsmUrNoL+ReTiqaDOWtN2nCCVFhCqs=;
 b=iR1zKRq57BCwjUuaMuOD+QRusa0Q+7Dqh2ddd4mUUisy7Hb/rXB2iiKJWEBzG8uKOw
 YL7iZlmLAxlUfJFuYOl8iEDYeQojX/JWNkDSug0wsTd+3xvhMgpkHukT8OQS/2DO9zzP
 vNgdYQruQKuTl8xOZXS2OtcsSXeblrUfifZIk5WvEe54nOtPlH/TrqGf5R8iozOGR4L7
 /ogT6pJB8sj3FZU1ePVaQ5GAFx593btsKBbZbBzJCWMWVmE3U5LgN3uxvWjcLRtbgLBM
 1aEdlcQxRnYGhdMHh9QgB+0ruUkQw1FVfpyZRuLSD3QKKdSwrqOgMLLvxSMkCYTlRyY9
 Ne2A==
X-Gm-Message-State: AOAM532ii3/qnIC3TW0aEUztoifzSbOQ0BmsITIMfeYWAF7wAA5bHzOo
 iY2snRjXKywdYE6PWeoJe0gCD9WgyPU=
X-Google-Smtp-Source: ABdhPJzPdYjkZ4ryuAK7Qop5ojPaBKI/scz3x4re72qvuixK+MNhWZS8qUy7RYkj17eHfIEDsM0Lqg==
X-Received: by 2002:a17:906:4c1:: with SMTP id
 g1mr2063496eja.148.1641556039082; 
 Fri, 07 Jan 2022 03:47:19 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312::224])
 by smtp.gmail.com with ESMTPSA id ht15sm1330729ejc.122.2022.01.07.03.47.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 03:47:18 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] configure: do not create roms/seabios/config.mak if SeaBIOS
 not present
Date: Fri,  7 Jan 2022 12:47:17 +0100
Message-Id: <20220107114717.509665-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::536
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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


