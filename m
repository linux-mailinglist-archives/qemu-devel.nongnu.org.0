Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A412949258C
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 13:16:36 +0100 (CET)
Received: from localhost ([::1]:39832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9nPf-0000gI-CH
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 07:16:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9nDn-00065R-W4; Tue, 18 Jan 2022 07:04:25 -0500
Received: from [2a00:1450:4864:20::335] (port=44875
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9nCT-0005kK-Gf; Tue, 18 Jan 2022 07:04:18 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 l35-20020a05600c1d2300b0034d477271c1so3296766wms.3; 
 Tue, 18 Jan 2022 04:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NcmRGZy+w5AeQknLrQ9i8jkt7Fnk+/sozWPtjzwcvn4=;
 b=BUXPn5+k9O6T/sa1a4lmJrLzIg80wNuXg4gTsEOdPcYbo2s1mcLcWB5GXsxe4breGz
 Tc2eqhTkGtcKWHf1cQagvKtGosb2iOUO2MF4ej+9hnXrJS+4Rma/wpeTg3qz2qskOY0S
 qbtb2danPSYbH1CduBvib61PyDPkF/zwGEgAIeWeDvosZzBtFxx2Y9Hqt+NRSPsjUMAK
 /MYtIBzoThspJRyFcc4E9kE6+sfZbJe5HQPVghsCDDvJLPQZg0vU9A73E/l3qr9QpXX7
 /7R7MTMZ3DCX645V2B7d9jAMCplTmDtyUbQLUEl8YpIAUiEaY25zk/FTXzAikN2o4W8h
 /udQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NcmRGZy+w5AeQknLrQ9i8jkt7Fnk+/sozWPtjzwcvn4=;
 b=AOKQWny7Ky228rBfOHKTHFjnsEPen2TKmJfAEUJswbTGa/vskG2DIT7zIF4lYhohKN
 UBkvcI7RoI84Wbn2+aut1eur9V9U2h800hqw2+W9XSAO5yT9tnSIz9P07kRijdLdHHkl
 xlPXe6Y/d3X7cH6CYY4WZbWduHfb0wPYL1UUwr98owpCH7x2ROBXOZy8JyowNtRjfv83
 EtLsGhpZ4BEjVzWQ8qeMmiLw1SUa9KnfRcVAM454CaO8UP1kztxjQJam79BbHFjepCk+
 Y6wcbOnZzvkgozgmOxCcWJRW+DjPpeVIAVpz/69QuK6cl2e/wqB0Wl16lxs0RsGSRan4
 x30w==
X-Gm-Message-State: AOAM530hh3oCh3gzGd4hCUpqPnZQke9NmLyHWWpLq4iNomrbEwUZ+pzH
 MPKFxUxlHmrdhk6DVoOxE4bmWDmMqAk=
X-Google-Smtp-Source: ABdhPJxcqCU+73oqEhIAjbPW2oGfth8yFjENXMIMJs5yBlSE5G0AeaQa+wbiUgNPzLMWiUSlccrxwg==
X-Received: by 2002:adf:dfcd:: with SMTP id q13mr24365013wrn.487.1642507370197; 
 Tue, 18 Jan 2022 04:02:50 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 o5sm2133194wmc.39.2022.01.18.04.02.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 04:02:49 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 04/19] machine: Use host_memory_backend_is_mapped() in
 machine_consume_memdev()
Date: Tue, 18 Jan 2022 13:02:14 +0100
Message-Id: <20220118120229.196337-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118120229.196337-1-f4bug@amsat.org>
References: <20220118120229.196337-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

From: David Hildenbrand <david@redhat.com>

memory_region_is_mapped() is the wrong check, we actually want to check
whether the backend is already marked mapped.

For example, memory regions mapped via an alias, such as NVDIMMs,
currently don't make memory_region_is_mapped() return "true". As the
machine is initialized before any memory devices (and thereby before
NVDIMMs are initialized), this isn't a fix but merely a cleanup.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20211102164317.45658-2-david@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/core/machine.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index debcdc0e70a..d856485cb4d 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1091,7 +1091,7 @@ MemoryRegion *machine_consume_memdev(MachineState *machine,
 {
     MemoryRegion *ret = host_memory_backend_get_memory(backend);
 
-    if (memory_region_is_mapped(ret)) {
+    if (host_memory_backend_is_mapped(backend)) {
         error_report("memory backend %s can't be used multiple times.",
                      object_get_canonical_path_component(OBJECT(backend)));
         exit(EXIT_FAILURE);
-- 
2.34.1


