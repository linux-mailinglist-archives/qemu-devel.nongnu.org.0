Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 380B82C4105
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 14:20:59 +0100 (CET)
Received: from localhost ([::1]:48164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khuj8-0001p2-LG
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 08:20:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1khuge-0000hJ-9J
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 08:18:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1khugc-000692-1L
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 08:18:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606310296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mp2IJTYqFqppXVtKKihfJwUT/XuA4Rt+Q9Pj3b7bvaE=;
 b=PRk0l8Yb4Z8ByfBTCBktCj+T0TeadyZ4jwg8fMoCs7RUSHZ/Qd56kotdmSrG0+T5aCkKYf
 UVa0imo5Sk6wCjaRglT9+UAuK/RLnp9HncyfKtnbsuRuUKBNdJQ4qYyaYDN2jY32DeR0H3
 W3ZrhudSD9kMmv71enigYMYatipp3J8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-IzRWZkPONY2JcsRFRv2rsg-1; Wed, 25 Nov 2020 08:18:12 -0500
X-MC-Unique: IzRWZkPONY2JcsRFRv2rsg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 52C808735D3;
 Wed, 25 Nov 2020 13:18:11 +0000 (UTC)
Received: from [10.3.112.182] (ovpn-112-182.phx2.redhat.com [10.3.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BF18460BE5;
 Wed, 25 Nov 2020 13:18:10 +0000 (UTC)
Subject: Re: [PATCH 1/1] net: Fix handling of id in netdev_add and netdev_del
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20201125100220.50251-1-armbru@redhat.com>
 <20201125100220.50251-2-armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <abaa78a8-1228-8517-1bcd-3afcefc47251@redhat.com>
Date: Wed, 25 Nov 2020 07:18:09 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201125100220.50251-2-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: yuri.benditovich@daynix.com, jasowang@redhat.com, qemu-stable@nongnu.org,
 andrew@daynix.com, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/25/20 4:02 AM, Markus Armbruster wrote:
> CLI -netdev accumulates in option group "netdev".
> 
> Before commit 08712fcb85 "net: Track netdevs in NetClientState rather
> than QemuOpt", netdev_add added to the option group, and netdev_del
> removed from it, both HMP and QMP.  Thus, every netdev had a
> corresponding QemuOpts in this option group.
> 
> Commit 08712fcb85 dropped this for QMP netdev_add and both netdev_del.
> Now a netdev has a corresponding QemuOpts only when it was created
> with CLI or HMP.  Two issues:
> 
> * QMP and HMP netdev_del can leave QemuOpts behind, breaking HMP
>   netdev_add.  Reproducer:
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
>   Fix by restoring the QemuOpts deletion in qmp_netdev_del(), but with
>   a guard, because the QemuOpts need not exist.
> 
> * QMP netdev_add loses its "no duplicate ID" check.  Reproducer:
> 
>     $ qemu-system-x86_64 -S -display none -qmp stdio
>     {"QMP": {"version": {"qemu": {"micro": 92, "minor": 1, "major": 5}, "package": "v5.2.0-rc2-1-g02c1f0142c"}, "capabilities": ["oob"]}}
>     {"execute": "qmp_capabilities"}
>     {"return": {}}
>     {"execute": "netdev_add", "arguments": {"type": "user", "id":"net0"}}
>     {"return": {}}
>     {"execute": "netdev_add", "arguments": {"type": "user", "id":"net0"}}
>     {"return": {}}
> 
>   Fix by adding a duplicate ID check to net_client_init1() to replace
>   the lost one.  The check is redundant for callers where QemuOpts
>   still checks, i.e. for CLI and HMP.
> 
> Reported-by: Andrew Melnichenko <andrew@daynix.com>
> Fixes: 08712fcb851034228b61f75bd922863a984a4f60
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  net/net.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)

The adventure in QAPIfication of netdev_add has been long.  Thanks for
working on this.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


