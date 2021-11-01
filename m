Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1D044235E
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 23:24:28 +0100 (CET)
Received: from localhost ([::1]:45118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhfjA-000251-2M
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 18:24:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhfUk-00076N-SY
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 18:09:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhfUi-0000cM-96
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 18:09:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635804571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YGFGnLXWsheb/qmVvEQnfSbPAvk7Yei/m0I6VzGvNKw=;
 b=Dti34Bt/3o7YSr0yhjpfNanaxCofwtozWCTM4T7La4Hjfr0q02nOLKBBZdQ/259bpsDnf1
 kgXG+6pXs+BO95W++iTylv03wtdX+AbQO9MqteqCsMY9qQQtdIet9lUl/a27JhC8Uo06GZ
 OKBLF/BHr/C8ZZcBeAUxuOlBQq5UUJQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-xGJieYbsPJudwP6nExruXA-1; Mon, 01 Nov 2021 18:09:30 -0400
X-MC-Unique: xGJieYbsPJudwP6nExruXA-1
Received: by mail-wr1-f70.google.com with SMTP id
 p17-20020adff211000000b0017b902a7701so3974759wro.19
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 15:09:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YGFGnLXWsheb/qmVvEQnfSbPAvk7Yei/m0I6VzGvNKw=;
 b=LRTvbgUOcBVepAjoORGHsI4HIcQSdjd7VaCAzej6Qng4ykq2FBGqK/ctRgQkfw6l3h
 mm9i8xg8gcEqCUczHQ+7+PiMNBxX0tHP47wy4aXqo80DrqD+vG7HhEXEPk0fvyMkERtP
 ZXalokvyxk3lYx+yIPOXuX+sdnIIqq3u+/oqk7noSTBldp1zGOhuYQ9KHQ2nF3FbMqQ7
 MEd1chx4S/ij5kUyKELJayDfeMzxNKY05emrCr6JZe6VxBY0XbyVPNhKAs3jlB7BFfsT
 ks7MgkuFquAetfjRWmumMEcFJRm22oNBC2rpAunpwZJFIFMAxwS5SOyKNE4I2O/AwGtp
 6CCg==
X-Gm-Message-State: AOAM531faiZrg1xI3GB4oJRrNmFz4vApTwanB5e7WKEzv2RcXBOcgWIh
 ZNkoYIeVPMIaNd170jm4ZTlGOROavcMk1pd8PGluCPWdOsZ705ojLXO8vxaYaW2qtAOny5yxNub
 Qik/3Yqfa0qi50qBtI9ONjlN0cXlCgMbYNhbeCKPFYKs/pSNOYv0RTqtoZdnVvxOIVBM=
X-Received: by 2002:a7b:cb52:: with SMTP id v18mr2063978wmj.10.1635804569227; 
 Mon, 01 Nov 2021 15:09:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJycZK3+VR9iW1fa+cGg38G9Qb59TRFSiW9klW7eikgdbxXetfRBE2KmtCFvsskBng80n8r0wQ==
X-Received: by 2002:a7b:cb52:: with SMTP id v18mr2063943wmj.10.1635804569026; 
 Mon, 01 Nov 2021 15:09:29 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id q18sm658847wmc.7.2021.11.01.15.09.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 15:09:28 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/20] memory: Introduce replay_discarded callback for
 RamDiscardManager
Date: Mon,  1 Nov 2021 23:09:03 +0100
Message-Id: <20211101220912.10039-12-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211101220912.10039-1-quintela@redhat.com>
References: <20211101220912.10039-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Paul Durrant <paul@xen.org>, Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

Introduce replay_discarded callback similar to our existing
replay_populated callback, to be used my migration code to never migrate
discarded memory.

Acked-by: Peter Xu <peterx@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 include/exec/memory.h | 21 +++++++++++++++++++++
 softmmu/memory.c      | 11 +++++++++++
 2 files changed, 32 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 04280450c9..20f1b27377 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -550,6 +550,7 @@ static inline void ram_discard_listener_init(RamDiscardListener *rdl,
 }
 
 typedef int (*ReplayRamPopulate)(MemoryRegionSection *section, void *opaque);
+typedef void (*ReplayRamDiscard)(MemoryRegionSection *section, void *opaque);
 
 /*
  * RamDiscardManagerClass:
@@ -638,6 +639,21 @@ struct RamDiscardManagerClass {
                             MemoryRegionSection *section,
                             ReplayRamPopulate replay_fn, void *opaque);
 
+    /**
+     * @replay_discarded:
+     *
+     * Call the #ReplayRamDiscard callback for all discarded parts within the
+     * #MemoryRegionSection via the #RamDiscardManager.
+     *
+     * @rdm: the #RamDiscardManager
+     * @section: the #MemoryRegionSection
+     * @replay_fn: the #ReplayRamDiscard callback
+     * @opaque: pointer to forward to the callback
+     */
+    void (*replay_discarded)(const RamDiscardManager *rdm,
+                             MemoryRegionSection *section,
+                             ReplayRamDiscard replay_fn, void *opaque);
+
     /**
      * @register_listener:
      *
@@ -682,6 +698,11 @@ int ram_discard_manager_replay_populated(const RamDiscardManager *rdm,
                                          ReplayRamPopulate replay_fn,
                                          void *opaque);
 
+void ram_discard_manager_replay_discarded(const RamDiscardManager *rdm,
+                                          MemoryRegionSection *section,
+                                          ReplayRamDiscard replay_fn,
+                                          void *opaque);
+
 void ram_discard_manager_register_listener(RamDiscardManager *rdm,
                                            RamDiscardListener *rdl,
                                            MemoryRegionSection *section);
diff --git a/softmmu/memory.c b/softmmu/memory.c
index f2ac0d2e89..7340e19ff5 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2081,6 +2081,17 @@ int ram_discard_manager_replay_populated(const RamDiscardManager *rdm,
     return rdmc->replay_populated(rdm, section, replay_fn, opaque);
 }
 
+void ram_discard_manager_replay_discarded(const RamDiscardManager *rdm,
+                                          MemoryRegionSection *section,
+                                          ReplayRamDiscard replay_fn,
+                                          void *opaque)
+{
+    RamDiscardManagerClass *rdmc = RAM_DISCARD_MANAGER_GET_CLASS(rdm);
+
+    g_assert(rdmc->replay_discarded);
+    rdmc->replay_discarded(rdm, section, replay_fn, opaque);
+}
+
 void ram_discard_manager_register_listener(RamDiscardManager *rdm,
                                            RamDiscardListener *rdl,
                                            MemoryRegionSection *section)
-- 
2.33.1


