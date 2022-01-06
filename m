Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14285486D73
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 23:59:26 +0100 (CET)
Received: from localhost ([::1]:53822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5bjB-00073D-5k
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 17:59:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5bhY-00051A-AK
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 17:57:44 -0500
Received: from [2607:f8b0:4864:20::102c] (port=35450
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5bhW-0000Gm-Ij
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 17:57:43 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 r16-20020a17090a0ad000b001b276aa3aabso10222582pje.0
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 14:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=59sTGIBhkZUxdVU/3Jb3/NHZMJKwGa7GltMG/ts6cC0=;
 b=PLsZ1cv6BZMZLOI2grfrooPyO7FcScA4NoQl9ITpqc9S0v+pk2VfHoYVG3u37xfXeu
 S7Y8w0QMEbf9XaRMt/gQjVRU/BtkemNEN4a1ygtCWaExRPOXlMWPOLLKNlMe8QMe+JLZ
 ym1ZoZtlc8vX7bB04yyyhvkfWKnW8jg589wKpCJnzclu1KTFfQc7Q/JwKCBRCEYB+flW
 zLCOWU/0hEHao1rrrHc7Q1oJhoSWQ3E7rCSeQ6dVWoy02hMG+UOawY35iCrvBxPv2M+8
 nSfCRKG2YnCjEqBsockSAF8KVQzMiJaSo0+Mtn/ZCe0ScBgZeh0fxI35Zsi2GShyRpEW
 kSvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=59sTGIBhkZUxdVU/3Jb3/NHZMJKwGa7GltMG/ts6cC0=;
 b=B+zUqnKoXXtk6TskfM/ru1uVp5l5kDBl3MU8tDZzRHtKLDTBLAmVUvw9Z5Iz92ctYo
 2lHG/W4VNElNJKp1f/UqhPg1LEgFRGc37S6ceZdiOM8v6cwMjHrECOavLb7nCMw2LpAx
 h30iupKQDrzqtiI7CnPpCFKC4OTg3xxEB2V5vqHdnHlmes1IUAqdZuJU2mw4+g+VrWOn
 9noAI8U/XduUkTE2zHK3GWnDbuSFpOmM24EMd8IKIuQKaqzhTmxlugpZL1hiaB5UZ24P
 kAz9+ddGxo2B0nGNnVwrTNppXjWvsdms5DcyzVpBismWbXBEgemlFdCoDghWYhb3Splo
 LEmQ==
X-Gm-Message-State: AOAM5310+IDaV79rxVlUjo+tZvN5cSpTtEsnAN17n2r4dp42sMHbtGTE
 x7hr/f7U9SSYPiJnVi8FkX1iJQC/mqzn0Q==
X-Google-Smtp-Source: ABdhPJy20pwedGkZ4WKZCFpUYXQ2Q0sBAPmksCKJIjXHETwb41Sx2k0l04+tU2cUjpX8i2pqvpwC8A==
X-Received: by 2002:a17:902:7146:b0:149:537e:e35e with SMTP id
 u6-20020a170902714600b00149537ee35emr59780119plm.55.1641509861285; 
 Thu, 06 Jan 2022 14:57:41 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id rj6sm5774687pjb.50.2022.01.06.14.57.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 14:57:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] linux-user: Implement PR_SET_PDEATHSIG
Date: Thu,  6 Jan 2022 14:57:37 -0800
Message-Id: <20220106225738.103012-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220106225738.103012-1-richard.henderson@linaro.org>
References: <20220106225738.103012-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 9eb2fb2bb2..8495f5e08e 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6450,6 +6450,9 @@ static abi_long do_prctl(CPUArchState *env, abi_long option, abi_long arg2,
             }
             return ret;
         }
+    case PR_SET_PDEATHSIG:
+        return get_errno(prctl(PR_SET_PDEATHSIG, target_to_host_signal(arg2),
+                               arg3, arg4, arg5));
     case PR_GET_NAME:
         {
             void *name = lock_user(VERIFY_WRITE, arg2, 16, 1);
-- 
2.25.1


