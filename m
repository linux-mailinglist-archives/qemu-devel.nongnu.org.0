Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CCD6D82F6
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 18:06:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk5dL-0005vT-Ix; Wed, 05 Apr 2023 12:05:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk5dK-0005up-8v
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 12:05:14 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk5dH-0007lh-KX
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 12:05:14 -0400
Received: by mail-wm1-x336.google.com with SMTP id s13so21172029wmr.4
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 09:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680710709;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vR5kvRphrC8o/hHrAZxx+p2NR9QjIUYlt0J+xt0JrLs=;
 b=Kue5crNsn30pNOYpY9SPsIZwYEzatKWT1JwNyC4Tz7AI+Dm1LFg9LUQzgpf2K6tikc
 mk/JLoWJuJW2YMb/u8tpJRDDD7NE7oEZWhjMD1NIUNYPSkllpMt4dfkpHFl4mXkmb2/c
 TNeHcs9kjwshAlFLaAd4rINe8sxW9leo230jyONFwRebI56QBZwVXxxrhO9P73poHXtK
 Y8QJ/YWtGqiDl6UF/8eCPHY7/WUX9shWQCd5AGt9lFkl2TKo5jGKRk9cKJNCtgCpeGep
 9jtSe7h0htiRpqIt8S8VefTo70S/iyC9ehr9mAsFxriP5352D4IpRYJpO5PNI1YHwluK
 zLVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680710709;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vR5kvRphrC8o/hHrAZxx+p2NR9QjIUYlt0J+xt0JrLs=;
 b=bAPJJqT0jK6Xj0CAAM5ESBNBxJIV+4dsHUfiFaBg/RW/+1vX+/DRLiexcF3ZAxiVAM
 88vnRgkEnakrXBVr7G3d8hAPlvp9FBaa98xa41sUPuWjff10VoDMsIcQkiVI94qW2IUF
 bsyAUs/NkmsSmCabLBJGxmKV/HffG7GU2m00biusQmB9ZInT8mwMJFYU3/tiD+exFY7g
 tY0LvmDfSkkCNia+L/GGxWMF6zF3aM0tdJ/VINXSg298ATYrLc3pePChMyeTRaY5XEE1
 e2pQCiSbgBCIHTVJc64ZxpEw84xjC36ISf0womhSrk4FTKatJntWrBgQBZ/dM4lcjQ60
 0otA==
X-Gm-Message-State: AAQBX9cGFev6GO8U9gLyP59ITGxuC2XfSKvQMl8fZwnjA2iz+2rmWW3t
 dZ7KgRxWWH7U1wiQk1jhEl1WcQwBz5d34OYLShc=
X-Google-Smtp-Source: AKy350ZaWzKW7gNGd6JCeIyd+5HFBIKAziuH2LQaatqde7bMAk2r3xVbM5UGjlxR3ZLELjGpAEwkSQ==
X-Received: by 2002:a7b:c7d4:0:b0:3ed:809b:79ac with SMTP id
 z20-20020a7bc7d4000000b003ed809b79acmr5056954wmk.19.1680710709383; 
 Wed, 05 Apr 2023 09:05:09 -0700 (PDT)
Received: from localhost.localdomain
 (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr. [176.184.52.81])
 by smtp.gmail.com with ESMTPSA id
 t6-20020a05600c450600b003ee2a0d49dbsm2642061wmo.25.2023.04.05.09.05.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 05 Apr 2023 09:05:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 02/10] accel/kvm: Declare kvm_direct_msi_allowed in stubs
Date: Wed,  5 Apr 2023 18:04:46 +0200
Message-Id: <20230405160454.97436-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230405160454.97436-1-philmd@linaro.org>
References: <20230405160454.97436-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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

Avoid when calling kvm_direct_msi_enabled() from
arm_gicv3_its_common.c the next commit:

  Undefined symbols for architecture arm64:
    "_kvm_direct_msi_allowed", referenced from:
        _its_class_name in hw_intc_arm_gicv3_its_common.c.o
  ld: symbol(s) not found for architecture arm64

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/stubs/kvm-stub.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/accel/stubs/kvm-stub.c b/accel/stubs/kvm-stub.c
index 5d2dd8f351..235dc661bc 100644
--- a/accel/stubs/kvm-stub.c
+++ b/accel/stubs/kvm-stub.c
@@ -27,6 +27,7 @@ bool kvm_allowed;
 bool kvm_readonly_mem_allowed;
 bool kvm_ioeventfd_any_length_allowed;
 bool kvm_msi_use_devid;
+bool kvm_direct_msi_allowed;
 
 void kvm_flush_coalesced_mmio_buffer(void)
 {
-- 
2.38.1


