Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E534E5401
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 15:08:42 +0100 (CET)
Received: from localhost ([::1]:43280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX1fF-0000NW-R7
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 10:08:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nX1Uo-0007XT-FR; Wed, 23 Mar 2022 09:57:56 -0400
Received: from [2607:f8b0:4864:20::829] (port=41947
 helo=mail-qt1-x829.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nX1Um-0000xq-LF; Wed, 23 Mar 2022 09:57:53 -0400
Received: by mail-qt1-x829.google.com with SMTP id d15so1160406qty.8;
 Wed, 23 Mar 2022 06:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iNm+hwBhGRcLm3jQ823b0u3fdJrto6XL/cXPhWRdun0=;
 b=Py2UGO0oqsFR7ARUKpK4gnJiLs1jkOXuWLXFbdIKqOcXcbvAxwLyvJd5eqg6Pj1B+b
 V0bQtQJce0t+OnIRGvJhAoFSEK90aP/cSIGF3dr1bW1Z7UeqKXwIdbZoYdF07w9HyiTW
 5Gfkgbx0R/OCel0vYwS6z4YSyxP1KTD9IBVnvNSO+iKTyBhrdanx+hW82R3KsPcYlwQO
 7/6qMjm102Qa9PkeLtnVKmehkvzi1m9NVZkCNAcQnVgQCw3HhAEeRN/NO4Q9C21LzeXC
 W5vyr1k+VOBuKfgMthov3S4Y1OPGZ+NChEA42KVc08oBYEAPdzI2XvlXabIM2yW/RIrW
 gCKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iNm+hwBhGRcLm3jQ823b0u3fdJrto6XL/cXPhWRdun0=;
 b=yys2nhyk9BnmHTThI68OA+r+F90l+pYm+0BYZsZ+sFf4Y4k4vgviZK6jFktfR5NNFX
 d7LoTi45Qu3lCZCX7XTYlhmzilYUgu3dsoe8hpD4/6H/OeBhbr2nRJs4+4fWaHTDSYBc
 y5IYC5w4r+P8f3aPq0iIHrP4gqiSdyRIENLvNcc/VSTMRdY69TQIDvvFwc8JC9hdq/FO
 lXroUzzHgpx55we/DDR7K8TE/1e2AHGctBkupSlJDTKNcC3yRxFB67bbJvoDlQYMO/ZK
 9ANcdIpIUeK0Z0v5Q/mo0hDMRg7irAYD+MlGmIbCnnKtzLqKvVMCFtK3rjBBvTDLD9GH
 h57A==
X-Gm-Message-State: AOAM532oLxAd/2hpb90MrQlgYzWnrAL0pi8326NFqR1IBSGcau4HaBFx
 AIbpZqr59ZTh/CUcYwCgl2cmb9oASf1DYA==
X-Google-Smtp-Source: ABdhPJxqN51OBHceKybdS0f0lvnFy7oH+K8yWb4KuNR2VavFXyzTYwYs+vR2SlQSS9F3m0PPSAoOtw==
X-Received: by 2002:ac8:5a0c:0:b0:2e1:e781:cbf7 with SMTP id
 n12-20020ac85a0c000000b002e1e781cbf7mr24273637qta.503.1648043870407; 
 Wed, 23 Mar 2022 06:57:50 -0700 (PDT)
Received: from localhost.localdomain (mont-dyn-146-104.pwrtc.com.
 [205.174.146.104]) by smtp.gmail.com with ESMTPSA id
 t128-20020a37aa86000000b0060ddf2dc3ecsm20907qke.104.2022.03.23.06.57.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 06:57:50 -0700 (PDT)
From: David Miller <dmiller423@gmail.com>
To: qemu-s390x@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v5 11/11] target/s390x: Fix writeback to v1 in helper_vstl
Date: Wed, 23 Mar 2022 09:57:22 -0400
Message-Id: <20220323135722.1623-12-dmiller423@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220323135722.1623-1-dmiller423@gmail.com>
References: <20220323135722.1623-1-dmiller423@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::829
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=dmiller423@gmail.com; helo=mail-qt1-x829.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, farman@linux.ibm.com,
 David Miller <dmiller423@gmail.com>, pasic@linux.ibm.com,
 borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Fixes: 0e0a5b49ad58 ("s390x/tcg: Implement VECTOR STORE WITH LENGTH")

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Miller <dmiller423@gmail.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/tcg/vec_helper.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/s390x/tcg/vec_helper.c b/target/s390x/tcg/vec_helper.c
index ededf13cf0..48d86722b2 100644
--- a/target/s390x/tcg/vec_helper.c
+++ b/target/s390x/tcg/vec_helper.c
@@ -200,7 +200,6 @@ void HELPER(vstl)(CPUS390XState *env, const void *v1, uint64_t addr,
         addr = wrap_address(env, addr + 8);
         cpu_stq_data_ra(env, addr, s390_vec_read_element64(v1, 1), GETPC());
     } else {
-        S390Vector tmp = {};
         int i;
 
         for (i = 0; i < bytes; i++) {
@@ -209,6 +208,5 @@ void HELPER(vstl)(CPUS390XState *env, const void *v1, uint64_t addr,
             cpu_stb_data_ra(env, addr, byte, GETPC());
             addr = wrap_address(env, addr + 1);
         }
-        *(S390Vector *)v1 = tmp;
     }
 }
-- 
2.34.1


