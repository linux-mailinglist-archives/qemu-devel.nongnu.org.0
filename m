Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3923BC79D
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 10:05:25 +0200 (CEST)
Received: from localhost ([::1]:45088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0g56-0005Hz-CI
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 04:05:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m0g3Z-0004Z1-Ip
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 04:03:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m0g3V-0001F6-M3
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 04:03:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625558623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/yLDbQD+gROycLJLrejDPhMkFJhwch2sJKywzc+X9Ac=;
 b=eK6/rCbpqu/utrt/pfF/CCwD/0SefZ9C497TA8WCJ6P7ha1zWm6BIR5Ga+cS89xxN/T/Vw
 aBCgXdu+nut9+Xvv4HR4GL+ieXzePEv1MSOaLklQACdEQapBoFTOfpskKSIVUSDV8TKGnR
 jZRz0c2BxOVWDKE7joFyBej4z1QL2YQ=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-dgY5fHYkP7iHjkOnY3Dydg-1; Tue, 06 Jul 2021 04:03:42 -0400
X-MC-Unique: dgY5fHYkP7iHjkOnY3Dydg-1
Received: by mail-pl1-f200.google.com with SMTP id
 a6-20020a1709027d86b02901019f88b046so7009644plm.21
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 01:03:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=/yLDbQD+gROycLJLrejDPhMkFJhwch2sJKywzc+X9Ac=;
 b=tqcK6MnIr2IHAPy7TE6I4nDhuxfkUXKaFbMqtXRfBmo1YKZaS3e2lxUsiP+6fXTroF
 ltKmRJF88m8QHOaGT3dmL3B6gFPJFnjTr97Rq+JGDbWKWvCbhG++l1wqZt8KKKM3Shth
 HHlw35regT1pdzTOnpUGBAPs0dlC6ksPbFy15EB9mrOZXFzijRdgGjkt9ouiYqXUZ2n5
 AYy1NJEkEgN48N6BS6qmerMk1w4MUvJc4gfAXlzez79Ld41qougVoJrLTAvVugMLnlFe
 hbzeEk5WttiyuDNOHrtPI0qi6cRUfqB052rjaxMHvDsn7M2P7MzKeo4ZkO7hbjs4QB0E
 6UOw==
X-Gm-Message-State: AOAM533Qjt/xBoOFJvhCrMHosEruc3rgfMADvv3F+s6q5LCAZ0L5AaHb
 NtYIp/JsSWzntj4jo+eFTcjB5YlHeg0Z7j4lFbigq6tX3R/tGId9FAGU5iEeZ9g02tShZVhisT3
 xKCvCLrm9+gkqMtE=
X-Received: by 2002:a17:90a:390d:: with SMTP id
 y13mr19685987pjb.52.1625558621329; 
 Tue, 06 Jul 2021 01:03:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUAbBBAkmRx2dNG8uKNbXUAMLeHIkyf1j3xzlpMymyZfZ4XlPvs8vJbwRByDoJaVVnUFdiZw==
X-Received: by 2002:a17:90a:390d:: with SMTP id
 y13mr19685968pjb.52.1625558621065; 
 Tue, 06 Jul 2021 01:03:41 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id r188sm16146896pfc.167.2021.07.06.01.03.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 01:03:40 -0700 (PDT)
Subject: Re: [PATCH 07/18] vhost-vdpa: tweak the error label in
 vhost_vdpa_add()
To: Stefano Garzarella <sgarzare@redhat.com>
References: <20210621041650.5826-1-jasowang@redhat.com>
 <20210621041650.5826-8-jasowang@redhat.com>
 <20210623150312.7g43l5qjwacxhw43@steredhat>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <208edb63-a0d1-6d6b-e451-b17cb24708ed@redhat.com>
Date: Tue, 6 Jul 2021 16:03:32 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210623150312.7g43l5qjwacxhw43@steredhat>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Cc: lulu@redhat.com, mst@redhat.com, qemu-devel@nongnu.org, eperezma@redhat.com,
 elic@nvidia.com, lingshan.zhu@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/6/23 下午11:03, Stefano Garzarella 写道:
> On Mon, Jun 21, 2021 at 12:16:39PM +0800, Jason Wang wrote:
>> Introduce new error label to avoid the unnecessary checking of net
>> pointer.
>>
>> Fixes: 1e0a84ea49b68 ("vhost-vdpa: introduce vhost-vdpa net client")
>> Signed-off-by: Jason Wang <jasowang@redhat.com>
>> ---
>> net/vhost-vdpa.c | 13 ++++++-------
>> 1 file changed, 6 insertions(+), 7 deletions(-)
>>
>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
>> index 21f09c546f..0da7bc347a 100644
>> --- a/net/vhost-vdpa.c
>> +++ b/net/vhost-vdpa.c
>> @@ -100,19 +100,18 @@ static int vhost_vdpa_add(NetClientState *ncs, 
>> void *be)
>>     net = vhost_net_init(&options);
>>     if (!net) {
>>         error_report("failed to init vhost_net for queue");
>> -        goto err;
>> +        goto err_init;
>>     }
>>     s->vhost_net = net;
>>     ret = vhost_vdpa_net_check_device_id(net);
>>     if (ret) {
>> -        goto err;
>> +        goto err_check;
>>     }
>>     return 0;
>> -err:
>> -    if (net) {
>> -        vhost_net_cleanup(net);
>> -        g_free(net);
>> -    }
>> +err_check:
>> +    vhost_net_cleanup(net);
>> +    g_free(net);
>
> Should we set s->vhost_net to NULL to avoid use after free?
>
> Then we should also remove the `assert(s->vhost_net)` in 
> net_vhost_vdpa_init() since we can fail.


Right, will do this in a separate patch.

Thanks


>
>> +err_init:
>>     return -1;
>> }
>>
>> -- 
>> 2.25.1
>>
>>
>


