Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1B36D82FF
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 18:07:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk5e6-0006ug-RW; Wed, 05 Apr 2023 12:06:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk5e4-0006o8-0N
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 12:06:00 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk5e1-00087N-6X
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 12:05:59 -0400
Received: by mail-wr1-x431.google.com with SMTP id h17so36705801wrt.8
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 09:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680710755;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YCSdJqBx+24lo5un4mJkeawVRhwXkPODtT/ypBXdn1k=;
 b=nYNsq+8yFO7mMRk2/GCs4D4e2iDu1F5AjhPlSj5MwnASO0hw5U/4oxpVLogb6drfmz
 3xU+KV29anaINmgzTl9ZhOc9H9utB1dE343KJ/Ch3nsDN2awoc2m/uGIUTaVMxmzxSgG
 xqRD/xBZxEreYRjFvoqcqzu5XK6hiX/J8pDK3O5eVEHmU9QCzAK4BaAmplmm9aESOaiO
 ae6Uv7SF5z/IgEENdF+M+eAcH47+wYVpnVgBJUOx9FPSM7Zy1/YL3ZUrvW8BmVJCLBZH
 ZI65eOSaRJWzT4iXngpJ6wyoT9UFNgKF6YSG3WUY8ns0z8i9D9egnrZvA5oKcJER0raT
 J/qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680710755;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YCSdJqBx+24lo5un4mJkeawVRhwXkPODtT/ypBXdn1k=;
 b=fK58KzfHMntZwFzP3U/7JWbyCY1/uLcUOmUI8ErVqgksox53xY0W8BE5J2JkW7ZU/r
 Z+pK6suQymbAYZG7WvzkAxUVEjkdvd6FPlD21oKDZaOLnWMVSet6Ln7L67XXc1fcFFGF
 OjVIsmnGlhebHOrKGtpzFeLm7+eIShVQ5Uh2QqG+EWKhP4xy/wMwg3eVUow22X39hARP
 FjZJS6bxG9/lLTSpxZ5YtMERhQG3woP0IVuLl/LMtYyFBMS835423d6S4DkmQQ9ywCic
 VG038fDVyunTVYtABkPoEU+jH8znlWTDJnmzPLrrUrYfwA4f6JxKAyqIxAgvm/LUhlhj
 tnKA==
X-Gm-Message-State: AAQBX9frlOow8W+tKOYyQOas9Woz8MNHzVGg3PiDQvjXWmMrGLhgBV+b
 HN4Rt2W0r07WN9LWIda4n15V4nh0cVrl/RQvD0Y=
X-Google-Smtp-Source: AKy350YkYdiHXB0g5ih7Cr+SgsA3BhgsWi6U992BWoRDvOtWKxTNhNkKh0iJQeFeR5+OUd9Zhgsf8g==
X-Received: by 2002:a5d:4745:0:b0:2ce:a835:83d4 with SMTP id
 o5-20020a5d4745000000b002cea83583d4mr2147619wrs.27.1680710755745; 
 Wed, 05 Apr 2023 09:05:55 -0700 (PDT)
Received: from localhost.localdomain
 (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr. [176.184.52.81])
 by smtp.gmail.com with ESMTPSA id
 a12-20020a056000100c00b002cea8664304sm15199709wrx.91.2023.04.05.09.05.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 05 Apr 2023 09:05:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH 10/10] hw/s390x: Rename pv.c -> pv-kvm.c
Date: Wed,  5 Apr 2023 18:04:54 +0200
Message-Id: <20230405160454.97436-11-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230405160454.97436-1-philmd@linaro.org>
References: <20230405160454.97436-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Protected Virtualization is specific to KVM.
Rename the file as 'pv-kvm.c' to make this clearer.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/s390x/{pv.c => pv-kvm.c} | 0
 hw/s390x/meson.build        | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename hw/s390x/{pv.c => pv-kvm.c} (100%)

diff --git a/hw/s390x/pv.c b/hw/s390x/pv-kvm.c
similarity index 100%
rename from hw/s390x/pv.c
rename to hw/s390x/pv-kvm.c
diff --git a/hw/s390x/meson.build b/hw/s390x/meson.build
index f291016fee..2f43b6c473 100644
--- a/hw/s390x/meson.build
+++ b/hw/s390x/meson.build
@@ -22,7 +22,7 @@ s390x_ss.add(when: 'CONFIG_KVM', if_true: files(
   'tod-kvm.c',
   's390-skeys-kvm.c',
   's390-stattrib-kvm.c',
-  'pv.c',
+  'pv-kvm.c',
   's390-pci-kvm.c',
 ))
 s390x_ss.add(when: 'CONFIG_TCG', if_true: files(
-- 
2.38.1


