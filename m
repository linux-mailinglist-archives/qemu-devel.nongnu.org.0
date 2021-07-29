Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0653DA359
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 14:49:18 +0200 (CEST)
Received: from localhost ([::1]:60764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m95TR-00062D-H8
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 08:49:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m95RX-0003S8-56
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 08:47:19 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:37758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m95RV-0007VL-JA
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 08:47:18 -0400
Received: by mail-ed1-x535.google.com with SMTP id h8so8053642ede.4
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 05:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bVkJDxISQsJiDctueFKDZan7YC/pcML2RCP1C418uk4=;
 b=c06BUHB91VgQ+8E6/MrKgA2a2Ws/JgbUomkSp4pt16jwo+DLrjJueCCc5BjFhFGpzr
 lMITfegCQcQ5wwpZ9xrCjLDxfwKJkYECh5jjfxKFWMyPJ7zDRB845ZiuEWiD0K0J28JR
 6qDdu5eOEHhyNba9NM4A2IzrdkvtmrA3Fvw1Jmf5ASQYlOku8Tgxep3y/eFVU6yd/8FL
 uK3aTxccc3g2ddBCbwrHXi9tmvujAxrhyv8TecUrUORr4dWGndfqb4k2wek96uNWHncI
 OqMZr7HO12zsQbyD1yv8ErnHV/9W5Ti7D8OfRmHDNLBzWZ9ExtRyi5NsDd80S5S7Vdke
 Bx6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=bVkJDxISQsJiDctueFKDZan7YC/pcML2RCP1C418uk4=;
 b=hJhLMGAiFmaFg/OE2Vveccq20fcK3JOyY1/wj4HcKoRQGk8XY3OA+zNOxThniFCemG
 ZfmPyL9bgtDgSH335vt1A+uOCVa4JRv3AqYq98j2tUmBcGhq5Zsek+3acjkIx5zAY4oo
 xFhD70fREqw7JAM6UAWnpSa9ggGEAYwX4RgPRfA1UiYgrZybRNmrKM4hrTPNXBniKy6G
 o8Be3asQb1sXcPmAWC5CmI3ilO7W5SNGvDtccHF44NGm/sbjPTYSdTn9ZbWAyM98gBHf
 lwsgwYpqdX82pU1aQWPqrU3lg2qghuGFobtl28b9vRIBmG/2/1+6W/0Es0ZGUOLhUuXH
 EiyQ==
X-Gm-Message-State: AOAM532wIlJn3v8k+P6QlB0E6BR9nFBPd6p0s41N4Fwi8L3xafSpgMkw
 4sIKUktYAM/j+b++ZTkcC/ghPll121fUcg==
X-Google-Smtp-Source: ABdhPJy9FHz9OB/nJCj1/QqX5UdqbW4GlOH97zct1Rnjl33wPrJy4PQoC91FwWd9qgV9f/yz2MAUqg==
X-Received: by 2002:a05:6402:1778:: with SMTP id
 da24mr2707480edb.385.1627562836164; 
 Thu, 29 Jul 2021 05:47:16 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id m12sm954659ejd.21.2021.07.29.05.47.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 05:47:15 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/7] i386: assert 'cs->kvm_state' is not null
Date: Thu, 29 Jul 2021 14:47:07 +0200
Message-Id: <20210729124713.208422-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210729124713.208422-1-pbonzini@redhat.com>
References: <20210729124713.208422-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vitaly Kuznetsov <vkuznets@redhat.com>

Coverity reports potential NULL pointer dereference in
get_supported_hv_cpuid_legacy() when 'cs->kvm_state' is NULL. While
'cs->kvm_state' can indeed be NULL in hv_cpuid_get_host(),
kvm_hyperv_expand_features() makes sure that it only happens when
KVM_CAP_SYS_HYPERV_CPUID is supported and KVM_CAP_SYS_HYPERV_CPUID
implies KVM_CAP_HYPERV_CPUID so get_supported_hv_cpuid_legacy() is
never really called. Add asserts to strengthen the protection against
broken KVM behavior.

Coverity: CID 1458243
Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
Message-Id: <20210716115852.418293-1-vkuznets@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/kvm/kvm.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 59ed8327ac..e69abe48e3 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -974,6 +974,12 @@ static struct kvm_cpuid2 *get_supported_hv_cpuid(CPUState *cs)
     do_sys_ioctl =
         kvm_check_extension(kvm_state, KVM_CAP_SYS_HYPERV_CPUID) > 0;
 
+    /*
+     * Non-empty KVM context is needed when KVM_CAP_SYS_HYPERV_CPUID is
+     * unsupported, kvm_hyperv_expand_features() checks for that.
+     */
+    assert(do_sys_ioctl || cs->kvm_state);
+
     /*
      * When the buffer is too small, KVM_GET_SUPPORTED_HV_CPUID fails with
      * -E2BIG, however, it doesn't report back the right size. Keep increasing
@@ -1105,6 +1111,14 @@ static uint32_t hv_cpuid_get_host(CPUState *cs, uint32_t func, int reg)
         if (kvm_check_extension(kvm_state, KVM_CAP_HYPERV_CPUID) > 0) {
             cpuid = get_supported_hv_cpuid(cs);
         } else {
+            /*
+             * 'cs->kvm_state' may be NULL when Hyper-V features are expanded
+             * before KVM context is created but this is only done when
+             * KVM_CAP_SYS_HYPERV_CPUID is supported and it implies
+             * KVM_CAP_HYPERV_CPUID.
+             */
+            assert(cs->kvm_state);
+
             cpuid = get_supported_hv_cpuid_legacy(cs);
         }
         hv_cpuid_cache = cpuid;
-- 
2.31.1



