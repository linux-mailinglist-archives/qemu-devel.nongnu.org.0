Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 977634041C1
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 01:27:08 +0200 (CEST)
Received: from localhost ([::1]:39976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO6yB-0003Si-L1
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 19:27:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mO6sK-0007Zm-OT
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 19:21:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mO6sJ-0002yh-8E
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 19:21:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631143262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qceza/WB3CtMew9GJDkTkDK3S8IfTB0xLv9ykQRmWEY=;
 b=BZf5flKneby/HH/TUn+2En4hcuRn0nmqUQlhObaQRtHRTS85+MH3RYybtdnDIP/nlNwvYl
 OqT0y4+C9/70yYBTF9ExiumHax9KbbMvWoqxYzsKno14Lq6ti5oo0k+SYsOzxIrHtDInIZ
 Ay6kf2TslFss/rF3NzONLuSpIgUsdmU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-XEyRmGphPVCA4xNF1TilaA-1; Wed, 08 Sep 2021 19:21:01 -0400
X-MC-Unique: XEyRmGphPVCA4xNF1TilaA-1
Received: by mail-wm1-f72.google.com with SMTP id
 r125-20020a1c2b830000b0290197a4be97b7so26483wmr.9
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 16:21:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qceza/WB3CtMew9GJDkTkDK3S8IfTB0xLv9ykQRmWEY=;
 b=SGlhbAlNEkN0dzsbjyfUb3AxKsHUb04yKBlNf5NJ2XGx60HGQGb10vDjUZ1J1UseYM
 nRTY7iQXFT+DigjCzrLYpFxJL8Z5k/XKyvi0D1B5mFuQJOQMh/21VOWPomlncWkIikhb
 9Poamo1FR5jtAaAiA589GKMDAHknP25hG78frJ32xyVSInQGHpEpXf3sFYX+YPb3s8Gg
 BksidVyb1W0lISxV0JO3DUGfaWfFaZ9w2DBu5ZqZHXmbQ1BNjiudeIfOrImkFYaeyMna
 V5PGOp6VWsKWJjLQfTpDI3XwzFR0rPaiDYjEpp9nX/nQue7/ui6fHRBzJrlW9zqmOeY9
 CQmA==
X-Gm-Message-State: AOAM532HkYYIkaCOo5Bakl4yhU2NIWsk9pBVdAAM0eeRGOnSj5YnEY71
 c6eCLVV6dxElx5wHXHkJHDwiTawq+b9TfK10lipcY2DutodBVsI/hmTonR1ONolbPQSHecqHeKt
 lygDdlnJRPlAp9GpatZdkgco4SmneoT7LDEGW1XozuM9n5hat3d/VO1tdH82i98rf
X-Received: by 2002:adf:fd51:: with SMTP id h17mr109124wrs.178.1631143260205; 
 Wed, 08 Sep 2021 16:21:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGCdGOUWAMH7ZAThbx+xTDgHh6zdyfVzIsc9P7NbgQbnC+meNZTqgQ/wi8QkKk51AhWel3JA==
X-Received: by 2002:adf:fd51:: with SMTP id h17mr109093wrs.178.1631143259991; 
 Wed, 08 Sep 2021 16:20:59 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id e8sm14000wrc.96.2021.09.08.16.20.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 16:20:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 07/10] hw/display: Mark ATI and Artist devices as unsafe
Date: Thu,  9 Sep 2021 01:20:21 +0200
Message-Id: <20210908232024.2399215-8-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908232024.2399215-1-philmd@redhat.com>
References: <20210908232024.2399215-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Prasad J Pandit <pjp@fedoraproject.org>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/display/artist.c | 1 +
 hw/display/ati.c    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/display/artist.c b/hw/display/artist.c
index 21b7fd1b440..067a4b2cb59 100644
--- a/hw/display/artist.c
+++ b/hw/display/artist.c
@@ -1482,6 +1482,7 @@ static void artist_class_init(ObjectClass *klass, void *data)
     dc->vmsd = &vmstate_artist;
     dc->reset = artist_reset;
     device_class_set_props(dc, artist_properties);
+    dc->taints_security_policy = true;
 }
 
 static const TypeInfo artist_info = {
diff --git a/hw/display/ati.c b/hw/display/ati.c
index 31f22754dce..2f27ab69a87 100644
--- a/hw/display/ati.c
+++ b/hw/display/ati.c
@@ -1024,6 +1024,7 @@ static void ati_vga_class_init(ObjectClass *klass, void *data)
     device_class_set_props(dc, ati_vga_properties);
     dc->hotpluggable = false;
     set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
+    dc->taints_security_policy = true;
 
     k->class_id = PCI_CLASS_DISPLAY_VGA;
     k->vendor_id = PCI_VENDOR_ID_ATI;
-- 
2.31.1


