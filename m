Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3922C22CC
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 11:22:40 +0100 (CET)
Received: from localhost ([::1]:34850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khVT5-0001ad-Ik
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 05:22:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1khVRm-000184-GF
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 05:21:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1khVRk-0000iA-0H
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 05:21:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606213275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GcaTr7TxbOtGgEydNHyubvT1c6qmdnTSR+g4GmXN/20=;
 b=Nw4iYtMQBT29doxueg0/iGhSSgRnogMXq++DjsYfsHHeiPLERP8OPk5QDz2AaC2ImGbxW/
 6MZYh12FuvEgd8n46HsUif8ZpmxtCHnt5gLkD2pyz4HtxwElGESCr+CnSSUAU7ej57vsTg
 xCS92V1Kns2+Tz7rE7UAd3ozkpq0jHE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-H0SvK8mVOKquV1WeKnALYQ-1; Tue, 24 Nov 2020 05:21:13 -0500
X-MC-Unique: H0SvK8mVOKquV1WeKnALYQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A31864144;
 Tue, 24 Nov 2020 10:21:12 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BF6D75D9CA;
 Tue, 24 Nov 2020 10:21:11 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5509F113864E; Tue, 24 Nov 2020 11:21:10 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH] hmp: Changed hmp_netdev_add() using
 qmp_marshal_netdev_add()
References: <20200716035532.1407660-1-andrew@daynix.com>
 <CABcq3pGFPkDMmEegGaw6UjHBijPZiyFj-uR+6Phz+0K44VRNgw@mail.gmail.com>
 <874klk5gnc.fsf@dusky.pond.sub.org>
 <CAOEp5OfjuR97v0VyyHpXJiZVsU1jMphHh86XwAU4t3Uw1T8Ghg@mail.gmail.com>
 <CAOEp5OdiFaCK=Ag8f9oNixhrkW4xoEJ2bXKU7ThXeF9VJXPqTw@mail.gmail.com>
 <CABcq3pGDAO7sB6jobcsiE8_7md1yZ7wGkkyxZefjXGc7-d6obw@mail.gmail.com>
 <87lfesv2zu.fsf@dusky.pond.sub.org>
 <CAOEp5OcAXn0dvvpaZSu3C0rnGPA_NTFKUxqMMKMJx2xzBQ8YiA@mail.gmail.com>
 <87blfnp20k.fsf@dusky.pond.sub.org>
Date: Tue, 24 Nov 2020 11:21:10 +0100
In-Reply-To: <87blfnp20k.fsf@dusky.pond.sub.org> (Markus Armbruster's message
 of "Tue, 24 Nov 2020 09:55:39 +0100")
Message-ID: <87lferm4x5.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Andrew Melnichenko <andrew@daynix.com>, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster <armbru@redhat.com> writes:

> This means commit 08712fcb85 "net: Track netdevs in NetClientState
> rather than QemuOpt" didn't actually replace QemuOpts completely.
>
> This affects QMP:
>
>     $ socat "READLINE,history=$HOME/.qmp_history,prompt=QMP>" UNIX-CONNECT:$HOME/work/images/test-qmp 
>     {"QMP": {"version": {"qemu": {"micro": 92, "minor": 1, "major": 5}, "package": "v5.2.0-rc2-19-gff85db769f-dirty"}, "capabilities": ["oob"]}}
>     QMP>{ "execute": "qmp_capabilities", "arguments": { "enable": ["oob"] } }
>     {"return": {}}
>     QMP>{"execute": "netdev_add", "arguments": {"type": "user", "id":"net0"}}
>     {"return": {}}
>     QMP>{"execute": "netdev_add", "arguments": {"type": "user", "id":"net0"}}
>     {"return": {}}
>
> Results in two netdevs called "net0".  Needs fixing.

Here's my attempt.  If it looks good to you, I'll post it as a proper
patch.


diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index a6a6684df1..8bc6b7bcc6 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1638,9 +1638,7 @@ void hmp_netdev_add(Monitor *mon, const QDict *qdict)
     }
 
     netdev_add(opts, &err);
-    if (err) {
-        qemu_opts_del(opts);
-    }
+    qemu_opts_del(opts);
 
 out:
     hmp_handle_error(mon, err);
diff --git a/net/net.c b/net/net.c
index 794c652282..eb743aca23 100644
--- a/net/net.c
+++ b/net/net.c
@@ -978,6 +978,7 @@ static int (* const net_client_init_fun[NET_CLIENT_DRIVER__MAX])(
 static int net_client_init1(const Netdev *netdev, bool is_netdev, Error **errp)
 {
     NetClientState *peer = NULL;
+    NetClientState *nc;
 
     if (is_netdev) {
         if (netdev->type == NET_CLIENT_DRIVER_NIC ||
@@ -1005,6 +1006,12 @@ static int net_client_init1(const Netdev *netdev, bool is_netdev, Error **errp)
         }
     }
 
+    nc = qemu_find_netdev(netdev->id);
+    if (nc) {
+        error_setg(errp, "Duplicate ID '%s'", netdev->id);
+        return -1;
+    }
+
     if (net_client_init_fun[netdev->type](netdev, netdev->id, peer, errp) < 0) {
         /* FIXME drop when all init functions store an Error */
         if (errp && !*errp) {
@@ -1015,8 +1022,6 @@ static int net_client_init1(const Netdev *netdev, bool is_netdev, Error **errp)
     }
 
     if (is_netdev) {
-        NetClientState *nc;
-
         nc = qemu_find_netdev(netdev->id);
         assert(nc);
         nc->is_netdev = true;
-- 
2.26.2


