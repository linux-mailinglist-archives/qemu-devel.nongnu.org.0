Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F81307181
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 09:33:33 +0100 (CET)
Received: from localhost ([::1]:50706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l52k8-0006IU-7u
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 03:33:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l52ap-0005ry-R4
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 03:23:55 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:35843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l52ao-0005iU-9E
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 03:23:55 -0500
Received: by mail-pl1-x633.google.com with SMTP id e9so2926648plh.3
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 00:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+gLPw/1CU8EEcg4ft9K8sRZ82WZkVlXHcJTnm9slh4g=;
 b=JZK9Zfv0J3LeSKqL81qqMZh/1kx6BCi7wOILxFCuob+udxHabsEWf33RG5aOLZRk1t
 CJD5RhVPgv1NENrdPmmPpQ59upMU7meX9Oo+PiuuVcyEOKLePPDOMH4pPYgacfFpjM8L
 7sFTAe7B0CvFM3c0ek12c++eIKNeWfl1TvVjTjJUGLcMujA92oNHUal+mSA+Ebtq7XAe
 QyITUw63l6NNBWqQfIk6q+CZK349GxsTGenlar4cdkx5R/j5y7yV8PiBfSVVeI0b/HHN
 SEJ2WLXe18KMyCmER3eHvCvD6qg5J71vJ9E2f+msIwLgGTIDFpcGNmr3FbdnAROxHmJ6
 a4XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+gLPw/1CU8EEcg4ft9K8sRZ82WZkVlXHcJTnm9slh4g=;
 b=b01SG9g+RD9QKjHtGqWTSsEYeSn/OguqVzDNXf/CvpsoFE5WMWm6ZZIC32XHMnec+d
 bTlaK/0xmhrLP+ifO23F1yIfiE1tIxU6zrr66OifGqqdSJ879mr/bx4Iwl2vf7Wjle7V
 B8ydcuwZclmxIOS70KILAezf8S6nWbGSCv7fv54b9BLuH1OmAAD64IIn/Ig1V1hsPlfA
 c+sLl3VwdZfINNRyVyRAYVo2a/ZFXfnOrCoQsILErh3it9xHGUR1ofDOcQ/mRjq78RO/
 y9errBuER8cKpvAI4gfv/x4LlpoIdHf5WHXC3ZPfP3SfLD++Wb3msIHcqniNwmCzMl2+
 tNFQ==
X-Gm-Message-State: AOAM533NsXZc5zRNmE845gy7DMh4Dwdf9Q0XUDpgfzSw4cH/a4lugq4t
 zsgoEhRiTbkiXCP9UnuVBBaAXNADFbc0N4Iy
X-Google-Smtp-Source: ABdhPJycnI8oOxSVa38JTY5+mQdsu/iMmGTk7mgVpia7p6eWTkJT1/Vj8sXk99jJ52VHUskYaTvDpA==
X-Received: by 2002:a17:90a:5b05:: with SMTP id
 o5mr9909946pji.109.1611822233111; 
 Thu, 28 Jan 2021 00:23:53 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id s24sm4658292pfd.118.2021.01.28.00.23.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 00:23:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/23] tcg/tci: Merge INDEX_op_ld8u_{i32,i64}
Date: Wed, 27 Jan 2021 22:23:19 -1000
Message-Id: <20210128082331.196801-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128082331.196801-1-richard.henderson@linaro.org>
References: <20210128082331.196801-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 864771d91b..019035d52f 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -571,6 +571,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             /* Load/store operations (32 bit). */
 
         case INDEX_op_ld8u_i32:
+        case INDEX_op_ld8u_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
@@ -844,12 +845,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
             /* Load/store operations (64 bit). */
 
-        case INDEX_op_ld8u_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_s32(&tb_ptr);
-            tci_write_reg(regs, t0, *(uint8_t *)(t1 + t2));
-            break;
         case INDEX_op_ld8s_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
-- 
2.25.1


