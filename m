Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 951CB4E6E8E
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 08:12:32 +0100 (CET)
Received: from localhost ([::1]:39462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXe7b-0002OZ-Lg
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 03:12:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nXe2T-0007ze-EQ
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 03:07:14 -0400
Received: from [2a00:1450:4864:20::529] (port=36479
 helo=mail-ed1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nXe2Q-0000XU-TB
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 03:07:13 -0400
Received: by mail-ed1-x529.google.com with SMTP id h4so395365edr.3
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 00:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dXYrp3td8hLF+Y2fCpcA9uLAXTP3QpyuvMkFSnX6eDU=;
 b=TAyV2mRJdINJRclR3WyGrKaZtvNmbz7zrqyRp0Fpltyumbgn4HCgHNb+zweA5dhBCf
 RWqcmMuSAnUgQUHwwYx23JjEOd1GzOyXWEAXtIxKbw6qOidYgSXrmK6Uk3ouGmyNWkDF
 JdCeX3R10QZghAV3faOJGaNxZhDOUlRXykqhG9CI+bHlOh9vizPyu/t7a0Pv6ph6VfUb
 KYGgWJ1vxJ9/1IAwM799Wg1lAyw6E573im6W0rIRJJN5rTqLTSSSoWF1yqf34E9p7q4T
 sdnjqbmT6gJrttzUxWsKtTS5jbQm6JCFZSuFsHj8SflFk/zOmBbJk6ko3tNuZiF4Vkz6
 pgJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dXYrp3td8hLF+Y2fCpcA9uLAXTP3QpyuvMkFSnX6eDU=;
 b=K59HeeGFenficoCQ7ioO2U6izieHOGa0EpACS0FzsYIpNvHL1TsNf26AunlkFARLVM
 5BHSK+wKb7St5APvZYJqnhs/WoA/YAai4RNb1EgwKdUThLQLuRm+GACSAqpEwzjl86nz
 lsXnsdfb7sZHAWr7Ryudih876eVTd9eRoyLnrhx+igYw+/JjPfwvxGSttuH/uXWepVlX
 JmRjzYx7rYLjK7pMOpEXvzp4JUwL/PhzSAdftXcDt8S4eYc52et9NdgGsGe0v1N4aBTJ
 WYnAvWvIa6iqxJ4auBw+gf3Yjp/qtX8+BR35vztEN4vKeeExwSRti2wmWAtaOg9FSCIa
 LHBg==
X-Gm-Message-State: AOAM531aF8OKOjd2LiYXkHfCACgRaG7CFRUcORs7b/nbAacyUjgukIuc
 caFN7m72KHSeX0BGarLFIbWOty9xKK4=
X-Google-Smtp-Source: ABdhPJxh5N6DAZeZbvdyxCb0YCRwqNpf24vPLz7UaTxAuphwytbUJyb3gL9nb1qqFzPLQwCIXuSGZg==
X-Received: by 2002:a05:6402:528e:b0:407:80ff:6eed with SMTP id
 en14-20020a056402528e00b0040780ff6eedmr11370517edb.165.1648192029626; 
 Fri, 25 Mar 2022 00:07:09 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 ka6-20020a170907990600b006ce54c95e3csm2011497ejc.161.2022.03.25.00.07.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 00:07:09 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/7] i386: Set MCG_STATUS_RIPV bit for mce SRAR error
Date: Fri, 25 Mar 2022 08:07:01 +0100
Message-Id: <20220325070706.271291-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220325070706.271291-1-pbonzini@redhat.com>
References: <20220325070706.271291-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::529
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
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
Cc: luofei <luofei@unicloud.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: luofei <luofei@unicloud.com>

In the physical machine environment, when a SRAR error occurs,
the IA32_MCG_STATUS RIPV bit is set, but qemu does not set this
bit. When qemu injects an SRAR error into virtual machine, the
virtual machine kernel just call do_machine_check() to kill the
current task, but not call memory_failure() to isolate the faulty
page, which will cause the faulty page to be allocated and used
repeatedly. If used by the virtual machine kernel, it will cause
the virtual machine to crash

Signed-off-by: luofei <luofei@unicloud.com>
Message-Id: <20220120084634.131450-1-luofei@unicloud.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/kvm/kvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 7396b430d7..9cf8e03669 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -569,7 +569,7 @@ static void kvm_mce_inject(X86CPU *cpu, hwaddr paddr, int code)
 
     if (code == BUS_MCEERR_AR) {
         status |= MCI_STATUS_AR | 0x134;
-        mcg_status |= MCG_STATUS_EIPV;
+        mcg_status |= MCG_STATUS_RIPV | MCG_STATUS_EIPV;
     } else {
         status |= 0xc0;
         mcg_status |= MCG_STATUS_RIPV;
-- 
2.35.1



