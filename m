Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0B6340210
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 10:29:41 +0100 (CET)
Received: from localhost ([::1]:35720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMoyK-0004XY-N2
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 05:29:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lMovH-0002tx-BS
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 05:26:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lMovC-00011T-LN
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 05:26:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616059579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tj35BLfRsfHwwzhHimRH+6bf6Sq6zUZN6Xlo2QirYVs=;
 b=Ql5NGzW6RN/qjE3oQrsbNaruZkTdH3GyAEWNT1JtMnYeZqtBFzdJ+64vk0tLZqEVBYznx4
 1tVw0V7jobaG3zKMOhc553kLDJtwLWfjtfi5xMccwKL77ow76x7dq2280arUW0NjYglEPf
 cDOnCsKiIJQHfElwLigMkrUDblRDrOY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-pnNHb4utPIyCcPkW8978lw-1; Thu, 18 Mar 2021 05:26:18 -0400
X-MC-Unique: pnNHb4utPIyCcPkW8978lw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E86B210509E1;
 Thu, 18 Mar 2021 09:26:15 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-61.ams2.redhat.com
 [10.36.115.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F3D46A8E4;
 Thu, 18 Mar 2021 09:25:40 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/13] ui,
 monitor: remove deprecated VNC ACL option and HMP commands
Date: Thu, 18 Mar 2021 09:25:00 +0000
Message-Id: <20210318092512.250725-2-berrange@redhat.com>
In-Reply-To: <20210318092512.250725-1-berrange@redhat.com>
References: <20210318092512.250725-1-berrange@redhat.com>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The VNC ACL concept has been replaced by the pluggable "authz" framework
which does not use monitor commands.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 docs/system/deprecated.rst       |  16 ---
 docs/system/removed-features.rst |  12 ++
 hmp-commands.hx                  |  76 -------------
 monitor/misc.c                   | 187 -------------------------------
 ui/vnc.c                         |  38 -------
 5 files changed, 12 insertions(+), 317 deletions(-)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 1db30f8f27..0e1fdf5c14 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -28,12 +28,6 @@ The 'file' driver for drives is no longer appropriate for character or host
 devices and will only accept regular files (S_IFREG). The correct driver
 for these file types is 'host_cdrom' or 'host_device' as appropriate.
 
-``-vnc acl`` (since 4.0.0)
-''''''''''''''''''''''''''
-
-The ``acl`` option to the ``-vnc`` argument has been replaced
-by the ``tls-authz`` and ``sasl-authz`` options.
-
 ``QEMU_AUDIO_`` environment variables and ``-audio-help`` (since 4.0)
 '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
@@ -281,16 +275,6 @@ Use the more generic commands ``block-export-add`` and ``block-export-del``
 instead.  As part of this deprecation, where ``nbd-server-add`` used a
 single ``bitmap``, the new ``block-export-add`` uses a list of ``bitmaps``.
 
-Human Monitor Protocol (HMP) commands
--------------------------------------
-
-``acl_show``, ``acl_reset``, ``acl_policy``, ``acl_add``, ``acl_remove`` (since 4.0.0)
-''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
-
-The ``acl_show``, ``acl_reset``, ``acl_policy``, ``acl_add``, and
-``acl_remove`` commands are deprecated with no replacement. Authorization
-for VNC should be performed using the pluggable QAuthZ objects.
-
 System emulator CPUS
 --------------------
 
diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
index 82e7fcc517..aa612c2846 100644
--- a/docs/system/removed-features.rst
+++ b/docs/system/removed-features.rst
@@ -45,6 +45,11 @@ This option lacked the possibility to specify an audio backend device.
 Use ``-device usb-audio`` now instead (and specify a corresponding USB
 host controller or ``-usb`` if necessary).
 
+``-vnc acl`` (removed in 6.0)
+'''''''''''''''''''''''''''''
+
+The ``acl`` option to the ``-vnc`` argument has been replaced
+by the ``tls-authz`` and ``sasl-authz`` options.
 
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
@@ -87,6 +92,13 @@ documentation of ``query-hotpluggable-cpus`` for additional details.
 No replacement.  The ``change vnc password`` and ``change DEVICE MEDIUM``
 commands are not affected.
 
+``acl_show``, ``acl_reset``, ``acl_policy``, ``acl_add``, ``acl_remove`` (removed in 6.0)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+The ``acl_show``, ``acl_reset``, ``acl_policy``, ``acl_add``, and
+``acl_remove`` commands were removed with no replacement. Authorization
+for VNC should be performed using the pluggable QAuthZ objects.
+
 Guest Emulator ISAs
 -------------------
 
diff --git a/hmp-commands.hx b/hmp-commands.hx
index d4001f9c5d..b500b8526d 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1433,82 +1433,6 @@ SRST
   Change watchdog action.
 ERST
 
-    {
-        .name       = "acl_show",
-        .args_type  = "aclname:s",
-        .params     = "aclname",
-        .help       = "list rules in the access control list",
-        .cmd        = hmp_acl_show,
-    },
-
-SRST
-``acl_show`` *aclname*
-  List all the matching rules in the access control list, and the default
-  policy. There are currently two named access control lists,
-  *vnc.x509dname* and *vnc.username* matching on the x509 client
-  certificate distinguished name, and SASL username respectively.
-ERST
-
-    {
-        .name       = "acl_policy",
-        .args_type  = "aclname:s,policy:s",
-        .params     = "aclname allow|deny",
-        .help       = "set default access control list policy",
-        .cmd        = hmp_acl_policy,
-    },
-
-SRST
-``acl_policy`` *aclname* ``allow|deny``
-  Set the default access control list policy, used in the event that
-  none of the explicit rules match. The default policy at startup is
-  always ``deny``.
-ERST
-
-    {
-        .name       = "acl_add",
-        .args_type  = "aclname:s,match:s,policy:s,index:i?",
-        .params     = "aclname match allow|deny [index]",
-        .help       = "add a match rule to the access control list",
-        .cmd        = hmp_acl_add,
-    },
-
-SRST
-``acl_add`` *aclname* *match* ``allow|deny`` [*index*]
-  Add a match rule to the access control list, allowing or denying access.
-  The match will normally be an exact username or x509 distinguished name,
-  but can optionally include wildcard globs. eg ``*@EXAMPLE.COM`` to
-  allow all users in the ``EXAMPLE.COM`` kerberos realm. The match will
-  normally be appended to the end of the ACL, but can be inserted
-  earlier in the list if the optional *index* parameter is supplied.
-ERST
-
-    {
-        .name       = "acl_remove",
-        .args_type  = "aclname:s,match:s",
-        .params     = "aclname match",
-        .help       = "remove a match rule from the access control list",
-        .cmd        = hmp_acl_remove,
-    },
-
-SRST
-``acl_remove`` *aclname* *match*
-  Remove the specified match rule from the access control list.
-ERST
-
-    {
-        .name       = "acl_reset",
-        .args_type  = "aclname:s",
-        .params     = "aclname",
-        .help       = "reset the access control list",
-        .cmd        = hmp_acl_reset,
-    },
-
-SRST
-``acl_reset`` *aclname*
-  Remove all matches from the access control list, and set the default
-  policy back to ``deny``.
-ERST
-
     {
         .name       = "nbd_server_start",
         .args_type  = "all:-a,writable:-w,uri:s",
diff --git a/monitor/misc.c b/monitor/misc.c
index a7650ed747..d9ed2bacef 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -1045,193 +1045,6 @@ static void hmp_wavcapture(Monitor *mon, const QDict *qdict)
     QLIST_INSERT_HEAD (&capture_head, s, entries);
 }
 
-static QAuthZList *find_auth(Monitor *mon, const char *name)
-{
-    Object *obj;
-    Object *container;
-
-    container = object_get_objects_root();
-    obj = object_resolve_path_component(container, name);
-    if (!obj) {
-        monitor_printf(mon, "acl: unknown list '%s'\n", name);
-        return NULL;
-    }
-
-    return QAUTHZ_LIST(obj);
-}
-
-static bool warn_acl;
-static void hmp_warn_acl(void)
-{
-    if (warn_acl) {
-        return;
-    }
-    error_report("The acl_show, acl_reset, acl_policy, acl_add, acl_remove "
-                 "commands are deprecated with no replacement. Authorization "
-                 "for VNC should be performed using the pluggable QAuthZ "
-                 "objects");
-    warn_acl = true;
-}
-
-static void hmp_acl_show(Monitor *mon, const QDict *qdict)
-{
-    const char *aclname = qdict_get_str(qdict, "aclname");
-    QAuthZList *auth = find_auth(mon, aclname);
-    QAuthZListRuleList *rules;
-    size_t i = 0;
-
-    hmp_warn_acl();
-
-    if (!auth) {
-        return;
-    }
-
-    monitor_printf(mon, "policy: %s\n",
-                   QAuthZListPolicy_str(auth->policy));
-
-    rules = auth->rules;
-    while (rules) {
-        QAuthZListRule *rule = rules->value;
-        i++;
-        monitor_printf(mon, "%zu: %s %s\n", i,
-                       QAuthZListPolicy_str(rule->policy),
-                       rule->match);
-        rules = rules->next;
-    }
-}
-
-static void hmp_acl_reset(Monitor *mon, const QDict *qdict)
-{
-    const char *aclname = qdict_get_str(qdict, "aclname");
-    QAuthZList *auth = find_auth(mon, aclname);
-
-    hmp_warn_acl();
-
-    if (!auth) {
-        return;
-    }
-
-    auth->policy = QAUTHZ_LIST_POLICY_DENY;
-    qapi_free_QAuthZListRuleList(auth->rules);
-    auth->rules = NULL;
-    monitor_printf(mon, "acl: removed all rules\n");
-}
-
-static void hmp_acl_policy(Monitor *mon, const QDict *qdict)
-{
-    const char *aclname = qdict_get_str(qdict, "aclname");
-    const char *policy = qdict_get_str(qdict, "policy");
-    QAuthZList *auth = find_auth(mon, aclname);
-    int val;
-    Error *err = NULL;
-
-    hmp_warn_acl();
-
-    if (!auth) {
-        return;
-    }
-
-    val = qapi_enum_parse(&QAuthZListPolicy_lookup,
-                          policy,
-                          QAUTHZ_LIST_POLICY_DENY,
-                          &err);
-    if (err) {
-        error_free(err);
-        monitor_printf(mon, "acl: unknown policy '%s', "
-                       "expected 'deny' or 'allow'\n", policy);
-    } else {
-        auth->policy = val;
-        if (auth->policy == QAUTHZ_LIST_POLICY_ALLOW) {
-            monitor_printf(mon, "acl: policy set to 'allow'\n");
-        } else {
-            monitor_printf(mon, "acl: policy set to 'deny'\n");
-        }
-    }
-}
-
-static QAuthZListFormat hmp_acl_get_format(const char *match)
-{
-    if (strchr(match, '*')) {
-        return QAUTHZ_LIST_FORMAT_GLOB;
-    } else {
-        return QAUTHZ_LIST_FORMAT_EXACT;
-    }
-}
-
-static void hmp_acl_add(Monitor *mon, const QDict *qdict)
-{
-    const char *aclname = qdict_get_str(qdict, "aclname");
-    const char *match = qdict_get_str(qdict, "match");
-    const char *policystr = qdict_get_str(qdict, "policy");
-    int has_index = qdict_haskey(qdict, "index");
-    int index = qdict_get_try_int(qdict, "index", -1);
-    QAuthZList *auth = find_auth(mon, aclname);
-    Error *err = NULL;
-    QAuthZListPolicy policy;
-    QAuthZListFormat format;
-    size_t i = 0;
-
-    hmp_warn_acl();
-
-    if (!auth) {
-        return;
-    }
-
-    policy = qapi_enum_parse(&QAuthZListPolicy_lookup,
-                             policystr,
-                             QAUTHZ_LIST_POLICY_DENY,
-                             &err);
-    if (err) {
-        error_free(err);
-        monitor_printf(mon, "acl: unknown policy '%s', "
-                       "expected 'deny' or 'allow'\n", policystr);
-        return;
-    }
-
-    format = hmp_acl_get_format(match);
-
-    if (has_index && index == 0) {
-        monitor_printf(mon, "acl: unable to add acl entry\n");
-        return;
-    }
-
-    if (has_index) {
-        i = qauthz_list_insert_rule(auth, match, policy,
-                                    format, index - 1, &err);
-    } else {
-        i = qauthz_list_append_rule(auth, match, policy,
-                                    format, &err);
-    }
-    if (err) {
-        monitor_printf(mon, "acl: unable to add rule: %s",
-                       error_get_pretty(err));
-        error_free(err);
-    } else {
-        monitor_printf(mon, "acl: added rule at position %zu\n", i + 1);
-    }
-}
-
-static void hmp_acl_remove(Monitor *mon, const QDict *qdict)
-{
-    const char *aclname = qdict_get_str(qdict, "aclname");
-    const char *match = qdict_get_str(qdict, "match");
-    QAuthZList *auth = find_auth(mon, aclname);
-    ssize_t i = 0;
-
-    hmp_warn_acl();
-
-    if (!auth) {
-        return;
-    }
-
-    i = qauthz_list_delete_rule(auth, match);
-    if (i >= 0) {
-        monitor_printf(mon, "acl: removed rule at position %zu\n", i + 1);
-    } else {
-        monitor_printf(mon, "acl: no matching acl entry\n");
-    }
-}
-
 void qmp_getfd(const char *fdname, Error **errp)
 {
     Monitor *cur_mon = monitor_cur();
diff --git a/ui/vnc.c b/ui/vnc.c
index 9c004a11f4..e0fac2136e 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -3507,9 +3507,6 @@ static QemuOptsList qemu_vnc_opts = {
         },{
             .name = "sasl",
             .type = QEMU_OPT_BOOL,
-        },{
-            .name = "acl",
-            .type = QEMU_OPT_BOOL,
         },{
             .name = "tls-authz",
             .type = QEMU_OPT_STRING,
@@ -3961,7 +3958,6 @@ void vnc_display_open(const char *id, Error **errp)
     bool reverse = false;
     const char *credid;
     bool sasl = false;
-    int acl = 0;
     const char *tlsauthz;
     const char *saslauthz;
     int lock_key_sync = 1;
@@ -4053,29 +4049,13 @@ void vnc_display_open(const char *id, Error **errp)
             goto fail;
         }
     }
-    if (qemu_opt_get(opts, "acl")) {
-        error_report("The 'acl' option to -vnc is deprecated. "
-                     "Please use the 'tls-authz' and 'sasl-authz' "
-                     "options instead");
-    }
-    acl = qemu_opt_get_bool(opts, "acl", false);
     tlsauthz = qemu_opt_get(opts, "tls-authz");
-    if (acl && tlsauthz) {
-        error_setg(errp, "'acl' option is mutually exclusive with the "
-                   "'tls-authz' option");
-        goto fail;
-    }
     if (tlsauthz && !vd->tlscreds) {
         error_setg(errp, "'tls-authz' provided but TLS is not enabled");
         goto fail;
     }
 
     saslauthz = qemu_opt_get(opts, "sasl-authz");
-    if (acl && saslauthz) {
-        error_setg(errp, "'acl' option is mutually exclusive with the "
-                   "'sasl-authz' option");
-        goto fail;
-    }
     if (saslauthz && !sasl) {
         error_setg(errp, "'sasl-authz' provided but SASL auth is not enabled");
         goto fail;
@@ -4113,29 +4093,11 @@ void vnc_display_open(const char *id, Error **errp)
 
     if (tlsauthz) {
         vd->tlsauthzid = g_strdup(tlsauthz);
-    } else if (acl) {
-        if (strcmp(vd->id, "default") == 0) {
-            vd->tlsauthzid = g_strdup("vnc.x509dname");
-        } else {
-            vd->tlsauthzid = g_strdup_printf("vnc.%s.x509dname", vd->id);
-        }
-        vd->tlsauthz = QAUTHZ(qauthz_list_new(vd->tlsauthzid,
-                                              QAUTHZ_LIST_POLICY_DENY,
-                                              &error_abort));
     }
 #ifdef CONFIG_VNC_SASL
     if (sasl) {
         if (saslauthz) {
             vd->sasl.authzid = g_strdup(saslauthz);
-        } else if (acl) {
-            if (strcmp(vd->id, "default") == 0) {
-                vd->sasl.authzid = g_strdup("vnc.username");
-            } else {
-                vd->sasl.authzid = g_strdup_printf("vnc.%s.username", vd->id);
-            }
-            vd->sasl.authz = QAUTHZ(qauthz_list_new(vd->sasl.authzid,
-                                                    QAUTHZ_LIST_POLICY_DENY,
-                                                    &error_abort));
         }
     }
 #endif
-- 
2.30.2


