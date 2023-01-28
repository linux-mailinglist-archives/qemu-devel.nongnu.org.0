Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9D067F479
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 04:58:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLcLI-0000SP-E4; Fri, 27 Jan 2023 22:57:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pLcLG-0000SG-UK
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 22:57:26 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pLcLF-0003pF-Ck
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 22:57:26 -0500
Received: by mail-pl1-x631.google.com with SMTP id jl3so6823832plb.8
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 19:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JBPxArb+accoiQR79WRA7abVrBow9EEKwkZ30aFdDp4=;
 b=70SrjzOTxntri0Seh1EVuPGUxuRQfnbsTm0LYu7dwUvuCXI1aM6Cy+SJRlywV8tGCb
 5lek/BlLceJiMzQsWOxXKKCyYyVS9idLCwcLdQNWbwhirMDf8k5TxOzMUmd/qV1a0IbP
 oHbRSYi0KFkdFNleXWETkNWfpzhBIvGEQt1Kuejif9Eano03B/LX+JanJRT+OhZy4nrU
 npjts9gjPUmSM6S+IRwJuDVC8uJy99UYqdYsWjyz9Br68xiRLDKW1Orh+712WtZUw1cM
 fLpdTutOwWz2d3K+noh19ge9lCMhPpSRCDZAiyOIJlwKwspmxi9OlWN37QHJSi/yPhIB
 9fjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JBPxArb+accoiQR79WRA7abVrBow9EEKwkZ30aFdDp4=;
 b=MqbbCSTS459IVFi1iIyRlF1sefgcfAtKlG8t/hC3UK4B3uguhYaq+K8Q4QydhBXN+e
 1tJbBFyvpUqqEhdUqBP0zRDgr5mU4/ez4i9vXt4kJODt4OGUBiC/yqP9lzFVdHqlbvaA
 jC3XwHvnSGot0IRDb01Vcs1mg9kx2Eo8kFv/Gse2lVz4R/ctowkOVe2jNCyz64EKqVv7
 6qgMhWox8Be7uQGo+HqTtS137TM9NiV439/Ey5Kk7AkwVeGBBYWnzN6lV+vuK/fqzSHl
 Pr6XQXIXfhEKAuKgrLKq+BACgV3ozGOBdg3GtG+iYwAgPkTeGOxK3u2UE8MDcxo8Z9Ij
 9jrw==
X-Gm-Message-State: AO0yUKWQYuC/cgm/QtTe40FK0BvCQ3OUrlCip57KrixPUfPBwj3z3xGr
 JwYrvdcAbRumOGSelTB5571O7A==
X-Google-Smtp-Source: AK7set/ZgkeFL04TX31rxV7E42iH/F7JJUzeanmGrtGLg6gm2EaZ4FVQaaKplWpu0N6glkdo55ufpQ==
X-Received: by 2002:a17:903:2288:b0:194:7c28:3fa4 with SMTP id
 b8-20020a170903228800b001947c283fa4mr814737plh.19.1674878244779; 
 Fri, 27 Jan 2023 19:57:24 -0800 (PST)
Received: from always-pc.bytedance.net ([61.213.176.6])
 by smtp.gmail.com with ESMTPSA id
 y4-20020a170902ed4400b00186c3afb49esm3594662plb.209.2023.01.27.19.57.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 19:57:24 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: mst@redhat.com,
	arei.gonglei@huawei.com,
	berrange@redhat.com
Cc: dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 qemu-devel@nongnu.org, zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH v3 12/12] MAINTAINERS: add myself as the maintainer for
 cryptodev
Date: Sat, 28 Jan 2023 11:56:33 +0800
Message-Id: <20230128035633.2548315-13-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230128035633.2548315-1-pizhenwei@bytedance.com>
References: <20230128035633.2548315-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pl1-x631.google.com
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


