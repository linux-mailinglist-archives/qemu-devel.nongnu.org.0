Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0776738C430
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 11:57:43 +0200 (CEST)
Received: from localhost ([::1]:56084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk1uX-0005oe-Me
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 05:57:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lk1q4-00045m-G7
 for qemu-devel@nongnu.org; Fri, 21 May 2021 05:53:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lk1q0-0007Ng-49
 for qemu-devel@nongnu.org; Fri, 21 May 2021 05:53:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621590779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wy3gOZRB6ny1DUwp6iJ+NdjXJ82hPEVWPCK+sTZn65Y=;
 b=Frh449X3jXKXmXFBZl5can/qsrzYphpzCMRtN30M+nZdsVBxvlvVnVztyMIdxQToYHC9mx
 4C7iKolvss9bVLtbPtLlyPbqtLlsY21G79muvEuT2oIwPujWdPYGw4A45zuGYG+k/TCdE7
 IWjeZoj3Y0QKwpmgbC5W6UFfjgmcnHM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-GrMIZrw7PYWIvKBiDQming-1; Fri, 21 May 2021 05:52:57 -0400
X-MC-Unique: GrMIZrw7PYWIvKBiDQming-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36414501EE;
 Fri, 21 May 2021 09:52:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-41.ams2.redhat.com
 [10.36.112.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BC06A9473;
 Fri, 21 May 2021 09:52:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 563F6113865F; Fri, 21 May 2021 11:52:54 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v7 02/12] accel: Introduce 'query-accels' QMP command
References: <20210505125806.1263441-1-philmd@redhat.com>
 <20210505125806.1263441-3-philmd@redhat.com>
 <875yzcjvly.fsf@dusky.pond.sub.org>
Date: Fri, 21 May 2021 11:52:54 +0200
In-Reply-To: <875yzcjvly.fsf@dusky.pond.sub.org> (Markus Armbruster's message
 of "Fri, 21 May 2021 11:15:37 +0200")
Message-ID: <87wnrsifbd.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster <armbru@redhat.com> writes:

> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>
>> Introduce the 'query-accels' QMP command which returns a list
>> of built-in accelerator names.
>>
>> - Accelerator is a QAPI enum of all existing accelerators,
>>
>> - AcceleratorInfo is a QAPI structure providing accelerator
>>   specific information. Currently the common structure base
>>   provides the name of the accelerator, while the specific
>>   part is empty, but each accelerator can expand it.
>>
>> - 'query-accels' QMP command returns a list of @AcceleratorInfo
>>
>> For example on a KVM-only build we get:
>>
>>     { "execute": "query-accels" }
>>     {
>>         "return": [
>>             {
>>                 "name": "qtest"
>>             },
>>             {
>>                 "name": "kvm"
>>             }
>>         ]
>>     }
>>
>> Note that we can't make the enum values or union branches conditional

"union branches" existed in a previous iteration, but no more.

>> because of target-specific poisoning of accelerator definitions.
>
> I second Eduardo's plea to explain this more clearly.  It's important,
> because if a properly conditionalized enum is feasible, then query-accel
> isn't needed.

The appended incremental patch conditionalizes the enum.  It applies on
top of the series, and passes "make check" for me.  Seems to contradict
"we can't make the enum values conditional".


diff --git a/qapi/machine-target.json b/qapi/machine-target.json
index e7811654b7..586a61b5d9 100644
--- a/qapi/machine-target.json
+++ b/qapi/machine-target.json
@@ -329,3 +329,57 @@
 ##
 { 'command': 'query-cpu-definitions', 'returns': ['CpuDefinitionInfo'],
   'if': 'defined(TARGET_PPC) || defined(TARGET_ARM) || defined(TARGET_I386=
) || defined(TARGET_S390X) || defined(TARGET_MIPS)' }
+
+##
+# @Accelerator:
+#
+# An enumeration of accelerator names.
+#
+# Since: 6.1
+##
+{ 'enum': 'Accelerator',
+  'data': [
+      { 'name': 'hax', 'if': 'defined(CONFIG_HAX)' },
+      { 'name': 'hvf', 'if': 'defined(CONFIG_HVF)' },
+      { 'name': 'kvm', 'if': 'defined(CONFIG_KVM)' },
+      { 'name': 'qtest' },
+      { 'name': 'tcg', 'if': 'defined(CONFIG_TCG)' },
+      { 'name': 'whpx', 'if': 'defined(CONFIG_WHPX)' },
+      { 'name': 'xen', 'if': 'defined(CONFIG_XEN_BACKEND)' } ] }
+
+##
+# @AcceleratorInfo:
+#
+# Accelerator information.
+#
+# @name: The accelerator name.
+#
+# Since: 6.1
+##
+{ 'struct': 'AcceleratorInfo',
+  'data': { 'name': 'Accelerator' } }
+
+##
+# @query-accels:
+#
+# Get a list of AcceleratorInfo for all built-in accelerators.
+#
+# Returns: a list of @AcceleratorInfo describing each accelerator.
+#
+# Since: 6.1
+#
+# Example:
+#
+# -> { "execute": "query-accels" }
+# <- { "return": [
+#        {
+#            "name": "qtest"
+#        },
+#        {
+#            "name": "kvm"
+#        }
+#    ] }
+#
+##
+{ 'command': 'query-accels',
+  'returns': ['AcceleratorInfo'] }
diff --git a/qapi/machine.json b/qapi/machine.json
index 79a0891793..58a9c86b36 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1274,50 +1274,3 @@
 ##
 { 'event': 'MEM_UNPLUG_ERROR',
   'data': { 'device': 'str', 'msg': 'str' } }
-
-##
-# @Accelerator:
-#
-# An enumeration of accelerator names.
-#
-# Since: 6.1
-##
-{ 'enum': 'Accelerator',
-  'data': [ 'hax', 'hvf', 'kvm', 'qtest', 'tcg', 'whpx', 'xen' ] }
-
-##
-# @AcceleratorInfo:
-#
-# Accelerator information.
-#
-# @name: The accelerator name.
-#
-# Since: 6.1
-##
-{ 'struct': 'AcceleratorInfo',
-  'data': { 'name': 'Accelerator' } }
-
-##
-# @query-accels:
-#
-# Get a list of AcceleratorInfo for all built-in accelerators.
-#
-# Returns: a list of @AcceleratorInfo describing each accelerator.
-#
-# Since: 6.1
-#
-# Example:
-#
-# -> { "execute": "query-accels" }
-# <- { "return": [
-#        {
-#            "name": "qtest"
-#        },
-#        {
-#            "name": "kvm"
-#        }
-#    ] }
-#
-##
-{ 'command': 'query-accels',
-  'returns': ['AcceleratorInfo'] }
diff --git a/accel/accel-qmp.c b/accel/accel-qmp.c
index 426737b3f9..aca90f8682 100644
--- a/accel/accel-qmp.c
+++ b/accel/accel-qmp.c
@@ -7,42 +7,18 @@
  */
=20
 #include "qemu/osdep.h"
-#include "qapi/qapi-commands-machine.h"
-
-static const bool accel_builtin_list[ACCELERATOR__MAX] =3D {
-    [ACCELERATOR_QTEST] =3D true,
-#ifdef CONFIG_TCG
-    [ACCELERATOR_TCG] =3D true,
-#endif
-#ifdef CONFIG_KVM
-    [ACCELERATOR_KVM] =3D true,
-#endif
-#ifdef CONFIG_HAX
-    [ACCELERATOR_HAX] =3D true,
-#endif
-#ifdef CONFIG_HVF
-    [ACCELERATOR_HVF] =3D true,
-#endif
-#ifdef CONFIG_WHPX
-    [ACCELERATOR_WHPX] =3D true,
-#endif
-#ifdef CONFIG_XEN_BACKEND
-    [ACCELERATOR_XEN] =3D true,
-#endif
-};
+#include "qapi/qapi-commands-machine-target.h"
=20
 AcceleratorInfoList *qmp_query_accels(Error **errp)
 {
     AcceleratorInfoList *list =3D NULL, **tail =3D &list;
=20
     for (Accelerator accel =3D 0; accel < ACCELERATOR__MAX; accel++) {
-        if (accel_builtin_list[accel]) {
-            AcceleratorInfo *info =3D g_new0(AcceleratorInfo, 1);
+        AcceleratorInfo *info =3D g_new0(AcceleratorInfo, 1);
=20
-            info->name =3D accel;
+        info->name =3D accel;
=20
-            QAPI_LIST_APPEND(tail, info);
-        }
+        QAPI_LIST_APPEND(tail, info);
     }
=20
     return list;


