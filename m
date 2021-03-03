Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C210832BA2D
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 20:22:01 +0100 (CET)
Received: from localhost ([::1]:49732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHX4K-0008Ll-RS
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 14:22:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWv6-0008Je-FY
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 14:12:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWv4-0006oi-CC
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 14:12:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614798745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rkUBN+Qyzi1lTxDF0XgYdWokUl6SLdP1HYpG3c36ims=;
 b=IfrY/C6kHmjT8jg5Sp30GA8xwOL+lGMu/8SHCKIzw7zk/91CbTJFICHRzqdcBnBsAZJA4L
 vHl7zzkRQvWIQfA2kID0JO6zkSR7jp2+GK8SmYWWdSdl6t1CT+7IDXjktciCICMCFl0A/l
 AKTaqAF2m+QfrJyXwAG43Z8whp4A7g0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-v8KP6CahNbyY1jwezaGc8w-1; Wed, 03 Mar 2021 14:12:24 -0500
X-MC-Unique: v8KP6CahNbyY1jwezaGc8w-1
Received: by mail-wr1-f72.google.com with SMTP id s10so2280698wre.0
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 11:12:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rkUBN+Qyzi1lTxDF0XgYdWokUl6SLdP1HYpG3c36ims=;
 b=PSpd6m5EB+8J1/kJSclb/dwe5qVXSiZpDnqT2p/c++1T6M6Hj2DUPv4Rp2s9LY4taj
 8OXd/HoTu1LAwC9aJRlkBWBJLukgxbNQ5d3joK0mpWp11q4R4ynMrJUj9UhK/hLYdqnx
 y3yNTIgmGvMPlgVRkXtt44KicVcnvbKMas06WdsHRAQH/yFeeEPeGaMvKrtvRvk16Xbk
 6+X/LqYG8cSRD5LhWjZFJ49HMLDWNIwruuUw89BobjIOYMQalTIH+Maj1IK5F3z04VcL
 whpvjrWDIEV7L+7yzJDMx7XEjZ55CHFdVq/SZux8zjC5JLJUcWx9OX8Xeb4sCUVwGz+m
 Uw4Q==
X-Gm-Message-State: AOAM531XiWLhJeeTO5bAElTAZSeXKQwCjYDOR1SpR7FHnIuVqR9XWA4m
 KZFZ2j8iZDDcP/XEc8hBsTUmoz1v+B5RSRoSZkqX0Oev3h56vmTDZjz/dFTgkEeTkU1xWDE1AXc
 gHYdtOxcJWaEDp2+kj4NdPbNl5MRILVxw14eBmGFBL61lDyeAs8Zkb8wgTjOa3/gs
X-Received: by 2002:adf:d20b:: with SMTP id j11mr81832wrh.397.1614798743079;
 Wed, 03 Mar 2021 11:12:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw0fJ17F+T3MrMvg9kX4RG2hRdOq/LhhlY/5lxP/sftpW0dnnGIGnU6W8QkUAppqHhWrlBO1w==
X-Received: by 2002:adf:d20b:: with SMTP id j11mr81811wrh.397.1614798742947;
 Wed, 03 Mar 2021 11:12:22 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id a6sm8828062wmm.0.2021.03.03.11.12.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 11:12:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 03/10] hw/net: e1000: Remove the logic of padding short
 frames in the receive path
Date: Wed,  3 Mar 2021 20:11:58 +0100
Message-Id: <20210303191205.1656980-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303191205.1656980-1-philmd@redhat.com>
References: <20210303191205.1656980-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Now that we have implemented unified short frames padding in the
QEMU networking codes, remove the same logic in the NIC codes.

This actually reverts commit 78aeb23eded2d0b765bf9145c71f80025b568acd.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Message-Id: <1614763306-18026-3-git-send-email-bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/net/e1000.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/hw/net/e1000.c b/hw/net/e1000.c
index d8da2f6528b..a53ba9052b4 100644
--- a/hw/net/e1000.c
+++ b/hw/net/e1000.c
@@ -882,7 +882,6 @@ e1000_receive_iov(NetClientState *nc, const struct iovec *iov, int iovcnt)
     uint16_t vlan_special = 0;
     uint8_t vlan_status = 0;
     uint8_t min_buf[MIN_BUF_SIZE];
-    struct iovec min_iov;
     uint8_t *filter_buf = iov->iov_base;
     size_t size = iov_size(iov, iovcnt);
     size_t iov_ofs = 0;
@@ -898,15 +897,7 @@ e1000_receive_iov(NetClientState *nc, const struct iovec *iov, int iovcnt)
         return 0;
     }
 
-    /* Pad to minimum Ethernet frame length */
-    if (size < sizeof(min_buf)) {
-        iov_to_buf(iov, iovcnt, 0, min_buf, size);
-        memset(&min_buf[size], 0, sizeof(min_buf) - size);
-        min_iov.iov_base = filter_buf = min_buf;
-        min_iov.iov_len = size = sizeof(min_buf);
-        iovcnt = 1;
-        iov = &min_iov;
-    } else if (iov->iov_len < MAXIMUM_ETHERNET_HDR_LEN) {
+    if (iov->iov_len < MAXIMUM_ETHERNET_HDR_LEN) {
         /* This is very unlikely, but may happen. */
         iov_to_buf(iov, iovcnt, 0, min_buf, MAXIMUM_ETHERNET_HDR_LEN);
         filter_buf = min_buf;
-- 
2.26.2


