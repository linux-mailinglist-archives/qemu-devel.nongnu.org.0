Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BA26CC94E
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 19:33:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phDAb-0004eJ-Jr; Tue, 28 Mar 2023 13:31:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phDAa-0004dR-14
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 13:31:40 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phDAY-0003Qi-9Y
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 13:31:39 -0400
Received: by mail-wr1-x430.google.com with SMTP id r11so13025238wrr.12
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 10:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680024693;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dtiprwlUv8RpyZHXqJVAug6oqdjSRp6/2zuWFlQJTRs=;
 b=jRrDLlb5Rr0/bjgs0sXnPhocTF2kfFeBSzLF6bstz/3ygI64v/eWDrZCogYGgynYQP
 A3hrl61AOTFeEGUhH99GhdE3G0beq7SNPicGoCu/67HMpRZ7OOxl/8FYyDGxYfostrQF
 O9jrP876HInNbbghyBLQwnS2deq8MHy5UCkIqOGupZNO/yjTu2Ytzvs1ahaP6Zg8hVqW
 iuw9CwKVPjBDtUPPo0bcuhM26bnS9Re/sMKECuZ6iP7XHy3eu1ZQllM5QS6B13i8Aa2s
 VUk9MjN7Pf8XFoXdNmBGvfruTlKaVjDP1NjyanfzO+a7iGGWHKkI/AjIDvpQQ8SDgTht
 gO8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680024693;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dtiprwlUv8RpyZHXqJVAug6oqdjSRp6/2zuWFlQJTRs=;
 b=Y58A8/sJRgRWjjg4vnFuRZ16Ajq9tKbXAKstbrXX7tMlCo8iF62BjQFlOlKs8sFvjR
 jbQtKFGh68nWtFzsgMRMnmJ0w0rsedmhNpnwY4SAEDeqSU2w+9rRQYOpxjT40uU1u8zb
 TrkWA3TntSMz0FC2o3Oijpcc1jq9uo7o5rvNqRxpgTY+4qi2fAdWTjrdsGJdGwz3PFnF
 OdG2AReqQ6MpXgTntY4rmXPUY/CQfaYph2RDKVtcwUFBpWIqtWLuzAaef1gYWAVSjGmH
 N65LKLsDjXSDKEtkxaB8KOC4wiUbxcwXiNdd2MQAgwGysIpKe+5r/D4NgOdh8L7BbFyE
 tbvA==
X-Gm-Message-State: AAQBX9eKNkm8fSTWWerK9MybCaJ0g6kaKv1KSMehYuMNdXLm4vdQDqQh
 bVxNQK83DxNuZ/EJxk3baRmVLeUFF9djGiVeTaE=
X-Google-Smtp-Source: AKy350YcLKf496WO/PMS7jSwOOzxrOynCtjMnJtsPQhvloi8lsidFYl2ZcxsFhfyhqCqdSMllBmsSg==
X-Received: by 2002:a5d:428a:0:b0:2d1:6104:76ab with SMTP id
 k10-20020a5d428a000000b002d1610476abmr12558802wrq.2.1680024693303; 
 Tue, 28 Mar 2023 10:31:33 -0700 (PDT)
Received: from localhost.localdomain ([176.187.210.212])
 by smtp.gmail.com with ESMTPSA id
 c8-20020adfe708000000b002cde626cd96sm27997076wrm.65.2023.03.28.10.31.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 28 Mar 2023 10:31:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Halil Pasic <pasic@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, David Hildenbrand <david@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Greg Kurz <groug@kaod.org>,
 kvm@vger.kernel.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH-for-8.0 v2 2/3] softmmu/watchpoint: Add missing
 'qemu/error-report.h' include
Date: Tue, 28 Mar 2023 19:31:16 +0200
Message-Id: <20230328173117.15226-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230328173117.15226-1-philmd@linaro.org>
References: <20230328173117.15226-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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

cpu_watchpoint_insert() calls error_report() which is declared
in "qemu/error-report.h". When moving this code in commit 2609ec2868
("softmmu: Extract watchpoint API from physmem.c") we neglected to
include this header. This works so far because it is indirectly
included by TCG headers -> "qemu/plugin.h" -> "qemu/error-report.h".

Currently cpu_watchpoint_insert() is only built with the TCG
accelerator. When building it with other ones (or without TCG)
we get:

  softmmu/watchpoint.c:38:9: error: implicit declaration of function 'error_report' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
        error_report("tried to set invalid watchpoint at %"
        ^

Include "qemu/error-report.h" in order to fix this for non-TCG
builds.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 softmmu/watchpoint.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/softmmu/watchpoint.c b/softmmu/watchpoint.c
index ad58736787..9d6ae68499 100644
--- a/softmmu/watchpoint.c
+++ b/softmmu/watchpoint.c
@@ -19,6 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/main-loop.h"
+#include "qemu/error-report.h"
 #include "exec/exec-all.h"
 #include "exec/translate-all.h"
 #include "sysemu/tcg.h"
-- 
2.38.1


