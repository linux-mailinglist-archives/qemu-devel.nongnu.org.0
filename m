Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DA121376E
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jul 2020 11:16:37 +0200 (CEST)
Received: from localhost ([::1]:41602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrHoC-0006Nh-9J
	for lists+qemu-devel@lfdr.de; Fri, 03 Jul 2020 05:16:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jrHcm-0000Kk-8h
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 05:04:48 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:26794
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jrHck-0004VM-F1
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 05:04:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593767085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XsBDJFEC04b3XTFz4nBxIO5zxhzyAGQ01hQLAAQIsGo=;
 b=Ca4QGZ3gweIhWD73RAngXCTbx/BkVP2eYmMTs860Knjq4kyE1mgNltg9uboGM1pkiHlPl+
 +wnUpo0/kwL8lGKAw3BcsA1sLlmop/n42g+28gfmVn5AkEsL8aItd2T6NVLoRMYU28K/Mg
 bKt6KnmLwko0D7R81mgtHLKI0X7A1hI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-sS_u22rpMeKNyreZnOPoGg-1; Fri, 03 Jul 2020 05:04:43 -0400
X-MC-Unique: sS_u22rpMeKNyreZnOPoGg-1
Received: by mail-wm1-f72.google.com with SMTP id v11so15783232wmb.1
 for <qemu-devel@nongnu.org>; Fri, 03 Jul 2020 02:04:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XsBDJFEC04b3XTFz4nBxIO5zxhzyAGQ01hQLAAQIsGo=;
 b=rINOm4tiyW/C4ViOVRNJI3xnAU27nENJ1p9cC800Yoco+XycZSV+VXRrrSjqRc6RWa
 BXgV3RCbrQ3igXfq7j79EHYYMQbTxX/NFOqcgubJz3NJAQlgeoMHleTX7S/uyZsPivtn
 wtI75fouJTNs5nRApGoLdkF2CwAd8Y5Fy9T/W3gKiOlC5KiXXpqxUJWyAGYsgCKgrIm2
 UPKvXwz4Ly2i/B+g/OaEPu/AqJ4akjZdoKwfTwiY7ULAkOhAHSgxo3TT+XlbxNcZw/60
 pgtbx8FmDAwZuxa85FPD+wB+grrl0d8z5BsVuk5dorUPfFiugk1+y3shD5p9TOMnHPKc
 ob4Q==
X-Gm-Message-State: AOAM5312L2WIv+42BShceqJYDVZKkt1gRKMWSy6vkNXfjbZwKPXhfu60
 76dcMOXDeoyMwT777dZ2JA/s9x8u5I28sREYQAHG7FlhKyzZjJ1G6Orgz7BUJsSReHfDPMs9dwW
 9RrcDerIknnGHylw=
X-Received: by 2002:a1c:4c16:: with SMTP id z22mr35382196wmf.103.1593767082450; 
 Fri, 03 Jul 2020 02:04:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzO5hCTXeCjk7blI3Vkd1MJkF1PN2PvQwjS4znBUidE+10H62+1eOwLvRQvKfScofsX7SsYwQ==
X-Received: by 2002:a1c:4c16:: with SMTP id z22mr35382179wmf.103.1593767082253; 
 Fri, 03 Jul 2020 02:04:42 -0700 (PDT)
Received: from redhat.com (bzq-79-182-31-92.red.bezeqint.net. [79.182.31.92])
 by smtp.gmail.com with ESMTPSA id
 g82sm11053191wma.37.2020.07.03.02.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 02:04:41 -0700 (PDT)
Date: Fri, 3 Jul 2020 05:04:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 26/41] docs: vhost-user: add Virtio status protocol feature
Message-ID: <20200703090252.368694-27-mst@redhat.com>
References: <20200703090252.368694-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200703090252.368694-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/03 01:34:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 Maxime Coquelin <maxime.coquelin@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Maxime Coquelin <maxime.coquelin@redhat.com>

This patch specifies the VHOST_USER_SET_STATUS and
VHOST_USER_GET_STATUS requests, which are sent by
the master to update and query the Virtio status
in the backend.

Signed-off-by: Maxime Coquelin <maxime.coquelin@redhat.com>
Message-Id: <20200618134501.145747-1-maxime.coquelin@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 docs/interop/vhost-user.rst | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index 688b7c6900..10e3e3475e 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -816,6 +816,7 @@ Protocol features
   #define VHOST_USER_PROTOCOL_F_RESET_DEVICE         13
   #define VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS 14
   #define VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS  15
+  #define VHOST_USER_PROTOCOL_F_STATUS               16
 
 Master message types
 --------------------
@@ -1307,6 +1308,29 @@ Master message types
   ``VHOST_USER_ADD_MEM_REG`` message, this message is used to set and
   update the memory tables of the slave device.
 
+``VHOST_USER_SET_STATUS``
+  :id: 39
+  :equivalent ioctl: VHOST_VDPA_SET_STATUS
+  :slave payload: N/A
+  :master payload: ``u64``
+
+  When the ``VHOST_USER_PROTOCOL_F_STATUS`` protocol feature has been
+  successfully negotiated, this message is submitted by the master to
+  notify the backend with updated device status as defined in the Virtio
+  specification.
+
+``VHOST_USER_GET_STATUS``
+  :id: 40
+  :equivalent ioctl: VHOST_VDPA_GET_STATUS
+  :slave payload: ``u64``
+  :master payload: N/A
+
+  When the ``VHOST_USER_PROTOCOL_F_STATUS`` protocol feature has been
+  successfully negotiated, this message is submitted by the master to
+  query the backend for its device status as defined in the Virtio
+  specification.
+
+
 Slave message types
 -------------------
 
-- 
MST


