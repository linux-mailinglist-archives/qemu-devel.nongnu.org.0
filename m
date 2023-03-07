Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA876AF0BF
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:36:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZc9W-0003X5-JV; Tue, 07 Mar 2023 13:35:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZc9V-0003Wm-Jp
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:35:09 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZc9T-0007hn-FI
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:35:09 -0500
Received: by mail-pj1-x102d.google.com with SMTP id l1so14146221pjt.2
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 10:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678214106;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LvRzWvVDOx/4mw8Xks+yN45owXOLBfvuaq+ouOQwf5k=;
 b=DLrYTU0uW0rxfmTKIOrGTG7NBWEpH9QlQDGYadQ3j7DQb6GmBqgq0RrdkPy7c48RI8
 fig/YstyFwB41YL2wf0d9tul/V6v6nTXgA6emezRblGzoi1Xc9phYFUxOnYz2/fZR8Ul
 3mxWB7WevvuxKn/A53nMoqofJHj14zGO0bQ3EtZBQa+TAuFZBxQBUydbq5+ith5wzXC6
 pVsFPd8wugYI/lBYafxg/ki0dIGP3NZYEIpVytF1bpzZPzkkBawPVRDNNOwr2FbJmcmW
 NNBej5s3tZRJN+R2fo1ZlQG6co0IuRITdEfBTbW+mxR0gCY/6rblA80bMAk7X8R1wdPU
 aXXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678214106;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LvRzWvVDOx/4mw8Xks+yN45owXOLBfvuaq+ouOQwf5k=;
 b=PPkrk8LZqfscLEupZ/vZG3QJjyRdknkJENkFUcXfz5kj9VsasqAHHc5ARcDtLACkAK
 5ySYnojZ8PLeAH1tVaQDaqpeSgf9//5G68suBrGNlEJsVskzzKQ9Ae4YkhFxn/wFTM8y
 5wGWnJUE13SRXwn4BXlpeG5lJIE7luJqzIFzf7Q7UU0YhCk830gbJGQ5+4jojD9HlYrJ
 KeRLBr3bjGp+6IATOqyqp4fgOkyLWELDCEbqzqOhGHXojDl+A88MbNBSvzN3LmSfW+s4
 eO6WcLahOHDwTLprXwKxcJCf18tVHnTwrC1V569+ZYvtnwgbNm3AWpe4CcA7GwMoXAPz
 vRng==
X-Gm-Message-State: AO0yUKVhsyZ3KyGpqAMvNHvj3XYWZm2eRNZBL6zs2sMiSbPBcM9IR5Lr
 8uEE5U/p8hgV8YnGj7Qt00BrT7DzyAKd5naEfs8=
X-Google-Smtp-Source: AK7set8d/Q7AvYAG2hPXFt/sslOSXccRXoL/LHFhrrcM9Vf+qamXwcLaWJ5919lLx3XPzL0zRQ5XNg==
X-Received: by 2002:a17:90b:3907:b0:233:f447:1271 with SMTP id
 ob7-20020a17090b390700b00233f4471271mr17353226pjb.43.1678214105797; 
 Tue, 07 Mar 2023 10:35:05 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 q1-20020a17090a1b0100b0022c0a05229fsm7757940pjq.41.2023.03.07.10.35.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 10:35:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 02/25] target/arm: Handle FPROUNDING_ODD in arm_rmode_to_sf
Date: Tue,  7 Mar 2023 10:34:40 -0800
Message-Id: <20230307183503.2512684-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307183503.2512684-1-richard.henderson@linaro.org>
References: <20230307183503.2512684-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

While this enumerator has been present since the first commit,
it isn't ever used.  The first actual use of round-to-odd came
with SVE, which currently uses float_round_to_odd instead of
the arm-specific enumerator.

Amusingly, the comment about unhandled TIEAWAY has been
out of date since the initial commit of translate-a64.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
Cc: qemu-arm@nongnu.org
---
 target/arm/vfp_helper.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 24e3d820a5..90cc324f71 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -1111,10 +1111,8 @@ int arm_rmode_to_sf(int rmode)
         rmode = float_round_ties_away;
         break;
     case FPROUNDING_ODD:
-        /* FIXME: add support for TIEAWAY and ODD */
-        qemu_log_mask(LOG_UNIMP, "arm: unimplemented rounding mode: %d\n",
-                      rmode);
-        /* fall through for now */
+        rmode = float_round_to_odd;
+        break;
     case FPROUNDING_TIEEVEN:
     default:
         rmode = float_round_nearest_even;
-- 
2.34.1


