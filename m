Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1897048768B
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 12:32:14 +0100 (CET)
Received: from localhost ([::1]:35200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5nTh-0001tW-3a
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 06:32:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n2u-0000go-3V
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:04:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n2s-0001ue-4Y
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:04:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641553467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cur9SUZpW8iaVGB6IQWM8uAhUApOuqbaIkx16EmO6Y0=;
 b=iJEt7eI6Wut6d0km16V3lNeWuCsDoStourRoLmgd0bPIqxmt2OonEqxXRT0WXqqQefQunG
 n1NuwOaM9+dIP+qEuP3ecFfVuNK8K9BtD/RIZsB1r07Y2sWQhtURSahXiEYTebH99AVrxG
 U16Uj2XlimisVP2OJlqcg7dzhkBPQUo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-ZjK0HZY5Njqa-CL5H-XnBQ-1; Fri, 07 Jan 2022 06:04:26 -0500
X-MC-Unique: ZjK0HZY5Njqa-CL5H-XnBQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 o18-20020a05600c511200b00345c1603997so702959wms.1
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 03:04:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Cur9SUZpW8iaVGB6IQWM8uAhUApOuqbaIkx16EmO6Y0=;
 b=qFt/XwltmclD5i8F/Eic05ty+4+d31I9Q7hDusf2thdqWFO6Jn6TjyTCBu1LR4D+pb
 7KgXrPdyu99EKJx4BgjJPY0ob74Ps4vH3H55p1JklG5qfTZAKuda7mpMWEuHloyw92un
 7MgC7JetrynBM5rpfguo/TM4/ltO0Hfx7LM3/40JzvhPGtuxmqjpg1U8NXom5MjgcdcM
 Mwt/SqnPOZtvid22Bl3tZbTxir9/TFGkoJoRvoxPN3t1I4ma6BnomDN2nyfvz0Mzb1Ci
 A37P8Nwp7Do3qtpA01IOb+4WIrk4+azlkCD4WCBoq4+SkEasFG+4WmucAs84Uw0Q/p19
 3xVQ==
X-Gm-Message-State: AOAM533P2JSxpSnGrjwBy2dtwfaq3IA7nrZ68CpJ8j/O9f5hzt/lgSw4
 qeUEt1S06ovUnRd7MIgwdTInnBr9fD046L2dkQFGdk/oSlLXnieiIxwj4UKsG8t9jssrV8JhN6p
 E9oG1VxyIkoJ+utkDn4AEG7E6ocaroKbSCgixmmwpA3BGueF012DTBPDQ06Sg
X-Received: by 2002:adf:d0cd:: with SMTP id z13mr53904405wrh.103.1641553465279; 
 Fri, 07 Jan 2022 03:04:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz6QyBSCWQZVOusfh+2ecHvFPLZTWXw+PPsGaho9/OInoygKx4MEuLBXvML46TKctW8bB7izA==
X-Received: by 2002:adf:d0cd:: with SMTP id z13mr53904377wrh.103.1641553465023; 
 Fri, 07 Jan 2022 03:04:25 -0800 (PST)
Received: from redhat.com ([2.55.16.192])
 by smtp.gmail.com with ESMTPSA id bk2sm4357887wrb.65.2022.01.07.03.04.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 03:04:24 -0800 (PST)
Date: Fri, 7 Jan 2022 06:04:21 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 26/55] hw/smbios: Use qapi for SmbiosEntryPointType
Message-ID: <20220107102526.39238-27-mst@redhat.com>
References: <20220107102526.39238-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220107102526.39238-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eduardo Habkost <ehabkost@redhat.com>

This prepares for exposing the SMBIOS entry point type as a
machine property on x86.

Based on a patch from Daniel P. Berrangé.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Message-Id: <20211026151100.1691925-3-ehabkost@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/machine.json            | 12 ++++++++++++
 include/hw/firmware/smbios.h | 10 ++--------
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/qapi/machine.json b/qapi/machine.json
index 372535b348..b6a37e17c4 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1568,3 +1568,15 @@
 { 'command': 'x-query-usb',
   'returns': 'HumanReadableText',
   'features': [ 'unstable' ] }
+
+##
+# @SmbiosEntryPointType:
+#
+# @32: SMBIOS version 2.1 (32-bit) Entry Point
+#
+# @64: SMBIOS version 3.0 (64-bit) Entry Point
+#
+# Since: 7.0
+##
+{ 'enum': 'SmbiosEntryPointType',
+  'data': [ '32', '64' ] }
diff --git a/include/hw/firmware/smbios.h b/include/hw/firmware/smbios.h
index d916baed6a..4b7ad77a44 100644
--- a/include/hw/firmware/smbios.h
+++ b/include/hw/firmware/smbios.h
@@ -1,6 +1,8 @@
 #ifndef QEMU_SMBIOS_H
 #define QEMU_SMBIOS_H
 
+#include "qapi/qapi-types-machine.h"
+
 /*
  * SMBIOS Support
  *
@@ -23,14 +25,6 @@ struct smbios_phys_mem_area {
     uint64_t length;
 };
 
-/*
- * SMBIOS spec defined tables
- */
-typedef enum SmbiosEntryPointType {
-    SMBIOS_ENTRY_POINT_TYPE_32,
-    SMBIOS_ENTRY_POINT_TYPE_64,
-} SmbiosEntryPointType;
-
 /* SMBIOS Entry Point
  * There are two types of entry points defined in the SMBIOS specification
  * (see below). BIOS must place the entry point(s) at a 16-byte-aligned
-- 
MST


