Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF194EEE08
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 15:24:46 +0200 (CEST)
Received: from localhost ([::1]:52322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naHGf-00016t-J4
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 09:24:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1naHEi-0007aC-U1
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 09:22:44 -0400
Received: from [2607:f8b0:4864:20::32a] (port=33687
 helo=mail-ot1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1naHEh-0006xd-Ct
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 09:22:44 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 e25-20020a0568301e5900b005b236d5d74fso2148667otj.0
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 06:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DWxqkmbIe1D+g2yoiMgVrjLbvsHSNutW/fm7DgKkCNE=;
 b=k9XEzsOUth3J0uuDZk/IDjMOAqOdX10KNzCRKUQHr3HHrOPjdmRcmnWnmHXTJWHdHE
 o/yjC+tklcoL13eh5dfHm/+xQGg1qnwrbc7EEz7gji+NKpJYl/S1FlOwxkNdsSVdF//L
 bAhatdgLfkLJ5a27LywKc03q/CmI6w4ni4wbGlY7k7cLUdZ0zra+d0HeolSggVwcsklL
 X9CyayAnhSGOh9gJObSJnbS8vNCCrDXdlsB0zhlR9uyoEobdeCHNtziSgCloXRf+YR0g
 GCa9z3JPvHvzYcUVA/7aBt0v6ogQUcIg6nIPUc8mg7H56ZbIvbS8fIEuGmgTZ2gjMCDL
 kfpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DWxqkmbIe1D+g2yoiMgVrjLbvsHSNutW/fm7DgKkCNE=;
 b=WI08Ycee5+SbBXpE3E8uS06B3VpqE62hz58vCxL8AYE1n5FTfZFAoHBrc8ocHrkmSX
 UcGB7WZ5kMfU/+QlUTwylwxKJigv89UJRWwFulBDgH2+pKmjB1dtu7goVYojS6F6Vff8
 HqSWk8hcGyKBubNr+cfBuLM1FtHwK5PHXyrgE2/Nx4IxLfNG8/wZLVJLRNDMcR12Ml4C
 p8ROkwGyluTMLeDRK3K6KzzFbPzcH9j6LFocaAxlolDcxXS8/HQEkC368GReKn/3UTJF
 yb8WrCZAeDrLBvr9KcPjZLl6na2GpFP+Py+rL4fZESA+lmMEMbvtvL6tdNAml2fgyvrd
 YDQw==
X-Gm-Message-State: AOAM53132ZQzWLFsoy3vSXYywJMj2cC3I+O5RGCOC0fTyKKiCE+O+j3w
 XJjoLDVBu8mWVxFk1q61gem/OR7q3OgvpMgRBTo=
X-Google-Smtp-Source: ABdhPJzQ+YHI2uBTThLYRKooyIEyJfOL4l91GheDNi9pffhgEzJmO0ziHRyDgD9i9M/Xp0gGZsveSw==
X-Received: by 2002:a05:6830:442a:b0:5c9:3a6b:de3e with SMTP id
 q42-20020a056830442a00b005c93a6bde3emr7661987otv.151.1648819362164; 
 Fri, 01 Apr 2022 06:22:42 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-188-190-73.totalplay.net.
 [187.188.190.73]) by smtp.gmail.com with ESMTPSA id
 x1-20020a4ae781000000b00320d5d238efsm1006935oov.3.2022.04.01.06.22.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 06:22:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] softfloat: FloatRelation cleanups
Date: Fri,  1 Apr 2022 07:22:37 -0600
Message-Id: <20220401132240.79730-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32a.google.com
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
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make consistent use of FloatRelation throughout the
implementation of the float compare functions.

I don't yet know if this actually solves Coverity issues,
but they all look a bit cleaner, I think.

r~

Richard Henderson (3):
  softfloat: Fix declaration of partsN_compare
  softfloat: Use FloatRelation within partsN_compare
  softfloat: Use FloatRelation for fracN_cmp

 fpu/softfloat.c           | 20 +++++++++++---------
 fpu/softfloat-parts.c.inc | 11 +++++++----
 2 files changed, 18 insertions(+), 13 deletions(-)

-- 
2.25.1


