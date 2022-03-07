Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7DD4D00FF
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 15:21:44 +0100 (CET)
Received: from localhost ([::1]:58454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nREF3-0005ME-VI
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 09:21:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRED2-0003dz-Ly
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 09:19:36 -0500
Received: from [2a00:1450:4864:20::62d] (port=39507
 helo=mail-ej1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRED1-0005mE-2A
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 09:19:36 -0500
Received: by mail-ej1-x62d.google.com with SMTP id dr20so32222887ejc.6
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 06:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bQ7QzzDfZTAEzBPQemH/goOcF8IL8Rwa/E0oZZAhyPI=;
 b=ZYbRL2hWaw4EL8tXItlk4s2bE1SOl57aLSEJ2Vbi3KIdz+bMy8uOCK6g/YADmxMqT9
 7q295w9CZOCvN+9XmYjAOLXJ8V5PhCrIz+DwMunltaIwejyMoGhkSnkjHJIDlBwQUgL5
 ttf6+s+E59MvJW0vOnbYtz5gccYyMdt4C0TNAVENPkF5epZuc7siBJ9GmtuXvLlnK3PV
 Wiwj4PVlsiPN127P6clhq/WMQXstaANJk3G7d8bbClXuZP//UHmCq+Rvq0mkWkCUyHLw
 M5JciNZWR6E3Mdba2WJpgPVuqyy2qIhFK36dJUtWJcCoOK+DOjcWavNYM+nOmi3z+rBi
 HnVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=bQ7QzzDfZTAEzBPQemH/goOcF8IL8Rwa/E0oZZAhyPI=;
 b=8RwnwEzw5v5BIDWS12FoH5CNkvqg8YGOF0+yAfUNBgc6aKFUhqSjq7RDEtR2wWBZPI
 7hqOwbRXILgcBpGjaYxHr0lZem8y/3gy2u4brEOeIblzJDz9+9QCIWfs04Ed/82T2t0C
 FZAfBj+GOxT0LRe8KQmSbhAs9zFlJ2lI9ZfwvBbe4Uj9QnMQ6fBW9ka7+cFMges5zlaU
 T3Crapyfwi6jhR3Q/z1CXHuJtJPRCatlR7pHk5ynlxRNOR/MtHT6pRZ0vFGmsztCwgMn
 ixVURzraHbPD30Igx/1V6agrvNK3uJ+7fh9cpE0oBqgZMKfYxP53DwjhcUhpx8WmWcvX
 SQJQ==
X-Gm-Message-State: AOAM532Qrjfbtfa/5ai1IYcpru8HdCEQY+0GmJkHC6V0cYa+pRLEdGW1
 HpVbZgO4joqySx4oV+8K3hiVWgzbsf8=
X-Google-Smtp-Source: ABdhPJzQsFZHNfXJqJSefCkAyHTwXK+p8Mjz4D0kwedBEsNQjaNSOxw0KvQkPvjpJfcrtiIPft3BsQ==
X-Received: by 2002:a17:907:6ea1:b0:6d6:f910:5141 with SMTP id
 sh33-20020a1709076ea100b006d6f9105141mr9320879ejc.123.1646662773038; 
 Mon, 07 Mar 2022 06:19:33 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 uz4-20020a170907118400b006dab1ea6e3asm3942198ejb.51.2022.03.07.06.19.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 06:19:32 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] gitlab-ci: do not run tests with address sanitizer
Date: Mon,  7 Mar 2022 15:19:28 +0100
Message-Id: <20220307141928.571482-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62d.google.com
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
Cc: peter.maydell@linaro.org, berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is flaky and sometimes fails or hangs unexplicably.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 .gitlab-ci.d/buildtest.yml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 0aa70213fb..0aea7ab84c 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -515,8 +515,6 @@ build-oss-fuzz:
         echo Testing ${fuzzer} ... ;
         "${fuzzer}" -runs=1 -seed=1 || exit 1 ;
       done
-    # Unrelated to fuzzer: run some tests with -fsanitize=address
-    - cd build-oss-fuzz && make check-qtest-i386 check-unit
 
 build-tci:
   extends: .native_build_job_template
-- 
2.34.1


