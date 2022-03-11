Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D684D4D62A2
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 14:53:40 +0100 (CET)
Received: from localhost ([::1]:36744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSfi7-0000QK-EY
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 08:53:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nSfh0-0007qK-Bj
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 08:52:30 -0500
Received: from [2a00:1450:4864:20::533] (port=38403
 helo=mail-ed1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nSfgy-0005gf-MC
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 08:52:30 -0500
Received: by mail-ed1-x533.google.com with SMTP id h13so10994719ede.5
 for <qemu-devel@nongnu.org>; Fri, 11 Mar 2022 05:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SAcaA+xc4yxAPK9nO2P/jx+6jiZeDY//zxKI1koGKoQ=;
 b=MJ5RqoO5uF3mEfs8uIgpUM0ThpobExR2+sUUORaEn1fAV9/hc8NG81tYUbD6d2Kd5n
 HxvGcIG5sHV+MJLFNogPtOK/CknhOwYKXUE12N/hpin1A94ukz8VlfLwgYpj/n+N9jaz
 aMj66nezeB9gmYUS1El5pefpH8RTXGBryGXr7KVWrB3OCTRCMP36rcW5ROE4noNDF68Z
 iWqIyP7yfwGlztxDqjmzjouwzeZV6WD4ycopPLiLQwIB7z9N6VnrYqyW4fbCx73ANXHv
 51cPqfGYnuq67iz1Ng9TfiGmZDLi/FNf6BYf5DHqGUCGfgCIKIsH32Dc692mPo1enzTm
 5ZOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SAcaA+xc4yxAPK9nO2P/jx+6jiZeDY//zxKI1koGKoQ=;
 b=Gu08UVndnIYmMG8Hw6ViAKomaeSkvG75rVYLf3VRks0G5njvv38wvamX6i33O9Bh+K
 XbZWCm9SrvF+alKSX4U1wYi5jealIDU8BlSE4gXCVZTAR6McxapHX+qIvqT6RCqk3G/N
 J2QME0WDDYqMAekVpnkbtxQaEhR9oED9Vj9W+j0gLXGsMqdRrRH1jy4mkRjSDiX6lFQ6
 hqX3yIy3h0wH3bIs+e+kK9hSrQRxROkQ27iK2AUoevbmNSu/ieWCxpVrkzHvKcfgfxil
 WlaKvgEzJ9DgUpcZyBCjbFAMEu2SM1EDbN7JOmwE8oBvZ34KmkyA1idwXMAUXFvAaX7F
 ir4g==
X-Gm-Message-State: AOAM532TxW1EnCzMTKHJCxwca7c9vih7gV1VUsZsh3s7PrP+dit773sM
 eOp7RNiKBwjSFEvC8W45LJFLSsoh6uXlZQ==
X-Google-Smtp-Source: ABdhPJwz7N1EZ1bIrvnUYiJgx8ENXMdqOOEFwEHaE6GYEf1uivG7EnMs9oX5ZheqAbAvU9PgQIlBww==
X-Received: by 2002:a05:6402:518a:b0:416:b50e:3c7d with SMTP id
 q10-20020a056402518a00b00416b50e3c7dmr7147163edd.177.1647006746006; 
 Fri, 11 Mar 2022 05:52:26 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 p24-20020a1709061b5800b006da6435cedcsm2941471ejg.132.2022.03.11.05.52.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Mar 2022 05:52:24 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 06DDC1FFB7;
 Fri, 11 Mar 2022 13:52:24 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] mailmap/gitdm: more fixes for bad tags and authors
Date: Fri, 11 Mar 2022 13:52:00 +0000
Message-Id: <20220311135200.680127-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::533
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Jason Wang <jasowang@redhat.com>, Michael Ellerman <michael@ellerman.id.au>,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <andreas.faerber@web.de>,
 Peter Chubb <peter.chubb@nicta.com.au>, Aaron Larson <alarson@ddci.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I was running some historical tags for the last 10 years and got the
following warnings:

  git log --use-mailmap --numstat --since "June 2010" | ~/src/gitdm.git/gitdm -n -l 5
  alarson@ddci.com is an author name, probably not what you want
  bad utf-8 ('utf-8' codec can't decode byte 0xe4 in position 552: invalid continuation byte) in patchm skipping
  bad utf-8 ('utf-8' codec can't decode byte 0xe4 in position 342: invalid continuation byte) in patchm skipping
  michael@ozlabs.org  is an author name, probably not what you want
  Oops...funky email nicta.com.au
  bad utf-8 ('utf-8' codec can't decode byte 0xe9 in position 232: invalid continuation byte) in patchm skipping
  Oops...funky email andreas.faerber
  Grabbing changesets...done
  Processed 76422 csets from 1902 developers

The following fixes try and alleviate that although I still get a
warning for Aaron which I think is from 9743cd5736.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Aaron Larson <alarson@ddci.com>
Cc: Andreas Färber <andreas.faerber@web.de>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Michael Ellerman <michael@ellerman.id.au>
Cc: Peter Chubb <peter.chubb@nicta.com.au>
---
 .mailmap              | 6 ++++++
 contrib/gitdm/aliases | 5 ++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index 5113f55b3a..5dc168b199 100644
--- a/.mailmap
+++ b/.mailmap
@@ -28,7 +28,11 @@ Thiemo Seufer <ths@networkno.de> ths <ths@c046a42c-6fe2-441c-8c8c-71466251a162>
 malc <av1474@comtv.ru> malc <malc@c046a42c-6fe2-441c-8c8c-71466251a162>
 
 # Corrupted Author fields
+Aaron Larson <alarson@ddci.com> alarson@ddci.com
+Andreas Färber <andreas.faerber@web.de> Andreas Färber <andreas.faerber>
+Jason Wang <jasowang@redhat.com> Jason Wang <jasowang>
 Marek Dolata <mkdolata@us.ibm.com> mkdolata@us.ibm.com <mkdolata@us.ibm.com>
+Michael Ellerman <michael@ellerman.id.au> michael@ozlabs.org <michael@ozlabs.org>
 Nick Hudson <hnick@vmware.com> hnick@vmware.com <hnick@vmware.com>
 
 # There is also a:
@@ -70,6 +74,7 @@ Yongbok Kim <yongbok.kim@mips.com> <yongbok.kim@imgtec.com>
 # Also list preferred name forms where people have changed their
 # git author config, or had utf8/latin1 encoding issues.
 Aaron Lindsay <aaron@os.amperecomputing.com>
+Aaron Larson <alarson@ddci.com>
 Alexey Gerasimenko <x1917x@gmail.com>
 Alex Chen <alex.chen@huawei.com>
 Alex Ivanov <void@aleksoft.net>
@@ -144,6 +149,7 @@ Pan Nengyuan <pannengyuan@huawei.com>
 Pavel Dovgaluk <dovgaluk@ispras.ru>
 Pavel Dovgaluk <pavel.dovgaluk@gmail.com>
 Pavel Dovgaluk <Pavel.Dovgaluk@ispras.ru>
+Peter Chubb <peter.chubb@nicta.com.au>
 Peter Crosthwaite <crosthwaite.peter@gmail.com>
 Peter Crosthwaite <peter.crosthwaite@petalogix.com>
 Peter Crosthwaite <peter.crosthwaite@xilinx.com>
diff --git a/contrib/gitdm/aliases b/contrib/gitdm/aliases
index 4792413ce7..5b31635c15 100644
--- a/contrib/gitdm/aliases
+++ b/contrib/gitdm/aliases
@@ -34,8 +34,11 @@ malc@c046a42c-6fe2-441c-8c8c-71466251a162 av1474@comtv.ru
 # canonical emails
 liq3ea@163.com liq3ea@gmail.com
 
-# some broken tags
+# some broken DCO tags
 yuval.shaia.ml.gmail.com yuval.shaia.ml@gmail.com
+jasowang jasowang@redhat.com
+nicta.com.au peter.chubb@nicta.com.au
+alarson@ddci.com alarson@ddci.com
 
 # There is also a:
 #    (no author) <(no author)@c046a42c-6fe2-441c-8c8c-71466251a162>
-- 
2.30.2


