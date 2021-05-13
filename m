Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72EF437FC13
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 19:05:27 +0200 (CEST)
Received: from localhost ([::1]:50832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhEm6-0002oR-Fq
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 13:05:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhET1-0000oy-Fo
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:45:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhESw-0004Fu-C5
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:45:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620924335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3E/uPYgPYgXvmYGbo0VC4ehMPtTxlbW+WJOigSuCc5s=;
 b=APNlghcQgQiupdBUzV7CT2u0t3GCxjKKn2SCbsJuQd6JQSU/I5FwmccrTMvnao5xG3dmbS
 l3+zxevPvi/G3jVruPAsxdPYBavGtBTVji4WgjHJAXU26JKotk+kFUUiwMQAtN4Z0Xjk4m
 GBTr+KCp6j1xYBat6a648oKPYrHgXok=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-CZVJU8HGMSGcpfaw6BTwAQ-1; Thu, 13 May 2021 12:45:29 -0400
X-MC-Unique: CZVJU8HGMSGcpfaw6BTwAQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 sd18-20020a170906ce32b02903cedf584542so2512388ejb.9
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 09:45:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3E/uPYgPYgXvmYGbo0VC4ehMPtTxlbW+WJOigSuCc5s=;
 b=Ps5gpuK5W5cIIdJ5kG+Df8dA4W1oco/dgwYArjQAJI8mMDbRM8aiW1i9m+uXpq9UVp
 OCgvbi/JmK/uBXj1zWTueduZiM2MoX7RsOI7gLL/5STlVI++JlTWn+V70LfceR5Yyamu
 iJLINst+iDrMfQkoUd5CHAZ38BTG52+IgsP79BTm+VSVmYUBV7dFiw+QikRgaKwuCcJE
 a0BmB2Mdiuylqf9vy/CPRh3X4VgWlkKj7EHugyrVNPG6mxQH1hOfGzeeKpIs290iwVsB
 0YlEMFbGHZXMi2ZcXa/xRBiAFavmELBOi+3LKbY9ibP3apbLUxPhoTrIrSZzcfCD1vsF
 oC9A==
X-Gm-Message-State: AOAM533ge6qYQFyW4eousBKkZxfEUbp4angrFwxWUnpvQT691FKtXikR
 iLSpUxOIB2IyWRMv35Wzo5p96aWKihwGJjydM+Prnch9ERbEsjpAVQyrJkCbCrsDMJOW2FCs/Xg
 j35ckimGyvewXBt0=
X-Received: by 2002:a17:906:27c3:: with SMTP id
 k3mr44375099ejc.519.1620924327872; 
 Thu, 13 May 2021 09:45:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7QSH65FLjlVUybwNjSbGwB041dNjAnbUyD9dy59f9u3mmTKjsApTPuO9GyBTnsjg9iOoxbQ==
X-Received: by 2002:a17:906:27c3:: with SMTP id
 k3mr44375073ejc.519.1620924327626; 
 Thu, 13 May 2021 09:45:27 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id d25sm2659852edx.58.2021.05.13.09.45.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 09:45:27 -0700 (PDT)
Subject: Re: [PATCH] migration/rdma: Fix cm_event used before being initialized
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Li Zhijian <lizhijian@cn.fujitsu.com>, quintela@redhat.com,
 dgilbert@redhat.com, qemu-stable@nongnu.org
References: <20210513113750.22970-1-lizhijian@cn.fujitsu.com>
 <56d58cef-1ef0-b68e-9ae3-673767a89074@redhat.com>
Message-ID: <7a538ce7-b224-8993-63b7-934fef4da5d9@redhat.com>
Date: Thu, 13 May 2021 18:45:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <56d58cef-1ef0-b68e-9ae3-673767a89074@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: qemu-devel@nongnu.org, Yuval Shaia <yuval.shaia.ml@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/13/21 6:13 PM, Philippe Mathieu-Daudé wrote:
> On 5/13/21 1:37 PM, Li Zhijian wrote:
>> A segmentation fault was triggered when i try to abort a postcopy + rdma
>> migration.
>>
>> since rdma_ack_cm_event releases a uninitialized cm_event in thise case.
>>
>> like below:
>> 2496     ret = rdma_get_cm_event(rdma->channel, &cm_event);
>> 2497     if (ret) {
>> 2498         perror("rdma_get_cm_event after rdma_connect");
>> 2499         ERROR(errp, "connecting to destination!");
>> 2500         rdma_ack_cm_event(cm_event); <<<< cause segmentation fault
>> 2501         goto err_rdma_source_connect;
>> 2502     }
>>
>> Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
>> ---
>>  migration/rdma.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/migration/rdma.c b/migration/rdma.c
>> index 00eac34232..2dadb62aed 100644
>> --- a/migration/rdma.c
>> +++ b/migration/rdma.c
>> @@ -2466,7 +2466,7 @@ static int qemu_rdma_connect(RDMAContext *rdma, Error **errp)
>>                                            .private_data = &cap,
>>                                            .private_data_len = sizeof(cap),
>>                                          };
>> -    struct rdma_cm_event *cm_event;
>> +    struct rdma_cm_event *cm_event = NULL;
>>      int ret;
>>  
>>      /*
>>
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 

Cc: qemu-stable@nongnu.org


