Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B964E42BB5B
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 11:19:26 +0200 (CEST)
Received: from localhost ([::1]:44752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maaQ1-0001Kh-NN
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 05:19:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEi-0002Cx-4j
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:44 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:37549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEb-0005f7-Kr
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:40 -0400
Received: by mail-ed1-x532.google.com with SMTP id y12so7307493eda.4
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 02:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XnHUnCLWt30/lAF1VSb0VH9h0dBGTDpJmWynp4ygNJ4=;
 b=IULQBBvd2GZzMCiUYHfLJrZiiwmvlSPwILMG16yfpUzKeiQas+6tMDGZ/aLkjqciT6
 78B76wa4OVAyO7JPZ/rN8+T7k68tifGszd8X0WMBmj8DmTQbJMSQ59IS7fzawoXFbCek
 XMx5Fd+qpkRoJWiSEvjP6BKpne8zddf9RAMw22Ntif9ch+axgposBlRVyFfErSNzEdR/
 Bdacs7HxEgszLLzw/VbaNuEIHZjQ5GV2rsv+GmWPX1BeSAmkf7W9ifoLQps1K/poRATb
 XBhpIhdZcccbxgdykBY0iTBBG0RB3vF2NAr4KskqzoPWuYEJ1ahrTE4CKY8J4Ta6ORpa
 jjag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XnHUnCLWt30/lAF1VSb0VH9h0dBGTDpJmWynp4ygNJ4=;
 b=OJr/gRSdSkjRNngyP/HmTcFQkL3JDSLkFlQID8P8BvQzXB+nJWkec8vJZNTgkZ4t83
 AejSrtsA48LNiinwKivvwJeU3J9YEAkMXCom9AqVVP2l0TMHJSdmNxSZRYYPuhESVSVC
 SvU5j3wZ5KPiHCa9lhdZFt6XcP5VnePxm1WxAxuQrUAuZZzftspz4U2VkCGUoOsmY+5c
 0Rb9X7J8wybsiz/cgGzSsFYNiw/78LXLcs5eGFBDAD+iYUnAsRsnWFfeTMAqzRsnOkXP
 YhXIYjq5Bf+Ss4NwS6iZdsIWY5FP94IqbTKSs38C/kfjI4DvaPQpF/2eQNZZ4RVaSJY4
 7mjQ==
X-Gm-Message-State: AOAM532m9KRYR0vj65vFhR7wJkdrGrlXb9IxSN5HIT0URQCytnPEtiq4
 ZwWPHMnIMHp7H67CaLvYzkDZ05NhiFE=
X-Google-Smtp-Source: ABdhPJzf2G5WvmRAUTHm9F71pA723my9qVe0ar9aIYQp4rwy1hHZvvjz/LBw+0v7qwwDxDLgEFDncg==
X-Received: by 2002:a05:6402:274b:: with SMTP id
 z11mr7747701edd.151.1634116055510; 
 Wed, 13 Oct 2021 02:07:35 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c6sm6177849ejb.41.2021.10.13.02.07.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 02:07:35 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/40] target/i386/kvm: Introduce i386_softmmu_kvm Meson source
 set
Date: Wed, 13 Oct 2021 11:06:56 +0200
Message-Id: <20211013090728.309365-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211013090728.309365-1-pbonzini@redhat.com>
References: <20211013090728.309365-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Introduce the i386_softmmu_kvm Meson source set to be able to
add features dependent on CONFIG_KVM.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211007161716.453984-4-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/kvm/meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/i386/kvm/meson.build b/target/i386/kvm/meson.build
index 0a533411ca..b1c76957c7 100644
--- a/target/i386/kvm/meson.build
+++ b/target/i386/kvm/meson.build
@@ -1,8 +1,12 @@
 i386_ss.add(when: 'CONFIG_KVM', if_false: files('kvm-stub.c'))
 
-i386_softmmu_ss.add(when: 'CONFIG_KVM', if_true: files(
+i386_softmmu_kvm_ss = ss.source_set()
+
+i386_softmmu_kvm_ss.add(files(
   'kvm.c',
   'kvm-cpu.c',
 ))
 
 i386_softmmu_ss.add(when: 'CONFIG_HYPERV', if_true: files('hyperv.c'), if_false: files('hyperv-stub.c'))
+
+i386_softmmu_ss.add_all(when: 'CONFIG_KVM', if_true: i386_softmmu_kvm_ss)
-- 
2.31.1



