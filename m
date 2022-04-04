Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A7F4F1528
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 14:44:27 +0200 (CEST)
Received: from localhost ([::1]:53392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbM4G-0004N4-LW
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 08:44:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.davydov@openvz.org>)
 id 1nbLyw-0002aT-Cp
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 08:38:54 -0400
Received: from [2a00:1450:4864:20::12f] (port=36662
 helo=mail-lf1-x12f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.davydov@openvz.org>)
 id 1nbLyu-0000HP-Bl
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 08:38:54 -0400
Received: by mail-lf1-x12f.google.com with SMTP id b17so9345057lfv.3
 for <qemu-devel@nongnu.org>; Mon, 04 Apr 2022 05:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=apYkqEkrQ7OJNtnnGb1W13z+vw8T8mJ6MG/ms4iW7B8=;
 b=ZJpcmK09yhCFOEjAL5SoQ9mqZPplzOjijV5NoAfixjma1kSTKjNydhc52DiG90/zee
 dx4xCToD2TIJn0FjkY4CFcONz7Zoz3XRHeUL6GxaD2WnVerL5Y8C2nIVKrO2XDvusPGT
 +c0SyrogbpQiZQdek78UIYE81dwEQQcH4QgSDLnwhQYcWN5r/JTif2ADzQNAI0XdSjbV
 evplFrV9+plJi8/60ev7oeM6bC7OaHXK/Bl8I5ftG30sBNDSI9iqWWuZedgadRbkW++V
 hP8O0Uvy764qTScLwMa/I11ES2MSSBWbkxBzKCfYKO6zKmhaP98l5I9vdqX7u7dnWx1X
 IHPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=apYkqEkrQ7OJNtnnGb1W13z+vw8T8mJ6MG/ms4iW7B8=;
 b=ukUiPRX396dJNT2JJqldMvN+nIty7SrLJI//wc1uXCiF1qpQwzhrGNlmslO5PlYxud
 J4NwMb/KbPZVwvV6BXjbSqFSqEcT5oUUML9xo/fWL+IN6U9s6bQ+i8vwPb+eM5HQ9X1h
 AIRkw5oiPZyCiEIe7ef9ctxQyEKn/Ks14cWQIkBnNaaHDuM/WkZJGns91ASM8VO0iMdV
 ioxv7Q7mcWjpPqXN2KMVjYt6ojGq3pItO/20xB4uzwIEnxfQ/EHkSyrIFKVGb6llqE4L
 7sosprz5DpckXueFpxMNn8CB3F2TEtNpx0EcmxDtpOrjIdjGzvsk7SEx0J5TgcUmB6Vg
 pfww==
X-Gm-Message-State: AOAM530Pu7qTGnzNN6qoDzGcQbSSwS3r2e+S33QSaTw8f63hzKyfnwzD
 cPDkdcbh40G3erWrc1IGQt4r8Q==
X-Google-Smtp-Source: ABdhPJwvuty7xljK9Er1FXHKzcOoOVWlbsdCMftxrVHcL+4GrB8w1Aq/AP8/biUZ7yNSQKZx/Jn2hQ==
X-Received: by 2002:a05:6512:3b8f:b0:44a:7f61:46c6 with SMTP id
 g15-20020a0565123b8f00b0044a7f6146c6mr22301359lfv.109.1649075930401; 
 Mon, 04 Apr 2022 05:38:50 -0700 (PDT)
Received: from [192.168.50.150] ([93.175.1.181])
 by smtp.gmail.com with ESMTPSA id
 b19-20020a056512305300b0044a9638b343sm1124924lfb.303.2022.04.04.05.38.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 05:38:49 -0700 (PDT)
Message-ID: <01ed9d56-db57-32bd-bf58-c0f6669dd9fc@openvz.org>
Date: Mon, 4 Apr 2022 15:38:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 6/9] chardev: add appropriate getting address
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 qemu-devel@nongnu.org
References: <20220328211539.90170-1-maxim.davydov@openvz.org>
 <20220328211539.90170-7-maxim.davydov@openvz.org>
 <5c20f014-27e3-d6bb-1e8d-e111134a8dc3@mail.ru>
From: Maxim Davydov <maxim.davydov@openvz.org>
In-Reply-To: <5c20f014-27e3-d6bb-1e8d-e111134a8dc3@mail.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=maxim.davydov@openvz.org; helo=mail-lf1-x12f.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: eduardo@habkost.net, berrange@redhat.com, xiaoguangrong.eric@gmail.com,
 mst@redhat.com, jsnow@redhat.com, crosa@redhat.com, f4bug@amsat.org,
 chen.zhang@intel.com, armbru@redhat.com, wangyanan55@huawei.com,
 marcandre.lureau@redhat.com, imammedo@redhat.com, lizhijian@fujitsu.com,
 pbonzini@redhat.com, ani@anisinha.ca, den@openvz.org, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 3/30/22 14:32, Vladimir Sementsov-Ogievskiy wrote:
> 29.03.2022 00:15, Maxim Davydov wrote:
>> Attempt to get address after initialization shouldn't fail on assert in
>> the qapi automatically generated code. As a possible solution, it can
>> return null type.
>
> But at some point this address appears? May be we try to query it too 
> early, or we need some more initialization steps?
For example, query address after object_new_with_class(). Without the 
patch it triggers assert(). I tried to implement the same solution as in 
hw/ppc/spapr_drc.c:prop_get_fdt
>
> Isn't it better to report failure, when we try to query things that 
> are not yet initialized?
Yes, maybe it should set errp after visit_type_null. And it should be a 
common error for unrealized devices to fix the same problem with 
MemoryRegion, etc.
>
>>
>> Signed-off-by: Maxim Davydov <maxim.davydov@openvz.org>
>> ---
>>   chardev/char-socket.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/chardev/char-socket.c b/chardev/char-socket.c
>> index fab2d791d4..f851e3346b 100644
>> --- a/chardev/char-socket.c
>> +++ b/chardev/char-socket.c
>> @@ -33,6 +33,7 @@
>>   #include "qapi/clone-visitor.h"
>>   #include "qapi/qapi-visit-sockets.h"
>>   #include "qemu/yank.h"
>> +#include "qapi/qmp/qnull.h"
>>     #include "chardev/char-io.h"
>>   #include "chardev/char-socket.h"
>> @@ -1509,6 +1510,14 @@ char_socket_get_addr(Object *obj, Visitor *v, 
>> const char *name,
>>   {
>>       SocketChardev *s = SOCKET_CHARDEV(obj);
>>   +    QNull *null = NULL;
>> +
>> +    /* Return NULL type if getting addr was called after init */
>> +    if (!s->addr) {
>> +        visit_type_null(v, NULL, &null, errp);
>> +        return;
>> +    }
>> +
>>       visit_type_SocketAddress(v, name, &s->addr, errp);
>>   }
>
>
-- 
Best regards,
Maxim Davydov


