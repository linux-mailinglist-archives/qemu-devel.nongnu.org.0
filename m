Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD5043E90A
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 21:39:28 +0200 (CEST)
Received: from localhost ([::1]:51982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgBFG-0001P0-IU
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 15:39:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mgBDU-0008OX-0t
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 15:37:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mgBDP-000147-Ad
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 15:37:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635449850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rchxB5iyw2l7IkGbg40bainTa+kQEnKPw/nHAUdVV/A=;
 b=M0CYw4Vxn9W0LetqZrYIb2Ligg9ZEzqIHNZnG32VTCPtJXBPzr3sasxhR77GcGHs0tZIAz
 +REod9XHfIoN9xDeoOr7t6TeYXWiHWHCvbeoUfAHuyyPVNh4DtHBxT8WJGp2bTI/3l7map
 R33+uO0FCAIcYb4BzXy+NeC/8VMrANU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-w53ikSFXOg6Sp9klfz8-cA-1; Thu, 28 Oct 2021 15:37:27 -0400
X-MC-Unique: w53ikSFXOg6Sp9klfz8-cA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74FD51006AA2;
 Thu, 28 Oct 2021 19:37:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F0A0F5F707;
 Thu, 28 Oct 2021 19:37:08 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8646E11380A7; Thu, 28 Oct 2021 21:37:07 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Reiter <s.reiter@proxmox.com>
Subject: Re: [PATCH v7 0/4] VNC-related HMP/QMP fixes
References: <20211021100135.4146766-1-s.reiter@proxmox.com>
 <87fssl3emb.fsf@dusky.pond.sub.org>
Date: Thu, 28 Oct 2021 21:37:07 +0200
In-Reply-To: <87fssl3emb.fsf@dusky.pond.sub.org> (Markus Armbruster's message
 of "Thu, 28 Oct 2021 07:25:16 +0200")
Message-ID: <87r1c5lz4s.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
Cc: Wolfgang Bumiller <w.bumiller@proxmox.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>, Thomas Lamprecht <t.lamprecht@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster <armbru@redhat.com> writes:

> Stefan Reiter <s.reiter@proxmox.com> writes:
>
>> Since the removal of the generic 'qmp_change' command, one can no longer replace
>> the 'default' VNC display listen address at runtime (AFAIK). For our users who
>> need to set up a secondary VNC access port, this means configuring a second VNC
>> display (in addition to our standard one for web-access), but it turns out one
>> cannot set a password on this second display at the moment, as the
>> 'set_password' call only operates on the 'default' display.
>>
>> Additionally, using secret objects, the password is only read once at startup.
>> This could be considered a bug too, but is not touched in this series and left
>> for a later date.
>
> Queued, thanks!

Unqueued, because it fails to compile with --disable-vnc and with
--disable-spice.  I failed to catch this in review, sorry.

Making it work takes a tiresome amount of #ifdeffery (sketch appended).
Missing: removal of stubs that are no longer used,
e.g. vnc_display_password() in ui/vnc-stubs.c.  Feels like more trouble
than it's worth.

To maximize our chances to get this into 6.2, please respin without the
'if' conditionals.  Yes, this makes introspection less useful, but it's
no worse than before the patch.


diff --git a/qapi/ui.json b/qapi/ui.json
index 5292617b44..39ca0b5ead 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -69,8 +69,10 @@
   'base': { 'protocol': 'DisplayProtocol',
             'password': 'str' },
   'discriminator': 'protocol',
-  'data': { 'vnc': 'SetPasswordOptionsVnc',
-            'spice': 'SetPasswordOptionsSpice' } }
+  'data': { 'vnc': { 'type': 'SetPasswordOptionsVnc',
+                     'if': 'CONFIG_VNC' },
+            'spice': { 'type': 'SetPasswordOptionsSpice',
+                       'if': 'CONFIG_SPICE' } } }
 
 ##
 # @SetPasswordOptionsSpice:
@@ -155,7 +157,8 @@
   'base': { 'protocol': 'DisplayProtocol',
             'time': 'str' },
   'discriminator': 'protocol',
