Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E206535D7
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 19:05:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p83Pz-0000Tu-NR; Wed, 21 Dec 2022 13:02:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p83Pl-0000Is-8Y
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:02:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p83Pi-0004GK-Sw
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:02:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671645718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0RLjBKC7zuAW/a6ddtPwalPoTZK/tLDETD58h1g0NvY=;
 b=dEsK9ojsliWVEZV88JAaELcedNMwdyVlp5npPtTXkxjlqsYRSAKXM0zRtFmrB2MUD2KNRK
 O3jkh5DhyVXmrUpwWifn2L6iePPQO1UU0vKuvXSLIAXUXB41nRDSfMdec/4vef6siaS7kn
 l97YBcL7HMWCU1xLMGFB6T1biRIgIUQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-449-Qzw0oBfONwO6k6MSVVIXhg-1; Wed, 21 Dec 2022 13:01:56 -0500
X-MC-Unique: Qzw0oBfONwO6k6MSVVIXhg-1
Received: by mail-ej1-f70.google.com with SMTP id
 hr34-20020a1709073fa200b0083a60c1d7abso2898064ejc.13
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 10:01:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0RLjBKC7zuAW/a6ddtPwalPoTZK/tLDETD58h1g0NvY=;
 b=q4pXS9AGA+UA8U6MEdBMCVibtxkUcrWYgXyS5X6rSv304GeZMvtcCff/3DrXqq88ZS
 sDfEGV5TjDoe1K3XVNvrPGfNk7OH8n/4VtUAlluspSrRJ9CairgTV+xuAr5v6b2nBjd7
 f0SGhjV9SwWwRp+byRmt6XwHVXHanppWZ/jVvW5Okfow1bmg0pmyupsnQmXx/0MLzevK
 R2l+7muhmrfdEnjyw5G9raGRk7YOnOHrnZLDIu0zM9c5W6zAyPLvl564LEUevIi2fe5o
 xc02bsgBWeF7K70cNKc+SSmALymQ0iJkPSC87GQ0XlAUAq6bRI+db0gGGFTprAZ2BfdO
 RmLQ==
X-Gm-Message-State: AFqh2krkHZkQOv5RkmUsFXRiLVbq5sCJaArtORayxjqG1B/P7UmzVaIZ
 bJf7uQiucYq31YRrp6ipQtH17KfwTUq+qXvgeapWkgvUPWaxR+p81JcUOOttMPGwfVywLUGeQoJ
 P271vm39Eg12nmuo6KcUiDkH4CRSQTJ3R37WSnzOxGkQ6AbYmYX9dD+krpFMeWSTu5Qg=
X-Received: by 2002:a17:906:6d47:b0:7c1:311f:3533 with SMTP id
 a7-20020a1709066d4700b007c1311f3533mr1835070ejt.60.1671645707400; 
 Wed, 21 Dec 2022 10:01:47 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvrOfnABj65B+r5b8WvUglItAVeJrJ5ALfnC3UhP2YjqafZGRBgcSAaZety3uLWw8Z1NI6jTA==
X-Received: by 2002:a17:906:6d47:b0:7c1:311f:3533 with SMTP id
 a7-20020a1709066d4700b007c1311f3533mr1835045ejt.60.1671645707108; 
 Wed, 21 Dec 2022 10:01:47 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 g19-20020a170906539300b007c0efbaa8a0sm7393236ejo.4.2022.12.21.10.01.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 10:01:46 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fabiano Rosas <farosas@suse.de>
Subject: [PULL 01/24] typedefs: Forward-declare AccelState
Date: Wed, 21 Dec 2022 19:01:18 +0100
Message-Id: <20221221180141.839616-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221180141.839616-1-pbonzini@redhat.com>
References: <20221221180141.839616-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Forward-declare AccelState in "qemu/typedefs.h" so structures
using a reference of it (like MachineState in "hw/boards.h")
don't have to include "qemu/accel.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Fabiano Rosas <farosas@suse.de>
Message-Id: <20221130135641.85328-2-philmd@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/accel.h    | 4 ++--
 include/qemu/typedefs.h | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/qemu/accel.h b/include/qemu/accel.h
index ce4747634a7c..e84db2e3e504 100644
--- a/include/qemu/accel.h
+++ b/include/qemu/accel.h
@@ -26,10 +26,10 @@
 #include "qom/object.h"
 #include "exec/hwaddr.h"
 
-typedef struct AccelState {
+struct AccelState {
     /*< private >*/
     Object parent_obj;
-} AccelState;
+};
 
 typedef struct AccelClass {
     /*< private >*/
diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index 688408e0481e..073abab9988a 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -21,6 +21,7 @@
  * Incomplete struct types
  * Please keep this list in case-insensitive alphabetical order.
  */
+typedef struct AccelState AccelState;
 typedef struct AdapterInfo AdapterInfo;
 typedef struct AddressSpace AddressSpace;
 typedef struct AioContext AioContext;
-- 
2.38.1


