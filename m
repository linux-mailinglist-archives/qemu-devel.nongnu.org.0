Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB956CC76D
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 18:04:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phBmB-0008F9-Ax; Tue, 28 Mar 2023 12:02:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phBm9-00089A-7c
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 12:02:21 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phBm3-0004Dd-B4
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 12:02:20 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 i5-20020a05600c354500b003edd24054e0so9780819wmq.4
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 09:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680019333;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dtiprwlUv8RpyZHXqJVAug6oqdjSRp6/2zuWFlQJTRs=;
 b=YBqnn50nc5BI6U2W2Uz+dLXQxn1NXHOzSypufKCyjOjT+cy3R7s0R4aqhwiDm1EzRC
 TQRA8apn7ceclv47/0cw5P4cRiGgwQUuwq3Zo4MRQ58HSywEWli1lhc4vczj5tBN5cT2
 EH6UeGV8Y9V6THfP62La39VWMa8enqO41YrD6+m0WRymZ4gzfu0oHhnvJXWPG3aJ6bV/
 RZ+0MTo57uraXhRjNX2vobjAzL7jx5j4xTzbwv14WIC2WUvqtGkqyidF5A9rKft4ryjm
 QF9nr+Thu0ERZdq6QCcmboo4d90zZPpJf/uvYLxXMjBgcjG+0wXDMEo0kibI+mce/6jE
 Dgbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680019333;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dtiprwlUv8RpyZHXqJVAug6oqdjSRp6/2zuWFlQJTRs=;
 b=u0WZi9pn8ueTLhERT2LRdu67OMEHg8RFmlE8oDBuAHYqdGAleyrUjJikTxHBBvlLBn
 4uZNFMsEFHJze8MQSd1aD3ODnWP1TaeHA7zzq12pucg3I3ypjHwbqaytdzjWi5L+6e0F
 mIn/UWWkZdS3FYhh5EkPZFW9geqAZ4+ZKas0+0pcJp9q9tsssTbChVdharkdqTs6J3MO
 sZp/joePak+8aQ+kkAy1WR+fdwWMLxXcpwpo59fizwnadw1/RwIVeydiTRVDcogFIayF
 pDeo1wIm32ibUE3E1/Yzdpn3SlDOLABsR7l9w+CsqAvt3frJGL90szocXQTdlt9NM7qh
 p6XQ==
X-Gm-Message-State: AO0yUKVZzidIN1/2uPT34XykZQgQlNoNkcHkvDxB7BjPtEVX2hGTDU2P
 wFh5WB2vqHUbafRC0I1nq6Ikqtk65564l6c87go=
X-Google-Smtp-Source: AK7set+wy+rcXei80pJmoUp0mvVFmGsR4Dmw3o1mOxbaDnbESYJxnRRG7eE/MMueHWRFm/HPkvRUVw==
X-Received: by 2002:a05:600c:204:b0:3ea:d620:57a7 with SMTP id
 4-20020a05600c020400b003ead62057a7mr13068749wmi.8.1680019333682; 
 Tue, 28 Mar 2023 09:02:13 -0700 (PDT)
Received: from localhost.localdomain ([176.187.210.212])
 by smtp.gmail.com with ESMTPSA id
 s3-20020a05600c45c300b003ed51cdb94csm12936005wmo.26.2023.03.28.09.02.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 28 Mar 2023 09:02:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, kvm@vger.kernel.org,
 qemu-s390x@nongnu.org, Fabiano Rosas <farosas@suse.de>,
 David Hildenbrand <david@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Greg Kurz <groug@kaod.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Yanan Wang <wangyanan55@huawei.com>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.0 1/3] softmmu/watchpoint: Add missing
 'qemu/error-report.h' include
Date: Tue, 28 Mar 2023 18:02:01 +0200
Message-Id: <20230328160203.13510-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230328160203.13510-1-philmd@linaro.org>
References: <20230328160203.13510-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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


