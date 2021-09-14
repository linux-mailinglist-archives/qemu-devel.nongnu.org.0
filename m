Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3351B40B0A1
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 16:30:07 +0200 (CEST)
Received: from localhost ([::1]:57094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ9Rm-0003wu-4o
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 10:30:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9Kd-0001dx-LQ
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:22:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9Ka-00049F-Fc
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:22:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631629359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AKQ5Y6mKD8eeLMm/8Vj1U//cSS0HbEG9luA/4D8pINQ=;
 b=F1X8741Gv376tfj200L2vmhX2xs/UeoRrR6bX57kDAut85Jx4UA4ylku2dxcD3Dijki9FU
 BLBKwawbiX7bzfLDwIzaz2FWJOFgMOLtcpFWPjf32C942dzGjvanagR5uShZeOCBlQrouW
 RwGIv3AiNuHrytQqFejoFL+ezunkMac=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-3kvnxxzgOzWlZw_UBtYRjQ-1; Tue, 14 Sep 2021 10:22:38 -0400
X-MC-Unique: 3kvnxxzgOzWlZw_UBtYRjQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E49B1084681;
 Tue, 14 Sep 2021 14:22:34 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E5B55D9CA;
 Tue, 14 Sep 2021 14:22:15 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/53] docs/devel: add example of command returning
 unstructured text
Date: Tue, 14 Sep 2021 15:19:53 +0100
Message-Id: <20210914142042.1655100-5-berrange@redhat.com>
In-Reply-To: <20210914142042.1655100-1-berrange@redhat.com>
References: <20210914142042.1655100-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Chris Wulff <crwulff@gmail.com>,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Eric Blake <eblake@redhat.com>,
 Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This illustrates how to add a QMP command returning unstructured text,
following the guidelines added in the previous patch. The example uses
a simplified version of 'info roms'.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 docs/devel/writing-monitor-commands.rst | 85 +++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/docs/devel/writing-monitor-commands.rst b/docs/devel/writing-monitor-commands.rst
index d68c552fdd..4cf51ab557 100644
--- a/docs/devel/writing-monitor-commands.rst
+++ b/docs/devel/writing-monitor-commands.rst
@@ -647,3 +647,88 @@ has to traverse the list, it's shown below for reference::
 
      qapi_free_TimerAlarmMethodList(method_list);
  }
+
+Writing a debugging aid returning unstructured text
+---------------------------------------------------
+
+As discussed at the start of the previous example, it is required that
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
+     GString buf = g_string_new("");
+     HumanReadableText ret = g_new0(HumanReadableText, 1);
+     Rom *rom;
+
+     QTAILQ_FOREACH(rom, &roms, next) {
+        g_string_append_printf("%s size=0x%06zx name=\"%s\"\n",
+                               memory_region_name(rom->mr),
+                               rom->romsize,
+                               rom->name);
+     }
+
+     ret->human_readable_text = g_string_free(buf, FALSE);
+
+     return ret;
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


