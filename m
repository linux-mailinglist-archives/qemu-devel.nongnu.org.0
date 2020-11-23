Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4372C023D
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 10:28:08 +0100 (CET)
Received: from localhost ([::1]:48270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh88l-0007pA-HQ
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 04:28:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kh86Y-0006SK-FQ
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 04:25:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kh86V-0001h5-Kr
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 04:25:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606123546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B96XAEf3WZO9qo3Ch3iqHicG3ML2rRK3r49vIqxqPg4=;
 b=eCRz5plsNhyfR31AzH6Bka+U6VJMYAqP9nd+LzfzQ/KYB9r1+h0Ue90lBkal/HVdQ4ruCJ
 c8ykMY2YySVyqhPL7TwMDksv1ab4knejBAOuK2Jukaj9pkkNQ96idUFICJPtQ6JgB+6wZE
 OnXbYksFXvRYw2Y/aiTVvGDIjT6u+2c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-93p3xJjEPBqoY_VWI_o_Hg-1; Mon, 23 Nov 2020 04:25:44 -0500
X-MC-Unique: 93p3xJjEPBqoY_VWI_o_Hg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E93A9CC1F;
 Mon, 23 Nov 2020 09:25:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DC26060BF3;
 Mon, 23 Nov 2020 09:25:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 637F711358BA; Mon, 23 Nov 2020 10:25:41 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Andrew Melnichenko <andrew@daynix.com>
Subject: Re: [PATCH] hmp: Changed hmp_netdev_add() using
 qmp_marshal_netdev_add()
References: <20200716035532.1407660-1-andrew@daynix.com>
 <CABcq3pGFPkDMmEegGaw6UjHBijPZiyFj-uR+6Phz+0K44VRNgw@mail.gmail.com>
 <874klk5gnc.fsf@dusky.pond.sub.org>
 <CAOEp5OfjuR97v0VyyHpXJiZVsU1jMphHh86XwAU4t3Uw1T8Ghg@mail.gmail.com>
 <CAOEp5OdiFaCK=Ag8f9oNixhrkW4xoEJ2bXKU7ThXeF9VJXPqTw@mail.gmail.com>
 <CABcq3pGDAO7sB6jobcsiE8_7md1yZ7wGkkyxZefjXGc7-d6obw@mail.gmail.com>
Date: Mon, 23 Nov 2020 10:25:41 +0100
In-Reply-To: <CABcq3pGDAO7sB6jobcsiE8_7md1yZ7wGkkyxZefjXGc7-d6obw@mail.gmail.com>
 (Andrew Melnichenko's message of "Sun, 22 Nov 2020 12:17:50 +0200")
Message-ID: <87lfesv2zu.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Andrew Melnichenko <andrew@daynix.com> writes:

> --000000000000f73b2205b4aef0c5
> Content-Type: text/plain; charset="UTF-8"
>
> Hi, the bug can be reproduced like that:
>
>> QEMU 5.1.50 monitor - type 'help' for more information
>> (qemu) netdev_add
>> type=tap,id=net0,script=/home/and/SRCS/qemu/ifup.sh,downscript=no
>> (qemu) info network
>> hub 0
>>  \ hub0port1: __org.qemu.net1: index=0,type=user,net=10.0.2.0,restrict=off
>>  \ hub0port0: e1000e.0:
>> index=0,type=nic,model=e1000e,macaddr=52:54:00:12:34:56
>> dnet0: index=0,type=nic,model=virtio-net-pci,macaddr=52:54:00:12:34:57
>> net0:
>> index=0,type=tap,ifname=tap0,script=/home/and/SRCS/qemu/ifup.sh,downscript=no
>> (qemu) netdev_del net0
>> (qemu) info network
>> hub 0
>>  \ hub0port1: __org.qemu.net1: index=0,type=user,net=10.0.2.0,restrict=off
>>  \ hub0port0: e1000e.0:
>> index=0,type=nic,model=e1000e,macaddr=52:54:00:12:34:56
>> dnet0: index=0,type=nic,model=virtio-net-pci,macaddr=52:54:00:12:34:57
>> (qemu) netdev_add
>> type=tap,id=net0,script=/home/and/SRCS/qemu/ifup.sh,downscript=no
>> Try "help netdev_add" for more information
>> (qemu) info network
>> hub 0
>>  \ hub0port1: __org.qemu.net1: index=0,type=user,net=10.0.2.0,restrict=off
>>  \ hub0port0: e1000e.0:
>> index=0,type=nic,model=e1000e,macaddr=52:54:00:12:34:56
>> dnet0: index=0,type=nic,model=virtio-net-pci,macaddr=52:54:00:12:34:57
>> (qemu)
>>
>>
> Its still actual bug - I've checked it with the
> master(2c6605389c1f76973d92b69b85d40d94b8f1092c).

I can see this with an even simpler reproducer:

    $ qemu-system-x86_64 -S -display none -nodefaults -monitor stdio
    QEMU 5.1.92 monitor - type 'help' for more information
    (qemu) netdev_add user,id=net0
    (qemu) info network
    net0: index=0,type=user,net=10.0.2.0,restrict=off
    (qemu) netdev_del net0
    (qemu) info network
    (qemu) netdev_add user,id=net0
    upstream-qemu: Duplicate ID 'net0' for netdev
    Try "help netdev_add" for more information

The appended patch fixes it for me.  It relies on nothing using the
"netdev" QemuOpts anymore.  Eric, what do you think?


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


