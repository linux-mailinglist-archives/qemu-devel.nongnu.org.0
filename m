Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF326673536
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 11:13:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIRoh-0003wq-7f; Thu, 19 Jan 2023 05:06:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIRnn-0003ns-Vp
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 05:05:49 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIRnm-0005EA-7Z
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 05:05:47 -0500
Received: by mail-wr1-x42e.google.com with SMTP id h16so1289531wrz.12
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 02:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lp7QBocGltbT5Ch7Xv6lzQ/CjEgDd3cHtWRpI2qpHEo=;
 b=Y/gaUUR62ZGPWWPVIABq5eI0Osm+q3hAlZtFCnyHqIr7C/MJAuGu3R7OSzNte0s3CP
 JHi0aDl74mzn16a3TXi0GTV5NRAaxIHfpfWzO3tuwURXeo2Zn6tlRAVXYYGScInF/pF/
 dJQAIpEfhMoDIX/qrrWTyf2IhUz4UU7Nb+0gmzaTyljUpwTnaUe9mqUwLxPFRYC77gwz
 mOD4KxUWa78gJhchPgCHQAi8IfqOxSQLPnDs24pSquW0afFrXcQoxRlP5iF1ohe2t693
 Tugb3bHFSMmxUq0NRt4zQCaPlTWyR7uCzQXD48sPZpS17GZYLv+sIPtbRJ0hYczmmSGt
 0d/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lp7QBocGltbT5Ch7Xv6lzQ/CjEgDd3cHtWRpI2qpHEo=;
 b=o3x9TDFs2AZmxf9n4wQA2sst5q1VPTkJjaeTrF/D8eKEY7KX+a8y7KypTwNvQ7pdPX
 YxrQyU3hydEtSPQOvNMVyDta1ZZWk00XYN1V5I9u+gsiuOliUSbjLL58iHanjHkdxNOY
 mhNdLbpoXvGOx7Ztj/Z9BdLeXkAFKeeBA096YLDpi+oPUOi3Mva8UUexGcKXUaX5J79x
 cMeByeCHViSi7ViL4op/rbd+2thGYc0SWYa3yP/KWbg321C54vtl0h0RK7wg1p+S6jJl
 xLz9SlII9gezOIZAg/YewABvXvu3jRw7GsVo7ri6GyNYVPdMOWvuRNstWpwMwJtYMfgy
 K9QA==
X-Gm-Message-State: AFqh2kqhcRVTSk5B6+5PT/zEIUaBZqKzz3wFDW53kQv/aLwEVjJ9ZgYU
 xiKkqmek2x40s9CqTKBNkc88JmWhsudenXWt
X-Google-Smtp-Source: AMrXdXtwwaHmPtjHwgbWViAQmCeUMoKQ0w2Cw1zXAmdm1m1043x90TmMFyi47NP/ftnb9xjnYPFRUA==
X-Received: by 2002:adf:e841:0:b0:2bd:bf01:5c3 with SMTP id
 d1-20020adfe841000000b002bdbf0105c3mr8958364wrn.61.1674122744516; 
 Thu, 19 Jan 2023 02:05:44 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 e1-20020adfdbc1000000b002b8fe58d6desm33743435wrj.62.2023.01.19.02.05.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Jan 2023 02:05:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/8] tests/qtest/boot-serial-test: Constify tests[] array
Date: Thu, 19 Jan 2023 11:05:30 +0100
Message-Id: <20230119100537.5114-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230119100537.5114-1-philmd@linaro.org>
References: <20230119100537.5114-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/boot-serial-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
index b216519b62..3aef3a97a9 100644
--- a/tests/qtest/boot-serial-test.c
+++ b/tests/qtest/boot-serial-test.c
@@ -139,7 +139,7 @@ typedef struct testdef {
     const uint8_t *bios;    /* Set in case we use our own mini bios */
 } testdef_t;
 
-static testdef_t tests[] = {
+static const testdef_t tests[] = {
     { "alpha", "clipper", "", "PCI:" },
     { "avr", "arduino-duemilanove", "", "T", sizeof(bios_avr), NULL, bios_avr },
     { "avr", "arduino-mega-2560-v3", "", "T", sizeof(bios_avr), NULL, bios_avr},
-- 
2.38.1


