Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A142B795F
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 09:50:39 +0100 (CET)
Received: from localhost ([::1]:41094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfJAk-0002G1-MQ
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 03:50:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kfIyb-0002DG-ES
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:38:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kfIyZ-0005WT-Gd
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:38:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605688682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W6LPgdYtq9wsraNQWeYw6RGzqst9S7TBwLVOmdRFdOk=;
 b=GzeKNyYIXe4rGcoct3/TamSNZmVRv5iHz+B7RxTlBq0Xxkliq3HV5xaOfdMDlSn8Nh1ZNH
 IO/RM8nNpkJbUMp+xsBWFLVVAVnobXnzhS+XOcwAJ7wgDpVupat+Iw1oWLM8lY2NIE9axz
 Pbgr/Cpeb01Lri2Y8+Dd2X5wpsSid18=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-DvclWaV6Nz2YukO2Xq-0KA-1; Wed, 18 Nov 2020 03:38:01 -0500
X-MC-Unique: DvclWaV6Nz2YukO2Xq-0KA-1
Received: by mail-wr1-f70.google.com with SMTP id f4so621215wru.21
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 00:38:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W6LPgdYtq9wsraNQWeYw6RGzqst9S7TBwLVOmdRFdOk=;
 b=mQm1cMei6hjFhjTJMcOsHAXlA6atfRfHCzSgM6GuUIqCf2qmSMghJmlTVRuGFy4Yf7
 ADDkntk0GDfpCXMNBSrp0Qoz9rzNFnXT50w9Sdje2ieYvwlA01bBFbudPPxh8mHY7goh
 FVz5e3OdAtSPVoGb/vWyN/SDXuJJBc74gmn7N4qaXvHL2bF96Uk8NG+8VWKBlH2dEWLo
 CRluj8EezDRg45N12lO5pi+PbYbL+kwDAjusiUHjzrEj/5EOpkOrgrUEmWrg4rikamN/
 +VVRoyl1+J+2sIR1q6u5ij65pBmeLBEbKmZPgXE2+tWDgEYl7YLhM9eWOUTsahS3lrhK
 7k8g==
X-Gm-Message-State: AOAM530qiEWM3JgWliEgPebA/QhBoI15oqF+MPYOr9PPFCkfNXdCYATJ
 WM12VRKaYihyya31T5UMnUUehByvJGrf3QDHTS+INrrqUoBBja4e7Fg5YFG6wPbDEsz1QQ5hQba
 JHzGB9KAh7vcA2tFl1hEza9E18/1kB9gRO9rUHTaNkkqkpchTUOYoYPRJkhoaeK6rKfk=
X-Received: by 2002:a7b:cbc8:: with SMTP id n8mr3157194wmi.124.1605688679733; 
 Wed, 18 Nov 2020 00:37:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz/uNM4Ikk7a3Eg4aUQowGykK9WNUHGyeDfAAlqZ7Iu1JPGI1g5qcL95zVnYiYUOkCFGUHzjA==
X-Received: by 2002:a7b:cbc8:: with SMTP id n8mr3157168wmi.124.1605688679525; 
 Wed, 18 Nov 2020 00:37:59 -0800 (PST)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id o14sm28202103wrw.4.2020.11.18.00.37.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 00:37:58 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/27] failover: Remove external partially_hotplugged
 property
Date: Wed, 18 Nov 2020 09:37:27 +0100
Message-Id: <20201118083748.1328-7-quintela@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201118083748.1328-1-quintela@redhat.com>
References: <20201118083748.1328-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 00:38:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It was only set "once", and with the wrong value. As far as I can see,
libvirt still don't use it.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 hw/net/virtio-net.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 3f658d6246..6ca85627d8 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3135,10 +3135,6 @@ static bool failover_replug_primary(VirtIONet *n, Error **errp)
     }
     qdev_set_parent_bus(n->primary_dev, primary_bus, &error_abort);
     qatomic_set(&n->primary_should_be_hidden, false);
-    if (!qemu_opt_set_bool(n->primary_device_opts,
-                           "partially_hotplugged", true, errp)) {
-        return false;
-    }
     hotplug_ctrl = qdev_get_hotplug_handler(n->primary_dev);
     if (hotplug_ctrl) {
         hotplug_handler_pre_plug(hotplug_ctrl, n->primary_dev, &err);
-- 
2.26.2


