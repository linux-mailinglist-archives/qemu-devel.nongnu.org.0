Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 106B8338EC0
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 14:28:05 +0100 (CET)
Received: from localhost ([::1]:40414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKhpj-0000JE-N6
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 08:28:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lKhoM-0008H4-V5
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:26:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lKhoK-0003cD-69
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:26:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615555595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IWoRlpASl7EJvSdGfWjStHNvUmzgol7j0PbwqV/ghEw=;
 b=EI1CYGGOXCUschJIvyNqQ4qPbPZ3aJxmTfZGgbpEcs2kw2Qy5glo6qpA8LV68hHgIa+Xt+
 JgebFpUYfWZbuYB87qIUO+qqJJAJ/KVEY3V2phn5/xhrxEXt9/tXx2qGYc7uOkwiFJPeTo
 GYRdTPkxy25zHxeuELGmQ4nTPRvEd1Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-uePGzBuoM56XY9g96eXdKA-1; Fri, 12 Mar 2021 08:26:32 -0500
X-MC-Unique: uePGzBuoM56XY9g96eXdKA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B04A819057A2;
 Fri, 12 Mar 2021 13:26:30 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-12-38.pek2.redhat.com
 [10.72.12.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 846E160C5F;
 Fri, 12 Mar 2021 13:26:28 +0000 (UTC)
Subject: Re: [PULL 03/16] net: validate that ids are well formed
To: Paolo Bonzini <pbonzini@redhat.com>, peter.maydell@linaro.org
References: <1615529786-30763-1-git-send-email-jasowang@redhat.com>
 <1615529786-30763-4-git-send-email-jasowang@redhat.com>
 <2e3d2321-be67-ab5d-9511-64de1fcbd196@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <c001654b-9802-7221-17e6-033bb10b89ff@redhat.com>
Date: Fri, 12 Mar 2021 21:26:27 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <2e3d2321-be67-ab5d-9511-64de1fcbd196@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/3/12 4:44 下午, Paolo Bonzini wrote:
> On 12/03/21 07:16, Jason Wang wrote:
>> From: Paolo Bonzini <pbonzini@redhat.com>
>>
>> When a network or network device is created from the command line or 
>> HMP,
>> QemuOpts ensures that the id passes the id_wellformed check. However,
>> QMP skips this:
>>
>>     $ qemu-system-x86_64 -qmp stdio -S -nic user,id=123/456
>>     qemu-system-x86_64: -nic user,id=123/456: Parameter id expects an 
>> identifier
>>     Identifiers consist of letters, digits, -, ., _, starting with a 
>> letter.
>>
>>     $ qemu-system-x86_64 -qmp stdio -S
>>     {"execute":"qmp_capabilities"}
>>     {"return": {}}
>>     {"execute":"netdev_add", "arguments": {"type": "user", "id": 
>> "123/456"}}
>>     {"return": {}}
>>
>> After:
>>
>>     $ qemu-system-x86_64 -qmp stdio -S
>>     {"execute":"qmp_capabilities"}
>>     {"return": {}}
>>     {"execute":"netdev_add", "arguments": {"type": "user", "id": 
>> "123/456"}}
>>     {"error": {"class": "GenericError", "desc": "Parameter "id" 
>> expects an identifier"}}
>>
>> Validity checks should be performed always at the bottom of the call 
>> chain,
>> because QMP skips all the steps above.  Do this for the network 
>> subsystem.
>>
>> Cc: Jason Wang <jasowang@redhat.com>
>> Reviewed-by: Eric Blake <eblake@redhat.com>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> Signed-off-by: Jason Wang <jasowang@redhat.com>
>> ---
>>   net/net.c | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/net/net.c b/net/net.c
>> index 9c784da..d36729f 100644
>> --- a/net/net.c
>> +++ b/net/net.c
>> @@ -44,6 +44,7 @@
>>   #include "qemu/cutils.h"
>>   #include "qemu/config-file.h"
>>   #include "qemu/ctype.h"
>> +#include "qemu/id.h"
>>   #include "qemu/iov.h"
>>   #include "qemu/qemu-print.h"
>>   #include "qemu/main-loop.h"
>> @@ -1011,6 +1012,17 @@ static int net_client_init1(const Netdev 
>> *netdev, bool is_netdev, Error **errp)
>>           }
>>       }
>>   +    /*
>> +     * The id for -net has already been checked by QemuOpts and
>> +     * could be automatically generated, in which case it is not
>> +     * well-formed by design.  HMP and QMP only call us with
>> +     * is_netdev == true.
>> +     */
>> +    if (is_netdev && !id_wellformed(netdev->id)) {
>> +        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "id", "an 
>> identifier");
>> +        return -1;
>> +    }
>> +
>>       nc = qemu_find_netdev(netdev->id);
>>       if (nc) {
>>           error_setg(errp, "Duplicate ID '%s'", netdev->id);
>>
>
> Sorry, I sent v2 yesterday.  This patch passed the tests at the time 
> it was submitted, but now fails (because it does not work with -nic).


I don't see that. But I add a fixup in the pull request:

https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg04237.html

If it doesn't make sense, I will drop this and send a new pull request 
next week.

THanks


>
> Paolo
>
>


