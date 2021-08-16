Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E1A3ED869
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 16:01:47 +0200 (CEST)
Received: from localhost ([::1]:48836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFdBQ-0005r5-KD
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 10:01:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFd8a-0003By-Tr
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 09:58:48 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:35634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFd8Z-000620-9y
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 09:58:48 -0400
Received: by mail-wr1-x42b.google.com with SMTP id q10so23826637wro.2
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 06:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G+5WdnIF0AlNWQxsS14WT6o6igP3aa3eGxkIM5Nj9A8=;
 b=Tdb0r/wbvlfqvUqBK0PBEoSenzXO6sJW7i8ZDQRMW3whbaAuc1trHIRsjCVzvRwiO+
 3E6sqyWPyV8UetGa51lLZ4fqhFZDOBjQCi8PmlLcQlgbG8hBv4N8JHncj6FxVo8PtTFW
 zaeJ1fQocSc4QVEF+dawpNEPX0miOiaLHWqW6pty0Bfsban+0FRkvWT1mftYcwzLExk7
 rk/5ndVRZCP/l/ubHoUTSBkTFTss56edbWgNml1lSZu1kc2ufKm9XNJmcf15Y9aaWvmY
 NO4UbtYua333uvplrARxd5bs30xcOqGsPsKTZTrzpNSPi6lYYH/mqqmAFpYghTcaGya0
 ulXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G+5WdnIF0AlNWQxsS14WT6o6igP3aa3eGxkIM5Nj9A8=;
 b=ic3xvTcE9JEWXUlY/RjbEQNE6GNgsTPRNy6yd1SR+FNSPJLyq2tdkELa/o7SLhIQIA
 gw+wenggi9OPNm/LpVyUh2eHhQr2f+xd7Y8kNgpYPtManxtQlVYt/24G4TkBygghcs0X
 KY8z/MzIiAMY6ooVHjnl8tbhfS7VpnINMu8krbB4KeMVjY94e3q4SkRcQYGi09H0gN3t
 YD+K8pW7tppgt45X524xInV1YnUsxMRraLMLNwx/MAakDFlzZCAhX5hJP8spxRltijyJ
 igzoSTevkDiVGOHPQDcgX/SiP2XzfOlNtYmS+fIACV/mHQ8SrUiuszKjmHIu8Z4zCU87
 poUg==
X-Gm-Message-State: AOAM531K+bAnLOFgttU6eY8xVDRdP7CuCpekfaOHSUsJcdYLEku0TrQs
 gzzD8umFPizB/49LqkhQV928sA==
X-Google-Smtp-Source: ABdhPJwYXOMeBcx8+tbRAdNNOSkeVNCxN8KDL173VTiTvz/Nm7+WSlxXy3xCKW0dQ7wKRPuoUm1qdQ==
X-Received: by 2002:a5d:4447:: with SMTP id x7mr19872425wrr.198.1629122325300; 
 Mon, 16 Aug 2021 06:58:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y14sm11855631wrs.29.2021.08.16.06.58.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 06:58:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/3] raspi: Use error_fatal for SoC realize errors,
 not error_abort
Date: Mon, 16 Aug 2021 14:58:40 +0100
Message-Id: <20210816135842.25302-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210816135842.25302-1-peter.maydell@linaro.org>
References: <20210816135842.25302-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The SoC realize can fail for legitimate reasons, because it propagates
errors up from CPU realize, which in turn can be provoked by user
error in setting commandline options. Use error_fatal so we report
the error message to the user and exit, rather than asserting
via error_abort.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/raspi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index b30a17871f7..0ada91c05e9 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -281,7 +281,7 @@ static void raspi_machine_init(MachineState *machine)
     object_property_add_const_link(OBJECT(&s->soc), "ram", OBJECT(machine->ram));
     object_property_set_int(OBJECT(&s->soc), "board-rev", board_rev,
                             &error_abort);
-    qdev_realize(DEVICE(&s->soc), NULL, &error_abort);
+    qdev_realize(DEVICE(&s->soc), NULL, &error_fatal);
 
     /* Create and plug in the SD cards */
     di = drive_get_next(IF_SD);
-- 
2.20.1


