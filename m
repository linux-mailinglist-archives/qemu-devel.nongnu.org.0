Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE4D41DB26
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 15:34:48 +0200 (CEST)
Received: from localhost ([::1]:60194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVwD1-0001FG-3t
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 09:34:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVw2q-0007yr-5d
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 09:24:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVw2o-0006KP-1r
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 09:24:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633008253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0MfgpxjYFzZldfPBl951SXHClSHbCcSu0hwApfe9K0A=;
 b=RYthB0Y0LTWT/nnVekj16nQKMM4ugFtB3teEduS3Pum9am+wI9ZP8g6B40l0wFx6Dh6fAq
 J4ewK7Hf5MUosnUmg3OVQsvTNzGzP38CpnWrF4q+X3WN/gZTSPRXE1UMGK9mC6/p6fCkLC
 K4VuFkxO8/Fp2MBHvsm4XwpYIlhfJhI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-CrHo3g7XNCGizPANiP8dgg-1; Thu, 30 Sep 2021 09:24:12 -0400
X-MC-Unique: CrHo3g7XNCGizPANiP8dgg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B64219F92B;
 Thu, 30 Sep 2021 13:24:10 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.195.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1298F5D9CA;
 Thu, 30 Sep 2021 13:24:06 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/19] docs/devel: add example of command returning
 unstructured text
Date: Thu, 30 Sep 2021 14:23:34 +0100
Message-Id: <20210930132349.3601823-5-berrange@redhat.com>
In-Reply-To: <20210930132349.3601823-1-berrange@redhat.com>
References: <20210930132349.3601823-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This illustrates how to add a QMP command returning unstructured text,
following the guidelines added in the previous patch. The example uses
a simplified version of 'info roms'.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 docs/devel/writing-monitor-commands.rst | 87 ++++++++++++++++++++++++-
 1 file changed, 86 insertions(+), 1 deletion(-)

diff --git a/docs/devel/writing-monitor-commands.rst b/docs/devel/writing-monitor-commands.rst
index 0f3b751dab..82a382d700 100644
--- a/docs/devel/writing-monitor-commands.rst
+++ b/docs/devel/writing-monitor-commands.rst
@@ -375,7 +375,9 @@ best practices. An example where this approach is taken is the QMP
 command "x-query-registers". This returns a formatted dump of the
 architecture specific CPU state. The way the data is formatted varies
 across QEMU targets, is liable to change over time, and is only
-intended to be consumed as an opaque string by machines.
+intended to be consumed as an opaque string by machines. Refer to the
+`Writing a debugging aid returning unstructured text`_ section for
+an illustration.
 
 User Defined Types
 ~~~~~~~~~~~~~~~~~~
@@ -647,3 +649,86 @@ has to traverse the list, it's shown below for reference::
 
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
+     if (err) {
+         error_report_err(err);
+         return;
+     }
+     monitor_printf(mon, "%s\n", info->human_readable_text);
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
-- 
2.31.1


