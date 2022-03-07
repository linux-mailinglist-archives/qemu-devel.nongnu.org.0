Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7999A4D069A
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 19:33:15 +0100 (CET)
Received: from localhost ([::1]:35592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRIAU-0002t1-Jc
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 13:33:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRHum-0001K1-3h
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:17:00 -0500
Received: from [2a00:1450:4864:20::534] (port=43887
 helo=mail-ed1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRHuh-0005PB-Li
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:16:59 -0500
Received: by mail-ed1-x534.google.com with SMTP id f8so21138088edf.10
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 10:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bQ7QzzDfZTAEzBPQemH/goOcF8IL8Rwa/E0oZZAhyPI=;
 b=Ctx+b7qnam6DgRiLYavBX+b3ga4c6OwkvGFaGxrAtqB+rJ8f9+H2MbWWhNcNKNRG76
 r2UEUoyMpKYGVpMnlO7Mg9lWlFRsD3ZtcraAR0LcXfoE8rclf0bKbhQqYJnt6ZgVWgv3
 I0OgfTYO1LWv8Qep86MNKiTNDYSPMFwixkrL0I1OgX/2NJ/4aA19ysZVR8LJ2dZtdp9+
 sAhbTZkgZt1q5DGDVaEXmtpcg6wd1CVGjompmne2x68gB/andm3US88PvH0pVdKMDnbp
 WDHpGkwjxwrpZE1dRezMYbKf+C4Wc50QSRyRqJ6qxydArfV3OtkCDMQtCAWjyMAtspx3
 v9cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=bQ7QzzDfZTAEzBPQemH/goOcF8IL8Rwa/E0oZZAhyPI=;
 b=g2VP5wLBv3jx3XC5NnEOg1/smAygOREyS3Eu6aigT1EF5qbI7BqF2GU9tu/Adww3g5
 9sQqRpNyr90NE6P+eYBvjx6XCVfu/ySt4bCIUp/ez2iqNMM0hP+mYO/w36eu+9hCLr2k
 Own20HXs2tvT08ZKSggZ78CTRW2MjmkEvdG7uoNyxCv9LyV+i2EhSLb/RUH7UB+AP/HI
 yfh2yrqqhFEYgI0SsZC12PXKdg5u62eLP+tbzbRK/MLZLGhycRqh7v/gLDtL+IDRJgwp
 /l1ZWy6b+hP9p0DJ2RNNYBhBE6ySB01nvssqu4xm6KnbHowCPppUj0x4C89HRAsTurgL
 eXeQ==
X-Gm-Message-State: AOAM5306I3wJW9cwi1vCIyFRNNZGpWV5iY6QkOg8+e7JSg5yg8lPU+Ws
 ostaxjKiEXyn544+LYWltYyBGNC08wQ=
X-Google-Smtp-Source: ABdhPJzWqSj4F3uVvY6yxEGJb/VK0KKRltTPBvsl4q6Nh6ZohnlFD1q5NTbRIb6kLVOnmta+T9YzPw==
X-Received: by 2002:aa7:de0e:0:b0:416:607c:6d45 with SMTP id
 h14-20020aa7de0e000000b00416607c6d45mr2402905edv.127.1646677014242; 
 Mon, 07 Mar 2022 10:16:54 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a170906304800b006cdf8a1e146sm4983382ejd.217.2022.03.07.10.16.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 10:16:53 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 23/23] gitlab-ci: do not run tests with address sanitizer
Date: Mon,  7 Mar 2022 19:16:33 +0100
Message-Id: <20220307181633.596898-24-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307181633.596898-1-pbonzini@redhat.com>
References: <20220307181633.596898-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::534
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
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


