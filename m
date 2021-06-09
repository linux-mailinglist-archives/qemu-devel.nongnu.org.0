Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB113A1D37
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 20:53:02 +0200 (CEST)
Received: from localhost ([::1]:40590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr3K1-0000TZ-FQ
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 14:53:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lr3HE-0006bW-Sh
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 14:50:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lr3HD-0003yf-3c
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 14:50:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623264604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ufd/1lPD7YOqAcMseEx+0LfzPXOJh9I7gpZPHh9YQsc=;
 b=YcEExidKLcn7u+KuYA9HIvf58sEeExRDyAdXkzngqTfECp9CvqNEvXD5FbfsWAj02Up995
 Mdk9TQavc2Kg3mKwFw6XE4vGlScRPocnz4nykSLAJQo4AN164q/zftCONRMI5knY0XlHS3
 KpoqKRMMwVdBQAN4fe8gc8Dz+proHTc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-oNa_TXk1ON2Qnst5ZdF95w-1; Wed, 09 Jun 2021 14:50:03 -0400
X-MC-Unique: oNa_TXk1ON2Qnst5ZdF95w-1
Received: by mail-wm1-f72.google.com with SMTP id
 z25-20020a1c4c190000b029019f15b0657dso2253395wmf.8
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 11:50:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ufd/1lPD7YOqAcMseEx+0LfzPXOJh9I7gpZPHh9YQsc=;
 b=XN+VezvJ2NSAly+rGcsqT3auzPbbUSKxMAIdX0Hm6bvGQsmInW4XCB/qRqWpMZr9ip
 Mrm5L/asIvHYMSsxK2PVJ/i8RDh8v1beLD2ZKUAmuIVpVm4hj/xoeqjA1nA+wBBGyNL7
 oboNu4X8KIpT1CRihZ4jZDagwsyuFDmKhYGbQpkKe/ti16yFSj8aNlnxgXpY526BZGD0
 sTwmfQI4sxhXoUXohC+gkl31qFzj7FN4sdCpoi+wN0bkuyIcJpvCYdtdsMKHQsn4klpj
 VDBCcus8iAMd2oectxAMSdLhEF8eoA29saGG7VwzPQtZs2fo3G5x9iHjIZpmt8ft5RfZ
 GUGA==
X-Gm-Message-State: AOAM530ewWhXGIoYZZitUtWU8piZymRHqzIrIIp7G+nTuBuwH93m/p98
 YpqCFkeTzuWDz/t7EZuENnp4/o7RqVz/zhLLAl50gmtBcp75/ljykCewq5Lz+UT2WzYO/pabdRz
 FrEVRr+ATB8inlujpDZRl1TLAqLrS7FDgABiT1cNWM/+WOEAPOxLqR8jbPLUrZJCA
X-Received: by 2002:adf:b34a:: with SMTP id k10mr1222828wrd.333.1623264602035; 
 Wed, 09 Jun 2021 11:50:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLuyOkhg20CpnP3cdYDjPzDdkGeqHV3SZTlHb/Ol1c14w5oTpGa/bI+Vpw9FmlXfTAmKBNZg==
X-Received: by 2002:adf:b34a:: with SMTP id k10mr1222806wrd.333.1623264601849; 
 Wed, 09 Jun 2021 11:50:01 -0700 (PDT)
Received: from x1w.redhat.com (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id m3sm845765wrr.32.2021.06.09.11.50.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 11:50:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 1/2] qapi: Inline qmp_marshal_output() functions
Date: Wed,  9 Jun 2021 20:49:54 +0200
Message-Id: <20210609184955.1193081-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609184955.1193081-1-philmd@redhat.com>
References: <20210609184955.1193081-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In case we need to use QAPI types but no QAPI command / QAPI event
actually use them, the generated qmp_marshal_output() function will
trigger the compiler 'unused-function' warnings.
To prevent that, emit these functions inlined: the compiler will
ignore such unused functions.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
RFC: No clue about QAPI...
Tested with GCC. If the compiler is picky we could use the 'unused'
function attribute.
---
 scripts/qapi/commands.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
index 0e13d510547..bbed776a909 100644
--- a/scripts/qapi/commands.py
+++ b/scripts/qapi/commands.py
@@ -91,8 +91,8 @@ def gen_call(name: str,
 def gen_marshal_output(ret_type: QAPISchemaType) -> str:
     return mcgen('''
 
-static void qmp_marshal_output_%(c_name)s(%(c_type)s ret_in,
-                                QObject **ret_out, Error **errp)
+static inline void qmp_marshal_output_%(c_name)s(%(c_type)s ret_in,
+                                        QObject **ret_out, Error **errp)
 {
     Visitor *v;
 
-- 
2.31.1


