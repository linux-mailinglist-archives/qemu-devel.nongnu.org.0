Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BDC44234D
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 23:21:34 +0100 (CET)
Received: from localhost ([::1]:36470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhfgL-0004TZ-Jt
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 18:21:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhfUg-0006wM-IX
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 18:09:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhfUc-0000ap-Pl
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 18:09:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635804565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UH6qFcOvOngPka/Fe9lzsDNdrqD8p0gmRL7v9NgF7Ts=;
 b=UzLKAAiG08gwmJ8IeYJdKOslj9RzfAb7VYoREht72gVGP9dAZzGYuugmyUICQ4e9Dz8P8x
 n8WH1MUfCwFXUfIezcK76ELrQ7ojWHF8ERv9TQB1U49ORrvJraslLr3WsNWK+3C2HLxdkk
 d6oZ32vacbBmGg2HLg/RGzWjCQSIfAg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-zmwHkUHiPmGVtYZtK_kRLw-1; Mon, 01 Nov 2021 18:09:24 -0400
X-MC-Unique: zmwHkUHiPmGVtYZtK_kRLw-1
Received: by mail-wm1-f69.google.com with SMTP id
 b133-20020a1c808b000000b0032cdd691994so184254wmd.1
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 15:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UH6qFcOvOngPka/Fe9lzsDNdrqD8p0gmRL7v9NgF7Ts=;
 b=a3eNInKopqnPZLGTcERCYO+AQNtwb66wFiYeWibNChXvHaHa5Wfn7FTl9Yr7Zi8qL3
 NRm7qIZy4Z+WjhZidp3Fi/pAMpRYJ+fSiNrjlRcSRl6yC51PXRlyIg7pbWf3N6mx9RL1
 yw80L6XjXAT9j57OWjusJ++BfJgBBKQ7UG8hPCmImgngaiA6JW0biqBpSiQWLn6m2uLc
 NZKQShNL1Z/wB+rxTTpnrc9giRLx0e2l+8lps6g1XAAI18zeQut7PAhYcNw6n7AXaoiM
 tl5HpMuPbjFWsLZKKw591O/zEB/aI3G7jm9Nn+HwtBih3a45mlIk0YTxhh6TqOtuUotq
 8kRw==
X-Gm-Message-State: AOAM5322aMtZs77IZDWz7qcm+t+4aWSMDdGxaeJXrS+bXj3wDqbFHemE
 cIY0j/x5WbR9ur//84S8xKWaY2cgqeP1vXv8bfcYglfWIY6bqAUSW0/dYMYQH8LTqEIKwyrA2o1
 q6P8YSp6UWhtPvPF62aIPPdNjPo1PfBkS4ZoCQPk8FyuU/SAKApkm3Apo8oZOtX9pxtQ=
X-Received: by 2002:adf:d20e:: with SMTP id j14mr33297726wrh.220.1635804562561; 
 Mon, 01 Nov 2021 15:09:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkffbvXrtYSeZN/zNmfpHm8cIwzDDYcEpAf91jdU0NQr69iLSppRQMuLbVQCsCLOwkm5qiNw==
X-Received: by 2002:adf:d20e:: with SMTP id j14mr33297679wrh.220.1635804562331; 
 Mon, 01 Nov 2021 15:09:22 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id n15sm637153wmq.38.2021.11.01.15.09.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 15:09:21 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/20] migration/dirtyrate: move init step of calculation to
 main thread
Date: Mon,  1 Nov 2021 23:08:58 +0100
Message-Id: <20211101220912.10039-7-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211101220912.10039-1-quintela@redhat.com>
References: <20211101220912.10039-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
 =?UTF-8?q?Hyman=20Huang=28=C3=A9=C2=BB=E2=80=9E=C3=A5=E2=80=B9?=
 =?UTF-8?q?=E2=80=A1=29?= <huangy81@chinatelecom.cn>,
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

From: Hyman Huang(é»„å‹‡) <huangy81@chinatelecom.cn>

since main thread may "query dirty rate" at any time, it's better
to move init step into main thead so that synchronization overhead
between "main" and "get_dirtyrate" can be reduced.

Signed-off-by: Hyman Huang(é»„å‹‡) <huangy81@chinatelecom.cn>
Message-Id: <109f8077518ed2f13068e3bfb10e625e964780f1.1624040308.git.huangy81@chinatelecom.cn>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/dirtyrate.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index a9bdd60034..b8f61cc650 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -380,7 +380,6 @@ void *get_dirtyrate_thread(void *arg)
 {
     struct DirtyRateConfig config = *(struct DirtyRateConfig *)arg;
     int ret;
-    int64_t start_time;
     rcu_register_thread();
 
     ret = dirtyrate_set_state(&CalculatingState, DIRTY_RATE_STATUS_UNSTARTED,
@@ -390,9 +389,6 @@ void *get_dirtyrate_thread(void *arg)
         return NULL;
     }
 
-    start_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME) / 1000;
-    init_dirtyrate_stat(start_time, config);
-
     calculate_dirtyrate(config);
 
     ret = dirtyrate_set_state(&CalculatingState, DIRTY_RATE_STATUS_MEASURING,
@@ -411,6 +407,7 @@ void qmp_calc_dirty_rate(int64_t calc_time, bool has_sample_pages,
     static struct DirtyRateConfig config;
     QemuThread thread;
     int ret;
+    int64_t start_time;
 
     /*
      * If the dirty rate is already being measured, don't attempt to start.
@@ -451,6 +448,10 @@ void qmp_calc_dirty_rate(int64_t calc_time, bool has_sample_pages,
     config.sample_period_seconds = calc_time;
     config.sample_pages_per_gigabytes = sample_pages;
     config.mode = DIRTY_RATE_MEASURE_MODE_PAGE_SAMPLING;
+
+    start_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME) / 1000;
+    init_dirtyrate_stat(start_time, config);
+
     qemu_thread_create(&thread, "get_dirtyrate", get_dirtyrate_thread,
                        (void *)&config, QEMU_THREAD_DETACHED);
 }
-- 
2.33.1


