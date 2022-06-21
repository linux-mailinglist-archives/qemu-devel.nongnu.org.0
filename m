Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A57F553BEA
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 22:50:19 +0200 (CEST)
Received: from localhost ([::1]:50308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3kpG-0000L8-Ae
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 16:50:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3kly-0006by-Va
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 16:46:57 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:34405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3klv-00015n-NG
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 16:46:54 -0400
Received: by mail-pl1-x631.google.com with SMTP id i15so13559627plr.1
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 13:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7zQvLkFRfY6uiQ/phm8O3aPlVxdTqBvkghprkVFaI2Y=;
 b=j6otmGLb/Cw/NVe5L0hwIqVgRGo7+/vJxPZkR/qBGgb4zUS0JxKJZ9nvc47X709CNU
 uTDchIlSWw233GE+QdK5+uO+6kGpnmuzbpLPdZVnGAIM2N/lnZphNirUCDwpRBeszclY
 2aazHLeI3LbgRm/CeksuzNTgdEHklmReppPyFW/YXmoL9gz2pmRnq7khKuGpptI8yQWz
 7MbzohW/UPq3/MhjJTxRO6/AMPLygRn4QZcq9f0DbandABDBoPdGi4kojQOWTSuA/aQv
 owluUDE1tsm+KiCZskm/8yk7KV4VxYfdClHNWUlROJ+g4EYrCFIQVeTEMnGd5XrugrRt
 +zDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7zQvLkFRfY6uiQ/phm8O3aPlVxdTqBvkghprkVFaI2Y=;
 b=R8XpphgTvOCxIYMpmjkh44Meoe1xbGSAoIuDZSlI3xa/v/YkFaoP7fd5fkanARgzRh
 UTvCd0E0rNZqo2RphDIOM+z8cxJuFhQpX6qTXDJbxWhJU7ENPLcvvPSSQgnws42RUGEP
 ap7NxWN7AB2IO9Dyr+C6IoTja3xOICeRsvBOC/oOeNgdZUw76Xf5UGDLK6kyXLsHxBZG
 YdKsLefXwfua8yk3U5XEsWsorSRKq5nvdJBJPOdq7D0n8NhsKO0OkEFlHRVCelGRheqi
 tEgQJLDtWnulx+idnu6RJIjXtfp1NW0eLppxvuYa6Q0n8lJmto5zmwXT0/yJrmWGHCos
 Dl3g==
X-Gm-Message-State: AJIora+FRZKPhkis/wa0ukeYKV76T3IPAQfNkM9jQkfpB8TgNJTr0kFh
 oEre0yCwDgRJBGSSlNjqyZUQscb8TIuqfw==
X-Google-Smtp-Source: AGRyM1vUi8fxnsMkZlj4A76tPTZJF45sosX4rKum9qywjPzIL/o2dL4hO368vUWBSJM2JDpwFnn0Ng==
X-Received: by 2002:a17:903:22c6:b0:167:5991:fb63 with SMTP id
 y6-20020a17090322c600b001675991fb63mr30862376plg.37.1655844409201; 
 Tue, 21 Jun 2022 13:46:49 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:8adc:a144:6ec2:4d71])
 by smtp.gmail.com with ESMTPSA id
 p66-20020a625b45000000b005252defb016sm3649674pfb.122.2022.06.21.13.46.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 13:46:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Idan Horowitz <idan.horowitz@gmail.com>
Subject: [PULL 5/9] qemu-timer: Skip empty timer lists before locking in
 qemu_clock_deadline_ns_all
Date: Tue, 21 Jun 2022 13:46:39 -0700
Message-Id: <20220621204643.371397-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220621204643.371397-1-richard.henderson@linaro.org>
References: <20220621204643.371397-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Idan Horowitz <idan.horowitz@gmail.com>

This decreases qemu_clock_deadline_ns_all's share from 23.2% to 13% in a
profile of icount-enabled aarch64-softmmu.

Signed-off-by: Idan Horowitz <idan.horowitz@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220114004358.299534-2-idan.horowitz@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 util/qemu-timer.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/util/qemu-timer.c b/util/qemu-timer.c
index a670a57881..6a0de33dd2 100644
--- a/util/qemu-timer.c
+++ b/util/qemu-timer.c
@@ -261,6 +261,9 @@ int64_t qemu_clock_deadline_ns_all(QEMUClockType type, int attr_mask)
     }
 
     QLIST_FOREACH(timer_list, &clock->timerlists, list) {
+        if (!qatomic_read(&timer_list->active_timers)) {
+            continue;
+        }
         qemu_mutex_lock(&timer_list->active_timers_lock);
         ts = timer_list->active_timers;
         /* Skip all external timers */
-- 
2.34.1


