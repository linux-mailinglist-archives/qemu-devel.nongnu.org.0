Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D223F5FF6
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 16:13:46 +0200 (CEST)
Received: from localhost ([::1]:58746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIXBQ-00088J-Bi
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 10:13:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mIX9k-00050X-TX
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 10:12:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mIX9h-0005Fo-EK
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 10:11:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629814316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wErq8/MJBqeGe7FrwWidBXlks9jtibqyP3ZzK8xaUyQ=;
 b=GyBOSfeRoMUX3YCmnMyVE/eYY2HuHmW4MD68OLVvh2wWqMm+yYXAQqA7IRFIZYByBygrNl
 LdXUN6Q3+IYIBUdsIR5u5C64LKTcAjgOERkgCy/RMddGC016b0Dr7qPriNMBtNiklF7joN
 U2jLqUYeJ2DUUdh7ZEPBV0cvq1Rg2fo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-601-p5EEBF5kMretIXfjsBoP7Q-1; Tue, 24 Aug 2021 10:11:55 -0400
X-MC-Unique: p5EEBF5kMretIXfjsBoP7Q-1
Received: by mail-wr1-f69.google.com with SMTP id
 102-20020adf82ef000000b001576e345169so49894wrc.7
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 07:11:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wErq8/MJBqeGe7FrwWidBXlks9jtibqyP3ZzK8xaUyQ=;
 b=Sh9hmFwBAPKH5ltN/uQEakXijJCz+LOc/C60gZ93zgAgsfK5HRiUjPI9sk7D6B7jR0
 CnUh6TMWcX4su+tVQ6DGUkG6w7AW99Dvy41ZFgMNTQKfn+9kKhDWj70eJdI5PPD1Vsyx
 HcnkLM+/N0DW7xgnsdY8LYecWyWePp3ufgDwtTdZxke4OFfTP7kK2vpgVNmrKDGk3R3J
 d6qw5v6nni6WDBJb0L0lThJmpel7C9H45utHmv7FhouCvJoqqD+ZdA99NirkhpzT7izp
 ANagKJPKIO9Mp0jtUx4kGzxUB7Zxe2ZLJX/QR5SRqbiMGNaoYiBVuEpCVryZ3iaYM60e
 nv1g==
X-Gm-Message-State: AOAM531d/ked2aJZQ6ytD9AoYm2upM9WrlqybzQso2sqoidwTtCzfUTc
 4APMXWfxZ0K+LZAR+s10pJkaTBtqlBU+77u2wVPbBWdSxEGgyDflC7+AYsUg7Jk34iAnUnpymp9
 rhVnnoJTNA41ZDnLclaGE3YZnqT4Z0wvqWeYYagfm8uANVL7MqQH0syJTU2ftkPm9
X-Received: by 2002:a1c:4c13:: with SMTP id z19mr4309498wmf.132.1629814313975; 
 Tue, 24 Aug 2021 07:11:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8AA5sxjyDrxXS0sY56cNGPL06ePlxg6uRN1Z6eGVLHV4CVS10/SuDdUnWhWD+ZnLRsBJz0w==
X-Received: by 2002:a1c:4c13:: with SMTP id z19mr4309476wmf.132.1629814313802; 
 Tue, 24 Aug 2021 07:11:53 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 f18sm2492249wmc.6.2021.08.24.07.11.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 07:11:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/9] block/nvme: Have nvme_create_queue_pair() report errors
 consistently
Date: Tue, 24 Aug 2021 16:11:35 +0200
Message-Id: <20210824141142.1165291-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210824141142.1165291-1-philmd@redhat.com>
References: <20210824141142.1165291-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Auger Eric <eric.auger@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

nvme_create_queue_pair() does not return a boolean value (indicating
eventual error) but a pointer, and is inconsistent in how it fills the
error handler. To fulfill callers expectations, always set an error
message on failure.

Reported-by: Auger Eric <eric.auger@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 block/nvme.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/block/nvme.c b/block/nvme.c
index e8dbbc23177..6642c104aa4 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -220,6 +220,7 @@ static NVMeQueuePair *nvme_create_queue_pair(BDRVNVMeState *s,
 
     q = g_try_new0(NVMeQueuePair, 1);
     if (!q) {
+        error_setg(errp, "Cannot allocate queue pair");
         return NULL;
     }
     trace_nvme_create_queue_pair(idx, q, size, aio_context,
@@ -228,6 +229,7 @@ static NVMeQueuePair *nvme_create_queue_pair(BDRVNVMeState *s,
                           qemu_real_host_page_size);
     q->prp_list_pages = qemu_try_memalign(qemu_real_host_page_size, bytes);
     if (!q->prp_list_pages) {
+        error_setg(errp, "Cannot allocate PRP page list");
         goto fail;
     }
     memset(q->prp_list_pages, 0, bytes);
-- 
2.31.1


