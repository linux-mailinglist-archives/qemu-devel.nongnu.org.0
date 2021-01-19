Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A92CF2FBB07
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 16:23:34 +0100 (CET)
Received: from localhost ([::1]:55604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1sqz-0005Iz-Nc
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 10:23:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sfP-00080S-P0
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:35 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:38773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sfN-0001Ki-T8
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:35 -0500
Received: by mail-wm1-x333.google.com with SMTP id y187so63708wmd.3
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 07:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=j/7T7BL356zDUkFhlnPSgXmj2AQrJrv0/tAPf2X58e0=;
 b=US/OO1nDQ64YvhVMPmpreWd0RZnNgZYlq/GR4CqORwP7B95yyf+IAUR5ntSk5cS7GC
 THJz9tBUyoKQt4n3Mv41Fsk8TqN1APFN24NMaUSqr+T2+ljJ/WD70KLu8ra/c4UA0WcB
 GfxrogT1ao86GhVGdHjkMF/UivEfWVLG8FfcO0cf89LyNOdbFKk/zYReiHetYXMAeRey
 lbMS/QccE3NucLnZNSBKa0b5GRR1ETQ62HlyQInd4nvhgnxYjfaUflyUb3h2HYi0Kdm5
 WYGsaGhIiPf5/AG6ru8EUIZBQMNlbQlPxcC/+z+JFbKrsKiwfM4wNOtjftKmnclTddX0
 R/qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j/7T7BL356zDUkFhlnPSgXmj2AQrJrv0/tAPf2X58e0=;
 b=U7ArmUVt6bh+a2wQE6L7TFtIWrruOfq8Xr2ZPqniv362Vox2Ud7J0rlechf6xYz/S1
 zaou8pfzBa5inLHLWRDtfDAyzWLOE9h7qRSfMFSCHhacalBUks0es/LW7WnFO+NNfV5v
 M9V8hZTvUTn37SYCIsnmSEMxhBQHszhMGz/y/xoAS5A14M6lE3DRk9x42PR4/9hVEDab
 PGyWevL4sLC07vGdNSOhhDvFBRbfC/P1x9msWrUcs5WvWRp4bybynPjFrOSDVrcQNMCH
 BU0VEXMJbrSS7fL/JzPINNiK76Oe2wOMbKifTzV3W9asGRjzJcxqsuTcSvztHZsxq1v4
 q64w==
X-Gm-Message-State: AOAM5324cs3HgJAoVMOhWG2o3KziO6uXb1uXFceBuucNRvN/gcmVzNs5
 knmQtBGn+SuPBPaVT1yo1JSGppbqBYx3PA==
X-Google-Smtp-Source: ABdhPJwlS8cGTQxssrKqc2V3yagFKf+GO0meZGnNP5Fega1sgbzrVUg6MQ5aeN9zTL8euIi8P5KuSw==
X-Received: by 2002:a1c:8095:: with SMTP id b143mr80956wmd.71.1611069092531;
 Tue, 19 Jan 2021 07:11:32 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a184sm4843699wme.35.2021.01.19.07.11.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 07:11:32 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 31/33] npcm7xx_adc-test: Fix memleak in adc_qom_set
Date: Tue, 19 Jan 2021 15:11:02 +0000
Message-Id: <20210119151104.16264-32-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210119151104.16264-1-peter.maydell@linaro.org>
References: <20210119151104.16264-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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

From: Gan Qixin <ganqixin@huawei.com>

The adc_qom_set function didn't free "response", which caused an indirect
memory leak. So use qobject_unref() to fix it.

ASAN shows memory leak stack:

Indirect leak of 593280 byte(s) in 144 object(s) allocated from:
    #0 0x7f9a5e7e8d4e in __interceptor_calloc (/lib64/libasan.so.5+0x112d4e)
    #1 0x7f9a5e607a50 in g_malloc0 (/lib64/libglib-2.0.so.0+0x55a50)
    #2 0x55b1bebf636b in qdict_new ../qobject/qdict.c:30
    #3 0x55b1bec09699 in parse_object ../qobject/json-parser.c:318
    #4 0x55b1bec0b2df in parse_value ../qobject/json-parser.c:546
    #5 0x55b1bec0b6a9 in json_parser_parse ../qobject/json-parser.c:580
    #6 0x55b1bec060d1 in json_message_process_token ../qobject/json-streamer.c:92
    #7 0x55b1bec16a12 in json_lexer_feed_char ../qobject/json-lexer.c:313
    #8 0x55b1bec16fbd in json_lexer_feed ../qobject/json-lexer.c:350
    #9 0x55b1bec06453 in json_message_parser_feed ../qobject/json-streamer.c:121
    #10 0x55b1bebc2d51 in qmp_fd_receive ../tests/qtest/libqtest.c:614
    #11 0x55b1bebc2f5e in qtest_qmp_receive_dict ../tests/qtest/libqtest.c:636
    #12 0x55b1bebc2e6c in qtest_qmp_receive ../tests/qtest/libqtest.c:624
    #13 0x55b1bebc3340 in qtest_vqmp ../tests/qtest/libqtest.c:715
    #14 0x55b1bebc3942 in qtest_qmp ../tests/qtest/libqtest.c:756
    #15 0x55b1bebbd64a in adc_qom_set ../tests/qtest/npcm7xx_adc-test.c:127
    #16 0x55b1bebbd793 in adc_write_input ../tests/qtest/npcm7xx_adc-test.c:140
    #17 0x55b1bebbdf92 in test_convert_external ../tests/qtest/npcm7xx_adc-test.c:246

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Gan Qixin <ganqixin@huawei.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Message-id: 20210118065627.79903-1-ganqixin@huawei.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/npcm7xx_adc-test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/npcm7xx_adc-test.c b/tests/qtest/npcm7xx_adc-test.c
index f0297069459..5ce8ce13b3d 100644
--- a/tests/qtest/npcm7xx_adc-test.c
+++ b/tests/qtest/npcm7xx_adc-test.c
@@ -129,6 +129,7 @@ static void adc_qom_set(QTestState *qts, const ADC *adc,
             path, name, value);
     /* The qom set message returns successfully. */
     g_assert_true(qdict_haskey(response, "return"));
+    qobject_unref(response);
 }
 
 static void adc_write_input(QTestState *qts, const ADC *adc,
-- 
2.20.1


