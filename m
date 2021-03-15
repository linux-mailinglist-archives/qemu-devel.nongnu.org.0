Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D383D33AD38
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 09:20:49 +0100 (CET)
Received: from localhost ([::1]:46752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLiT2-0003W5-JB
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 04:20:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lLiRt-0001VR-5O
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 04:19:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lLiRp-00005u-9L
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 04:19:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615796371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+rRxAEJP0yb8hy5xLsHkEvRLysybMMWDqJwpU7ye9LI=;
 b=QHm0gsCbvDdXdrKcnOf99JgAuNMDs+e2T75dXixrV+paUUcYnYLshWK/lA/JOOKmvF19SU
 O4dRmT3+29cuPhNJp7WxaNJtcsIMZ7xGciKqF+gFSqwvFuYV/cxNm9P1dHN+QSBgKHbQUR
 02cDJmYf9BbZ+Q+cznyh4JfUglu4OCI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-JTYACgGdPaStKMrDzo-FLQ-1; Mon, 15 Mar 2021 04:19:22 -0400
X-MC-Unique: JTYACgGdPaStKMrDzo-FLQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1B0E93920;
 Mon, 15 Mar 2021 08:19:19 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-12-245.pek2.redhat.com
 [10.72.12.245])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4292E501D4;
 Mon, 15 Mar 2021 08:19:02 +0000 (UTC)
Subject: Re: [PATCH v7 0/5] Introducing QMP query-netdev command
To: Alexey Kirillov <lekiravi@yandex-team.ru>,
 Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eric Blake <eblake@redhat.com>
References: <20210303095910.78277-1-lekiravi@yandex-team.ru>
 <32641615544652@mail.yandex-team.ru>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <583ade39-fd95-b5af-6d8f-c2126e341cbe@redhat.com>
Date: Mon, 15 Mar 2021 16:19:00 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <32641615544652@mail.yandex-team.ru>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, Michael Roth <michael.roth@amd.com>,
 Stefan Weil <sw@weilnetz.de>, "Michael S. Tsirkin" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Vincenzo Maffione <v.maffione@gmail.com>,
 "yc-core@yandex-team.ru" <yc-core@yandex-team.ru>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Giuseppe Lettieri <g.lettieri@iet.unipi.it>, Luigi Rizzo <rizzo@iet.unipi.it>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/3/12 下午6:29, Alexey Kirillov 写道:
> ping
>
> Patchew page: https://patchew.org/QEMU/20210303095910.78277-1-lekiravi@yandex-team.ru


Applied.

Thanks


>
> 03.03.2021, 13:01, "Alexey Kirillov" <lekiravi@yandex-team.ru>:
>> This patch series introduces a new QMP command "query-netdev" to get
>> information about currently attached backend network devices (netdevs).
>>
>> Also, since the "info_str" field of "NetClientState" is now deprecated,
>> we no longer use it for netdevs, only for NIC/hubports.
>>
>> The HMP command "info network" now also uses QAPI structure inside.
>>
>> Usage example:
>>
>> -> { "execute": "query-netdev" }
>> <- { "return": [
>>           {
>>               "listen": "127.0.0.1:90",
>>               "type": "socket",
>>               "peer-id": "hub0port1",
>>               "id": "__org.qemu.net1"
>>           },
>>           {
>>               "script": "/etc/qemu-ifup",
>>               "downscript": "/etc/qemu-ifdown",
>>               "ifname": "tap0",
>>               "type": "tap",
>>               "peer-id": "net5",
>>               "vnet_hdr": true,
>>               "id": "tap0"
>>           },
>>           {
>>               "ipv6": true,
>>               "ipv4": true,
>>               "host": "10.0.2.2",
>>               "ipv6-dns": "fec0::3",
>>               "ipv6-prefix": "fec0::",
>>               "net": "10.0.2.0/255.255.255.0",
>>               "ipv6-host": "fec0::2",
>>               "type": "user",
>>               "peer-id": "net0",
>>               "dns": "10.0.2.3",
>>               "hostfwd": [
>>                   {
>>                       "str": "tcp::20004-:22"
>>                   }
>>               ],
>>               "ipv6-prefixlen": 64,
>>               "id": "netdev0",
>>               "restrict": false
>>           }
>>       ]
>>     }
>>
>> v6->v7:
>> - Use macroses QAPI_LIST_PREPEND and QAPI_LIST_APPEND for lists.
>> - Reorder NetBackend entries in alphabetical order.
>>
>> v5->v6:
>> - Add QAPI visitor to generate info_str replacement directly from NetdevInfo.
>> - Make info_str dynamically allocated.
>> - Make commit messages more meaningful.
>>
>> v4->v5:
>> - Enable qtest of query-netdevs for AVR and RX archs.
>> - Bump "Since" version in QAPI to 6.0.
>>
>> v3->v4:
>> - Rename "query-netdevs" to "query-netdev".
>> - Copy netdev drivers to new QAPI enum "NetBackend".
>>
>> v2->v3:
>> - Remove NIC and hubports from query-netdevs.
>> - Remove several fields from NetdevInfo since they are unnecessary.
>> - Rename field @peer to @peer-id.
>> - Add support of vhost-vdpa.
>> - Keep "info_str" for NIC/hubports, but remove it for netdevs.
>>
>> v1->v2:
>> - Rewrite HMP "info network" to get information from results of QMP command.
>> - Remove obsolete field "info_str" from "NetClientState".
>>
>> Alexey Kirillov (5):
>>    qapi: net: Add query-netdev command
>>    tests: Add tests for query-netdev command
>>    net: Move NetClientState.info_str to dynamic allocations
>>    hmp: Use QAPI NetdevInfo in hmp_info_network
>>    net: Do not fill legacy info_str for backends
>>
>>   hw/net/xen_nic.c | 5 +-
>>   include/net/net.h | 5 +-
>>   include/qapi/hmp-output-visitor.h | 30 +++++
>>   net/l2tpv3.c | 8 +-
>>   net/net.c | 73 +++++++++--
>>   net/netmap.c | 7 ++
>>   net/slirp.c | 124 ++++++++++++++++++-
>>   net/socket.c | 92 ++++++++++----
>>   net/tap-win32.c | 10 +-
>>   net/tap.c | 107 +++++++++++++++--
>>   net/vde.c | 25 +++-
>>   net/vhost-user.c | 20 +++-
>>   net/vhost-vdpa.c | 15 ++-
>>   qapi/hmp-output-visitor.c | 193 ++++++++++++++++++++++++++++++
>>   qapi/meson.build | 1 +
>>   qapi/net.json | 80 +++++++++++++
>>   tests/qtest/meson.build | 3 +
>>   tests/qtest/test-query-netdev.c | 120 +++++++++++++++++++
>>   18 files changed, 856 insertions(+), 62 deletions(-)
>>   create mode 100644 include/qapi/hmp-output-visitor.h
>>   create mode 100644 qapi/hmp-output-visitor.c
>>   create mode 100644 tests/qtest/test-query-netdev.c
>>
>> --
>> 2.25.1
>
> -- 
> Alexey Kirillov
> Yandex.Cloud
>
>


