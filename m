Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9C96535DE
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 19:09:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p83Qu-0001fS-1d; Wed, 21 Dec 2022 13:03:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p83Qb-0001SJ-GP
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:02:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p83QZ-0004Rr-Ph
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:02:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671645771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LGPZjGxxYxhIYJTsd727PH2vevZKkF3XOuCGOKh0wZw=;
 b=et0jQmKbzJTzVQiAx9/Dm8lowRHWqSCBfXAk+4BTvOs3YAHk5CUZAPSj5YoeOGbGlkm1so
 qIqfhgK1ppDDpUlOp75UAz9hoz5g3jACGWjNW6Q34OwVzxKoz6oOpMO+mr5qPPzrCFPtUE
 QWHfDnSlsjlCmHzg97NaIdp7FaGAeX0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-624-mu6AZMfwMBCrjyNKw-p91Q-1; Wed, 21 Dec 2022 13:02:49 -0500
X-MC-Unique: mu6AZMfwMBCrjyNKw-p91Q-1
Received: by mail-ed1-f69.google.com with SMTP id
 b16-20020a056402279000b0046fb99731e6so11706728ede.1
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 10:02:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LGPZjGxxYxhIYJTsd727PH2vevZKkF3XOuCGOKh0wZw=;
 b=vfr36S2lFP3qvkYcb3Psj7be82DzVSklhXy8xbTXSFHjbTQtHvYMVjUltZlf2xYapw
 ejji0cOgkq7c9Tq++KmXSSeKogcbsiGYP1lh5Tv6C6fFKy1zPBY4BcbohACE4vzMAHuN
 VDZAjrvTIhFuKpbBNWBmai3df/AhCEMSjV+LcFUDMd2QDnhDbif1bHaEK0LvlhYv+2Lu
 /B7iePAc59vhDNoCs0X0yU6wXd4YfGbtm2Z99EQ2EnrPJRB/BF4QAOMqckG01/b9ruaa
 /9BxS7MEO3UCa8/DdgtdvHX3r5mAi1DqMIZw3ul5Og/6k5Fo7wIWko/DnzkHzBTedBYC
 pZ/Q==
X-Gm-Message-State: AFqh2krqyrhbfJLaLVytGRRBG6pw7A5Glha30j6QSOTfEWUOUKhdfO+H
 o8SMb7nAMTdRhBg2sbJNUcBej4+27Rj4WKV0p4C6znHNhxkawOq65b/5i5q33YWqCMczY+//ZIT
 yKpXSMhsa9UTRy8y2Jz7r4Im11DdB2hAAbMGVEvm3bgr7bmvqTsforjtYAsMa7Tv2F94=
X-Received: by 2002:a17:906:191a:b0:837:c2fc:a97c with SMTP id
 a26-20020a170906191a00b00837c2fca97cmr2073961eje.64.1671645767881; 
 Wed, 21 Dec 2022 10:02:47 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuxrYSYycO8GvzZd8EBGABDmzX7fm+pzF/y2fKtrUDySg4p21c07UFGYEjVVPCd4/FhY0tKIw==
X-Received: by 2002:a17:906:191a:b0:837:c2fc:a97c with SMTP id
 a26-20020a170906191a00b00837c2fca97cmr2073931eje.64.1671645767548; 
 Wed, 21 Dec 2022 10:02:47 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 ku17-20020a170907789100b008072c925e4csm5734907ejc.21.2022.12.21.10.02.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 10:02:46 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 24/24] i386: SGX: remove deprecated member of SGXInfo
Date: Wed, 21 Dec 2022 19:01:41 +0100
Message-Id: <20221221180141.839616-25-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221180141.839616-1-pbonzini@redhat.com>
References: <20221221180141.839616-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/about/deprecated.rst       | 13 -------------
 docs/about/removed-features.rst | 13 +++++++++++++
 hw/i386/sgx.c                   | 15 ++++++---------
 qapi/misc-target.json           | 12 ++----------
 4 files changed, 21 insertions(+), 32 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 91015ce5da3b..c3a874dee806 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -165,19 +165,6 @@ accepted incorrect commands will return an error. Users should make sure that
 all arguments passed to ``device_add`` are consistent with the documented
 property types.
 
-``query-sgx`` return value member ``section-size`` (since 7.0)
-''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
-
-Member ``section-size`` in return value elements with meta-type ``uint64`` is
-deprecated.  Use ``sections`` instead.
-
-
-``query-sgx-capabilities`` return value member ``section-size`` (since 7.0)
-'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
-
-Member ``section-size`` in return value elements with meta-type ``uint64`` is
-deprecated.  Use ``sections`` instead.
-
 System accelerators
 -------------------
 
diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index 44bd299142ca..c918cabd1aaa 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -507,6 +507,19 @@ type of array items in query-named-block-nodes.
 
 Specify the properties for the object as top-level arguments instead.
 
+``query-sgx`` return value member ``section-size`` (removed in 8.0)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Member ``section-size`` in the return value of ``query-sgx``
+was superseded by ``sections``.
+
+
+``query-sgx-capabilities`` return value member ``section-size`` (removed in 8.0)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Member ``section-size`` in the return value of ``query-sgx-capabilities``
+was superseded by ``sections``.
+
 Human Monitor Protocol (HMP) commands
 -------------------------------------
 
diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
index 09d9c7c73d9f..db004d17a65d 100644
--- a/hw/i386/sgx.c
+++ b/hw/i386/sgx.c
@@ -83,7 +83,7 @@ static uint64_t sgx_calc_section_metric(uint64_t low, uint64_t high)
            ((high & MAKE_64BIT_MASK(0, 20)) << 32);
 }
 
-static SGXEPCSectionList *sgx_calc_host_epc_sections(uint64_t *size)
+static SGXEPCSectionList *sgx_calc_host_epc_sections(void)
 {
     SGXEPCSectionList *head = NULL, **tail = &head;
     SGXEPCSection *section;
@@ -106,7 +106,6 @@ static SGXEPCSectionList *sgx_calc_host_epc_sections(uint64_t *size)
         section = g_new0(SGXEPCSection, 1);
         section->node = j++;
         section->size = sgx_calc_section_metric(ecx, edx);
-        *size += section->size;
         QAPI_LIST_APPEND(tail, section);
     }
 
@@ -157,7 +156,6 @@ SGXInfo *qmp_query_sgx_capabilities(Error **errp)
 {
     SGXInfo *info = NULL;
     uint32_t eax, ebx, ecx, edx;
-    uint64_t size = 0;
 
     int fd = qemu_open_old("/dev/sgx_vepc", O_RDWR);
     if (fd < 0) {
@@ -175,8 +173,7 @@ SGXInfo *qmp_query_sgx_capabilities(Error **errp)
     info->sgx1 = eax & (1U << 0) ? true : false;
     info->sgx2 = eax & (1U << 1) ? true : false;
 
-    info->sections = sgx_calc_host_epc_sections(&size);
-    info->section_size = size;
+    info->sections = sgx_calc_host_epc_sections();
 
     close(fd);
 
@@ -223,14 +220,12 @@ SGXInfo *qmp_query_sgx(Error **errp)
         return NULL;
     }
 
-    SGXEPCState *sgx_epc = &pcms->sgx_epc;
     info = g_new0(SGXInfo, 1);
 
     info->sgx = true;
     info->sgx1 = true;
     info->sgx2 = true;
     info->flc = true;
-    info->section_size = sgx_epc->size;
     info->sections = sgx_get_epc_sections_list();
 
     return info;
@@ -241,6 +236,7 @@ void hmp_info_sgx(Monitor *mon, const QDict *qdict)
     Error *err = NULL;
     SGXEPCSectionList *section_list, *section;
     g_autoptr(SGXInfo) info = qmp_query_sgx(&err);
+    uint64_t size = 0;
 
     if (err) {
         error_report_err(err);
@@ -254,8 +250,6 @@ void hmp_info_sgx(Monitor *mon, const QDict *qdict)
                    info->sgx2 ? "enabled" : "disabled");
     monitor_printf(mon, "FLC support: %s\n",
                    info->flc ? "enabled" : "disabled");
-    monitor_printf(mon, "size: %" PRIu64 "\n",
-                   info->section_size);
 
     section_list = info->sections;
     for (section = section_list; section; section = section->next) {
@@ -263,7 +257,10 @@ void hmp_info_sgx(Monitor *mon, const QDict *qdict)
                        section->value->node);
         monitor_printf(mon, "size=%" PRIu64 "\n",
                        section->value->size);
+        size += section->value->size;
     }
+    monitor_printf(mon, "total size=%" PRIu64 "\n",
+                   size);
 }
 
 bool sgx_epc_get_section(int section_nr, uint64_t *addr, uint64_t *size)
diff --git a/qapi/misc-target.json b/qapi/misc-target.json
index 4944c0528fe2..5b6a8e91850a 100644
--- a/qapi/misc-target.json
+++ b/qapi/misc-target.json
@@ -329,14 +329,8 @@
 #
 # @flc: true if FLC is supported
 #
-# @section-size: The EPC section size for guest
-#                Redundant with @sections.  Just for backward compatibility.
-#
 # @sections: The EPC sections info for guest (Since: 7.0)
 #
-# Features:
-# @deprecated: Member @section-size is deprecated.  Use @sections instead.
-#
 # Since: 6.2
 ##
 { 'struct': 'SGXInfo',
@@ -344,8 +338,6 @@
             'sgx1': 'bool',
             'sgx2': 'bool',
             'flc': 'bool',
-            'section-size': { 'type': 'uint64',
-                    'features': [ 'deprecated' ] },
             'sections': ['SGXEPCSection']},
    'if': 'TARGET_I386' }
 
@@ -362,7 +354,7 @@
 #
 # -> { "execute": "query-sgx" }
 # <- { "return": { "sgx": true, "sgx1" : true, "sgx2" : true,
-#                  "flc": true,  "section-size" : 96468992,
+#                  "flc": true,
 #                  "sections": [{"node": 0, "size": 67108864},
 #                  {"node": 1, "size": 29360128}]} }
 #
@@ -382,7 +374,7 @@
 #
 # -> { "execute": "query-sgx-capabilities" }
 # <- { "return": { "sgx": true, "sgx1" : true, "sgx2" : true,
-#                  "flc": true, "section-size" : 96468992,
+#                  "flc": true,
 #                  "section" : [{"node": 0, "size": 67108864},
 #                  {"node": 1, "size": 29360128}]} }
 #
-- 
2.38.1


