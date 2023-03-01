Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B126A65CA
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 03:53:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCZl-00089w-O5; Tue, 28 Feb 2023 21:52:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pXCZi-000829-Ci
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:52:14 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pXCZg-0001nK-NB
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:52:14 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 6-20020a17090a190600b00237c5b6ecd7so11254357pjg.4
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 18:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1677639132;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CoSIyarAIU04vw264hmDOARNwoMR9ygoAxd2VOTLPP4=;
 b=JfNVdEvO2xGf+jF62ZN4lAERV1WgCyiaBgdFY6brdDHjZVf4X860XHIGPwXJaEddbh
 BxjTnV1qyxZxDvDuMB+iK7jWbJkK+5WVtCsPbQy7Q7EGVh5LdHDkv2iwCgTNh1tN3YSC
 7FsODMd5LJDVqfiLOqPiKKOUr8DEZDqK5y3xVaxigj4okjTKu0g9PY6JvIOK9xBetvML
 Ib9qgjRX/3I3uZTYm/cu6RAhgdby8ZKQgLgkF6jFoNK044S1Hl8oulcnaaSsis+eECpo
 bevvto46v2hev0qG1oxBYQbzFzOp0zqjnECwFLg/iKVuBws65Xz2nh7Ic2evxnZIVXUf
 /CnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677639132;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CoSIyarAIU04vw264hmDOARNwoMR9ygoAxd2VOTLPP4=;
 b=y9jZcfrA+jf5/hDUPSzf1K4OO7ju52ur/DQTPY390zATBi0Fd0NwdQiUDbJngPpZMO
 /EOL/gEPItV/7oY3noOo9WwqgQG51oTHtFqU9x4SwXN6rhYaiMci55TpEPHhCai5olHR
 9OHazP1VWbRVpexxe23UBYoAuVdjFiRBLHBDyOomOA2xy4mjkHCx+3FywUHJKa65yrkn
 qHSM24LcVZ74b+kKACZREoQ44DozX/ymhecgos+7TcSKiCc5DqUQTMhUBuKtIbkReb9y
 XpL+AL5DqodooA40OBlilOuYtu5h54kmkAPZWcPq5bG5QW/0oRzLBcRRm/COMH/hRvn2
 1f2A==
X-Gm-Message-State: AO0yUKX7jFOM07OzrMKrgVxgBrfngfSBMLleOUnZA/0IqS3ZpREj3S0e
 T4BWBgeJ+O7jjtEj79EpaU0NUg==
X-Google-Smtp-Source: AK7set8dingixSEX8cA21c/DVsVdM9T5vJs0vfrRhirRE46e8GBTR4UVuUBPiWf9UNLW/cfqKrQLig==
X-Received: by 2002:a17:902:c401:b0:19c:d5f9:337f with SMTP id
 k1-20020a170902c40100b0019cd5f9337fmr6445854plk.5.1677639131961; 
 Tue, 28 Feb 2023 18:52:11 -0800 (PST)
Received: from libai.bytedance.net ([61.213.176.5])
 by smtp.gmail.com with ESMTPSA id
 ix1-20020a170902f80100b0019ab58f47a6sm7218743plb.105.2023.02.28.18.52.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 18:52:11 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: mst@redhat.com,
	arei.gonglei@huawei.com
Cc: dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 qemu-devel@nongnu.org, berrange@redhat.com,
 zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH v5 12/12] MAINTAINERS: add myself as the maintainer for
 cryptodev
Date: Wed,  1 Mar 2023 10:51:24 +0800
Message-Id: <20230301025124.3605557-13-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025124.3605557-1-pizhenwei@bytedance.com>
References: <20230301025124.3605557-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x102f.google.com
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

I developed the akcipher service, QoS setting, QMP/HMP commands and
statistics accounting for crypto device. Making myself as the
maintainer for QEMU's cryptodev.

Cc: Gonglei <arei.gonglei@huawei.com>
Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7651cb0ace..0bac2e8bcf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2867,6 +2867,7 @@ T: git https://gitlab.com/ehabkost/qemu.git machine-next
 
 Cryptodev Backends
 M: Gonglei <arei.gonglei@huawei.com>
+M: zhenwei pi <pizhenwei@bytedance.com>
 S: Maintained
 F: include/sysemu/cryptodev*.h
 F: backends/cryptodev*.c
-- 
2.34.1


