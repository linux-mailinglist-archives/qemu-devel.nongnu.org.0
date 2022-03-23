Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E084E5258
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 13:41:24 +0100 (CET)
Received: from localhost ([::1]:53594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX0Ik-000401-GY
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 08:41:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nWzVU-0003l8-6g
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 07:50:30 -0400
Received: from [2a00:1450:4864:20::530] (port=35787
 helo=mail-ed1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nWzVS-0003Q1-HB
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 07:50:27 -0400
Received: by mail-ed1-x530.google.com with SMTP id k10so1532719edj.2
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 04:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bERp2p0Xrlr6QnzpMTfcSdabbsR9hkmx0eBPG3U9Xy8=;
 b=b3i5sGQlKd7YBa4rPjBFJTb0prNcZnf0gB+uVDPeDAegLn28qtlQ8mJKyoxDDI6Pri
 g8T6lI+58Zhs1zd8sl8Aebz7RHm+hX/fDmwhwQrUIvCMFx0MF3COqQHplGBG9crW7SdR
 Avdu+NAH08HliaA8CDwqYgov5n5TuZc5J7yw4PmYSSE+unuw/PQUp066/4r/JJVzWItK
 qHu1f0PbTpK9/Lqvv1WFGOeywEiK4oSyQm4q44bHfZxVy5vOLZ6u775ebwyDGWXjqEXY
 qmmF1f+OSgVGXlGPbsAPJvNfnJpchycaRQqRZfGxaYo/LjcfDej4pfxxHkxLboY+U9Kc
 c5gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=bERp2p0Xrlr6QnzpMTfcSdabbsR9hkmx0eBPG3U9Xy8=;
 b=79YNoC+SPDNOulMHRP1ppRDdBfFyQn1RAsnYgx5b1pa5Y0IPLlr+4olXlflIW332xY
 9RoUxS2g4+lBx1WiodDANa5mGgSbNR/yQaIP82/Gr2xY6+MuzweV0qNuJdKdZzrG+kPN
 39t1JsqlD10Go0Th+tVRraiL1H9zVy5FfGXNIpSZU3jIE72ki9RLRPvj5BlQaWP3z2Pr
 WRTYczCDXoc+dVLgCUkI8kFS4ZlLbel5QtmnwGtYBAGZFDa95nQYIeXy4cPH1TSF92mB
 posdioDwjiSdv8sz9dxwktWGjNDhqozusyo2Z+r9rbQWSYaJ0XBk5phggCpqF4PXCEbZ
 6ukQ==
X-Gm-Message-State: AOAM533fphL7o9MYRreKdXB7u1u4e24QfUQZcrxIhNX5Bw8VL8GzaB7I
 IThRZIUkBwzl0LgqGu03mpx9VmBMUco=
X-Google-Smtp-Source: ABdhPJwX3aSsd4SlpgzyNzz0cQgn0SMYbgcYwDXQuhF51je8dmcio0CweuFRlqI4U9q1wmyM1pKGAw==
X-Received: by 2002:a05:6402:5193:b0:419:3d19:ce9e with SMTP id
 q19-20020a056402519300b004193d19ce9emr16851286edd.199.1648036223132; 
 Wed, 23 Mar 2022 04:50:23 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 p23-20020a170906605700b006ccebe7f75dsm9685514ejj.123.2022.03.23.04.50.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 04:50:22 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] configure: remove dead int128 test
Date: Wed, 23 Mar 2022 12:50:21 +0100
Message-Id: <20220323115021.24763-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::530
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/configure b/configure
index 6d9cb23ac5..7c08c18358 100755
--- a/configure
+++ b/configure
@@ -2463,24 +2463,6 @@ else # "$safe_stack" = ""
 fi
 fi
 
-########################################
-# check if __[u]int128_t is usable.
-
-int128=no
-cat > $TMPC << EOF
-__int128_t a;
-__uint128_t b;
-int main (void) {
-  a = a + b;
-  b = a * b;
-  a = a * a;
-  return 0;
-}
-EOF
-if compile_prog "" "" ; then
-    int128=yes
-fi
-
 ########################################
 # check if ccache is interfering with
 # semantic analysis of macros
-- 
2.35.1


