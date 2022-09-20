Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 258DE5BE782
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 15:48:11 +0200 (CEST)
Received: from localhost ([::1]:54142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oadbe-0000Xx-7O
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 09:48:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaZc-0001Um-HO
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:33:54 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:41709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaZb-000527-0r
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:33:52 -0400
Received: by mail-pf1-x434.google.com with SMTP id l65so2312433pfl.8
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 03:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=TUsOJQnvJjC5OLNKVEVXq4E1NZhuCvF9KTJRvGMNaas=;
 b=fAQut5FG7k+vX/K+84SOyBUhKU2ziyp3XHW5qv9z22sE/9tUQhqXwK91ob2kLkNhVs
 Ev+nY5PtL+DpqDidF+m/fzIOvoja5sE3Sc4H/NvQP75qpKn9GKKZGJ2uyKqi9ZFeQhHX
 TtJggo0677WGmyro719DQ3kTspe7Ca9HckmuE+9rPshqNpS/VuqLIFjjk4IwV40YgeoX
 yjfox/Jd7py79bRqNgcntpWtaTFgKKm+l31udziQI29ZV1KNozhnngwbAzHafPfNfA2h
 0YkM+c2QhDvgeLZNmyzpn1VtaE+3mqxLHUKCwyP40g8Yow3qz7d3olZrwH3m/9RCKhLk
 62EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=TUsOJQnvJjC5OLNKVEVXq4E1NZhuCvF9KTJRvGMNaas=;
 b=vyvXINp0bVC9Zw9osbsZQNtsCnFu5pa0zrAR+TeJ4incElhIyDWycg7G9ho+zMKtOr
 3WxwSvET+cdj3CKoR2lqgOximb6f8pgL+4T8RdWoTkWeP1NFRFYU2/bP8s1asGDt2aMZ
 livo7aP3aM2hzX1xEBRXqJAVW8M0NpbH1TKJiZQp28WHMV5YOfOuoVxuXAyZsoJ1pKOq
 NwK+1fW5pmHwv9O5pOeXN8iPx9KRl0b5jMYabbhk/i9OoQfLTn9nAOlyR0FiBh/7ekFY
 MeLp8WJPL1xYbOnbvOpTTEx4RxrtwSbIAttspYgIVBjs+f20rS2IBFtI3BCFywl+N+yG
 Dx4w==
X-Gm-Message-State: ACrzQf0mjpCwTAjsdZSdCNIkKu8RaG1K9iuYuH/0jWZOJKEh74+3Mlz8
 YdEMz/Ou6TupRSooStwjhkD1g8BMCHo=
X-Google-Smtp-Source: AMsMyM4wuM9SL0nLhaihitJCdsXA3OFYI8AZRPGogtrEcNGHNfVABBijbl3z1ZZuouYRRUrzeCx96Q==
X-Received: by 2002:a63:698a:0:b0:41c:8dfa:e622 with SMTP id
 e132-20020a63698a000000b0041c8dfae622mr19434840pgc.465.1663670029159; 
 Tue, 20 Sep 2022 03:33:49 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 n2-20020aa79842000000b00551fa0e2b2dsm699573pfq.206.2022.09.20.03.33.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 03:33:48 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH v2 36/39] .gitlab-ci.d/windows.yml: Increase the timeout to 90
 minutes
Date: Tue, 20 Sep 2022 18:31:56 +0800
Message-Id: <20220920103159.1865256-37-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920103159.1865256-1-bmeng.cn@gmail.com>
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Bin Meng <bin.meng@windriver.com>

commit 9f8e6cad65a6 ("gitlab-ci: Speed up the msys2-64bit job by using --without-default-devices"
changed to compile QEMU with the --without-default-devices switch for
the msys2-64bit job, due to the build could not complete within the
project timeout (1h), and also mentioned that a bigger timeout was
getting ignored on the shared Gitlab-CI Windows runners.

However as of today it seems the shared Gitlab-CI Windows runners does
honor the job timeout, and the runner has the timeout limit of 2h, so
let's increase the timeout to 90 minutes and drop the configure switch
"--without-default-devices" to get a larger build coverage.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

Changes in v2:
- Change the timeout limit to 90 minutes

 .gitlab-ci.d/windows.yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
index da6013904a..818676662a 100644
--- a/.gitlab-ci.d/windows.yml
+++ b/.gitlab-ci.d/windows.yml
@@ -10,7 +10,7 @@
       - ${CI_PROJECT_DIR}/msys64/var/cache
   needs: []
   stage: build
-  timeout: 70m
+  timeout: 90m
   before_script:
   - If ( !(Test-Path -Path msys64\var\cache ) ) {
       mkdir msys64\var\cache
@@ -59,7 +59,7 @@ msys2-64bit:
   - $env:MSYSTEM = 'MINGW64'     # Start a 64 bit Mingw environment
   - $env:MSYS = 'winsymlinks:native' # Enable native Windows symlink
   - .\msys64\usr\bin\bash -lc './configure --target-list=x86_64-softmmu
-      --enable-capstone --without-default-devices'
+      --enable-capstone'
   - .\msys64\usr\bin\bash -lc "sed -i '/^ROMS=/d' build/config-host.mak"
   - .\msys64\usr\bin\bash -lc 'make'
   - .\msys64\usr\bin\bash -lc 'make check'
-- 
2.34.1


