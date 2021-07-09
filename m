Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C243C1DF5
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 05:54:23 +0200 (CEST)
Received: from localhost ([::1]:33482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1hao-0006Ki-Mw
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 23:54:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m1hZd-00050s-QD
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 23:53:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m1hZa-0001jP-41
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 23:53:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625802784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=USJQtR0pGVSPniZfwPmlw425WSj2zuW3iPCgpp0qdK4=;
 b=Kn/qwYkSmGw3Y2izvieVvgEFp05emlPqtAb00b6m/DZWSS+JfI9OXzzEuWY7PYJTsSZy6S
 V3twacopOspjefZDyj3H2hnyWTX1Udc0b8EvqjejNnncLHmi6vwMp6mBJ5wVdJM/5HtHxX
 LjI6PsEyWuFmXjcVg1AIN7bFtYJKm3I=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-SDfVWSHhMPiaKoRl1F9GTQ-1; Thu, 08 Jul 2021 23:53:01 -0400
X-MC-Unique: SDfVWSHhMPiaKoRl1F9GTQ-1
Received: by mail-pf1-f198.google.com with SMTP id
 t18-20020a056a001392b02903039eb2e663so5346671pfg.5
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 20:53:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=USJQtR0pGVSPniZfwPmlw425WSj2zuW3iPCgpp0qdK4=;
 b=JVx5pFEYmlG86tiQCEoMIOQOO36ZqnGk30thFIriVg1lg4Cu/zyQ7chbgIUcYzg68N
 5SI2uhA7tKErvasMuobbKXVfl2c24jHVYntH5DdXEOz/b+WVL0mpeM8Ch2HhPSAcEZmx
 Zd5Eh4AeuCIfdQeO9oM7mWvvcViAzeAPw+QaGT/4aAjJJLdVangpaLHCpgC6UpxMCOkC
 EENFE/cqykRNr61nX68ZS/r7b5vghCe8yQFk1XgpzXhDDi1X8mT2Cs0wpEbSVV4zP+xh
 oQNY6TVXeFoecW4JI4DTJp/PRptdvPje38D0bbGddPBeoBC6EHA7MBO8xtRzHZda4dkv
 xx0Q==
X-Gm-Message-State: AOAM5316X2yS3Qr5fYTXlVXkqFX/0JTKYNIQSV+bCvnyocHP0JYG5Ltg
 v3xvPfNNpEM9v+eKS7+TOyP0BgsKwm2dlg8pgA5zMVrYc4ErJrajpHCRZEKHx0/VOrAg2cd8eOZ
 5x6VUjwb78g1yhb8=
X-Received: by 2002:a63:f348:: with SMTP id t8mr34926327pgj.23.1625802780072; 
 Thu, 08 Jul 2021 20:53:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjvtTqe0KCc0lvi3sa/YcfMIWJbms3E+LZ7e8n1+716u6AYZ5utwdsiPLT97sczsdInfoErg==
X-Received: by 2002:a63:f348:: with SMTP id t8mr34926301pgj.23.1625802779741; 
 Thu, 08 Jul 2021 20:52:59 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id a15sm4371618pff.128.2021.07.08.20.52.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 20:52:59 -0700 (PDT)
Subject: Re: [PULL V2 1/6] qapi/net: Add IPFlowSpec and QMP command for filter
 passthrough
To: Zhang Chen <chen.zhang@intel.com>
References: <20210701091130.3022093-1-chen.zhang@intel.com>
 <20210701091130.3022093-2-chen.zhang@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <a49385c6-5ccc-42db-b3ca-0f81b5734f05@redhat.com>
Date: Fri, 9 Jul 2021 11:52:33 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210701091130.3022093-2-chen.zhang@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Lukas Straub <lukasstraub2@web.de>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, qemu-dev <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/7/1 ÏÂÎç5:11, Zhang Chen Ð´µÀ:
> Since the real user scenario does not need to monitor all traffic.
> Add passthrough-filter-add and passthrough-filter-del to maintain
> a network passthrough list in object with network packet processing
> function. Add IPFlowSpec struct for all QMP commands.
> Most the fields of IPFlowSpec are optional,except object-name.
>
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>


Hi:

I would like to have ack from the QAPI guys for this patch.

Thanks


> ---
>   net/net.c     | 10 +++++++
>   qapi/net.json | 78 +++++++++++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 88 insertions(+)
>
> diff --git a/net/net.c b/net/net.c
> index 76bbb7c31b..00f2be7a58 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -1195,6 +1195,16 @@ void qmp_netdev_del(const char *id, Error **errp)
>       }
>   }
>   
> +void qmp_passthrough_filter_add(IPFlowSpec *spec, Error **errp)
> +{
> +    /* TODO implement setup passthrough rule */
> +}
> +
> +void qmp_passthrough_filter_del(IPFlowSpec *spec, Error **errp)
> +{
> +    /* TODO implement delete passthrough rule */
> +}
> +
>   static void netfilter_print_info(Monitor *mon, NetFilterState *nf)
>   {
>       char *str;
> diff --git a/qapi/net.json b/qapi/net.json
> index 7fab2e7cd8..bfe38faab5 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -7,6 +7,7 @@
>   ##
>   
>   { 'include': 'common.json' }
> +{ 'include': 'sockets.json' }
>   
>   ##
>   # @set_link:
> @@ -696,3 +697,80 @@
>   ##
>   { 'event': 'FAILOVER_NEGOTIATED',
>     'data': {'device-id': 'str'} }
> +
> +##
> +# @IPFlowSpec:
> +#
> +# IP flow specification.
> +#
> +# @protocol: Transport layer protocol like TCP/UDP, etc. The protocol is the
> +#            string instead of enum, because it can be passed to getprotobyname(3)
> +#            and avoid duplication with /etc/protocols.
> +#
> +# @object-name: The @object-name means a qemu object with network packet
> +#               processing function, for example colo-compare, filtr-redirector
> +#               filtr-mirror, etc. VM can running with multi network packet
> +#               processing function objects. They can control different network
> +#               data paths from netdev or chardev. So it needs the object-name
> +#               to set the effective module.
> +#
> +# @source: Source address and port.
> +#
> +# @destination: Destination address and port.
> +#
> +# Since: 6.1
> +##
> +{ 'struct': 'IPFlowSpec',
> +  'data': { '*protocol': 'str', 'object-name': 'str',
> +    '*source': 'InetSocketAddressBase',
> +    '*destination': 'InetSocketAddressBase' } }
> +
> +##
> +# @passthrough-filter-add:
> +#
> +# Add passthrough entry IPFlowSpec to a qemu object with network packet
> +# processing function, for example filtr-mirror, COLO-compare, etc.
> +# The object-name is necessary. The protocol and source/destination IP and
> +# source/destination ports are optional. if only inputs part of the
> +# information, it will match all traffic.
> +#
> +# Returns: Nothing on success
> +#
> +# Since: 6.1
> +#
> +# Example:
> +#
> +# -> { "execute": "passthrough-filter-add",
> +#      "arguments": { "protocol": "tcp", "object-name": "object0",
> +#      "source": {"host": "192.168.1.1", "port": "1234"},
> +#      "destination": {"host": "192.168.1.2", "port": "4321"} } }
> +# <- { "return": {} }
> +#
> +##
> +{ 'command': 'passthrough-filter-add', 'boxed': true,
> +     'data': 'IPFlowSpec' }
> +
> +##
> +# @passthrough-filter-del:
> +#
> +# Delete passthrough entry IPFlowSpec to a qemu object with network packet
> +# processing function, for example filtr-mirror, COLO-compare, etc.
> +# The object-name is necessary. The protocol and source/destination IP and
> +# source/destination ports are optional. if only inputs part of the
> +# information, only the exact same rule will be deleted.
> +#
> +# Returns: Nothing on success
> +#
> +# Since: 6.1
> +#
> +# Example:
> +#
> +# -> { "execute": "passthrough-filter-del",
> +#      "arguments": { "protocol": "tcp", "object-name": "object0",
> +#      "source": {"host": "192.168.1.1", "port": "1234"},
> +#      "destination": {"host": "192.168.1.2", "port": "4321"} } }
> +# <- { "return": {} }
> +#
> +##
> +{ 'command': 'passthrough-filter-del', 'boxed': true,
> +     'data': 'IPFlowSpec' }


