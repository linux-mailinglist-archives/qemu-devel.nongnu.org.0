Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A195C0480
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 18:45:44 +0200 (CEST)
Received: from localhost ([::1]:44576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob2r1-0000ne-EZ
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 12:45:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ob2ND-000740-Hw
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 12:14:55 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:44828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ob2NB-0001Va-OZ
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 12:14:55 -0400
Received: by mail-wr1-x429.google.com with SMTP id c11so10667356wrp.11
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 09:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=zs6if3JsrgpCg8dSorFuiYuQlfRV6HSFVzcfBOEUknM=;
 b=tBSaZXCHyL0X04o1b89r/sLIPcBvPkr2w01jT2oe9V7TTqQy9BHGCmNmtdgSs0AXsC
 T9bINdrmnGZ+mkMzznBZnAIgdxeeI2iqWvJTNIRpQltLMnSkn+6zK6610r5wvPlaypVM
 sQro1bKETDsae2m8+Fyu5x+siStPyYF+0G1fK6JCV4/9vlmQoo5aukU8uCu7CaWg5lNH
 LBz3X+O3zVHMMM31zPqskcXRtXt/o6Q/iY+pSxjiA7HOujQ0fwZQTHKsvOMIpK8I3vw1
 NZ/FCuWxjKyvvgUw0+GifXs3kl0STEn6v5nb8nKxBEUY6gW6XdJ1t7u9SHcA45JCDzSm
 8Ugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=zs6if3JsrgpCg8dSorFuiYuQlfRV6HSFVzcfBOEUknM=;
 b=fL/fNjNE9XsltlUlySzWwWL8dCH1g9iP7wQaFab5vTdI2nhFdtj2os5kp55jOLbnG4
 lB2SpAWQbStBEbfCGks/dqmK7Ry/GjsbqgzWNR1XZoLsNX+QybhVObWjx2yvb/ysyN7L
 4BoSE8qsc83V3WFDeBy15gYW5ZMql5NHbaN2X7Gqi1YU5F/Ezv8wBamcIx7oKck8VjyZ
 AIo/Q6Y2+ffwu53eCoKcO6Bo95mAMzDPdcp4cFbitTZUThUMLzSKuzvbicaJIj4lO3Fw
 YBJFxec33t+AfEVA2fOctnRaH4IPBjiSfA9Geu0UJq+OEIi88NR/IJ9NAROMKmgW9z99
 3btA==
X-Gm-Message-State: ACrzQf2/UWRHx7bMLcgRdwtQBvmWvSL/VobO+/AQQL0z6CQXJcxUF/as
 9OIiM9u4+0EfxJKTdXX8heYJXQ==
X-Google-Smtp-Source: AMsMyM7PhvOqlA7muc8FKwfRm0KNnnmscgHRXtZBD5GBCG42+BbrfQiWPBVJfJ5yZA0N8M7AbYg0Tw==
X-Received: by 2002:a5d:59a9:0:b0:22b:e6a:4796 with SMTP id
 p9-20020a5d59a9000000b0022b0e6a4796mr6907197wrr.47.1663776892207; 
 Wed, 21 Sep 2022 09:14:52 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 q63-20020a1c4342000000b003b4bd18a23bsm3218113wma.12.2022.09.21.09.14.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Sep 2022 09:14:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 04F121FFC1;
 Wed, 21 Sep 2022 17:08:02 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>
Subject: [PATCH v1 09/10] contrib/plugins: reset skip when matching in execlog
Date: Wed, 21 Sep 2022 17:08:00 +0100
Message-Id: <20220921160801.1490125-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220921160801.1490125-1-alex.bennee@linaro.org>
References: <20220921160801.1490125-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The purpose of the matches was to only track the execution of
instructions we care about. Without resetting skip to the value at the
start of the block we end up dumping all instructions after the match
with the consequent load on the instrumentation.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Alexandre Iooss <erdnaxe@crans.org>
---
 contrib/plugins/execlog.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/contrib/plugins/execlog.c b/contrib/plugins/execlog.c
index e659ac9cbb..b5360f2c8e 100644
--- a/contrib/plugins/execlog.c
+++ b/contrib/plugins/execlog.c
@@ -147,6 +147,9 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
             /* Register callback on instruction */
             qemu_plugin_register_vcpu_insn_exec_cb(insn, vcpu_insn_exec,
                                                    QEMU_PLUGIN_CB_NO_REGS, output);
+
+            /* reset skip */
+            skip = (imatches || amatches) ? true : false;
         }
 
     }
-- 
2.34.1


