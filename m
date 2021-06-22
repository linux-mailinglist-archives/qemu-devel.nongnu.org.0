Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BA93AFE55
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 09:49:50 +0200 (CEST)
Received: from localhost ([::1]:49282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvbAL-0000o3-IF
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 03:49:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lvb9O-00005z-02
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 03:48:50 -0400
Received: from mga09.intel.com ([134.134.136.24]:34215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lvb9J-0007Pg-Dw
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 03:48:49 -0400
IronPort-SDR: MoMXe9XjvHJl5GaEn5+o+USqk2NROJN4/62Z6k93gF9AT/LIsMv+4GdV5533BJxCKSwMlvlTDA
 YjMLJGCUnHTw==
X-IronPort-AV: E=McAfee;i="6200,9189,10022"; a="206949152"
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; d="scan'208";a="206949152"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2021 00:48:40 -0700
IronPort-SDR: RvNQlZTyH3QoNumoiKj8oKaNGlmu6yNRRe1LisJrlnlveGJIQnfhOv9mqJaodW2Wwki/chyMDj
 +79uDhOJxs1g==
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; d="scan'208";a="452513456"
Received: from unknown (HELO [10.239.13.19]) ([10.239.13.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2021 00:48:38 -0700
Subject: Re: [PATCH V8 1/6] qapi/net: Add IPFlowSpec and QMP command for COLO
 passthrough
To: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Li Zhijian <lizhijian@cn.fujitsu.com>
References: <20210615113740.2278015-1-chen.zhang@intel.com>
 <20210615113740.2278015-2-chen.zhang@intel.com>
 <30fb1d13-8547-2027-44dd-683fc0ec67b4@redhat.com>
From: "chen.zhang@intel.com" <chen.zhang@intel.com>
Message-ID: <c6f5e29d-cf19-8ed0-d1f9-46ceb4e97c34@intel.com>
Date: Tue, 22 Jun 2021 15:41:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <30fb1d13-8547-2027-44dd-683fc0ec67b4@redhat.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=134.134.136.24; envelope-from=chen.zhang@intel.com;
 helo=mga09.intel.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, MIME_CHARSET_FARAWAY=2.45,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Lukas Straub <lukasstraub2@web.de>, Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 6/22/21 3:05 PM, Jason Wang wrote:
> ÔÚ 2021/6/15 ÏÂÎç7:37, Zhang Chen Ð´µÀ:
>> Since the real user scenario does not need COLO to monitor all traffic.
>> Add colo-passthrough-add and colo-passthrough-del to maintain
>> a COLO network passthrough list. Add IPFlowSpec struct for all QMP commands.
>> All the fields of IPFlowSpec are optional.
>>
>> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
>> ---
>>    net/net.c     | 10 +++++++
>
> Let's avoid to have colo stuffs in the general net codes.


As we will change the command to "passthrough-filter-add/del", the data 
structure and commands are the general net codes.


Thanks

Chen


>
> Thanks
>
>
>>    qapi/net.json | 74 +++++++++++++++++++++++++++++++++++++++++++++++++++
>>    2 files changed, 84 insertions(+)
>>
>> diff --git a/net/net.c b/net/net.c
>> index 76bbb7c31b..f913e97983 100644
>> --- a/net/net.c
>> +++ b/net/net.c
>> @@ -1195,6 +1195,16 @@ void qmp_netdev_del(const char *id, Error **errp)
>>        }
>>    }
>>    
>> +void qmp_colo_passthrough_add(IPFlowSpec *spec, Error **errp)
>> +{
>> +    /* TODO implement setup passthrough rule */
>> +}
>> +
>> +void qmp_colo_passthrough_del(IPFlowSpec *spec, Error **errp)
>> +{
>> +    /* TODO implement delete passthrough rule */
>> +}
>> +
>>    static void netfilter_print_info(Monitor *mon, NetFilterState *nf)
>>    {
>>        char *str;
>> diff --git a/qapi/net.json b/qapi/net.json
>> index 7fab2e7cd8..91f2e1495a 100644
>> --- a/qapi/net.json
>> +++ b/qapi/net.json
>> @@ -7,6 +7,7 @@
>>    ##
>>    
>>    { 'include': 'common.json' }
>> +{ 'include': 'sockets.json' }
>>    
>>    ##
>>    # @set_link:
>> @@ -696,3 +697,76 @@
>>    ##
>>    { 'event': 'FAILOVER_NEGOTIATED',
>>      'data': {'device-id': 'str'} }
>> +
>> +##
>> +# @IPFlowSpec:
>> +#
>> +# IP flow specification.
>> +#
>> +# @protocol: Transport layer protocol like TCP/UDP, etc. The protocol is the
>> +#            string instead of enum, because it can be passed to getprotobyname(3)
>> +#            and avoid duplication with /etc/protocols.
>> +#
>> +# @object-name: The @object-name means packet handler in Qemu. Because not
>> +#               all the network packet must pass the colo-compare module,
>> +#               the net-filters are same situation. There modules attach to
>> +#               netdev or chardev to work, VM can run multiple modules
>> +#               at the same time. So it needs the object-name to set
>> +#               the effective module.
>> +#
>> +# @source: Source address and port.
>> +#
>> +# @destination: Destination address and port.
>> +#
>> +# Since: 6.1
>> +##
>> +{ 'struct': 'IPFlowSpec',
>> +  'data': { '*protocol': 'str', '*object-name': 'str',
>> +    '*source': 'InetSocketAddressBase',
>> +    '*destination': 'InetSocketAddressBase' } }
>> +
>> +##
>> +# @colo-passthrough-add:
>> +#
>> +# Add passthrough entry IPFlowSpec to the COLO-compare instance.
>> +# The protocol and source/destination IP/ports are optional. if the user
>> +# only inputs part of the information, this will match all traffic.
>> +#
>> +# Returns: Nothing on success
>> +#
>> +# Since: 6.1
>> +#
>> +# Example:
>> +#
>> +# -> { "execute": "colo-passthrough-add",
>> +#      "arguments": { "protocol": "tcp", "object-name": "object0",
>> +#      "source": {"host": "192.168.1.1", "port": "1234"},
>> +#      "destination": {"host": "192.168.1.2", "port": "4321"} } }
>> +# <- { "return": {} }
>> +#
>> +##
>> +{ 'command': 'colo-passthrough-add', 'boxed': true,
>> +     'data': 'IPFlowSpec' }
>> +
>> +##
>> +# @colo-passthrough-del:
>> +#
>> +# Delete passthrough entry IPFlowSpec to the COLO-compare instance.
>> +# The protocol and source/destination IP/ports are optional. if the user
>> +# only inputs part of the information, this will match all traffic.
>> +#
>> +# Returns: Nothing on success
>> +#
>> +# Since: 6.1
>> +#
>> +# Example:
>> +#
>> +# -> { "execute": "colo-passthrough-del",
>> +#      "arguments": { "protocol": "tcp", "object-name": "object0",
>> +#      "source": {"host": "192.168.1.1", "port": "1234"},
>> +#      "destination": {"host": "192.168.1.2", "port": "4321"} } }
>> +# <- { "return": {} }
>> +#
>> +##
>> +{ 'command': 'colo-passthrough-del', 'boxed': true,
>> +     'data': 'IPFlowSpec' }

