Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7B76BF9A2
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Mar 2023 12:48:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdV1R-0004mS-PU; Sat, 18 Mar 2023 07:46:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pdV1O-0004lL-4V
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 07:46:50 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pdV1L-0007CQ-DZ
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 07:46:49 -0400
Received: by mail-wr1-x42a.google.com with SMTP id o7so6503041wrg.5
 for <qemu-devel@nongnu.org>; Sat, 18 Mar 2023 04:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679140006;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1N/OulA3IcWNhsQzhmChEA/faRYoekZujDhr1Ro9J5g=;
 b=vLbWC8ibZASKEFYqBskixr6opRCmrRvwACmc1nR5FJ3I5uGdXmIT09t5gLkrwFBI/n
 jzLCNlilNCwZS7/UpgbjptcUvphmdxxPGbMKzs7gW0PTkoS6LIsfVcBN96tMooq9iXJn
 RUtmke7eO7gls1LRcC5QijJAIgzd3gqNvYvDRfB4SoDKBJ4EGzYxa2Kx7Zlln3OXAroQ
 93oAYnGlQjrqa/hBqsaviab3P5xboUyFjoPc3T1nLaauska41hRziYDJzLnJCXniwcTm
 ype/x8OYGnNdTjkEuI4r3lURNr2UupZfEgVQCjtHqA0qL4fkFOW79fb56Lp9CX64ESjq
 YHhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679140006;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1N/OulA3IcWNhsQzhmChEA/faRYoekZujDhr1Ro9J5g=;
 b=50o1+dV2m4trn7CUDlDUkdU+IKu8C/iP7ZY3pZtbn9M2m5MT/VYV+1mm0dPJlyOjbK
 0ewG2qWhS779EX7lFhQXJgMpZtuheFGDBzRqajMil2ztBXlPUJySo/C8x91g9D05kGY7
 M5yXcV/iZTC70b81t+UvS77JNqktPCwbBJ9lbMrGxc5k7scQnvehBS1wVwyjqATluTNI
 PWC3lICqeRusc2Fq8/FFCjie4SdJd8Jw3/EZYJYER6vcdN2xj4Ti1GpvkyY1Y7GgJKoF
 ponnNGUqDx/5w/wH68MLzghHTycWrbNBYk57gi3s02JAfeJA3Fi4lpDeeqf/E3J+HK2v
 7yrQ==
X-Gm-Message-State: AO0yUKVsz5pVFONGKdD+dUcbcDWEB+RmUVQbF7lSWwTkoSuoOIBtLPAX
 baWhB8PKKYLlCccOC44J74ZL6gD7qpFSKc2C1dA=
X-Google-Smtp-Source: AK7set+GSnJbEbWpcAq6VslhKlPGcISt4/WZ9lOgdnj5XlQxQOLVZmKCq/dOukbpCOWMTC00HVKbPA==
X-Received: by 2002:a5d:534e:0:b0:2ce:9fb8:b560 with SMTP id
 t14-20020a5d534e000000b002ce9fb8b560mr9267528wrv.8.1679140005808; 
 Sat, 18 Mar 2023 04:46:45 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 d10-20020adfe88a000000b002c70e60abd4sm4223137wrm.2.2023.03.18.04.46.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 04:46:45 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D85ED1FFBB;
 Sat, 18 Mar 2023 11:46:44 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 03/31] scripts/ci: add libslirp-devel to build-environment
Date: Sat, 18 Mar 2023 11:46:16 +0000
Message-Id: <20230318114644.1340899-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318114644.1340899-1-alex.bennee@linaro.org>
References: <20230318114644.1340899-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Without libslip enabled we won't have user networking which means the
KVM tests won't run.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230315174331.2959-4-alex.bennee@linaro.org>

diff --git a/scripts/ci/org.centos/stream/8/build-environment.yml b/scripts/ci/org.centos/stream/8/build-environment.yml
index 0d094d70c3..1ead77e2cb 100644
--- a/scripts/ci/org.centos/stream/8/build-environment.yml
+++ b/scripts/ci/org.centos/stream/8/build-environment.yml
@@ -55,6 +55,7 @@
           - librados-devel
           - librbd-devel
           - libseccomp-devel
+          - libslirp-devel
           - libssh-devel
           - libxkbcommon-devel
           - lzo-devel
-- 
2.39.2


