Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3D96EDD31
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 09:50:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prDOY-0002og-0N; Tue, 25 Apr 2023 03:47:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDNl-0001kT-SB
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:46:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDNR-0006qW-Hh
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:46:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682408776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Pa00TmI+JP+HfRG/j3rVJD6r3nOHqgZI9IlJQtfidvc=;
 b=YJTVohtbH9cfmtKgfI5G5mApOKdTDnDRB99fHjTFLEPrQeBc/qQLiJkwdhxHHefdK8g377
 sOERuqRdxG2pnOYVZZ4BQqxYLdUM8fTZNzO+wKKHxJNt6dEiM+E7Vlo1Zovkn/FiJeyd0j
 POYbtsfyajhiCSwC3nWapYafmOetFvg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-511-UgICCn_5M_SI7VNQdBdQtQ-1; Tue, 25 Apr 2023 03:46:15 -0400
X-MC-Unique: UgICCn_5M_SI7VNQdBdQtQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f080f46fb1so20311955e9.0
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 00:46:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682408773; x=1685000773;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pa00TmI+JP+HfRG/j3rVJD6r3nOHqgZI9IlJQtfidvc=;
 b=Gloa/tHFg2pd5gPKWQ0Xahf5gnPlLrMtmIJLZCqLSDOQ4rHTvvI6+KA15XXEM0Vs4X
 UZDrQorYyFIP1viTU2lAGDbfIH6vMmf3hatRgRtXXJWI02ynyjxENNLJW5GcR2HDUAov
 HPnQnGd0vjyqMx/GovhvxllwlkpKYfpRJ+U/iWAGnVv9dn+NhX9BDQoZ4rNRpzzBzY3i
 bnwjoRV516IEYQ9xyHW7LIClKLeT8NvKkfkIEeSbV/2UWubA0ou1NU7XGW/aKQnFubNh
 JguglfrRq+9PXpNv6Yw6JbWuzPLier9AYWwZxpeR/q6iCfGo0KDrE5zCysvAPXlo/6wQ
 sWzw==
X-Gm-Message-State: AAQBX9c9kec+uJMggk2CbWkEK2IR5G1sRU3K9YuuOLckoKVGTJOPq9J0
 XWyZj+vvTMYX/P4OVpfY7BXPYUqUSJ/5R+TfZhvoIrMMaUmLJdP/X0XpU7p63mGWGCSZvN+9CyT
 8SK8e1lPWovGun7A6XjCDJt+2C6H8bQScE8HBLfHhMytgNxZ0JQ9oC2xpdeVujNpaPLVN
X-Received: by 2002:a5d:4f8e:0:b0:2fb:2567:bc1 with SMTP id
 d14-20020a5d4f8e000000b002fb25670bc1mr11525794wru.8.1682408772908; 
 Tue, 25 Apr 2023 00:46:12 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZdYebbVmCRgM7XKBsIPRqtaf2Bdr7fOWmrilAKbfwF6ZoHuykbNqZhwAyG+y2T5ZLImAIqSQ==
X-Received: by 2002:a5d:4f8e:0:b0:2fb:2567:bc1 with SMTP id
 d14-20020a5d4f8e000000b002fb25670bc1mr11525777wru.8.1682408772626; 
 Tue, 25 Apr 2023 00:46:12 -0700 (PDT)
Received: from redhat.com ([2.55.61.39]) by smtp.gmail.com with ESMTPSA id
 b4-20020a05600010c400b002e45f6ffe63sm12477818wrx.26.2023.04.25.00.46.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 00:46:11 -0700 (PDT)
Date: Tue, 25 Apr 2023 03:46:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Ben Widawsky <ben@bwidawsk.net>
Subject: [PULL 22/31] docs/cxl: Fix sentence
Message-ID: <8a9ede6f511c5a028e1c1fc949a97ff30c36bebe.1682408661.git.mst@redhat.com>
References: <cover.1682408661.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1682408661.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Stefan Weil <sw@weilnetz.de>

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Message-Id: <20230409201828.1159568-1-sw@weilnetz.de>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 docs/system/devices/cxl.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/system/devices/cxl.rst b/docs/system/devices/cxl.rst
index f25783a4ec..4c38223069 100644
--- a/docs/system/devices/cxl.rst
+++ b/docs/system/devices/cxl.rst
@@ -111,7 +111,7 @@ Interfaces provided include:
 
 CXL Root Ports (CXL RP)
 ~~~~~~~~~~~~~~~~~~~~~~~
-A CXL Root Port servers te same purpose as a PCIe Root Port.
+A CXL Root Port serves the same purpose as a PCIe Root Port.
 There are a number of CXL specific Designated Vendor Specific
 Extended Capabilities (DVSEC) in PCIe Configuration Space
 and associated component register access via PCI bars.
-- 
MST


