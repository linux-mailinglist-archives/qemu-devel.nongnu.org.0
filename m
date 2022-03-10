Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A27034D5315
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 21:30:11 +0100 (CET)
Received: from localhost ([::1]:35866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSPQI-00022K-Jc
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 15:30:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSPOA-0008CR-Gg
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 15:27:58 -0500
Received: from [2607:f8b0:4864:20::533] (port=38813
 helo=mail-pg1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSPO9-0008F7-27
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 15:27:58 -0500
Received: by mail-pg1-x533.google.com with SMTP id 132so5669280pga.5
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 12:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DPs3qyT+uZfNbgHJhAl1/at2oy1K0HPub76v6Xk9tE4=;
 b=XADrHLsowmHz98IKHJNxqQqL/8yVgU837I20LdtVu7rGvRbLo5QR4yBT2Akn5phbLz
 gJcuk+qFT6DiR5gDu1GllUEFmmJwQ5f9VOWwhcyWw4dFbo+Wv2ZWSY2rJjFme9+5exy9
 xDcmC3EYG7ETHBTaBSVWI1F7Eyd+eleEVgG9ljTSy2U/e4JCFuUD35S4IkYIuC3B4cMk
 QhuB3JggC0tS/GFdktIAn9/RouJ3j1QG6KNoCwx7fcreriTMH2PDrP2gCeVWbBfHSBBG
 /yhmHxXd4dHpLosyTfRhr9asDbcrziQ0CMRBUlzZhm+QnrPwp9x2qMrPA801/z3zBaDx
 nw/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DPs3qyT+uZfNbgHJhAl1/at2oy1K0HPub76v6Xk9tE4=;
 b=DRIm6l3cSNiXmiRQPdK28OAs80FpIGeTIuaPGmgFDU51fEy9XpbspxSZG/0/louJF5
 ilExDixQH9aYAwkuu1uXVJvOLfmZztZAfIho9DPPXUsZ7Eb51jpZujej7ujQRWCbd4fA
 tRyT+F9vICpiue/umzRu4mN0jQlho6IaZvTyQhEHToJ5pFN1LumO77UUnl4XV6RGVoH2
 owIWE0XdeBYIup/G9eFdCXAmG9dpma6l+B9CvrKi2VFzaBsqiCIcnZ/LAgsDexpvKzwM
 CQlQjIV1ffez/s13J9XCrHTo1PV4n/mSWZaibgu0DCs2X0KKjYFCRiPrQRSr6PxlKsaG
 ZHDQ==
X-Gm-Message-State: AOAM5315KAikf7WaKnYKDueZig268zZwk7XqQ+oPmwnjY69CZwkT5HAc
 UWp4IZ790IWHbbQ8FrQYQjzFEi6IGziDFw==
X-Google-Smtp-Source: ABdhPJxbM8ceOLskwWXwt4cxn3Ke/++cyMxFALnDZ8ITxqWtz2c1Q2+C/UY/X8Nv1Va4rV/BfvpHbQ==
X-Received: by 2002:a05:6a00:ac1:b0:4f1:29e4:b3a1 with SMTP id
 c1-20020a056a000ac100b004f129e4b3a1mr6822755pfl.63.1646944075789; 
 Thu, 10 Mar 2022 12:27:55 -0800 (PST)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 l9-20020a655609000000b0037589f4337dsm6399938pgs.78.2022.03.10.12.27.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 12:27:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] tcg/s390x: Fix tcg_out_dup_vec vs general registers
Date: Thu, 10 Mar 2022 12:27:51 -0800
Message-Id: <20220310202751.594961-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310202751.594961-1-richard.henderson@linaro.org>
References: <20220310202751.594961-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::533
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: thuth@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We copied the data from the general register input to the
vector register output, but have not yet replicated it.
We intended to fall through into the vector-vector case,
but failed to redirect the input register.

This is caught by an assertion failure in tcg_out_insn_VRIc,
which diagnosed the incorrect register class.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 3b185b3c96..33becd7694 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -2675,6 +2675,7 @@ static bool tcg_out_dup_vec(TCGContext *s, TCGType type, unsigned vece,
         if (vece == MO_64) {
             return true;
         }
+        src = dst;
     }
 
     /*
-- 
2.25.1


