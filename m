Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 893C61CAEDD
	for <lists+qemu-devel@lfdr.de>; Fri,  8 May 2020 15:16:50 +0200 (CEST)
Received: from localhost ([::1]:49216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jX2rx-0001gr-IL
	for lists+qemu-devel@lfdr.de; Fri, 08 May 2020 09:16:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1jX2bY-00019a-H0
 for qemu-devel@nongnu.org; Fri, 08 May 2020 08:59:52 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:43468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1jX2bX-0006dE-OM
 for qemu-devel@nongnu.org; Fri, 08 May 2020 08:59:52 -0400
Received: by mail-wr1-x441.google.com with SMTP id i15so1725195wrx.10
 for <qemu-devel@nongnu.org>; Fri, 08 May 2020 05:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=bKbcDZF4VvCdwc1Z3LgA0n0/o1l3SD8mbWQhoT1XpcI=;
 b=Lc8lcnksX5d3je3p49Vztr08A+MFZfIGBC/zZ5XUENKKcT6sQE5k6ekGgGUpM0VMit
 5TW/HMBti6n5VTWjcIIbYn//a417AuzILpvtjyvVRiNvSCturknFgUTDqLMjqEOO+zt1
 vHyJsqhytNAIQmXjTxaRbp0kjyIt9rM1t0gBzCYCln4xyR5baI1cemLEl18E/qPVJT8i
 SMOGy0fOzZSpE2LAlCr5/4Z/X34FK5UhtQ4S6EvPgPm0ARa3bOQ/DUa0CxXf0xxszNfv
 JFbFVs2GnZRW49uXpav9BQkOAHAWiZAl3wY9B6hJZffxMYGlUFVBAmb1xCOJyl8IWQ58
 j24g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=bKbcDZF4VvCdwc1Z3LgA0n0/o1l3SD8mbWQhoT1XpcI=;
 b=XA1DJrON2yXJC0S5xCeyePVXzMaLzQa6ojox3n2UZZiJOeLruQGLC0xo5IjmfLlpWj
 GvXTIvvjW79J96bS0W/XkNZ2+JORfEZzRmQhc1APOdJBPtBCTjMBwtRJx+aXT92R09nL
 Lw0xzMUmB9IRVg3IylJSMjb+WxSdwBVcpI1uqa4QSVW1USojUqs7YI+ga6eYaA+mlLcV
 WcDDUGiBRzg5YWy6tU7c0TMt4dB41YBSUfEv/d46fKMk+1pK3O7J6MR1F/Qv2FD7OMbA
 PIHxIUJ2RPFqjPdA0y6zGrgJX8iz57hRTLhpduYW1lKiD9ZHZmYkX9euGWO0ruESCFb/
 DCKQ==
X-Gm-Message-State: AGi0PuY4qC+TdVJyNUrFeWWV/xGG7JLDjv771BL5YSxQfCKsMoupIOzT
 /ZCAHLWAquxe303mwT4wULtCmeJC8ZYcqQ==
X-Google-Smtp-Source: APiQypIAIFQoe7kCiC7XGBBEM2F8ki2/zqFYd4bzyZ1VfEP6M9gZ9OJK2XzC//4SWtgPGsg9aDC4+g==
X-Received: by 2002:adf:a1c8:: with SMTP id v8mr2791377wrv.79.1588942789362;
 Fri, 08 May 2020 05:59:49 -0700 (PDT)
Received: from f2.redhat.com (bzq-79-183-19-16.red.bezeqint.net.
 [79.183.19.16])
 by smtp.gmail.com with ESMTPSA id g6sm2915974wrw.34.2020.05.08.05.59.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 08 May 2020 05:59:48 -0700 (PDT)
From: Yuri Benditovich <yuri.benditovich@daynix.com>
To: qemu-devel@nongnu.org, mst@redhat.com, jasowang@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com
Subject: [PATCH v8 5/7] vmstate.h: provide VMSTATE_VARRAY_UINT16_ALLOC macro
Date: Fri,  8 May 2020 15:59:32 +0300
Message-Id: <20200508125934.7861-6-yuri.benditovich@daynix.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200508125934.7861-1-yuri.benditovich@daynix.com>
References: <20200508125934.7861-1-yuri.benditovich@daynix.com>
Received-SPF: none client-ip=2a00:1450:4864:20::441;
 envelope-from=yuri.benditovich@daynix.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: yan@daynix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Similar to VMSTATE_VARRAY_UINT32_ALLOC, but the size is
16-bit field.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
---
 include/migration/vmstate.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
index 30667631bc..baaefb6b9b 100644
--- a/include/migration/vmstate.h
+++ b/include/migration/vmstate.h
@@ -432,6 +432,16 @@ extern const VMStateInfo vmstate_info_qlist;
     .offset     = vmstate_offset_pointer(_state, _field, _type),     \
 }
 
+#define VMSTATE_VARRAY_UINT16_ALLOC(_field, _state, _field_num, _version, _info, _type) {\
+    .name       = (stringify(_field)),                               \
+    .version_id = (_version),                                        \
+    .num_offset = vmstate_offset_value(_state, _field_num, uint16_t),\
+    .info       = &(_info),                                          \
+    .size       = sizeof(_type),                                     \
+    .flags      = VMS_VARRAY_UINT16 | VMS_POINTER | VMS_ALLOC,       \
+    .offset     = vmstate_offset_pointer(_state, _field, _type),     \
+}
+
 #define VMSTATE_VARRAY_UINT16_UNSAFE(_field, _state, _field_num, _version, _info, _type) {\
     .name       = (stringify(_field)),                               \
     .version_id = (_version),                                        \
-- 
2.17.1