-  'data': { 'vnc': 'ExpirePasswordOptionsVnc' } }
+  'data': { 'vnc': { 'type': 'ExpirePasswordOptionsVnc',
+                     'if': 'CONFIG_VNC' } } }
 
 ##
 # @ExpirePasswordOptionsVnc:
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index f0f0c82d59..f714b2d316 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1451,24 +1451,40 @@ void hmp_set_password(Monitor *mon, const QDict *qdict)
 {
     const char *protocol  = qdict_get_str(qdict, "protocol");
     const char *password  = qdict_get_str(qdict, "password");
+#if defined(CONFIG_SPICE) || defined(CONFIG_VNC)
     const char *display = qdict_get_try_str(qdict, "display");
+#endif
+#ifdef CONFIG_SPICE
     const char *connected = qdict_get_try_str(qdict, "connected");
+#endif
     Error *err = NULL;
+    int proto;
 
     SetPasswordOptions opts = {
         .password = (char *)password,
     };
 
-    opts.protocol = qapi_enum_parse(&DisplayProtocol_lookup, protocol,
-                                    DISPLAY_PROTOCOL_VNC, &err);
+    proto = qapi_enum_parse(&DisplayProtocol_lookup, protocol, -1, &err);
     if (err) {
         goto out;
     }
 
-    if (opts.protocol == DISPLAY_PROTOCOL_VNC) {
+    switch (proto) {
+#ifdef CONFIG_VNC
+    case -1:
+        proto = DISPLAY_PROTOCOL_VNC;
+        /* fall through */
+    case DISPLAY_PROTOCOL_VNC:
         opts.u.vnc.has_display = !!display;
         opts.u.vnc.display = (char *)display;
-    } else if (opts.protocol == DISPLAY_PROTOCOL_SPICE) {
+        break;
+#else
+    case -1:
+        error_setg(&err, "FIXME");
+        goto out;
+#endif
+#ifdef CONFIG_SPICE
+    case DISPLAY_PROTOCOL_SPICE:
         opts.u.spice.has_connected = !!connected;
         opts.u.spice.connected =
             qapi_enum_parse(&SetPasswordAction_lookup, connected,
@@ -1476,8 +1492,13 @@ void hmp_set_password(Monitor *mon, const QDict *qdict)
         if (err) {
             goto out;
         }
+        break;
+#endif
+    default:
+        ;
     }
 
+    opts.protocol = proto;
     qmp_set_password(&opts, &err);
 
 out:
@@ -1488,22 +1509,34 @@ void hmp_expire_password(Monitor *mon, const QDict *qdict)
 {
     const char *protocol  = qdict_get_str(qdict, "protocol");
     const char *whenstr = qdict_get_str(qdict, "time");
+#if defined(CONFIG_SPICE) || defined(CONFIG_VNC)
     const char *display = qdict_get_try_str(qdict, "display");
+#endif
     Error *err = NULL;
+    int proto;
 
     ExpirePasswordOptions opts = {
         .time = (char *)whenstr,
     };
 
-    opts.protocol = qapi_enum_parse(&DisplayProtocol_lookup, protocol,
-                                    DISPLAY_PROTOCOL_VNC, &err);
+    proto = qapi_enum_parse(&DisplayProtocol_lookup, protocol, -1, &err);
     if (err) {
         goto out;
     }
 
-    if (opts.protocol == DISPLAY_PROTOCOL_VNC) {
+    switch (proto) {
+#ifdef CONFIG_VNC
+    case -1:
+        proto = DISPLAY_PROTOCOL_VNC;
+        /* fall through */
+    case DISPLAY_PROTOCOL_VNC:
         opts.u.vnc.has_display = !!display;
         opts.u.vnc.display = (char *)display;
+#else
+    case -1:
+        error_setg(&err, "FIXME");
+        goto out;
+#endif
     }
 
     qmp_expire_password(&opts, &err);
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 4825d0cbea..69a9c2977a 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -167,18 +167,26 @@ void qmp_set_password(SetPasswordOptions *opts, Error **errp)
 {
     int rc = 0;
 
-    if (opts->protocol == DISPLAY_PROTOCOL_SPICE) {
+    switch (opts->protocol) {
+#ifdef CONFIG_SPICE
+    case DISPLAY_PROTOCOL_SPICE:
         if (!qemu_using_spice(errp)) {
             return;
         }
         rc = qemu_spice.set_passwd(opts->password,
                 opts->u.spice.connected == SET_PASSWORD_ACTION_FAIL,
                 opts->u.spice.connected == SET_PASSWORD_ACTION_DISCONNECT);
-    } else {
-        assert(opts->protocol == DISPLAY_PROTOCOL_VNC);
+        break;
+#endif
+#ifdef CONFIG_VNC
+    case DISPLAY_PROTOCOL_VNC:
         /* Note that setting an empty password will not disable login through
          * this interface. */
         rc = vnc_display_password(opts->u.vnc.display, opts->password);
+        break;
+#endif
+    default:
+        abort();
     }
 
     if (rc != 0) {
@@ -202,14 +210,22 @@ void qmp_expire_password(ExpirePasswordOptions *opts, Error **errp)
         when = strtoull(whenstr, NULL, 10);
     }
 
-    if (opts->protocol == DISPLAY_PROTOCOL_SPICE) {
+    switch (opts->protocol) {
+#ifdef CONFIG_SPICE
+    case DISPLAY_PROTOCOL_SPICE:
         if (!qemu_using_spice(errp)) {
             return;
         }
         rc = qemu_spice.set_pw_expire(when);
-    } else {
-        assert(opts->protocol == DISPLAY_PROTOCOL_VNC);
+        break;
+#endif
+#ifdef CONFIG_VNC
+    case DISPLAY_PROTOCOL_VNC:
         rc = vnc_display_pw_expire(opts->u.vnc.display, when);
+        break;
+#endif
+    default:
+        abort();
     }
 
     if (rc != 0) {


