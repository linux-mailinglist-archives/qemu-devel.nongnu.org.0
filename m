Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9C42C2092
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 09:58:45 +0100 (CET)
Received: from localhost ([::1]:38892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khU9t-0005Im-1S
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 03:58:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1khU71-0002db-EW
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 03:55:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1khU6z-00049Z-EG
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 03:55:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606208144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xVcKPVo+1qjDrthcoSp3KX1OU+hI40e6oUBPYmKqXWA=;
 b=UCQwIhJsAtcHy/uHtY5qQwiVcDFPGw1W+AGOhwJJwpe2TVtWeXC4k8elS4gcen3VDb5ZiW
 qYpQ1njtUvc+iA9QkgZ/FVIBokDivzn3/gdLqqCPPLRzBEk5pu/11gctSNn5UZToZKgn7S
 1GjkvHVv4C4atP+QCZquJsxGsmg23wo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-Xd0bCFyrMvCk8_obUmfkUg-1; Tue, 24 Nov 2020 03:55:42 -0500
X-MC-Unique: Xd0bCFyrMvCk8_obUmfkUg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B795805BE0;
 Tue, 24 Nov 2020 08:55:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 26EED5D71B;
 Tue, 24 Nov 2020 08:55:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A79F4113864E; Tue, 24 Nov 2020 09:55:39 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Yuri Benditovich <yuri.benditovich@daynix.com>
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
Date: Tue, 24 Nov 2020 09:55:39 +0100
In-Reply-To: <CAOEp5OcAXn0dvvpaZSu3C0rnGPA_NTFKUxqMMKMJx2xzBQ8YiA@mail.gmail.com>
 (Yuri Benditovich's message of "Mon, 23 Nov 2020 17:35:30 +0200")
Message-ID: <87blfnp20k.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: Yan Vugenfirer <yan@daynix.com>, Andrew Melnichenko <andrew@daynix.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Yuri Benditovich <yuri.benditovich@daynix.com> writes:

> On Mon, Nov 23, 2020 at 11:25 AM Markus Armbruster <armbru@redhat.com>
> wrote:
>
>> Andrew Melnichenko <andrew@daynix.com> writes:
>>
>> > --000000000000f73b2205b4aef0c5
>> > Content-Type: text/plain; charset="UTF-8"
>> >
>> > Hi, the bug can be reproduced like that:
>> >
>> >> QEMU 5.1.50 monitor - type 'help' for more information
>> >> (qemu) netdev_add
>> >> type=tap,id=net0,script=/home/and/SRCS/qemu/ifup.sh,downscript=no
>> >> (qemu) info network
>> >> hub 0
>> >>  \ hub0port1: __org.qemu.net1:
>> index=0,type=user,net=10.0.2.0,restrict=off
>> >>  \ hub0port0: e1000e.0:
>> >> index=0,type=nic,model=e1000e,macaddr=52:54:00:12:34:56
>> >> dnet0: index=0,type=nic,model=virtio-net-pci,macaddr=52:54:00:12:34:57
>> >> net0:
>> >>
>> index=0,type=tap,ifname=tap0,script=/home/and/SRCS/qemu/ifup.sh,downscript=no
>> >> (qemu) netdev_del net0
>> >> (qemu) info network
>> >> hub 0
>> >>  \ hub0port1: __org.qemu.net1:
>> index=0,type=user,net=10.0.2.0,restrict=off
>> >>  \ hub0port0: e1000e.0:
>> >> index=0,type=nic,model=e1000e,macaddr=52:54:00:12:34:56
>> >> dnet0: index=0,type=nic,model=virtio-net-pci,macaddr=52:54:00:12:34:57
>> >> (qemu) netdev_add
>> >> type=tap,id=net0,script=/home/and/SRCS/qemu/ifup.sh,downscript=no
>> >> Try "help netdev_add" for more information
>> >> (qemu) info network
>> >> hub 0
>> >>  \ hub0port1: __org.qemu.net1:
>> index=0,type=user,net=10.0.2.0,restrict=off
>> >>  \ hub0port0: e1000e.0:
>> >> index=0,type=nic,model=e1000e,macaddr=52:54:00:12:34:56
>> >> dnet0: index=0,type=nic,model=virtio-net-pci,macaddr=52:54:00:12:34:57
>> >> (qemu)
>> >>
>> >>
>> > Its still actual bug - I've checked it with the
>> > master(2c6605389c1f76973d92b69b85d40d94b8f1092c).
>>
>> I can see this with an even simpler reproducer:
>>
>>     $ qemu-system-x86_64 -S -display none -nodefaults -monitor stdio
>>     QEMU 5.1.92 monitor - type 'help' for more information
>>     (qemu) netdev_add user,id=net0
>>     (qemu) info network
>>     net0: index=0,type=user,net=10.0.2.0,restrict=off
>>     (qemu) netdev_del net0
>>     (qemu) info network
>>     (qemu) netdev_add user,id=net0
>>     upstream-qemu: Duplicate ID 'net0' for netdev
>>     Try "help netdev_add" for more information
>>
>> The appended patch fixes it for me.  It relies on nothing using the
>> "netdev" QemuOpts anymore.  Eric, what do you think?
>>
>>
>> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
>> index a6a6684df1..8bc6b7bcc6 100644
>> --- a/monitor/hmp-cmds.c
>> +++ b/monitor/hmp-cmds.c
>> @@ -1638,9 +1638,7 @@ void hmp_netdev_add(Monitor *mon, const QDict *qdict)
>>      }
>>
>>      netdev_add(opts, &err);
>> -    if (err) {
>> -        qemu_opts_del(opts);
>> -    }
>> +    qemu_opts_del(opts);
>>
>>
> Unfortunately, if I'm not mistaken, with this fix qemu will be able to
> create from hmp several devices with the same id
> (which is not expected).
> For example:
> netdev_add user,id=net0
> netdev_add user,id=net0
> info network lists 2 devices net0

This means commit 08712fcb85 "net: Track netdevs in NetClientState
rather than QemuOpt" didn't actually replace QemuOpts completely.

This affects QMP:

    $ socat "READLINE,history=$HOME/.qmp_history,prompt=QMP>" UNIX-CONNECT:$HOME/work/images/test-qmp 
    {"QMP": {"version": {"qemu": {"micro": 92, "minor": 1, "major": 5}, "package": "v5.2.0-rc2-19-gff85db769f-dirty"}, "capabilities": ["oob"]}}
    QMP>{ "execute": "qmp_capabilities", "arguments": { "enable": ["oob"] } }
    {"return": {}}
    QMP>{"execute": "netdev_add", "arguments": {"type": "user", "id":"net0"}}
    {"return": {}}
    QMP>{"execute": "netdev_add", "arguments": {"type": "user", "id":"net0"}}
    {"return": {}}

Results in two netdevs called "net0".  Needs fixing.


