Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA84615CC3
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 08:11:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oq7tx-0004Ub-Bi; Wed, 02 Nov 2022 03:11:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oq7tv-0004U5-78
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 03:11:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oq7ts-0002Pf-Pd
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 03:11:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667373060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rjqGWo0Q8LA9AOUs0/AKru4ETW+tUE7XSavqHeDMjW4=;
 b=RgRs+fNMbGj1jgXRKUOxlYF5jOaUZHE6iINq7B77PskLXazUgV+unoTLz8EOtezLiDpXOo
 EnZM9Sjjm27iJWiZUVSCAQy1A70d313QHJX0rIcsgBSbJdH2rPoQlmLqIM0bQM6T4a+6Hu
 g14m3LkhqiapN/hGYoKIWGC05tnD4Ig=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-596-FruBT_3sPp6qsAwgsXcsXQ-1; Wed, 02 Nov 2022 03:10:58 -0400
X-MC-Unique: FruBT_3sPp6qsAwgsXcsXQ-1
Received: by mail-qk1-f198.google.com with SMTP id
 x22-20020a05620a259600b006b552a69231so14432429qko.18
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 00:10:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rjqGWo0Q8LA9AOUs0/AKru4ETW+tUE7XSavqHeDMjW4=;
 b=OxS69/KsTEB41YNzx8h3buSEGxH9/auR8sRyR3yOBrzisCPVb/l+3U7XTOfI4niiI0
 NjtDLwtDaneySHb7HFAyvQE0SpCv4z6DUnkn3bf6cF4vomTVPcPVlWRJiI3Dg1vZO9N8
 CtTpvdEo6r2HPNK6B4lYK6y8wPSGl2U6d+cMSUHfsQMrXo0VvdxnjnrdWEZ+CItJD/5v
 L6lq0gUACWGCKlhCUdDiaoCxlUKf8PpKpslYwrdlkSH3UsqVb4nI9lAxE/+SoEc1ifRU
 UYOq85Cp5sh982W41ZgC6FysRYtb0OBwPfDFaWXWtvVSAZvZYNfYwv6LtWCM5oHB0Bht
 V74w==
X-Gm-Message-State: ACrzQf10TSZCMx+9tGQv0Zhp/RLuP0BghtW0TLywXEh/hFXZAc+IF5z9
 i57dwLhiQAfUa1oaAh//op7b753Ic1kOmvd2yWvnplDfAt0KsX9AjdHYToKl6isIrr1JrhdG2MS
 5pif/t2uLymvl8wM=
X-Received: by 2002:a37:308:0:b0:6f9:389a:3a49 with SMTP id
 8-20020a370308000000b006f9389a3a49mr16213980qkd.301.1667373058494; 
 Wed, 02 Nov 2022 00:10:58 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5CprM8eFBq7zi2ED00QjxKlbfOXq0D9y45YwwDmQ8oAwimp4IsHGBh7cQeVjGTg3xCQySFug==
X-Received: by 2002:a37:308:0:b0:6f9:389a:3a49 with SMTP id
 8-20020a370308000000b006f9389a3a49mr16213962qkd.301.1667373058258; 
 Wed, 02 Nov 2022 00:10:58 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-201.web.vodafone.de.
 [109.43.177.201]) by smtp.gmail.com with ESMTPSA id
 br30-20020a05620a461e00b006fa468342a3sm2684569qkb.108.2022.11.02.00.10.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Nov 2022 00:10:57 -0700 (PDT)
Message-ID: <6203a6be-7b48-3ee2-2bfa-48fff291c14b@redhat.com>
Date: Wed, 2 Nov 2022 08:10:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH RFC 1/4] net: Introduce qmp cmd "query-netdev"
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>, huangy81@chinatelecom.cn
Cc: qemu-devel <qemu-devel@nongnu.org>, "Michael S . Tsirkin"
 <mst@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
References: <cover.1667232396.git.huangy81@chinatelecom.cn>
 <d254324983817fb380411995155c9e927edaeb92.1667232396.git.huangy81@chinatelecom.cn>
 <CACGkMEvvoVwtr8aSqTpAVxYN7q7mxMmLbusfgKDf3zwfmk2itg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CACGkMEvvoVwtr8aSqTpAVxYN7q7mxMmLbusfgKDf3zwfmk2itg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.051,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 02/11/2022 06.42, Jason Wang wrote:
> On Tue, Nov 1, 2022 at 12:19 AM <huangy81@chinatelecom.cn> wrote:
>>
>> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>>
>> For netdev device that can offload virtio-net dataplane to slave,
>> such as vhost-net, vhost-user and vhost-vdpa, exporting it's
>> capability information and acked features would be more friendly for
>> developers. These infomation can be analyzed and compare to slave
>> capability provided by, eg dpdk or other slaves directly, helping to
>> draw conclusions about if vm network interface works normally, if
>> it vm can be migrated to another feature-compatible destination or
>> whatever else.
>>
>> For developers who devote to offload virtio-net dataplane to DPU
>> and make efforts to migrate vm lively from software-based source
>> host to DPU-offload destination host smoothly, virtio-net feature
>> compatibility is an serious issue, exporting the key capability
>> and acked_features of netdev could also help to debug greatly.
>>
>> So we export out the key capabilities of netdev, which may affect
>> the final negotiated virtio-net features, meanwhile, backed-up
>> acked_features also exported, which is used to initialize or
>> restore features negotiated between qemu and vhost slave when
>> starting vhost_dev device.
>>
>> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>> ---
>>   net/net.c     | 44 +++++++++++++++++++++++++++++++++++++++
>>   qapi/net.json | 66 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>   2 files changed, 110 insertions(+)
>>
>> diff --git a/net/net.c b/net/net.c
>> index 2db160e..5d11674 100644
>> --- a/net/net.c
>> +++ b/net/net.c
>> @@ -53,6 +53,7 @@
>>   #include "sysemu/runstate.h"
>>   #include "net/colo-compare.h"
>>   #include "net/filter.h"
>> +#include "net/vhost-user.h"
>>   #include "qapi/string-output-visitor.h"
>>
>>   /* Net bridge is currently not supported for W32. */
>> @@ -1224,6 +1225,49 @@ void qmp_netdev_del(const char *id, Error **errp)
>>       }
>>   }
>>
>> +static NetDevInfo *query_netdev(NetClientState *nc)
>> +{
>> +    NetDevInfo *info = NULL;
>> +
>> +    if (!nc || !nc->is_netdev) {
>> +        return NULL;
>> +    }
>> +
>> +    info = g_malloc0(sizeof(*info));
>> +    info->name = g_strdup(nc->name);
>> +    info->type = nc->info->type;
>> +    info->ufo = nc->info->has_ufo;
>> +    info->vnet_hdr = nc->info->has_vnet_hdr;
>> +    info->vnet_hdr_len = nc->info->has_vnet_hdr_len;
> 
> So all the fields are virtio specific, I wonder if it's better to
> rename the command as query-vhost or query-virtio?

And add a "x-" prefix (and a "-netdev" suffix) as long as we don't feel 
confident about this yet? "x-query-virtio-netdev" ?

  Thomas


