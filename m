Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1F45FA3D2
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 20:57:00 +0200 (CEST)
Received: from localhost ([::1]:41902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohxxT-0003Y1-NM
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 14:56:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwdW-0004ev-T2
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:32:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwdR-0007ZO-7b
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:32:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665423132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KuON6KR8v4ZyhUPw0ahXTTbszD75BcPXFV2vpPKexgE=;
 b=Hyu2+uGhSpkGMP0VXPb0m2dtwLD+4+bbt+rQrGjZ7IBHLsP8cJ28lQgNLVhsmD7RTY994k
 wZonheAziNvM5h2/N3wUJW1KAN1DFptjXMH2IQzwLtUvnsunX6bTh7DpASvZnk/cQ8puxF
 ZUWS/qcfsDvu3Vq5BZTD6HlCOaf7lHA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-614-JkKpmZVbN_OKsamsc78bmw-1; Mon, 10 Oct 2022 13:32:11 -0400
X-MC-Unique: JkKpmZVbN_OKsamsc78bmw-1
Received: by mail-wm1-f72.google.com with SMTP id
 az35-20020a05600c602300b003c5273b79fdso3669947wmb.3
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 10:32:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KuON6KR8v4ZyhUPw0ahXTTbszD75BcPXFV2vpPKexgE=;
 b=WMorxX/eui1lnUehFatKi5rKUsnna2c84SIoBN+gvhX6C55ngUonr2oBZ6B/Yy6GpI
 lSpzqjfPR7PHkyi9z+DN4PZl8o/b5Ie8h9DLIRrkDw9nZwxZM5sewjVv5lrA1xbPFU3l
 FkQuRgaVIGCF+Qd2bJAvZ+vNpsKQFPC69lH1zRiUtdidTcVtMhULpOjuLG5iOX6wR8OK
 IjZ/4UQDF7lFQhlNUn44rjlDU3CyaLEutjeWkVR+SEBMsksf8SQkbjR9m9WZYo8a07Zl
 h6j87MYu6GjNEgwQsB9hyVZ2Moc54eY7DnCYx44yYYR0AxEmfzLK5C7/mkaFi63yiyyd
 iucg==
X-Gm-Message-State: ACrzQf3Ighl3p/AnRxsmxHdWk4J4LjtTrXCElMabxhPDzcra3D+AAVzW
 aNkohM9MSWAJvT3o0XXRJg+ExtH7jdgdewwF6DRfzeir8RWoPt+r1KI9fIUH8PrtsOKQFJBck+R
 y+wZ8UiYcJPOtmnvv7G842UupNr7WL+2uOzQ/NVBVlmsr9b/1P2s3ETc98kpX
X-Received: by 2002:a1c:2743:0:b0:3b3:4066:fa61 with SMTP id
 n64-20020a1c2743000000b003b34066fa61mr21153026wmn.79.1665423130018; 
 Mon, 10 Oct 2022 10:32:10 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4jRbngvm8L40/nBxpye2owivpE7hrNVN3I5ANfhpxVKGwVH33lvqGf1hejitkYXOkhmb92jQ==
X-Received: by 2002:a1c:2743:0:b0:3b3:4066:fa61 with SMTP id
 n64-20020a1c2743000000b003b34066fa61mr21152993wmn.79.1665423129738; 
 Mon, 10 Oct 2022 10:32:09 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 w5-20020a5d6805000000b002285f73f11dsm11817884wru.81.2022.10.10.10.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:32:09 -0700 (PDT)
Date: Mon, 10 Oct 2022 13:32:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 46/55] tests: acpi: whitelist pc/q35 DSDT before switching
 _DSM to use ASUN
Message-ID: <20221010172813.204597-47-mst@redhat.com>
References: <20221010172813.204597-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221010172813.204597-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20220701133515.137890-9-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..1983fa596b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,15 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/pc/DSDT",
+"tests/data/acpi/pc/DSDT.acpierst",
+"tests/data/acpi/pc/DSDT.acpihmat",
+"tests/data/acpi/pc/DSDT.bridge",
+"tests/data/acpi/pc/DSDT.cphp",
+"tests/data/acpi/pc/DSDT.dimmpxm",
+"tests/data/acpi/pc/DSDT.hpbridge",
+"tests/data/acpi/pc/DSDT.ipmikcs",
+"tests/data/acpi/pc/DSDT.memhp",
+"tests/data/acpi/pc/DSDT.nohpet",
+"tests/data/acpi/pc/DSDT.numamem",
+"tests/data/acpi/pc/DSDT.roothp",
+"tests/data/acpi/q35/DSDT.bridge",
+"tests/data/acpi/q35/DSDT.multi-bridge",
-- 
MST


