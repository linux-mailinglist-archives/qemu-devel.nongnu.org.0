Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6597B59745D
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 18:43:26 +0200 (CEST)
Received: from localhost ([::1]:53514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOM8b-00021z-6m
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 12:43:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOLnX-0007ku-4t
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 12:21:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOLnV-0005db-H4
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 12:21:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660753296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Dumk1EQg5Ag6vu8AL5g6B95ji6VBlJBMEnXMduaUodE=;
 b=fPENus8Fmlvz7CIiltFsGzgzaxSqh2FeIVZjrzge+h4tV/SSiAv8iIZsK+JkS2o8g47uIO
 umz4L/DoFHU8nDzaDdpY+h0HYqPzD2d2ouqL/eznuZVtF0hCG/1zGRGCNG/y8zPHk7PhAM
 UCUJiIKWZ0b/IPMnA2L1vkktIGnNaKE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-645-BibXulo_N7a2C56F0HNMmg-1; Wed, 17 Aug 2022 12:15:01 -0400
X-MC-Unique: BibXulo_N7a2C56F0HNMmg-1
Received: by mail-wr1-f71.google.com with SMTP id
 g11-20020adfa48b000000b002250d091f76so1900438wrb.3
 for <qemu-devel@nongnu.org>; Wed, 17 Aug 2022 09:15:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=Dumk1EQg5Ag6vu8AL5g6B95ji6VBlJBMEnXMduaUodE=;
 b=Ip+5mx/zoFOQEYbD9aXln1z4e1pA/vWmzGa6cXxPRP1lMTbkX16dL8HdnQrInvDG2O
 +Ot8pyNrzf8105ok92S2oKd3tBMD0oSi5lDlDiDqt6bBz9U/uNM/9SY63ccw1azWrY+8
 63ipXMZwmCniQ8du5dFnG4KgDLqkuTS7hFyuB7wNvFUKKzyGsThWpKNTz2X5Of0ceT/I
 A2/JOM76EzL0xXMfYwm/rTKn4gUh/fTqU9uWDRm9YJC6ohWFzD77Eo2ucYLyHxBANi8z
 LfpufvpQvkw/M2cWBnSTo3cMxkOh14kBAIRKimQ6VLjaVsmhxKB+XhvNhvQ65xzWTfwj
 FUpg==
X-Gm-Message-State: ACgBeo0MDMOJuUroQZ7VfAGbVdyoUkEgXxPhE3XEMZcFzaZNJ6TXottj
 xe0EIaRVdfW02S90Po9i4Zjh9Ys/NeHn6ARuvlKYMXCeSbmWQW48ByQcMqhJL1TV60qvRSEvUlC
 UU2gfjAo8QXm5P6aAjxOJ4H0iu0BbTmryGWK/mmqj91mtY2Iq1WPmyyH3MUJM
X-Received: by 2002:a5d:64a1:0:b0:222:3b0d:c9a3 with SMTP id
 m1-20020a5d64a1000000b002223b0dc9a3mr15164680wrp.437.1660752899883; 
 Wed, 17 Aug 2022 09:14:59 -0700 (PDT)
X-Google-Smtp-Source: AA6agR49T2bEym4M5bXS97Or9ylPWfRsZP1qYG8kyHvmtDY4k/Gt2RyGQWodrDvK+UXPSetHsBmJGw==
X-Received: by 2002:a5d:64a1:0:b0:222:3b0d:c9a3 with SMTP id
 m1-20020a5d64a1000000b002223b0dc9a3mr15164664wrp.437.1660752899592; 
 Wed, 17 Aug 2022 09:14:59 -0700 (PDT)
Received: from redhat.com ([2.55.4.37]) by smtp.gmail.com with ESMTPSA id
 b3-20020a05600010c300b002217339ce90sm13498386wrx.8.2022.08.17.09.14.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 09:14:59 -0700 (PDT)
Date: Wed, 17 Aug 2022 12:14:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Ben Widawsky <ben.widawsky@intel.com>
Subject: [PULL 08/10] hw/cxl: Correctly handle variable sized mailbox input
 payloads.
Message-ID: <20220817161342.240674-9-mst@redhat.com>
References: <20220817161342.240674-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220817161342.240674-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

A placeholder of ~0 is used to indicate variable payload size.
Whilst the checks for output payload correctly took this into
account, those for input payload did not.

This results in failure of the Set LSA command.

Fixes: 464e14ac43 ("hw/cxl/device: Implement basic mailbox (8.2.8.4)")
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Message-Id: <20220817145759.32603-4-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/cxl/cxl-mailbox-utils.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
index 3cea8b17a8..bc1bb18844 100644
--- a/hw/cxl/cxl-mailbox-utils.c
+++ b/hw/cxl/cxl-mailbox-utils.c
@@ -425,7 +425,7 @@ void cxl_process_mailbox(CXLDeviceState *cxl_dstate)
     cxl_cmd = &cxl_cmd_set[set][cmd];
     h = cxl_cmd->handler;
     if (h) {
-        if (len == cxl_cmd->in) {
+        if (len == cxl_cmd->in || cxl_cmd->in == ~0) {
             cxl_cmd->payload = cxl_dstate->mbox_reg_state +
                 A_CXL_DEV_CMD_PAYLOAD;
             ret = (*h)(cxl_cmd, cxl_dstate, &len);
-- 
MST


