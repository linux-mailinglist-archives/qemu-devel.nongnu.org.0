Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 158FD270F2F
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Sep 2020 17:49:46 +0200 (CEST)
Received: from localhost ([::1]:36040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJf7Q-00053p-KZ
	for lists+qemu-devel@lfdr.de; Sat, 19 Sep 2020 11:49:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1kJf06-0006n7-EN
 for qemu-devel@nongnu.org; Sat, 19 Sep 2020 11:42:10 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:53369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1kJf00-00052z-W7
 for qemu-devel@nongnu.org; Sat, 19 Sep 2020 11:42:10 -0400
Received: by mail-pj1-x1043.google.com with SMTP id t7so4825631pjd.3
 for <qemu-devel@nongnu.org>; Sat, 19 Sep 2020 08:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=PvBsYCc78DXAzEwdVxoHuiCDgTa31YthGTj/WsyFVeM=;
 b=rIQ8H+14znjq55corm3EBYuD1+sqt27/KHiRc2Fb7pH/inF/nb9Jj7AMldqtnqjTd7
 QpCkprzD89P/YaZKLgZBaEy6MAPRxnQSrwQ0p9NfK92BE8KfOx9q/oa+a2sa+M5ezZlk
 eWswHs6GsT55893/7WtZD+Twr/zK5JHe/EkgaWnxYOvcjnP5K1rhmiud0sDA4cHO+tws
 fAFAoGERHqGMLuwrHBCQnBnYAWjbSC1l09wNvmMMK6E7YyYY2D40Qb5nrQqAZqrgAv1Z
 SBT8tV8yVTpxOUdQPK1yOofdJED51QIHSQ8sZ8TeEDWktfx+/wqg6rtwSp6dVL7o6zOe
 BQ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=PvBsYCc78DXAzEwdVxoHuiCDgTa31YthGTj/WsyFVeM=;
 b=Q80WH5bFqqyp31ZMReDivgy46VKVk0vEaog1iaD7AvZQkBvt2f/1MKKe9Eqqy+dP98
 qrW4dn+NAbI+1xBp3ckJ34nfOuc3gSkaCdFM21FqWN8eXsPo1m6RayqSXk19QVnwnASP
 p2UhzK0GuzxX2nQhXgoSXNIVvzysXzEI0pFSC75zJ93u7kegmjb0o22HQlj7BYw1LHay
 kcpoLWitB9uaXDgB4tJ9XtsayMv23W7r04y8RHk1nPvZ0hxwzKUZWawBBSTzAuYzYmKV
 /KuAfELAqZjb5xXPkksbBR8VaofjFTkx2GBcGpa580uunKP6F3wKQi3zKiD0tTEF0nxY
 yWqQ==
X-Gm-Message-State: AOAM530CR3612/wBO81SLAi5CUisA9/bPGa/WuRthzdN8WWHAA8Vnf9w
 5/6LP8s4wHt0EF7ozm1J9E7p1SLNrKrlcK7h
X-Google-Smtp-Source: ABdhPJwX4QYzAB1LnzpK2Wgyko+hbJUBlJwwSOPpHri/id62mG5l1DHjsczbHaDzE1DliFh8uTlnHQ==
X-Received: by 2002:a17:902:b7c4:b029:d0:b7a2:d16 with SMTP id
 v4-20020a170902b7c4b02900d0b7a20d16mr38632462plz.11.1600530122510; 
 Sat, 19 Sep 2020 08:42:02 -0700 (PDT)
Received: from localhost.localdomain ([115.96.127.92])
 by smtp.googlemail.com with ESMTPSA id gg13sm6044059pjb.3.2020.09.19.08.41.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Sep 2020 08:42:01 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Subject: [PATCH] qom: code hardening - have bound checking while looping with
 integer value
Date: Sat, 19 Sep 2020 21:11:39 +0530
Message-Id: <20200919154139.9608-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.17.1
Received-SPF: none client-ip=2607:f8b0:4864:20::1043;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1043.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Object property insertion code iterates over an integer to get an unused
index that can be used as an unique name for an object property. This loop
increments the integer value indefinitely. Although very unlikely, this can
still cause an integer overflow.
In this change, we fix the above code by checking against INT_MAX and making
sure that the interger index does not overflow beyond that value. If no
available index is found, the code would cause an assertion failure. This
assertion failure is necessary because the callers of the function do not check
the return value for NULL.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 qom/object.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/qom/object.c b/qom/object.c
index 00fdf89b3b..62414da67f 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -1158,11 +1158,11 @@ object_property_try_add(Object *obj, const char *name, const char *type,
 
     if (name_len >= 3 && !memcmp(name + name_len - 3, "[*]", 4)) {
         int i;
-        ObjectProperty *ret;
+        ObjectProperty *ret = NULL;
         char *name_no_array = g_strdup(name);
 
         name_no_array[name_len - 3] = '\0';
-        for (i = 0; ; ++i) {
+        for (i = 0; i < INT_MAX; ++i) {
             char *full_name = g_strdup_printf("%s[%d]", name_no_array, i);
 
             ret = object_property_try_add(obj, full_name, type, get, set,
@@ -1173,6 +1173,7 @@ object_property_try_add(Object *obj, const char *name, const char *type,
             }
         }
         g_free(name_no_array);
+        assert(ret);
         return ret;
     }
 
-- 
2.17.1


