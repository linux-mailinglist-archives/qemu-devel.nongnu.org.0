Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8064443E5B0
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 18:01:46 +0200 (CEST)
Received: from localhost ([::1]:39292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg7qb-0006VI-3T
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 12:01:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mg7mI-0003Rn-5K
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:57:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mg7mF-0004S9-Rt
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:57:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635436635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JEfnsPuHjZ2fn03999z5W6MgAqe0CqqY0VfWsgmOuqY=;
 b=MiWm2Mag5tFDKqwf2zD1zcGWhmcW9i5hUKcrN6gGaAgpO8o/d6HoRxfxFp9ZBUZLb7RGYE
 HZRftBCtYGM3DyFIhNXxNP7X9zt03V2hZxkNNyZkPwlD0GYA1sJ1Z0xC5ter8ZNBjg8aTs
 8qi/43zUragt5zEwu4Z+yhoRiwiyat4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-603-N9kXu-hLPC-9Z3toS2fTVQ-1; Thu, 28 Oct 2021 11:57:11 -0400
X-MC-Unique: N9kXu-hLPC-9Z3toS2fTVQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73D0391270;
 Thu, 28 Oct 2021 15:57:09 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.195.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4C2D46C8F7;
 Thu, 28 Oct 2021 15:56:55 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 08/22] docs/devel: add example of command returning
 unstructured text
Date: Thu, 28 Oct 2021 16:54:43 +0100
Message-Id: <20211028155457.967291-9-berrange@redhat.com>
In-Reply-To: <20211028155457.967291-1-berrange@redhat.com>
References: <20211028155457.967291-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This illustrates how to add a QMP command returning unstructured text,
following the guidelines added in the previous patch. The example uses
a simplified version of 'info roms'.

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 docs/devel/writing-monitor-commands.rst | 101 +++++++++++++++++++++++-
 1 file changed, 100 insertions(+), 1 deletion(-)

diff --git a/docs/devel/writing-monitor-commands.rst b/docs/devel/writing-monitor-commands.rst
index 031e980bf5..b87992df91 100644
--- a/docs/devel/writing-monitor-commands.rst
+++ b/docs/devel/writing-monitor-commands.rst
@@ -374,7 +374,9 @@ best practices. An example where this approach is taken is the QMP
 command "x-query-registers". This returns a formatted dump of the
 architecture specific CPU state. The way the data is formatted varies
 across QEMU targets, is liable to change over time, and is only
-intended to be consumed as an opaque string by machines.
+intended to be consumed as an opaque string by machines. Refer to the
+`Writing a debugging aid returning unstructured text`_ section for
+an illustration.
 
 User Defined Types
 ~~~~~~~~~~~~~~~~~~
@@ -642,3 +644,100 @@ has to traverse the list, it's shown below for reference::
 
      qapi_free_TimerAlarmMethodList(method_list);
  }
+
+Writing a debugging aid returning unstructured text
+---------------------------------------------------
+
+As discussed in section `Modelling data in QAPI`_, it is required that
+commands expecting machine usage be using fine-grained QAPI data types.
+The exception to this rule applies when the command is solely intended
+as a debugging aid and allows for returning unstructured text. This is
+commonly needed for query commands that report aspects of QEMU's
+internal state that are useful to human operators.
+
+In this example we will consider a simplified variant of the HMP
+command ``info roms``. Following the earlier rules, this command will
+need to live under the ``x-`` name prefix, so its QMP implementation
+will be called ``x-query-roms``. It will have no parameters and will
+return a single text string::
+
+ { 'struct': 'HumanReadableText',
+   'data': { 'human-readable-text': 'str' } }
+
+ { 'command': 'x-query-roms',
+   'returns': 'HumanReadableText' }
+
+The ``HumanReadableText`` struct is intended to be used for all
+commands, under the ``x-`` name prefix that are returning unstructured
+text targetted at humans. It should never be used for commands outside
+the ``x-`` name prefix, as those should be using structured QAPI types.
+
+Implementing the QMP command
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The QMP implementation will typically involve creating a ``GString``
+object and printing formatted data into it::
+
+ HumanReadableText *qmp_x_query_roms(Error **errp)
+ {
+     g_autoptr(GString) buf = g_string_new("");
+     Rom *rom;
+
+     QTAILQ_FOREACH(rom, &roms, next) {
+        g_string_append_printf("%s size=0x%06zx name=\"%s\"\n",
+                               memory_region_name(rom->mr),
+                               rom->romsize,
+                               rom->name);
+     }
+
+     return human_readable_text_from_str(buf);
+ }
+
+
+Implementing the HMP command
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Now that the QMP command is in place, we can also make it available in
+the human monitor (HMP) as shown in previous examples. The HMP
+implementations will all look fairly similar, as all they need do is
+invoke the QMP command and then print the resulting text or error
+message. Here's the implementation of the "info roms" HMP command::
+
+ void hmp_info_roms(Monitor *mon, const QDict *qdict)
+ {
+     Error err = NULL;
+     g_autoptr(HumanReadableText) info = qmp_x_query_roms(&err);
+
+     if (hmp_handle_error(mon, err)) {
+         return;
+     }
+     monitor_printf(mon, "%s", info->human_readable_text);
+ }
+
+Also, you have to add the function's prototype to the hmp.h file.
+
+There's one last step to actually make the command available to
+monitor users, we should add it to the hmp-commands-info.hx file::
+
+    {
+        .name       = "roms",
+        .args_type  = "",
+        .params     = "",
+        .help       = "show roms",
+        .cmd        = hmp_info_roms,
+    },
+
+The case of writing a HMP info handler that calls a no-parameter QMP query
+command is quite common. To simplify the implementation there is a general
+purpose HMP info handler for this scenario. All that is required to expose
+a no-parameter QMP query command via HMP is to declare it using the
+'.cmd_info_hrt' field to point to the QMP handler, and leave the '.cmd'
+field NULL::
+
+    {
+        .name         = "roms",
+        .args_type    = "",
+        .params       = "",
+        .help         = "show roms",
+        .cmd_info_hrt = qmp_x_query_roms,
+    },
-- 
2.31.1


