Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA301486D7B
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 00:01:47 +0100 (CET)
Received: from localhost ([::1]:59346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5blS-0002LW-Nj
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 18:01:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5bhY-000518-7Z
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 17:57:44 -0500
Received: from [2607:f8b0:4864:20::62f] (port=37804
 helo=mail-pl1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5bhV-0000Gc-U8
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 17:57:43 -0500
Received: by mail-pl1-x62f.google.com with SMTP id q14so3517777plx.4
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 14:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qXmfusgryZRwHORLLj3tYYX8dUPLK+MhJ1OKc+3H5hY=;
 b=aOl5wDI6Yq24+mK8tLh+f81d6AVwUTHyOksdCqBQyfNXu0ir4o3lJt24sjcmUmVeaU
 5j6Ikf5/6+m+DtqsP6PekQPLb8N/slIhVo8A4LsjdilgplCKpa3//QJqtyBmkUfCyPlE
 gDQ4lQl0gu9HxCn2si0f+3Kdo8TD1IsYBvflTInP8RQefiuJp2lomRGsj/2RCFjJAReD
 5V6W9cORTZQjhrQisduN19Kt7q8K1K9qqJpHZhm+xosogiwrYKPU1WbILM5TzAJPGrKP
 5GD98l845Y6CGn9C9MGfQJA90in7QqBQbdQ0+QVReRUS08CVTMycmPJImm3aNvQ6hvzT
 qEng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qXmfusgryZRwHORLLj3tYYX8dUPLK+MhJ1OKc+3H5hY=;
 b=TpbTlxh+zbFhIBbQjDjRjCa3gmfg/qhJ7UgSvpnOeTvliIEf/Ro01xylmVO/cw5QGe
 IzLNNySGchnTmCdgnv7L6Eb8uNlDmo53cHsKthwf1f1iDGS5516/D7GQ4hE4txyztOI8
 WzBUe0IwYXEHUmrXCi007paD0WtmCJZ7ANkCBObzeGV+Q3s/3PtboFNxuKqDrYFhp7gQ
 D8/i4pestbuO4qRCi7pdKsBWpwwBmiVqIDzn6tbrxNZ/1upsisP9ZZnpodc32j+UNZJs
 5CW1GF183byMKsyc8aa8qMUpIqUvaAZOde7/BqwYwZIuDVwAo1uvx39bo/nTNqKks+IP
 9ksQ==
X-Gm-Message-State: AOAM532rauyx5sON5SUu47f6EuBtoz7N4kgyDwcOTSjLd2P7m7JEGKvc
 Duo46NjLGJRbGaB72U91d0wSomNPwngwdw==
X-Google-Smtp-Source: ABdhPJy95vtv82bV8zxBfislzEjID+e5tBJFO/8UN75dlSU4NMPvMLiwb41DMMrq3+Z2ArqPhpDdpw==
X-Received: by 2002:a17:902:ce8d:b0:149:5e3c:34f2 with SMTP id
 f13-20020a170902ce8d00b001495e3c34f2mr56759836plg.147.1641509860177; 
 Thu, 06 Jan 2022 14:57:40 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id rj6sm5774687pjb.50.2022.01.06.14.57.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 14:57:39 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] linux-user: Do not special-case NULL for PR_GET_PDEATHSIG
Date: Thu,  6 Jan 2022 14:57:35 -0800
Message-Id: <20220106225738.103012-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220106225738.103012-1-richard.henderson@linaro.org>
References: <20220106225738.103012-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The kernel does not special-case arg2 != NULL, so
neither should we.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index ce9d64896c..e8f9e0643e 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6444,7 +6444,7 @@ static abi_long do_prctl(CPUArchState *env, abi_long option, abi_long arg2,
             int deathsig;
             ret = get_errno(prctl(PR_GET_PDEATHSIG, &deathsig,
                                   arg3, arg4, arg5));
-            if (!is_error(ret) && arg2 && put_user_s32(deathsig, arg2)) {
+            if (!is_error(ret) && put_user_s32(deathsig, arg2)) {
                 return -TARGET_EFAULT;
             }
             return ret;
-- 
2.25.1


