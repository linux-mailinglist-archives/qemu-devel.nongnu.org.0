Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7FE3AFD90
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 09:07:34 +0200 (CEST)
Received: from localhost ([::1]:56650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvaVR-0001ey-Pm
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 03:07:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lvaTP-00006D-Lg
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 03:05:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lvaTN-000569-Gk
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 03:05:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624345524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+8axuU5NahyGw4a9GKZsKPYmYM3NDdmO70GvksSqHuw=;
 b=FnLuU/nJmP5B5WrX+nitnOoeK8vCyeIo/nI6c3aAtjcMv8O7aRhWB/P4aV0mPRB6PSTj3j
 v5LydKVgVmJQlrJOQRF24GbV/oJus0mOmerzKnwj+v8OkFk0bOYXKLk7O4bBfL4fY/5Em4
 1XOXXwizi1nsbw8a+ox3qzOTBRMGMxw=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-e3O8Qt1OMB25GljMjDhm-g-1; Tue, 22 Jun 2021 03:05:22 -0400
X-MC-Unique: e3O8Qt1OMB25GljMjDhm-g-1
Received: by mail-pg1-f199.google.com with SMTP id
 r5-20020a635d050000b0290220f78694c8so13215992pgb.0
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 00:05:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=+8axuU5NahyGw4a9GKZsKPYmYM3NDdmO70GvksSqHuw=;
 b=h43L53iw5V5UqOTdCH0sqXiGs1UsipixcK1gtfQ7YKj/Z/ZAPnX2QQnxXYqyiKOQfg
 vpFL4fXXWVSPkRoNclL/Q8fq1Fkbfgvcz/8fNEKl+mGisSkTS6Xq5lrfdiRCCJm15KEz
 l2aM1CEN9UqQsBd+IR5JXQ6SX1+6l+Asw8v0vpm4QskRJvt0D0A21kF68QgH+cQ6WkC8
 MMysqlpa5EgB3C0RIge61AzwTzDfoIsziErwtEk0qh95h0S8WS/yt9P4SrRztbxf1gkr
 TUxphSb0NBxo0kZ8Er6DQ8IC23tp4hgPfoLZDuXZS9oIiMVmbDW4c56fvBn+OZ7ck0xl
 /O3g==
X-Gm-Message-State: AOAM531Ryeka9+BK6VkkFS0fcj4gVpiEikj5jbRdh35iv3JqqpH4jdCp
 OZf80+Ks8gkS/gbPzIVumHBK5O8p1FoA7/WK2KRrhRbcrmSPNVmo9JlNHb0qYFOIW1nYLu1t6Yc
 P3NcLHd3q4O2+bBQ=
X-Received: by 2002:a17:90b:4a82:: with SMTP id
 lp2mr2511359pjb.190.1624345521213; 
 Tue, 22 Jun 2021 00:05:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzn1/huvNRuSSq/YJTRiDm5s9UmL8APOc6CDK2dRiI/v82j5p8i8eFRceWGcaARqpYmOaXjQ==
X-Received: by 2002:a17:90b:4a82:: with SMTP id
 lp2mr2511341pjb.190.1624345521051; 
 Tue, 22 Jun 2021 00:05:21 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id a187sm17188695pfb.66.2021.06.22.00.05.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 00:05:19 -0700 (PDT)
Subject: Re: [PATCH V8 1/6] qapi/net: Add IPFlowSpec and QMP command for COLO
 passthrough
To: Zhang Chen <chen.zhang@intel.com>, qemu-dev <qemu-devel@nongnu.org>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Li Zhijian <lizhijian@cn.fujitsu.com>
References: <20210615113740.2278015-1-chen.zhang@intel.com>
 <20210615113740.2278015-2-chen.zhang@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <30fb1d13-8547-2027-44dd-683fc0ec67b4@redhat.com>
Date: Tue, 22 Jun 2021 15:05:15 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210615113740.2278015-2-chen.zhang@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: Lukas Straub <lukasstraub2@web.de>, Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/6/15 ÏÂÎç7:37, Zhang Chen Ð´µÀ:
> Since the real user scenario does not need COLO to monitor all traffic.
> Add colo-passthrough-add and colo-passthrough-del to maintain
> a COLO network passthrough list. Add IPFlowSpec struct for all QMP commands.
> All the fields of IPFlowSpec are optional.
>
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> ---
>   net/net.c     | 10 +++++++


Let's avoid to have colo stuffs in the general net codes.

Thanks


>   qapi/net.json | 74 +++++++++++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 84 insertions(+)
>
> diff --git a/net/net.c b/net/net.c
> index 76bbb7c31b..f913e97983 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -1195,6 +1195,16 @@ void qmp_netdev_del(const char *id, Error **errp)
>       }
>   }
>   
> +void qmp_colo_passthrough_add(IPFlowSpec *spec, Error **errp)
> +{
> +    /* TODO implement setup passthrough rule */
> +}
> +
> +void qmp_colo_passthrough_del(IPFlowSpec *spec, Error **errp)
> +{
> +    /* TODO implement delete passthrough rule */
> +}
> +
>   static void netfilter_print_info(Monitor *mon, NetFilterState *nf)
>   {
>       char *str;
> diff --git a/qapi/net.json b/qapi/net.json
> index 7fab2e7cd8..91f2e1495a 100644
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
> @@ -696,3 +697,76 @@
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
> +# @object-name: The @object-name means packet handler in Qemu. Because not
> +#               all the network packet must pass the colo-compare module,
> +#               the net-filters are same situation. There modules attach to
> +#               netdev or chardev to work, VM can run multiple modules
> +#               at the same time. So it needs the object-name to set
> +#               the effective module.
> +#
> +# @source: Source address and port.
> +#
> +# @destination: Destination address and port.
> +#
> +# Since: 6.1
> +##
> +{ 'struct': 'IPFlowSpec',
> +  'data': { '*protocol': 'str', '*object-name': 'str',
> +    '*source': 'InetSocketAddressBase',
> +    '*destination': 'InetSocketAddressBase' } }
> +
> +##
> +# @colo-passthrough-add:
> +#
> +# Add passthrough entry IPFlowSpec to the COLO-compare instance.
> +# The protocol and source/destination IP/ports are optional. if the user
> +# only inputs part of the information, this will match all traffic.
> +#
> +# Returns: Nothing on success
> +#
> +# Since: 6.1
> +#
> +# Example:
> +#
> +# -> { "execute": "colo-passthrough-add",
> +#      "arguments": { "protocol": "tcp", "object-name": "object0",
> +#      "source": {"host": "192.168.1.1", "port": "1234"},
> +#      "destination": {"host": "192.168.1.2", "port": "4321"} } }
> +# <- { "return": {} }
> +#
> +##
> +{ 'command': 'colo-passthrough-add', 'boxed': true,
> +     'data': 'IPFlowSpec' }
> +
> +##
> +# @colo-passthrough-del:
> +#
> +# Delete passthrough entry IPFlowSpec to the COLO-compare instance.
> +# The protocol and source/destination IP/ports are optional. if the user
> +# only inputs part of the information, this will match all traffic.
> +#
> +# Returns: Nothing on success
> +#
> +# Since: 6.1
> +#
> +# Example:
> +#
> +# -> { "execute": "colo-passthrough-del",
> +#      "arguments": { "protocol": "tcp", "object-name": "object0",
> +#      "source": {"host": "192.168.1.1", "port": "1234"},
> +#      "destination": {"host": "192.168.1.2", "port": "4321"} } }
> +# <- { "return": {} }
> +#
> +##
> +{ 'command': 'colo-passthrough-del', 'boxed': true,
> +     'data': 'IPFlowSpec' }


