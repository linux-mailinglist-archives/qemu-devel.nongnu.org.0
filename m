Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1FA42009F
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 10:01:49 +0200 (CEST)
Received: from localhost ([::1]:40388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWwRQ-0000xp-IL
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 04:01:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw9W-0004NY-Lw
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:43:20 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:34447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw9V-00014C-0g
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:43:18 -0400
Received: by mail-ed1-x52d.google.com with SMTP id g7so50880602edv.1
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 00:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZPw8jJvn3jd8qiXtPJ9VzDsq2VSW8qdZuNX8z06CReY=;
 b=dvnUx29M5XeTUz/iWuYZcCZqpi7BZw3lScfDPCp3e9GA5eJ+izsGSDXoZuiPOpVmbb
 e9V7ZAsTQ2Dox8mgjKoApfkeZg589uyeHOfoDJUz+0eSlz9os8wdttk4aPdt2C3ZExuI
 0Z+3RBTdnlLBpLL+pK3S6AwfOV/tBKj17wVC7beB/OCQFJILDASsba5tpA1b00pp10me
 msb0BwjR7ed2W2/BekV4YBx0xgT6W0OlvA60M39LXTxntaRSd6HrXTlwi4wHpsTX1s7k
 lje1b33+3LFuXRO7afwFyoOk1/q5yTpd3zL7CuIERp9n5iUj2nvjK67G0qnMwPMLdcnL
 WPKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ZPw8jJvn3jd8qiXtPJ9VzDsq2VSW8qdZuNX8z06CReY=;
 b=Y3kYgMq2S+VRKSYSGtI3uTyTGQ7Qo40ENR3snlSeDcsS8cwU23PbAFn97/J82pQM31
 Q1AypfCZuY2xEgIHbIOOnw8QN45rIpTfR7UCKY2SZaCXHFrIXdfb+p4EMzzb/rLX35le
 Hxbu0VV2R33hDTlDbG8VtchrRZ7cxPef5IfZt7KnXunvLqTYIzSmp3ut369ed9hiTPka
 uAlIzMO7FTu/UNWR3y53s8AlqB/NZn4NyApg7QiDZ65Gb9m8NoCMjvr0vPucHSbDMRnt
 pShVneOxzRLS/MBOMKTRX6k7vLj/c/TXYsuSK5OfQn90uTm2RsePy6EDHy+DA56xX6Jc
 ZfWQ==
X-Gm-Message-State: AOAM5315IDKkMi6cOAR3on//aJgWwqwczEQTL8+9yInX4A9kDx5/aT1N
 PozFZvVIiwVf9qq1nOFnKP/gbl/wAXw=
X-Google-Smtp-Source: ABdhPJwTlTF7YvDrCzdd21kx+4inZhhDiEuBC5ctmewBovERbi3KV4WXtOU9rXsFuS9cCmJU6FT/MQ==
X-Received: by 2002:a17:906:81da:: with SMTP id
 e26mr8984699ejx.296.1633246995643; 
 Sun, 03 Oct 2021 00:43:15 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n6sm5560856eds.10.2021.10.03.00.43.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 00:43:15 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 30/30] softmmu/memory_mapping: optimize for RamDiscardManager
 sections
Date: Sun,  3 Oct 2021 09:42:50 +0200
Message-Id: <20211003074250.60869-31-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211003074250.60869-1-pbonzini@redhat.com>
References: <20211003074250.60869-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52d.google.com
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

virtio-mem logically plugs/unplugs memory within a sparse memory region
and notifies via the RamDiscardManager interface when parts become
plugged (populated) or unplugged (discarded).

Currently, we end up (via the two users)
1) zeroing all logically unplugged/discarded memory during TPM resets.
2) reading all logically unplugged/discarded memory when dumping, to
   figure out the content is zero.

1) is always bad, because we assume unplugged memory stays discarded
   (and is already implicitly zero).
2) isn't that bad with anonymous memory, we end up reading the zero
   page (slow and unnecessary, though). However, once we use some
   file-backed memory (future use case), even reading will populate memory.

Let's cut out all parts marked as not-populated (discarded) via the
RamDiscardManager. As virtio-mem is the single user, this now means that
logically unplugged memory ranges will no longer be included in the
dump, which results in smaller dump files and faster dumping.

virtio-mem has a minimum granularity of 1 MiB (and the default is usually
2 MiB). Theoretically, we can see quite some fragmentation, in practice
we won't have it completely fragmented in 1 MiB pieces. Still, we might
end up with many physical ranges.

Both, the ELF format and kdump seem to be ready to support many
individual ranges (e.g., for ELF it seems to be UINT32_MAX, kdump has a
linear bitmap).

Reviewed-by: Peter Xu <peterx@redhat.com>
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
Cc: Stefan Berger <stefanb@linux.ibm.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210727082545.17934-5-david@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/memory_mapping.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/softmmu/memory_mapping.c b/softmmu/memory_mapping.c
index a2af02c41c..a62eaa49cc 100644
--- a/softmmu/memory_mapping.c
+++ b/softmmu/memory_mapping.c
@@ -246,6 +246,15 @@ static void guest_phys_block_add_section(GuestPhysListener *g,
 #endif
 }
 
+static int guest_phys_ram_populate_cb(MemoryRegionSection *section,
+                                      void *opaque)
+{
+    GuestPhysListener *g = opaque;
+
+    guest_phys_block_add_section(g, section);
+    return 0;
+}
+
 static void guest_phys_blocks_region_add(MemoryListener *listener,
                                          MemoryRegionSection *section)
 {
@@ -257,6 +266,17 @@ static void guest_phys_blocks_region_add(MemoryListener *listener,
         memory_region_is_nonvolatile(section->mr)) {
         return;
     }
+
+    /* for special sparse regions, only add populated parts */
+    if (memory_region_has_ram_discard_manager(section->mr)) {
+        RamDiscardManager *rdm;
+
+        rdm = memory_region_get_ram_discard_manager(section->mr);
+        ram_discard_manager_replay_populated(rdm, section,
+                                             guest_phys_ram_populate_cb, g);
+        return;
+    }
+
     guest_phys_block_add_section(g, section);
 }
 
-- 
2.31.1


