Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE90B5EB096
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 20:57:12 +0200 (CEST)
Received: from localhost ([::1]:40142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1octHz-0003Va-Pi
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 14:57:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ocs4T-00089K-Mz
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 13:39:11 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:35429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ocs4S-00025e-60
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 13:39:09 -0400
Received: by mail-oi1-x233.google.com with SMTP id v130so9148107oie.2
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 10:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=pXVh0YO1NoWUJnhZsEYuTK+C1YYZnhqFkmKC8PgYkM8=;
 b=n0cwJsLOEUr68EUVvDh154wOt/n68+AniNDuHDACUze8zD4vnVxYMGYUrm2ZvYr4tE
 iNTn2/btGdHrDuPmEA2LlGj1K25cqsnzbKHPIj0hSmlk8s1v3gMTOWiZFHJTLgr5vFf7
 B4Ms97wJrqPQRQse+/cmR23cJg97couBlBLH0+Z8cbzSZP+rTa/p4sspyMZEucuqA2NZ
 0+Kdz5GZQ2IZeAS17SXTvuSkzJqBS1tQk1IhJYJcu6iUUoPaioEYHhZWCtpnaJHLsYLF
 CXM9N1Jl9ln/Iu8NQIpJnwdzBGS2L/Ai7UZaoUKEi9qcDPRUf3/goi8jhLx+O1fNGddA
 2f8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=pXVh0YO1NoWUJnhZsEYuTK+C1YYZnhqFkmKC8PgYkM8=;
 b=746oJihevRVCnwSV0pI5VwCZDafkYY19zcsChUGaBDE0tCTW5NMtEbL9xmSyxGoMLS
 2zg4bPepO3WEPVVGTBVDI2p9yGLlXMzK5GE6AB2fT/YeMCYdvFvybj1z/TqWdYSonCPD
 mpI196Ksa9mZjyZMUh702yHZDliBcQBkNxlhxAoDg/e5W7Aass02PryTX/vUchZl5ui8
 XeKCnVxPxK5AOk7xj7xkgrHuQkgmNCUqHWOB0zyTuliJF/lwoVRyO5qZn+IxsB5pj3jv
 o3fEPH9soWAWgr30QY6IU7bvOmvUxUUrOTVLs0N5OSWsz9RYgkF3/DJg499rQRd0fcYy
 tLog==
X-Gm-Message-State: ACrzQf3TzPZRg8qWW91/O0CKLiWF72RmlZdKo8+RwEOmrVkpdthizC0n
 ykXWd6HapxJ9w1noBy0GAtcbbWjcTMs=
X-Google-Smtp-Source: AMsMyM726l1FlSjgIEH5sHhGktc/nSFakzJ/Qg6uiV+RjoJMcxV/YxBLrSoMg58QHHFBYNKch4naHw==
X-Received: by 2002:a05:6808:22aa:b0:34b:ae3a:1e57 with SMTP id
 bo42-20020a05680822aa00b0034bae3a1e57mr10461522oib.150.1664213946464; 
 Mon, 26 Sep 2022 10:39:06 -0700 (PDT)
Received: from balboa.COMFAST (189-68-154-15.dsl.telesp.net.br.
 [189.68.154.15]) by smtp.gmail.com with ESMTPSA id
 m12-20020a0568301e6c00b0061c9ab1032dsm7947165otr.18.2022.09.26.10.39.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 10:39:06 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v8 02/16] hw/core: free ms->fdt in machine_finalize()
Date: Mon, 26 Sep 2022 14:38:41 -0300
Message-Id: <20220926173855.1159396-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220926173855.1159396-1-danielhb413@gmail.com>
References: <20220926173855.1159396-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x233.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

ms->fdt must also be freed in machine_finalize() similar to what is
already done with other MachineState objects.

Suggested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/core/machine.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index aa520e74a8..aa8c1c5c36 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1114,6 +1114,7 @@ static void machine_finalize(Object *obj)
     g_free(ms->device_memory);
     g_free(ms->nvdimms_state);
     g_free(ms->numa_state);
+    g_free(ms->fdt);
 }
 
 bool machine_usb(MachineState *machine)
-- 
2.37.3


