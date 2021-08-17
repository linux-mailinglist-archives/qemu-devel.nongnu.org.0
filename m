Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E39CF3EE3C9
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 03:39:03 +0200 (CEST)
Received: from localhost ([::1]:54088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFo4E-0001Ww-Kc
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 21:39:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mFo2U-0000A6-LH
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 21:37:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mFo2T-00023q-5o
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 21:37:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629164231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aVYRVMH8WHd91fY4Jdw5KkQgHnOwpylUSfTTbNBS2vA=;
 b=Nd8J9uYW4dctVGClCZTki+9lZ3b+738a4B5DT6p0BGW5b/KiW2kx6x3I+scCiHwZUsOJN3
 9ObFDM6LDri8z/dB3uPmTpNJIA/lPmLnEQOSm7IvZE8SLFbxjyf9Fi2/RqoZSjYPlbpBXk
 JVFT3Bth5QxyVbFI7MXL6MDwTmOojFw=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-Db5Cekk0Nsa5Tq9DUNv-og-1; Mon, 16 Aug 2021 21:37:09 -0400
X-MC-Unique: Db5Cekk0Nsa5Tq9DUNv-og-1
Received: by mail-qt1-f199.google.com with SMTP id
 w19-20020ac87e930000b029025a2609eb04so10255191qtj.17
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 18:37:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aVYRVMH8WHd91fY4Jdw5KkQgHnOwpylUSfTTbNBS2vA=;
 b=HNExn2culH7pcivI9sOm8CW134XRi7yaQEl/ibEC5D5nvQiezaVV8+XJv8cJPRVVJc
 hcOgOjXM40AU+nOlRrtmQ0tMXb+Ap5nRKZ/M+sHZEjOQfMOSDkKanLR69dyJSpRomq1k
 3yeZ0ruChmOD+giol3iHLM6Kqd3YgOV+3EMjTo6UCF1SVRlzbbaXCa/BVxHKnlqsCBct
 yl/Ff5ZwQi96iHXkHhHWC8L8jfjgEIXne8vvHo7nEjqmfjCxvfSW7UR7Iw84h1UymD3B
 i+i84CA9lC/6gUfDucBs+Fc4+fTapBoekYO2RV32+qsjMqop5ipJnHG+8642XDzW2lNp
 IHKg==
X-Gm-Message-State: AOAM530CZ2AO8Nmdu45bmVtZ25Dycdc+uFK8ON2rUHDIUsCuxXZ/zzZL
 mkKfeN+IASIo0tgA5dqYmcYJ1E6KDwvtsK3ebIKHg/6ahJodFFXzrIF7Uct35UbSo/94I4UwbhZ
 49n2EXeIobFvD/Y73Rh50hs6iGYv/WL5zAkPdhZoxenkV0lSkT9FdXVerq8ivnqrj
X-Received: by 2002:a05:622a:13c8:: with SMTP id
 p8mr878987qtk.238.1629164228472; 
 Mon, 16 Aug 2021 18:37:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUzqBGthsDEdgMMqtsdxwPLfDbJWFA8QiBYnwdSp6dilAIwE74G2476lE/VOH+NS2UQf5drQ==
X-Received: by 2002:a05:622a:13c8:: with SMTP id
 p8mr878973qtk.238.1629164228201; 
 Mon, 16 Aug 2021 18:37:08 -0700 (PDT)
Received: from t490s.redhat.com ([2607:fea8:56a3:500::d413])
 by smtp.gmail.com with ESMTPSA id 187sm417983qke.32.2021.08.16.18.37.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 18:37:07 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RESEND 2/2] memory: Add tracepoint for dirty sync
Date: Mon, 16 Aug 2021 21:37:06 -0400
Message-Id: <20210817013706.30986-1-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210817013553.30584-1-peterx@redhat.com>
References: <20210817013553.30584-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Trace at memory_region_sync_dirty_bitmap() for log_sync() or global_log_sync()
on memory regions.  One trace line should suffice when it finishes, so as to
estimate the time used for each log sync process.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 softmmu/memory.c     | 2 ++
 softmmu/trace-events | 1 +
 2 files changed, 3 insertions(+)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index bfedaf9c4d..f0c5817b97 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2149,6 +2149,7 @@ static void memory_region_sync_dirty_bitmap(MemoryRegion *mr)
                 }
             }
             flatview_unref(view);
+            trace_memory_region_sync_dirty(mr ? mr->name : "(all)", listener->name, 0);
         } else if (listener->log_sync_global) {
             /*
              * No matter whether MR is specified, what we can do here
@@ -2156,6 +2157,7 @@ static void memory_region_sync_dirty_bitmap(MemoryRegion *mr)
              * sync in a finer granularity.
              */
             listener->log_sync_global(listener);
+            trace_memory_region_sync_dirty(mr ? mr->name : "(all)", listener->name, 1);
         }
     }
 }
diff --git a/softmmu/trace-events b/softmmu/trace-events
index 7b278590a0..bf1469990e 100644
--- a/softmmu/trace-events
+++ b/softmmu/trace-events
@@ -15,6 +15,7 @@ memory_region_subpage_read(int cpu_index, void *mr, uint64_t offset, uint64_t va
 memory_region_subpage_write(int cpu_index, void *mr, uint64_t offset, uint64_t value, unsigned size) "cpu %d mr %p offset 0x%"PRIx64" value 0x%"PRIx64" size %u"
 memory_region_ram_device_read(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u"
 memory_region_ram_device_write(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u"
+memory_region_sync_dirty(const char *mr, const char *listener, int global) "mr '%s' listener '%s' synced (global=%d)"
 flatview_new(void *view, void *root) "%p (root %p)"
 flatview_destroy(void *view, void *root) "%p (root %p)"
 flatview_destroy_rcu(void *view, void *root) "%p (root %p)"
-- 
2.31.1


