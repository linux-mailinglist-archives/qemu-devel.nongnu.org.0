Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3205334512
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 18:24:41 +0100 (CET)
Received: from localhost ([::1]:48590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK2Zc-0007YG-QM
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 12:24:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK2Hs-0005np-Nl
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:06:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK2Hr-0000Gd-B1
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:06:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615395978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XgHB9Xq4JwDA4FPpoAiA/3Du3vBPCn/Cbea9/ueFNnI=;
 b=W5/sG8ApsQQmgM5HknYYx4vsgK4hgdOdbz3YomLu2DUD+jmX4arAbOKtLFLUfakl5ll5u8
 TeI8wBhkAEi5KFdOEPNbb4GETcf1iwwOX76htir1QE9XbLYGHg4E7rCiPqJA4QCHuhE3Ps
 XfYKOKkJaSdsZKhwInR6GyrcDdOC9j4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-a2sUvTP0Op6ZzIO76fqstg-1; Wed, 10 Mar 2021 12:06:15 -0500
X-MC-Unique: a2sUvTP0Op6ZzIO76fqstg-1
Received: by mail-ed1-f70.google.com with SMTP id v27so8695478edx.1
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 09:06:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XgHB9Xq4JwDA4FPpoAiA/3Du3vBPCn/Cbea9/ueFNnI=;
 b=cpqHNb1/uL3j0v+RMk/fH0C/9h0LCqVBHyYNrrHoTaigO0O1irHoZ/QFpHxaiNjokE
 qbcLfFsAXahu/lHLNgTfD2sWxIVAOjvsJtUOSZ4SaUMXomrhpFWXJ5YRl3PhJYg5hHAt
 TAZr8nhDYIEfJkMflEuRu8aGfuBieYJYxnrSMp0eO60vrBrvzCSMdHSTu1I08EvxQkSb
 qi0hMmj64G4G9z0k+hJNVI50pd1p5TzaAdUBYNsRsCKxoiqhItIGuY3vL4P7ymjbjkho
 nkolsI6d6SvFH/ItpppfjbVB7DG2j6wq5AmXGTORHx1kxtlmjPLnic0ahGIRin1y55TD
 TNDQ==
X-Gm-Message-State: AOAM530e5PjEZBZDZGQQubcZtdQHCdBjD9JqV1fP2CkDqDVzO/VbsMuM
 3Ls+dEkF9Iu+NkPeIEI4swo4RfeeHGfyLmKo7Zjztfiadp2Knm3BLtLlyTi3uKwbm8w1ngQGgUh
 YNvRU7UtDdhnaDfht/4vuOnDKMhswiLWwIcKZnvVHDJRLSQd+tN7CAHedUn0USx4k
X-Received: by 2002:a05:6402:38d:: with SMTP id
 o13mr4362986edv.337.1615395973951; 
 Wed, 10 Mar 2021 09:06:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwZmQbEY1cvOWYdoMQ8AkvAE1xbmX5mD+DCL3rttFX6aoThbfIdVIPeU156u+XLQsQKn+xopw==
X-Received: by 2002:a05:6402:38d:: with SMTP id
 o13mr4362953edv.337.1615395973696; 
 Wed, 10 Mar 2021 09:06:13 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id k22sm10754965edv.33.2021.03.10.09.06.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 09:06:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/12] hw/block/pflash_cfi02: Add DeviceReset method
Date: Wed, 10 Mar 2021 18:05:24 +0100
Message-Id: <20210310170528.1184868-9-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210310170528.1184868-1-philmd@redhat.com>
References: <20210310170528.1184868-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Stephen Checkoway <stephen.checkoway@oberlin.edu>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/pflash_cfi02.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index aea47a99c61..c40febd2a41 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -942,6 +942,13 @@ static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
     pflash_cfi02_fill_cfi_table(pfl, nb_regions);
 }
 
+static void pflash_cfi02_reset(DeviceState *dev)
+{
+    PFlashCFI02 *pfl = PFLASH_CFI02(dev);
+
+    pflash_reset_state_machine(pfl);
+}
+
 static Property pflash_cfi02_properties[] = {
     DEFINE_PROP_DRIVE("drive", PFlashCFI02, blk),
     DEFINE_PROP_UINT32("num-blocks", PFlashCFI02, uniform_nb_blocs, 0),
@@ -979,6 +986,7 @@ static void pflash_cfi02_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->realize = pflash_cfi02_realize;
+    dc->reset = pflash_cfi02_reset;
     dc->unrealize = pflash_cfi02_unrealize;
     device_class_set_props(dc, pflash_cfi02_properties);
     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
-- 
2.26.2


