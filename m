Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2477A4D0650
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 19:21:31 +0100 (CET)
Received: from localhost ([::1]:52198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRHz8-0001BP-6r
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 13:21:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRHuh-00012v-Ib
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:16:55 -0500
Received: from [2a00:1450:4864:20::634] (port=41785
 helo=mail-ej1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRHud-0005Ml-6S
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:16:55 -0500
Received: by mail-ej1-x634.google.com with SMTP id a8so33810838ejc.8
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 10:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sppHUFpHoe2Mf0jRs80IVLnkBEj/9LXlh2U2u72ah2M=;
 b=DvBOADNAYlm3K12CkaxsKM0hatFkFignAn9shnY8z3bgbqtOYflI6RdZ3OFa80frQ5
 GwcMrrSsUHjZbz1LIHE7vwgK4Q2H1OSI1FNg2wMJuBNpm0qaodS/s1jLSYUOjTJdpjYl
 tNhyLzDiXamyh+DHYL9L5BXZgZEpnC0LXhsJrhksqbbtI4jxy9YmTgZRZTIAYG3FWJSj
 DIiZn/ESC/3wP/mYc88JgEvqqzt/XI+Q1kSJo54l2kpnnNgtH4iEcEfgOlgcNGbs4ynj
 QJ0cfGS9Mw8PP8YS7HwGhECm2FchBakTxzs6SoVnP2f+/TEJybGwcJVHfMRcsJhYzasf
 +AoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sppHUFpHoe2Mf0jRs80IVLnkBEj/9LXlh2U2u72ah2M=;
 b=rj6xOxuKNFXFkMBvDEL5UEgbmX2KyNXsoVXQC4rc/YU/nSKXr47dn3SH2T16BVTsIe
 C4bp9bK1yNFHRbKa7XNIsqBxiON6eh8N9TTuGpeAWjSOnskAUIj32m8ge26i2Py9pf3p
 ZNL9sYlGBjv4KXImiErnvMg/iOl1gvVm+CvVtyTzBYcCjb6P/IaP2OnIrfqp++rklfpu
 RBCrDeKwP7LX4k2sk9LBho60RyDMC5pt869bpdWHLKZqSuXZKhzbxTX51rzD2knrCCXi
 QTJEcO+v+ClxxvBvpHqK5y5CHKe3TOYA9M6G8l3H7xD0hjE+Kkx9k9LHyntJgFePw5mW
 UHGg==
X-Gm-Message-State: AOAM532IM7UdkqaSL7NxoXq02ANltSUWe5cFueymBNdf3TTfYy4hCkga
 LAjDkqUUnLc6VePvzIR4zBd1Osa3VO4=
X-Google-Smtp-Source: ABdhPJyN3cm5Jma8GfN6a/uz3W4Or63jupoYwSjr7JC1slc/3NQwY0EEw5zDoJDEB9ui4jRerKtgvA==
X-Received: by 2002:a17:906:b102:b0:6db:1487:e73 with SMTP id
 u2-20020a170906b10200b006db14870e73mr6255476ejy.474.1646676998079; 
 Mon, 07 Mar 2022 10:16:38 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a170906304800b006cdf8a1e146sm4983382ejd.217.2022.03.07.10.16.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 10:16:37 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/23] vmxcap: Add 5-level EPT bit
Date: Mon,  7 Mar 2022 19:16:13 +0100
Message-Id: <20220307181633.596898-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307181633.596898-1-pbonzini@redhat.com>
References: <20220307181633.596898-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::634
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x634.google.com
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
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vitaly Kuznetsov <vkuznets@redhat.com>

5-level EPT is present in Icelake Server CPUs and is supported by QEMU
('vmx-page-walk-5').

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
Message-Id: <20220221145316.576138-2-vkuznets@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/kvm/vmxcap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/kvm/vmxcap b/scripts/kvm/vmxcap
index 6fe66d5f57..f140040104 100755
--- a/scripts/kvm/vmxcap
+++ b/scripts/kvm/vmxcap
@@ -249,6 +249,7 @@ controls = [
         bits = {
             0: 'Execute-only EPT translations',
             6: 'Page-walk length 4',
+            7: 'Page-walk length 5',
             8: 'Paging-structure memory type UC',
             14: 'Paging-structure memory type WB',
             16: '2MB EPT pages',
-- 
2.34.1



