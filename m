Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9F62C0E1E
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 15:51:52 +0100 (CET)
Received: from localhost ([::1]:36892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khDC3-0003D5-MI
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 09:51:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1khCtt-000443-Cr
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 09:33:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1khCtq-0005ph-U7
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 09:33:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606141980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sAtbEYD3ofD3z8H1oXQSUrif8GErQDl3MRUOkSR2mWY=;
 b=WANHmRB/yRsC4G9WOTzAd7wQBw3M+Xz3s4fr8R9KDYRBHEUNVkU4Ew+7gutVnxuWWVYtg7
 DxnzUMKQQkc5Gxc/T+P2MqVDiBiQ3FtlMUt13X1vMtsCOkkgxZKEgwVVViUNreePsD26Dt
 g228hlD/7OZ/j1w5j2heawukgQk7Sr0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-FDDCx-RUP6OBNu5NPBqWpw-1; Mon, 23 Nov 2020 09:32:56 -0500
X-MC-Unique: FDDCx-RUP6OBNu5NPBqWpw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2EB82805EFF;
 Mon, 23 Nov 2020 14:32:55 +0000 (UTC)
Received: from [10.3.112.140] (ovpn-112-140.phx2.redhat.com [10.3.112.140])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A8A0B5D71D;
 Mon, 23 Nov 2020 14:32:54 +0000 (UTC)
To: Markus Armbruster <armbru@redhat.com>,
 Andrew Melnichenko <andrew@daynix.com>
References: <20200716035532.1407660-1-andrew@daynix.com>
 <CABcq3pGFPkDMmEegGaw6UjHBijPZiyFj-uR+6Phz+0K44VRNgw@mail.gmail.com>
 <874klk5gnc.fsf@dusky.pond.sub.org>
 <CAOEp5OfjuR97v0VyyHpXJiZVsU1jMphHh86XwAU4t3Uw1T8Ghg@mail.gmail.com>
 <CAOEp5OdiFaCK=Ag8f9oNixhrkW4xoEJ2bXKU7ThXeF9VJXPqTw@mail.gmail.com>
 <CABcq3pGDAO7sB6jobcsiE8_7md1yZ7wGkkyxZefjXGc7-d6obw@mail.gmail.com>
 <87lfesv2zu.fsf@dusky.pond.sub.org>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH] hmp: Changed hmp_netdev_add() using
 qmp_marshal_netdev_add()
Message-ID: <52abb089-f5e2-a3a6-bf38-71ec76b4f3fc@redhat.com>
Date: Mon, 23 Nov 2020 08:32:53 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <87lfesv2zu.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/23/20 3:25 AM, Markus Armbruster wrote:

>> Its still actual bug - I've checked it with the
>> master(2c6605389c1f76973d92b69b85d40d94b8f1092c).
> 
> I can see this with an even simpler reproducer:
> 
>     $ qemu-system-x86_64 -S -display none -nodefaults -monitor stdio
>     QEMU 5.1.92 monitor - type 'help' for more information
>     (qemu) netdev_add user,id=net0
>     (qemu) info network
>     net0: index=0,type=user,net=10.0.2.0,restrict=off
>     (qemu) netdev_del net0
>     (qemu) info network
>     (qemu) netdev_add user,id=net0
>     upstream-qemu: Duplicate ID 'net0' for netdev
>     Try "help netdev_add" for more information
> 
> The appended patch fixes it for me.  It relies on nothing using the
> "netdev" QemuOpts anymore.  Eric, what do you think?

Makes sense to me.  My quick audit for qemu_find_opts("netdev") finds only:

monitor/hmp-cmds.c:    opts =
qemu_opts_from_qdict(qemu_find_opts("netdev"), qdict, &err);

net/net.c:    if (qemu_opts_foreach(qemu_find_opts("netdev"),

softmmu/vl.c:                if
(net_client_parse(qemu_find_opts("netdev"), optarg) == -1) {

where the latter two are related (we gather the command line opts, and
initialize net devs based on them, but never refer to those opts again),
and the first is the one you are proposing to change.


> 
> 
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index a6a6684df1..8bc6b7bcc6 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -1638,9 +1638,7 @@ void hmp_netdev_add(Monitor *mon, const QDict *qdict)
>      }
>  
>      netdev_add(opts, &err);
> -    if (err) {
> -        qemu_opts_del(opts);
> -    }
> +    qemu_opts_del(opts);
>  
>  out:
>      hmp_handle_error(mon, err);
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


