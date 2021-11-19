Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3B8456E45
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 12:34:48 +0100 (CET)
Received: from localhost ([::1]:37332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo2AJ-0007vu-Kz
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 06:34:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mo28D-0006LT-0m
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 06:32:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mo28A-0005xq-FS
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 06:32:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637321554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=L5SPzgBXAW+dyHwMZ9KNwUhM2nBFRPRF0cO1t6WFYPs=;
 b=UC4P1N9maOhLlhs89y2sylu6veBwClFWK4ExXgFrMoEaeZWKjhqIqBGT2kvVcj0j2s+7Yg
 DJuYRyHm7Jn/bKU7Ge7bAe4D4mBTjASpo1WkSHWhn8xZ38qGlUfvABStgd7ummjyYXKAlN
 mNvRuIiNNaANuFO3lAio18vs2inEhus=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-419-qhfu2qaoNTe8aTUAa0_04w-1; Fri, 19 Nov 2021 06:32:32 -0500
X-MC-Unique: qhfu2qaoNTe8aTUAa0_04w-1
Received: by mail-wm1-f71.google.com with SMTP id
 j193-20020a1c23ca000000b003306ae8bfb7so3913938wmj.7
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 03:32:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L5SPzgBXAW+dyHwMZ9KNwUhM2nBFRPRF0cO1t6WFYPs=;
 b=HXm0z66IXCoeyV2omlqxEhbbHuV8AK/5cDjOaPqaJrsoMewGsOuQYft06sWIU6s10P
 2BXmL4ZRT3YB6phBNHfBhSQvMrTnPfwc+knaephLzqn4e7ZLmRV+tIFSLqT1kJmCg28h
 0a6K1cRPHMkIzKHHaUSe+u3pQKYx33kHA5xj41Yor+ggjnaF33mQiw9UT8991lwhkDAD
 6b7+42W59cVnr2xkCoQsOIZ1trJWDjdLD0L8pjSUbSZRd5mlliideJ7A+Uv2QuYPrv2N
 9XBJKFfgKqT6vKvtgiO2PjbClUN4WRLmPP6/owI8os8i4/4UOUT5ljDRS/bFMyel0CH+
 6AdQ==
X-Gm-Message-State: AOAM532jtiWYvyIRqz02s3R0oA/jn7NqA+qM5KdjtrjrVS3RCUhyye69
 Y0wRZ5jMiC0eDhvzMOLmh/1u/Ko59oQ+ghojHXPaKslewukp8w3rgt29+jF2yjW87WXWMMJaJni
 u1glqvDix58AKqJoDgNxKRQFhxidMJ+CWTrLRg30Qw1xsFQieFEAHUY1aVOsdliH+
X-Received: by 2002:a7b:cf25:: with SMTP id m5mr6034673wmg.51.1637321551177;
 Fri, 19 Nov 2021 03:32:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy7mioYjmw0idYSlrXfW284YrW4A9QiTBYpJkWt57R0crfnrJUrpaMHLS3pUriGtF3rkluTcA==
X-Received: by 2002:a7b:cf25:: with SMTP id m5mr6034616wmg.51.1637321550870;
 Fri, 19 Nov 2021 03:32:30 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 v7sm2643015wrq.25.2021.11.19.03.32.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 03:32:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2] qom/object: Ignore global properties with empty name
Date: Fri, 19 Nov 2021 12:32:29 +0100
Message-Id: <20211119113229.350338-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When using -global, properties might have empty name/value.

This fixes this legitimate use case:

  $ qemu-system-x86_64 -global driver=isa-fdc
  qemu-system-x86_64: ../../devel/qemu/qapi/string-input-visitor.c:394:
  string_input_visitor_new: Assertion `str' failed.
  Aborted (core dumped)

  (gdb) bt
  #4  0x0000555555f6b8d5 in string_input_visitor_new (str=0x0) at qapi/string-input-visitor.c:394
  #5  0x0000555555dd0f8d in object_property_parse (obj=0x555556f33400, name=0x0, string=0x0, errp=0x7fffffffc9c8) at qom/object.c:1641
  #6  0x0000555555dce131 in object_apply_global_props (obj=0x555556f33400, props=0x555556737360, errp=0x555556611760 <error_fatal>) at qom/object.c:411
  #7  0x0000555555dc5ee2 in qdev_prop_set_globals (dev=0x555556f33400) at hw/core/qdev-properties.c:790
  #8  0x0000555555dc89e8 in device_post_init (obj=0x555556f33400) at hw/core/qdev.c:697
  #9  0x0000555555dce02b in object_post_init_with_type (obj=0x555556f33400, ti=0x55555672bd20) at qom/object.c:383
  #10 0x0000555555dce059 in object_post_init_with_type (obj=0x555556f33400, ti=0x5555566e9090) at qom/object.c:387
  #11 0x0000555555dce059 in object_post_init_with_type (obj=0x555556f33400, ti=0x5555566df730) at qom/object.c:387
  #12 0x0000555555dce566 in object_initialize_with_type (obj=0x555556f33400, size=848, type=0x5555566df730) at qom/object.c:519
  #13 0x0000555555dcec78 in object_new_with_type (type=0x5555566df730) at qom/object.c:733
  #14 0x0000555555dceccf in object_new (typename=0x5555560fcf81 "isa-fdc") at qom/object.c:748
  #15 0x0000555555dc75fe in qdev_new (name=0x5555560fcf81 "isa-fdc") at hw/core/qdev.c:153
  #16 0x00005555559eec58 in isa_new (name=0x5555560fcf81 "isa-fdc") at hw/isa/isa-bus.c:166
  #17 0x0000555555bd3607 in pc_superio_init (isa_bus=0x5555566b42e0, create_fdctrl=true, no_vmport=false) at hw/i386/pc.c:1026
  (gdb) fr 6
  #6  0x0000555555dce131 in object_apply_global_props (obj=0x555556f33400, props=0x555556737360, errp=0x555556611760 <error_fatal>) at qom/object.c:411
  411             if (!object_property_parse(obj, p->property, p->value, &err)) {
  (gdb) p *p
  $1 = {driver = 0x555556738250 "isa-fdc", property = 0x0, value = 0x0, used = true, optional = false}

Reported-by: Thomas Huth <thuth@redhat.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/604
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 qom/object.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/qom/object.c b/qom/object.c
index 4f0677cca9e..45fa8561df6 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -401,6 +401,9 @@ bool object_apply_global_props(Object *obj, const GPtrArray *props,
         GlobalProperty *p = g_ptr_array_index(props, i);
         Error *err = NULL;
 
+        if (!p->property) {
+            continue;
+        }
         if (object_dynamic_cast(obj, p->driver) == NULL) {
             continue;
         }
-- 
2.31.1


