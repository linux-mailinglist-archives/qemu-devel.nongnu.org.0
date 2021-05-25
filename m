Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB334390593
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 17:36:55 +0200 (CEST)
Received: from localhost ([::1]:39454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llZ6z-0003sA-J3
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 11:36:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYbQ-0003D8-DK
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:16 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:53245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYbH-0004My-M8
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:15 -0400
Received: by mail-wm1-x32c.google.com with SMTP id z130so16944314wmg.2
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=IHEU+EiY4WCezbM765U/F6yjDoUL+n4D64hBsfdmdHA=;
 b=t2STds8LpqF5zcGw9lbhOxAGcu48ExnJ3AL1Q+5QX87FZ1MRZ2TLuwlXKn0ZsMypyQ
 PGSRHaZ6OJRrgtSIw/1GH2FqpSJRqC4vj7XD7sDSx0PbaYBF1Vgey7ypGBLQjp0zS7E/
 bvgGILZTKh4Hl5vNf/PS1AO57UI5N8chzgQgOsCknHfA/xIE9lbwB170s4OuQjApEjxH
 yS35IA9y2EYFfRpTdzDaSh3ntSv/MTWtVjmvooofMINOeVURqfjF6cv+TQ+h+yHASqPa
 97B6uFobez3jXqjSF7xqOyifh56jKLcF6esl/PaUrWLR4APV+YtYVBjc3wQ0VL3VsrpL
 XYEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IHEU+EiY4WCezbM765U/F6yjDoUL+n4D64hBsfdmdHA=;
 b=RVwbeZ3ywkfmi0nSbBxJ6YUqMw8aYUejdDtbl0JqA0FNXxKTQaAnOIPCDhDrzYZIpR
 iztK+PkFeCUwYjox/OgeqEwM9LuSZau5Y+QrhHp0vTNZz0ozklpS4idiyMmY+r5qoJVG
 E7F5PPybADprcnM4JIRfnnNFhLVC16RT+XFSKsKlFgCqxegJi1XvI5zHjFeb6/q5Mb+H
 NuH5evBkEZFauVEmio0uNi8CGeYI8a7H3dC80omjMMq7riKOlkn9JMGtk3nzDA2leixm
 7oZAeG4K6BKcCOQ1A7E/o8bc63ycQqNau1NKm6XzEeQujfDhJ44PnehY5QPDcY2Rvaxs
 ov1g==
X-Gm-Message-State: AOAM530ZmqJz2BvPv8ZUEtgZG7X04dv1Xf40sg9y4Juzd4NQqxSaYVKj
 5VNSzNUQ/frKk/KE8GoXRPlmlgy5UWsIyTZk
X-Google-Smtp-Source: ABdhPJyxiS5yKEZVbx6TxwiaiCZ5+HLnNMOmRyNfJif3UJAHLWhaq6QRBLs57rs1mc9Xpp4u1TCi8Q==
X-Received: by 2002:a7b:cb49:: with SMTP id v9mr4496896wmj.115.1621955046408; 
 Tue, 25 May 2021 08:04:06 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.04.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:04:06 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 044/114] target/arm: Implement SVE2 bitwise shift and insert
Date: Tue, 25 May 2021 16:02:14 +0100
Message-Id: <20210525150324.32370-45-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150324.32370-1-peter.maydell@linaro.org>
References: <20210525150324.32370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

From: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210525010358.152808-23-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/sve.decode      |  5 +++++
 target/arm/translate-sve.c | 10 ++++++++++
 2 files changed, 15 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index d3c4ec6dd12..695a16551e7 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1261,3 +1261,8 @@ SSRA            01000101 .. 0 ..... 1110 00 ..... .....  @rd_rn_tszimm_shr
 USRA            01000101 .. 0 ..... 1110 01 ..... .....  @rd_rn_tszimm_shr
 SRSRA           01000101 .. 0 ..... 1110 10 ..... .....  @rd_rn_tszimm_shr
 URSRA           01000101 .. 0 ..... 1110 11 ..... .....  @rd_rn_tszimm_shr
+
+## SVE2 bitwise shift and insert
+
+SRI             01000101 .. 0 ..... 11110 0 ..... .....  @rd_rn_tszimm_shr
+SLI             01000101 .. 0 ..... 11110 1 ..... .....  @rd_rn_tszimm_shl
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 1f93b1e3fe3..5e42ba350e6 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6428,3 +6428,13 @@ static bool trans_URSRA(DisasContext *s, arg_rri_esz *a)
 {
     return do_sve2_fn2i(s, a, gen_gvec_ursra);
 }
+
+static bool trans_SRI(DisasContext *s, arg_rri_esz *a)
+{
+    return do_sve2_fn2i(s, a, gen_gvec_sri);
+}
+
+static bool trans_SLI(DisasContext *s, arg_rri_esz *a)
+{
+    return do_sve2_fn2i(s, a, gen_gvec_sli);
+}
-- 
2.20.1


