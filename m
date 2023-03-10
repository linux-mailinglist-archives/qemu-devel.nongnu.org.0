Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1676B4FC0
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 19:05:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pah5l-0001vy-8R; Fri, 10 Mar 2023 13:03:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pah5h-0001ts-5A
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 13:03:41 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pah5e-0004bP-IC
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 13:03:40 -0500
Received: by mail-wr1-x431.google.com with SMTP id v16so5898181wrn.0
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 10:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678471417;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y3d5I+v06GPLdSUWb/h0exi05J9B1j/Dp2Lr8aLUqhY=;
 b=yF4d9wYy5BWQDty5hBaI1/IsYGdcSSVBvKsq8KxuChqQI8LLR7CPZrb038pQMRFucq
 2XUqRSz0DDRH4SON5DKt8xkhNxFocM5D2mZaAzts8SOkjoSFHkzjYLz5nelPFdF/QYzd
 DOs5Em6aJoOyHk1Bs201v5EEe6sz3zWo5PgJPxjHle4yt/hEtmo7MO1fQch0YMxju2Gr
 5Oo03VDOCAfaHLVdX02+CqP6v3LsShCw+xD3auyEDgBtwrR1EU5/Ux7wIXb//4e777l2
 e5zudVgdcync9mpZbsDswe/VtXneAgke76bJHEJd3rrmLzjDKjMDH7hjbrbEryX91qDq
 fz8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678471417;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y3d5I+v06GPLdSUWb/h0exi05J9B1j/Dp2Lr8aLUqhY=;
 b=EZ76lvTTjv+90ufZPXr5mvjivaCAbnQDHvpvndPxhFueZ8qcNa8pfoZeBPUS5jzIOK
 0DPAve1/oWiO8bOd3zWHaL69BvvumEBvF5ku4r83splWbmSq1QXn/qO++ccGVQ8z2L3D
 Mpyk3i3z1HcVY50SXpeb98oEE6b6zmNe7mw/5luPaUBM8JMkT1oG4Wdk4fm9KntUq/JN
 t765I+gt1uIfo57X2YoyY+TYYFYJu/6m+/4k8piYt6cVlU+jEeHImc9F0xGQWOJbpH0d
 Gs/cO59kcTMnNSWxDCHN4yjFKHj1tSfO2aWONDg1bdM0Ia0ltaFLmFs0j5KpSk7QfsUb
 U+xA==
X-Gm-Message-State: AO0yUKWaQsiMECrDLk//xLDNPlI7v6lNDjHrldwIEXckU7MRWLwntlIW
 2YixbGzbpEldiypCsOHLETL8m0pQUN75YJtVUl8=
X-Google-Smtp-Source: AK7set9BTBWm5OHfO6F5q3EMpxupnE4pUDoe4kt2Qqvg22/Qpn4DzW98ddp/ULzVOwgzVNGXn5D3FQ==
X-Received: by 2002:adf:eb8b:0:b0:2c3:f8b8:87 with SMTP id
 t11-20020adfeb8b000000b002c3f8b80087mr16973817wrn.25.1678471417341; 
 Fri, 10 Mar 2023 10:03:37 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 n11-20020a05600c294b00b003e21638c0edsm480635wmd.45.2023.03.10.10.03.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 10:03:35 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8B0411FFBF;
 Fri, 10 Mar 2023 18:03:33 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Guo Ren <guoren@kernel.org>
Subject: [PATCH v2 07/10] contrib/gitdm: add Alibaba to the domain-map
Date: Fri, 10 Mar 2023 18:03:29 +0000
Message-Id: <20230310180332.2274827-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310180332.2274827-1-alex.bennee@linaro.org>
References: <20230310180332.2274827-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This replaces the previous attempt to add c-sky.com so I've dropped
the review/ack tags. Group everything under Alibaba now.

Added as requested by LIU Zhiwei.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: Guo Ren <guoren@kernel.org>
---
 contrib/gitdm/domain-map        | 1 +
 contrib/gitdm/group-map-alibaba | 7 +++++++
 gitdm.config                    | 1 +
 3 files changed, 9 insertions(+)
 create mode 100644 contrib/gitdm/group-map-alibaba

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index 0261533990..e678c23a9c 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -4,6 +4,7 @@
 # This maps email domains to nice easy to read company names
 #
 
+linux.alibaba.com Alibaba
 amazon.com      Amazon
 amazon.co.uk    Amazon
 amd.com         AMD
diff --git a/contrib/gitdm/group-map-alibaba b/contrib/gitdm/group-map-alibaba
new file mode 100644
index 0000000000..0ebbe6b06e
--- /dev/null
+++ b/contrib/gitdm/group-map-alibaba
@@ -0,0 +1,7 @@
+#
+# Alibaba contributors including its subsidiaries 
+#
+
+# c-sky.com, now part of T-Head, wholly-owned entity of Alibaba Group
+ren_guo@c-sky.com
+zhiwei_liu@c-sky.com
diff --git a/gitdm.config b/gitdm.config
index 4b52ee47be..6908ddbd19 100644
--- a/gitdm.config
+++ b/gitdm.config
@@ -31,6 +31,7 @@ EmailMap contrib/gitdm/domain-map
 # identifiable corporate emails. Please keep this list sorted.
 #
 
+GroupMap contrib/gitdm/group-map-alibaba Alibaba
 GroupMap contrib/gitdm/group-map-cadence Cadence Design Systems
 GroupMap contrib/gitdm/group-map-codeweavers CodeWeavers
 GroupMap contrib/gitdm/group-map-facebook Facebook
-- 
2.39.2


