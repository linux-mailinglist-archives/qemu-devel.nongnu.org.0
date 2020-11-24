Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7C22C2857
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 14:40:47 +0100 (CET)
Received: from localhost ([::1]:59930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khYYp-0006sS-13
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 08:40:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1khYUg-0003bW-EX
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 08:36:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1khYUe-0003Pn-Sq
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 08:36:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606224988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lQo3DvsB7M2Qm8kp4lKFMKb4PNcecuOqHRk8rA46ZT0=;
 b=JOPyh2uxBnJun0sryLdM7N/Hnk0mVUXkHdk8DQp7MI7Lz6KYV6Egn8VA2KOPo2aMP56ayZ
 vnaiZ4Udb/VcJTTp8solKKdNUPuJV2a+X1TORHNBf5rdZSzDgEco+hnPpQT6cr2FDWw3AI
 wFrXIKE72BpHTDBozJRptB2iV3hJQwk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-Mm-A5HRXP9SemN_pBU1l5w-1; Tue, 24 Nov 2020 08:36:25 -0500
X-MC-Unique: Mm-A5HRXP9SemN_pBU1l5w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C637D803652;
 Tue, 24 Nov 2020 13:36:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 944755C1A3;
 Tue, 24 Nov 2020 13:36:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 245EC113864E; Tue, 24 Nov 2020 14:36:22 +0100 (CET)
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
 <87lferm4x5.fsf@dusky.pond.sub.org>
 <CAOEp5Oe18jtsgHVqwtm+-sqspD6KoJTOO9nNPmcWS++AVGjXKQ@mail.gmail.com>
 <87tutej3dc.fsf@dusky.pond.sub.org>
Date: Tue, 24 Nov 2020 14:36:22 +0100
In-Reply-To: <87tutej3dc.fsf@dusky.pond.sub.org> (Markus Armbruster's message
 of "Tue, 24 Nov 2020 14:22:55 +0100")
Message-ID: <87blfmj2qx.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

> Yuri Benditovich <yuri.benditovich@daynix.com> writes:
>
>> Please confirm that this patch is intended to solve only the problem with
>> hmp (and disallow duplicated ids)
>
> The intent is to reject duplicate ID and to accept non-duplicate ID, no
> matter how the device is created (CLI, HMP, QMP) or a prior instance was
> deleted (HMP, QMP).
>
>> With it the netdev that was added from qemu's command line and was deleted
>> (for example by hmp) still can't be created, correct?
>
> Yet another case; back to the drawing board...

Next try.  Hope this is one holds water :)


diff --git a/net/net.c b/net/net.c
index 794c652282..c1dc75fc37 100644
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
@@ -1137,6 +1142,7 @@ void qmp_netdev_add(Netdev *netdev, Error **errp)
 void qmp_netdev_del(const char *id, Error **errp)
 {
     NetClientState *nc;
+    QemuOpts *opts;
 
     nc = qemu_find_netdev(id);
     if (!nc) {
@@ -1151,6 +1157,16 @@ void qmp_netdev_del(const char *id, Error **errp)
     }
 
     qemu_del_net_client(nc);
+
+    /*
+     * Wart: we need to delete the QemuOpts associated with netdevs
+     * created via CLI or HMP, to avoid bogus "Duplicate ID" errors in
+     * HMP netdev_add.
+     */
+    opts = qemu_opts_find(qemu_find_opts("netdev"), id);
+    if (opts) {
+        qemu_opts_del(opts);
+    }
 }
 
 static void netfilter_print_info(Monitor *mon, NetFilterState *nf)
-- 
2.26.2


