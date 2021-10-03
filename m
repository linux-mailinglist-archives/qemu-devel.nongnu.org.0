Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5780C4200AD
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 10:08:26 +0200 (CEST)
Received: from localhost ([::1]:52308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWwXp-0000uE-DO
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 04:08:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw9T-0004Ap-BV
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:43:15 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:33747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw9R-00011C-NX
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:43:15 -0400
Received: by mail-ed1-x535.google.com with SMTP id p13so23617987edw.0
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 00:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QwdzjPR8WZDeMpfLkQQqWDyohKpDUiK9I55YvVVcH58=;
 b=PG3PcsJIpAQzSYqyIQWOkkS9TZTeeWdWexrR19gky2VaGekQMzGJzYakgGiUoio15q
 dhtsa7gTDOVWbsI0veNGr5/etfzJh2xm4uCrx8QkCc8kcr6kHurUFtHLW5QmDgC29+a8
 jvATa6kZrK3cArU6IGf/z5JDElC93tT0G7ur5JwGR32iW6cCq6l26Uhp01VxJpZgPVBZ
 2qFzunYdNU+P4w+4wjgjNmcJI4C8eCcz5WIrwTH6ehB19zyX5nYl3b0X69Dk+9AJdyn2
 /TXhLYSiANYwb28wXzcWSGwDq3M0ULlHjio0WSHXLFP+jryKzbTHpJ43VAswNRFEkxZa
 cFZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=QwdzjPR8WZDeMpfLkQQqWDyohKpDUiK9I55YvVVcH58=;
 b=FfEcsbPRSkwY5RtoHMWxvRG8ZheBhWhMqWgdfZzpx2rzwJcLU//EhHYAm7PDwccslo
 yxJWwhUghoaoubAJ2g65+St7pdXLD6yq3SAckWgTXVZjsDrnqYX52L9GiXTgtrKp8GZc
 7RNw2SCVbTvDkJ0M1W2TnOlsJcQJUJFAsmzAUsEjCPiDnkc/9ab9Dp2Axi+p3oXMKbAP
 RLgYooow+GgbIFFRz8h4FS9EVc/E++INDqohhOhNR8WIBMAktPs/cN+GsLG65N8TxfXR
 4/uuOLbYjYeRtnPPKPIm5VUaEZMesNDqKRhmNSe53j81o8PS0Y7t1+1bkDeU96snhQ7f
 Opqg==
X-Gm-Message-State: AOAM532d3O3mz3FTWx/raaePWNNHrBfaHLbTHdYFmUPQWk9DyWjOLYox
 IrZcAFn1E666ETOGH6tifw+EbHbiFLs=
X-Google-Smtp-Source: ABdhPJz4s09VyCQELcMS4avZIhnsx8yjTPr/XpZ5oFO0QUg0zXo4zMelvoO2C1nu2POxFEPKxIlTKw==
X-Received: by 2002:a17:906:29d0:: with SMTP id
 y16mr9585658eje.477.1633246992426; 
 Sun, 03 Oct 2021 00:43:12 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n6sm5560856eds.10.2021.10.03.00.43.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 00:43:12 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 27/30] tpm: mark correct memory region range dirty when
 clearing RAM
Date: Sun,  3 Oct 2021 09:42:47 +0200
Message-Id: <20211003074250.60869-28-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211003074250.60869-1-pbonzini@redhat.com>
References: <20211003074250.60869-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

We might not start at the beginning of the memory region. Let's
calculate the offset into the memory region via the difference in the
host addresses.

Acked-by: Stefan Berger <stefanb@linux.ibm.com>
Fixes: ffab1be70692 ("tpm: clear RAM when "memory overwrite" requested")
Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Claudio Fontana <cfontana@suse.de>
Cc: Thomas Huth <thuth@redhat.com>
Cc: "Alex Bennée" <alex.bennee@linaro.org>
Cc: Peter Xu <peterx@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Message-Id: <20210727082545.17934-2-david@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/tpm/tpm_ppi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/tpm/tpm_ppi.c b/hw/tpm/tpm_ppi.c
index 362edcc5c9..274e9aa4b0 100644
--- a/hw/tpm/tpm_ppi.c
+++ b/hw/tpm/tpm_ppi.c
@@ -30,11 +30,14 @@ void tpm_ppi_reset(TPMPPI *tpmppi)
         guest_phys_blocks_init(&guest_phys_blocks);
         guest_phys_blocks_append(&guest_phys_blocks);
         QTAILQ_FOREACH(block, &guest_phys_blocks.head, next) {
+            hwaddr mr_offs = block->host_addr -
+                             (uint8_t *)memory_region_get_ram_ptr(block->mr);
+
             trace_tpm_ppi_memset(block->host_addr,
                                  block->target_end - block->target_start);
             memset(block->host_addr, 0,
                    block->target_end - block->target_start);
-            memory_region_set_dirty(block->mr, 0,
+            memory_region_set_dirty(block->mr, mr_offs,
                                     block->target_end - block->target_start);
         }
         guest_phys_blocks_free(&guest_phys_blocks);
-- 
2.31.1



