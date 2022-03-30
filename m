Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A3D4ED078
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 01:57:27 +0200 (CEST)
Received: from localhost ([::1]:55602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZiBq-00038H-1O
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 19:57:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZftC-0008ME-U3
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:30:06 -0400
Received: from [2a00:1450:4864:20::230] (port=43584
 helo=mail-lj1-x230.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZft8-0003R2-EU
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:30:01 -0400
Received: by mail-lj1-x230.google.com with SMTP id b43so24946395ljr.10
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S4e9jyMdA4UH1Yzt7/XU3q+WYCHj7Vr1ejq6qbSf/3Q=;
 b=n4U/dnhZum4f4wjr9V5qlua3TNyetA12CnVudFo9gKX2ilCIsy8mSZVAi4m5BWwB8E
 StgX9SBou6pW/l28T+jXfdMpW7iQzVLW5RnW9p8+uiJDeFmmNz042iqM7fi+bdepKdT9
 TytxohUzRPuJi9Qf4C5kL4fjRn340yFczzgi8ZayFC1QrbC7yDe+DnlYP89YTlUpr9Tr
 RL2RCg5E2rv0A3+DeLbjQ0izfz0uBFTHMCTlf4pKymiSLGNUkaGLWI5rkiPZhZpjZNT4
 r8MlCO789sg9zqe0xpsTDkVpv2dSmJKskoGcIsTUZZwWpio9+4VnKAvPk/BlqowCuTBZ
 u3Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S4e9jyMdA4UH1Yzt7/XU3q+WYCHj7Vr1ejq6qbSf/3Q=;
 b=dfQBghioX48S7vlw416FTL6Do6K2aN6Adpq5+TnVgJLJH8SrHvAPUaFz8HHitEhMxg
 E/m4Fidwd9ARjaWkYlKeAc5pl0bnRwR+0AbvrsodOVw7yMwtioXbWlHIXZcmUp5bQn2O
 MBa49qMGAR25+UfsU6awQvgDGaSLmV+s3+CIyqMC58ueJ3DUC9pXojHO2oj8ToRIQ6sJ
 Z/VEtXwq25oJmIWyDVPeesDejrIsG6+lKMxW3msTl82LuLzp1Hl5ef+coXajfLDOA296
 dAhzPOJuryjz4C3g1NNAK4gBIev53oUNhYXiabLvy8AX4cYlEfVpRbD79k0p0y360C5A
 jbtA==
X-Gm-Message-State: AOAM5330K5gSzsdxTR7sgZmVs9EfV4uW3rvLFwCSoHgYxeqVJGFaTxFu
 fyJTmiVEUpWVRDKHx43DZWzb2Q==
X-Google-Smtp-Source: ABdhPJxBxOwDr05TyFESsuzjTVSWLET5VqG0oPPcXdF6LZzjLRCoPDnmG+gS8YZ9AVNFvYix8Bo5Cg==
X-Received: by 2002:a2e:8e96:0:b0:24a:eac4:7ffe with SMTP id
 z22-20020a2e8e96000000b0024aeac47ffemr3971722ljk.430.1648675796500; 
 Wed, 30 Mar 2022 14:29:56 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 y3-20020a056512044300b0044a9bda3242sm1057573lfk.90.2022.03.30.14.29.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 14:29:56 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v5 40/45] iotests.py: qemu_img_create: use imgfmt by default
Date: Thu, 31 Mar 2022 00:28:57 +0300
Message-Id: <20220330212902.590099-41-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330212902.590099-1-vsementsov@openvz.org>
References: <20220330212902.590099-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::230
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lj1-x230.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 30 Mar 2022 19:17:26 -0400
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
Cc: kwolf@redhat.com, hreitz@redhat.com, vsementsov@openvz.org,
 v.sementsov-og@mail.ru, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Less typing: let's use imgfmt by default if user doesn't specify
neither -f nor --image-opts.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 tests/qemu-iotests/iotests.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index fcec3e51e5..c7a38a95a4 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -266,6 +266,8 @@ def ordered_qmp(qmsg, conv_keys=True):
     return qmsg
 
 def qemu_img_create(*args: str) -> 'subprocess.CompletedProcess[str]':
+    if '-f' not in args and '--image-opts' not in args:
+        args = ['-f', imgfmt] + list(args)
     return qemu_img('create', *args)
 
 def qemu_img_json(*args: str) -> Any:
-- 
2.35.1


