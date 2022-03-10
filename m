Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA114D460A
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 12:43:10 +0100 (CET)
Received: from localhost ([::1]:58138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSHCH-00080Y-4L
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 06:43:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGx9-0004nP-Bd
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:27:31 -0500
Received: from [2607:f8b0:4864:20::102b] (port=35644
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGx7-0007tn-Ln
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:27:30 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 mg21-20020a17090b371500b001bef9e4657cso8014949pjb.0
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 03:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NA9HskFqPeLh+02a0cXnYrdAXovGtw+F2Po8AxVhC7E=;
 b=DZUuX833jwyKf25fc16ZvWHBarUREFZrcPPZWxVd51RcBpv1SsMiqwtmWAM+VSSW6v
 ++FmquQQX8uKo/f33hbwCyCbF3YFC6Tsc2BQkxyV8ePOkV8yBNtNKWgGqoBzE6nd+aYi
 +MOqvYZGukQgsJgYD2+Hj6Df9M8AxZgFuiHONNkOt2gZoaVACXatJae755t841LnA6rl
 JdUqhGaTP8uaCjxViT6DHR1VVrx82CgRWATozFDVT7xqjJbHC5Huel7RVTfsUzgTc77Y
 VS3DqzvOvbJv1wwiZZKnJ/IMUj12T5EWMYn6t+SyvjS9oaMttM8tA/sLBME8QIupqsTn
 szxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NA9HskFqPeLh+02a0cXnYrdAXovGtw+F2Po8AxVhC7E=;
 b=aYeAlP2byz3lWpueidM1j2FQPW8iRA8Km+VuM1g9/Zb43X4I56pZNpAynpMOcwtkdL
 AdltOXAkHSDweNm/wERuClh//uh00DgWtGNZhdRLUgVrj+yXDYAUT70UP1yfxsVIGfX+
 VJqFwcEKxc1OXuq+A/nteSV5f8hJRPrVjkKNj+wjezjU8DXK3+yglEdSRxXiiD7ySvv6
 zMM5T8ISImQf4lYsojhS4hbmwjLyu4XnkYvDTgOqzh41EEWdEngWSjxx0A+29S+SL2oY
 FX0RUUnrgY/8DGnUWQOeGJOdEeZf/cUvmPnYksmrd9UO5S59VxGKlvzPJLOg1Zwxeant
 jycA==
X-Gm-Message-State: AOAM531znU9OEmqVRX5oqWXRtIIjRRX+PnmQl1dY8SFjUX/uJkCyckyk
 /Y8h7hc0YPWYc8RuslvhlIqI6dW1Wq0vog==
X-Google-Smtp-Source: ABdhPJxpXIcZueN00DZa/PF7a+xeELRODICXUPMxx3tKrFbHMsvqYdr0V9E8hJC6iC5ngjGTpefs3g==
X-Received: by 2002:a17:902:8491:b0:14e:dad4:5ce5 with SMTP id
 c17-20020a170902849100b0014edad45ce5mr4505167plo.76.1646911648371; 
 Thu, 10 Mar 2022 03:27:28 -0800 (PST)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 js15-20020a17090b148f00b001bfc8614b93sm3114977pjb.1.2022.03.10.03.27.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 03:27:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 01/48] target/nios2: Check supervisor on eret
Date: Thu, 10 Mar 2022 03:26:38 -0800
Message-Id: <20220310112725.570053-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310112725.570053-1-richard.henderson@linaro.org>
References: <20220310112725.570053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: marex@denx.de, peter.maydell@linaro.org, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Amir Gonnen <amir.gonnen@neuroblade.ai>

eret instruction is only allowed in supervisor mode.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Amir Gonnen <amir.gonnen@neuroblade.ai>
Message-Id: <20220303153906.2024748-2-amir.gonnen@neuroblade.ai>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index f89271dbed..341f3a8273 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -384,6 +384,8 @@ static const Nios2Instruction i_type_instructions[] = {
  */
 static void eret(DisasContext *dc, uint32_t code, uint32_t flags)
 {
+    gen_check_supervisor(dc);
+
     tcg_gen_mov_tl(cpu_R[CR_STATUS], cpu_R[CR_ESTATUS]);
     tcg_gen_mov_tl(cpu_R[R_PC], cpu_R[R_EA]);
 
-- 
2.25.1


