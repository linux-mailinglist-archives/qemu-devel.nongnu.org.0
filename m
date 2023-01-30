Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FCF681B89
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 21:31:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMae3-0005I8-LW; Mon, 30 Jan 2023 15:20:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMadU-0003UJ-Sv
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:20:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMadS-00077Q-CF
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:20:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675110013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Eu0hV6kZQ0nIbCmro5EDIhlPYBwmSBFdi8AyK9fUVtU=;
 b=TJYDf4fx7/BOh8DBubGqoIt4hPtbGLS9u1F3hfbtWix0n5Ub5TfAjWGinIm/JjaC5WR7y5
 xS8U0IhaKagiJ8ysyWPgPigwe8y2wV/tMAso7wJfJAsiAO7l6Ir0ocxSThB0SkV00QK5Fh
 WgGi7x8AcQa7PGM83f+4GU8guwgti3s=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-592-QFDVLjzoOUK7c7vPL-VKOg-1; Mon, 30 Jan 2023 15:20:12 -0500
X-MC-Unique: QFDVLjzoOUK7c7vPL-VKOg-1
Received: by mail-ed1-f70.google.com with SMTP id
 bq13-20020a056402214d00b004a25d8d7593so834696edb.0
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:20:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Eu0hV6kZQ0nIbCmro5EDIhlPYBwmSBFdi8AyK9fUVtU=;
 b=G5h+IezOSpNDA8Hh8QqHCDLL2KRd2WSU1p+GKFTRYEB58kJgjpNcVElAmZ0X7QfOpM
 vCjSjgwWz8LX07Ix0GEfSNEJ5VtPzsGw3zxa45rXqKUQrQ1N1PJyOnr+skUNw76SyCDJ
 d55YUskbDRxmdBg49VZE4MYw4XWP6uzaXYUJI06/7PE5y3afAYT4iWZW4zbdWGZjbDQ/
 5vBx5GqPHl5MQiHWmFnqR0JD5+iym1W8+JoPAOwJJxjDRWJLyCffd1a8cR8FWKN1sb+D
 NrK7iUDXcrXRP+yZKHMT3FO9znjQwrGFrFrSBYQYYpU97Qx7aKhhAddytMIhM9Iketjp
 8kwQ==
X-Gm-Message-State: AFqh2kr8mwSfxyDzrPxnRjpTQe7CRZRF8L/VoO+DBLCHT4i1MLwmvbS3
 lg7sYkoyKL5fvvfHyI7NrygdnBtemXeExQ3iSzHvySN8Mdai8Wcxb/+QteNH6JmLTF6ksX+DDnn
 +oP+C8CFvt4w0bLJXcXSRJrYSeUGwllh38+aR8YOnZrN2k61cbV8R/7E4CNWi
X-Received: by 2002:a05:6402:43c5:b0:499:b5fc:e56f with SMTP id
 p5-20020a05640243c500b00499b5fce56fmr59559570edc.19.1675110010418; 
 Mon, 30 Jan 2023 12:20:10 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvt5kVMdlXceeX5vhX6q7XBKrFk8EEn2d+vasA7afIBo7olJ4Wb/5CHn9K0tNoTPwa+flt/4w==
X-Received: by 2002:a05:6402:43c5:b0:499:b5fc:e56f with SMTP id
 p5-20020a05640243c500b00499b5fce56fmr59559545edc.19.1675110010146; 
 Mon, 30 Jan 2023 12:20:10 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 c10-20020a056402100a00b00483dd234ac6sm7266260edu.96.2023.01.30.12.20.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:20:09 -0800 (PST)
Date: Mon, 30 Jan 2023 15:20:06 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 11/56] tests: qtest: print device_add error before failing test
Message-ID: <20230130201810.11518-12-mst@redhat.com>
References: <20230130201810.11518-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130201810.11518-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230112140312.3096331-2-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/libqtest.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 6b2216cb20..d658222a19 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -1435,6 +1435,10 @@ void qtest_qmp_device_add_qdict(QTestState *qts, const char *drv,
     resp = qtest_qmp(qts, "{'execute': 'device_add', 'arguments': %p}", args);
     g_assert(resp);
     g_assert(!qdict_haskey(resp, "event")); /* We don't expect any events */
+    if (qdict_haskey(resp, "error")) {
+        fprintf(stderr, "error: %s\n",
+            qdict_get_str(qdict_get_qdict(resp, "error"), "desc"));
+    }
     g_assert(!qdict_haskey(resp, "error"));
     qobject_unref(resp);
 }
-- 
MST


