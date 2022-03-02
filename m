Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E12974CAD81
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 19:26:35 +0100 (CET)
Received: from localhost ([::1]:55754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPTgI-0002Yu-Vj
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 13:26:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nPTRw-0006hY-0P
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:11:44 -0500
Received: from [2a00:1450:4864:20::42d] (port=36847
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nPTRt-0008O5-IJ
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:11:42 -0500
Received: by mail-wr1-x42d.google.com with SMTP id r10so4101966wrp.3
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 10:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sppHUFpHoe2Mf0jRs80IVLnkBEj/9LXlh2U2u72ah2M=;
 b=eFddcbmNonXX6qRbTxNrsgOouKnX6MxFK6Y+K9ulLHzWyD6HYQHzYJC0p/PNS+j0oq
 eUxfkrDJFjQltk2CWD8aAxelZrmco3uSQGfH1vSt0QnM2hZjHg7sqG1AJaRlyZDfkgdT
 KkFexzmKKB+hxRRpe+q781F1itdf05nGCZoWAaP25xcHARBbe6XIKBpKzPJnjRhe4pbv
 UcMwvvI54Z0auMUQKtZfUCctK91BRi6vcwJk2JU9z18P0YmmBFPbQ4WUVOxeLAaLLpZ2
 1OErIIOaxmKXUFsJ73j1DDo6XR/758aOctassrbqtAU3HgaTh46Mnr0ynjyEk3Gy1GyI
 FmGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sppHUFpHoe2Mf0jRs80IVLnkBEj/9LXlh2U2u72ah2M=;
 b=6bE36vugT2aqhn4bvA4EVpdGSkOrNRONRzxobeZxkawHie0W5yDNw9PBWegqHpAeve
 M01aCLEzWJt5939vR+qLoM/4MuKjOiXZzFk/TuqeofWhSXFGA8QNF4y63pj9lOeHR7CL
 fH+6cHqSJa4/lAk39WPlSWmrhcq3nZSFA4IK8jnj0fb5tTs56UlJ+u/8b75zHF2RaX2w
 xAodfyqHd3Wsa+XgNbD5qIqxVtfujfNPqOcym/xr5s6iIj4jeJQojdyyXWQAEJCiU/gJ
 liokMIdlHTUt7Q2VyrxMnvLRDlJkgRhmmJcZP/B36dqAcz5+6Nd+uSfLgXhOojH/tLZE
 vJXw==
X-Gm-Message-State: AOAM530wcd0s5Kcz9NjFOgjgeYV7fS+g8253OCLVq8TOR7STPH4FFzl3
 XbHpKbh8e7/pPcEkUDpfqmaTVQLxOHI=
X-Google-Smtp-Source: ABdhPJykWY1+W2QBwkXJahneb9cjAFN8YeXXzrFiaHFuE62D6TB9xiUSvkE3fEYOqliXgJ2ILE7ULw==
X-Received: by 2002:a5d:52ca:0:b0:1e5:8cbc:7f2e with SMTP id
 r10-20020a5d52ca000000b001e58cbc7f2emr24171216wrv.309.1646244700343; 
 Wed, 02 Mar 2022 10:11:40 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 bg20-20020a05600c3c9400b0037fa5c422c8sm7720811wmb.48.2022.03.02.10.11.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 10:11:39 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/11] vmxcap: Add 5-level EPT bit
Date: Wed,  2 Mar 2022 19:11:26 +0100
Message-Id: <20220302181134.285107-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302181134.285107-1-pbonzini@redhat.com>
References: <20220302181134.285107-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42d.google.com
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



