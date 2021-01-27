Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7F13065E4
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 22:23:30 +0100 (CET)
Received: from localhost ([::1]:53274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4sHh-0008Om-TO
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 16:23:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4sG8-00076E-LN
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 16:21:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4sG5-0000Ws-Rl
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 16:21:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611782508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YkAnTBu7ZCuuWD+W4OWe1NqQOLeIilwFuGa2G7+CQm8=;
 b=C0FGuV8pdFGlbFrycgdNDMp3QBN1c0Qlp36c2u5EAJ/E4D7JvEgHJI2oioEocIfBEGLBlg
 X+el8xm+1s2kWtzdVfS6qmk7b53WpmJw0QSWMgJzkY9xyIQXZdRgzKioKiXUUGObQqtDIw
 6uMN41iusTm+J2gDeYHrpa2y8w9NR3M=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-Z1AqtShkNImUoicC4qXoZA-1; Wed, 27 Jan 2021 16:21:47 -0500
X-MC-Unique: Z1AqtShkNImUoicC4qXoZA-1
Received: by mail-wr1-f69.google.com with SMTP id s15so1875523wrt.14
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 13:21:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YkAnTBu7ZCuuWD+W4OWe1NqQOLeIilwFuGa2G7+CQm8=;
 b=OwmNM8sOTR46ZBxuAdbMv1nz0417ieJbhaCWHPEVUVDoGOpa+AXYkG3t/l0FGpkn2T
 IxJS2Bje1n51v2HXfPbNLUTo6DHvB9Y8rFkqssxnk6aw3obTSL1vZqFHjiRPVs44taEz
 OJmEhgC6RZRE+c7Evgl1ZxsBc95MOuP8NWl1o9gkDrB/xG37UsyYpTKLw+hPQCn7GvMO
 KIpEXfnSLmMafnXPGIRAZ0r2wEuu7m7JId2tmaJJyK4w06cc38e3Z8ftB+NqPx91TqUZ
 rnfWlQfzw1bMycjLcRd0FygTbJYqpTntexCkKtWMtabpayakE5IRd+zx0447HlBml2lc
 h30A==
X-Gm-Message-State: AOAM53297aBGlt1gJvyQM6CEjMdRZOuE+1l7rpTQDTEGGXhOqaP54rfW
 yXWYz8VjqnV5b+0ESo4FJAiqOxtAF96oD0asF7/He8tZqrOIKwPHbL54suQG1wT/Ugi7v48X37P
 PtU7hyNBzo25pqNBqyvN8Rip8YKhvgaIXr/AdwB76SLaP6HOkOEYWD2qRYT+pmKUZ
X-Received: by 2002:a05:600c:22cf:: with SMTP id
 15mr5659909wmg.19.1611782505814; 
 Wed, 27 Jan 2021 13:21:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwwyEX0lceUnt/2T9a6OwsoQmL7gv+JXLL9TV9DIaaZgM+D5+VwfFCDDNOnQEOmOTwAJTYLfw==
X-Received: by 2002:a05:600c:22cf:: with SMTP id
 15mr5659890wmg.19.1611782505563; 
 Wed, 27 Jan 2021 13:21:45 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id f17sm4665249wrv.0.2021.01.27.13.21.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 13:21:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] block/nvme: Properly display doorbell stride length in
 trace event
Date: Wed, 27 Jan 2021 22:21:36 +0100
Message-Id: <20210127212137.3482291-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210127212137.3482291-1-philmd@redhat.com>
References: <20210127212137.3482291-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 15b2260bef3 ("block/nvme: Trace controller capabilities")
misunderstood the doorbell stride value from the datasheet, use
the correct one. The 'doorbell_scale' variable used few lines
later is correct.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 block/nvme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/nvme.c b/block/nvme.c
index 5a6fbacf4a5..80c4318d8fc 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -745,7 +745,7 @@ static int nvme_init(BlockDriverState *bs, const char *device, int namespace,
     trace_nvme_controller_capability("Contiguous Queues Required",
                                      NVME_CAP_CQR(cap));
     trace_nvme_controller_capability("Doorbell Stride",
-                                     2 << (2 + NVME_CAP_DSTRD(cap)));
+                                     1 << (2 + NVME_CAP_DSTRD(cap)));
     trace_nvme_controller_capability("Subsystem Reset Supported",
                                      NVME_CAP_NSSRS(cap));
     trace_nvme_controller_capability("Memory Page Size Minimum",
-- 
2.26.2


