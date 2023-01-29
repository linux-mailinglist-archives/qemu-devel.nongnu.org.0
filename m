Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AA767FC85
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 04:00:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLxu6-0004dQ-3y; Sat, 28 Jan 2023 21:58:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pLxu3-0004Uc-Ik
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 21:58:47 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pLxu1-0008Jn-E5
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 21:58:47 -0500
Received: by mail-pl1-x635.google.com with SMTP id d3so8471372plr.10
 for <qemu-devel@nongnu.org>; Sat, 28 Jan 2023 18:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JBPxArb+accoiQR79WRA7abVrBow9EEKwkZ30aFdDp4=;
 b=rg4SVt83O26E46i6aR0xcklvd2l8wgucQ8rakiKzHiJwv9pCTJlyGZ5o9si1kx7Ydn
 qKgs7NNd3of/B/EwVjXMh6GWuu6wphw8qvl28sbX7N56SEc6o7z3ImvgwYbS7sop+P+Q
 NTUOnB+m9ZjKA3SWg+9FwGCnCSMUIrTtHKCWdhI4mtjBgFW8mDQ8gR6Xy4px1mFfwBmA
 qDXVE4JAXnMxsYgNtvLFEpUI6xAnP+MmI9j6mZ8jxrzIMcMX2AIq60mshiKtX6bYkJL5
 3U+93Rl6F604iPVBtAburc1DhVHEUkq6ahTed5NX3H6qM5k+eQPo1tmI99OHNmtLvjyL
 h8Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JBPxArb+accoiQR79WRA7abVrBow9EEKwkZ30aFdDp4=;
 b=DueAniIzG9ZNPLLwt6x1MikaRZvHDjTHj46QEcCVWmJMGYV5s5zYoVuF2wiMi/Uow3
 YE+e390B2apDq9iRTW6KDaV6gtcnfxHWV/uhHwfzshsyRwEqqVmKLGle3UTW0gmmNWdH
 4Zj3L88yqGEqyIdmei3QcV/dhPVM+MGATDdkpfOf0xPfq9xZ2Ju6MKdv6R+r2asuiAh/
 esBz/s+dPgGW7loTXvGkYC7sNkDXhusaMeGdKxXs4Y5j65PBUKs95Y3K2gZvJQpfLmN3
 +cgQymTsBO/dqPcYWeq/czXvewGTpwFXHiyUaKTsMkoawsQ4NIsp3BNfw9VPikUOKOfh
 fv1g==
X-Gm-Message-State: AFqh2kpmx03ZmMEP0vs/XsANFOneW9VDp6TmhTs1TwwU/r/Ex+r5/95q
 USaC77fBt3beJSO+UxTnoe45UA==
X-Google-Smtp-Source: AMrXdXtm93Xlrm1d5/a0kU/AoLU9aUsmOgAUjTQuAb9k3z1QpR792f6fxbHmCCrV9TnoxlsjxW4Nvg==
X-Received: by 2002:a17:902:bd97:b0:193:c79:657a with SMTP id
 q23-20020a170902bd9700b001930c79657amr44099960pls.5.1674961117991; 
 Sat, 28 Jan 2023 18:58:37 -0800 (PST)
Received: from always-pc.bytedance.net ([61.213.176.6])
 by smtp.gmail.com with ESMTPSA id
 x4-20020a170902ea8400b00194c90ca320sm5167084plb.204.2023.01.28.18.58.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Jan 2023 18:58:37 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: arei.gonglei@huawei.com, mst@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com
Cc: armbru@redhat.com, qemu-devel@nongnu.org,
 zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH v4 12/12] MAINTAINERS: add myself as the maintainer for
 cryptodev
Date: Sun, 29 Jan 2023 10:57:47 +0800
Message-Id: <20230129025747.682282-13-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230129025747.682282-1-pizhenwei@bytedance.com>
References: <20230129025747.682282-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

I developed the akcipher service, QoS setting, QMP/HMP commands and
statistics accounting for crypto device. Making myself as the
maintainer for QEMU's cryptodev.

Cc: Gonglei <arei.gonglei@huawei.com>
Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9f6c54b145..e21a6ee470 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2857,6 +2857,7 @@ T: git https://gitlab.com/ehabkost/qemu.git machine-next
 
 Cryptodev Backends
 M: Gonglei <arei.gonglei@huawei.com>
+M: zhenwei pi <pizhenwei@bytedance.com>
 S: Maintained
 F: include/sysemu/cryptodev*.h
 F: backends/cryptodev*.c
-- 
2.34.1


