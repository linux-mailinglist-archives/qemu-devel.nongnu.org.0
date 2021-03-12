Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A001B338FFD
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 15:27:34 +0100 (CET)
Received: from localhost ([::1]:59972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKilJ-0008WL-JM
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 09:27:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKihL-0002oE-Uv
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 09:23:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKihI-00032C-SF
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 09:23:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615559003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wJVCkaHNh+KopIoIbK2T5+pXfBS3MzZolvp+nrAaNL4=;
 b=iElSt//7LSPBlt3EtS8k04Gj0i4n4oIImjgKf1zSfVMTAl3vwzVqUTJ+re7O+1jMULVmaB
 F3XKIBEFu4ozq+9rDLU4ejRVSmLy0iukHER6ODbueMcP846WT0loRw+Pls6j7lr4yCkfMB
 2ph4stwBVqpZyJjBtHxlbCssymshQFA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-8tAwk3kRPR-qqRP5j-KXfQ-1; Fri, 12 Mar 2021 09:23:19 -0500
X-MC-Unique: 8tAwk3kRPR-qqRP5j-KXfQ-1
Received: by mail-wr1-f71.google.com with SMTP id g5so11168098wrd.22
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 06:23:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wJVCkaHNh+KopIoIbK2T5+pXfBS3MzZolvp+nrAaNL4=;
 b=cRhNvgjfgffos1QA/Pl+E60Hiht3p3yFj0CHOPnbBz65lvbCTD2NOptGJglAhG+vwM
 i7WEMPEv9iWKhF7K0ocIM2C1Tvjw8mD5wh9AJZavbkk5XECYy4Fq6XmJr44RpsoDmXzb
 RnDV1vtwaL4HV4MOmSxWk4nHQ0VRAdrRzs/K0V6a/0pZE7cjD3YM3BNms3E4+RvCnS98
 kuyHxETrZp6ZHbOXpYiTdbeSXc+JPNbGyLtXcpVkb1j+aLczRdQnn+wF1PnfxSuMwaBS
 0NdqX4inBZ52+FmK0YMzqIk4bihVatK/Q6BVfx4o0BJVc8Pxxgtaj6SJbTekwDlPB6zW
 YcmA==
X-Gm-Message-State: AOAM531qupKRDzmoOtF1U3HaGCmliUM6akOEL0K/2U9jnh9Ad+s04mJ7
 7gsm4/xoiy/mqHyM/W/ky/X+j5MiPAslPt/2yXKDNJrEeUv7Hb9ivrqKb0KnPeFl7/q1+KByiRP
 X+IeMZVe5OcgwPIiXW90EYFLbrPMtfCvDc+Sp+5Nw0J55NSbUGsnP8T8Hu8X79LHa0uY=
X-Received: by 2002:adf:e411:: with SMTP id g17mr14236286wrm.225.1615558998379; 
 Fri, 12 Mar 2021 06:23:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwQK/WJ4V7P3n8B5lGSakdw1suChpSd28tdUhuWSd7HFZY90gpqvu4K+uDJTNFzp0G7FaHKSw==
X-Received: by 2002:adf:e411:: with SMTP id g17mr14236263wrm.225.1615558998169; 
 Fri, 12 Mar 2021 06:23:18 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m132sm2117326wmf.45.2021.03.12.06.23.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Mar 2021 06:23:17 -0800 (PST)
Subject: Re: [PULL 03/16] net: validate that ids are well formed
To: Jason Wang <jasowang@redhat.com>, peter.maydell@linaro.org
References: <1615529786-30763-1-git-send-email-jasowang@redhat.com>
 <1615529786-30763-4-git-send-email-jasowang@redhat.com>
 <2e3d2321-be67-ab5d-9511-64de1fcbd196@redhat.com>
 <c001654b-9802-7221-17e6-033bb10b89ff@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <201e2590-49a7-f05c-c579-73e2fed20917@redhat.com>
Date: Fri, 12 Mar 2021 15:23:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <c001654b-9802-7221-17e6-033bb10b89ff@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

On 12/03/21 14:26, Jason Wang wrote:
> 
> On 2021/3/12 4:44 下午, Paolo Bonzini wrote:
>> On 12/03/21 07:16, Jason Wang wrote:
>>> From: Paolo Bonzini <pbonzini@redhat.com>
>>>
>>> When a network or network device is created from the command line or 
>>> HMP,
>>> QemuOpts ensures that the id passes the id_wellformed check. However,
>>> QMP skips this:
>>>
>>>     $ qemu-system-x86_64 -qmp stdio -S -nic user,id=123/456
>>>     qemu-system-x86_64: -nic user,id=123/456: Parameter id expects an 
>>> identifier
>>>     Identifiers consist of letters, digits, -, ., _, starting with a 
>>> letter.
>>>
>>>     $ qemu-system-x86_64 -qmp stdio -S
>>>     {"execute":"qmp_capabilities"}
>>>     {"return": {}}
>>>     {"execute":"netdev_add", "arguments": {"type": "user", "id": 
>>> "123/456"}}
>>>     {"return": {}}
>>>
>>> After:
>>>
>>>     $ qemu-system-x86_64 -qmp stdio -S
>>>     {"execute":"qmp_capabilities"}
>>>     {"return": {}}
>>>     {"execute":"netdev_add", "arguments": {"type": "user", "id": 
>>> "123/456"}}
>>>     {"error": {"class": "GenericError", "desc": "Parameter "id" 
>>> expects an identifier"}}
>>>
>>> Validity checks should be performed always at the bottom of the call 
>>> chain,
>>> because QMP skips all the steps above.  Do this for the network 
>>> subsystem.
>>>
>>> Cc: Jason Wang <jasowang@redhat.com>
>>> Reviewed-by: Eric Blake <eblake@redhat.com>
>>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>>> Signed-off-by: Jason Wang <jasowang@redhat.com>
>>> ---
>>>   net/net.c | 12 ++++++++++++
>>>   1 file changed, 12 insertions(+)
>>>
>>> diff --git a/net/net.c b/net/net.c
>>> index 9c784da..d36729f 100644
>>> --- a/net/net.c
>>> +++ b/net/net.c
>>> @@ -44,6 +44,7 @@
>>>   #include "qemu/cutils.h"
>>>   #include "qemu/config-file.h"
>>>   #include "qemu/ctype.h"
>>> +#include "qemu/id.h"
>>>   #include "qemu/iov.h"
>>>   #include "qemu/qemu-print.h"
>>>   #include "qemu/main-loop.h"
>>> @@ -1011,6 +1012,17 @@ static int net_client_init1(const Netdev 
>>> *netdev, bool is_netdev, Error **errp)
>>>           }
>>>       }
>>>   +    /*
>>> +     * The id for -net has already been checked by QemuOpts and
>>> +     * could be automatically generated, in which case it is not
>>> +     * well-formed by design.  HMP and QMP only call us with
>>> +     * is_netdev == true.
>>> +     */
>>> +    if (is_netdev && !id_wellformed(netdev->id)) {
>>> +        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "id", "an 
>>> identifier");
>>> +        return -1;
>>> +    }
>>> +
>>>       nc = qemu_find_netdev(netdev->id);
>>>       if (nc) {
>>>           error_setg(errp, "Duplicate ID '%s'", netdev->id);
>>>
>>
>> Sorry, I sent v2 yesterday.  This patch passed the tests at the time 
>> it was submitted, but now fails (because it does not work with -nic).
> 
> I don't see that. But I add a fixup in the pull request:
> 
> https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg04237.html
> 
> If it doesn't make sense, I will drop this and send a new pull request 
> next week.

Hmm no, it didn't reach the list.  Let me resend.

Paolo


