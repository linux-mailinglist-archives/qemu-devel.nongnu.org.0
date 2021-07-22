Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FA13D20A9
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 11:18:51 +0200 (CEST)
Received: from localhost ([::1]:53602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Uqw-00041I-7s
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 05:18:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m6Uot-00024W-0o
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 05:16:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m6Uoo-00087N-Dm
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 05:16:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626945396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cuH8Wy5ZW/XenjMi0TCWy/7JPcuqC4OpxXwEPVSchss=;
 b=fFciRi363pgyBpAN/xAWQympfkji24Oucm1/tmOCXwnPvoh3tdET4nTRmRmxga4W6RUN1n
 rytWKyIBdqM+sOKt72n3kEzEUSIhcgKGxWEN0mB4i5cvAxbYO9QeKCrTYE3mPC3g9PcDIR
 05/Eudimn1AzckzsC6ba7gPQWHNyQBU=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541-0alLL8r_MYqZA0uLreXoxw-1; Thu, 22 Jul 2021 05:16:34 -0400
X-MC-Unique: 0alLL8r_MYqZA0uLreXoxw-1
Received: by mail-pl1-f199.google.com with SMTP id
 x6-20020a170902ec86b029012bb183b35cso318516plg.3
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 02:16:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=cuH8Wy5ZW/XenjMi0TCWy/7JPcuqC4OpxXwEPVSchss=;
 b=ma5dIbeXri+IdUwTVdtasy2Wkng5WwUhSGk6PkfeYizGaiEStblUV9bTpEN4ICWqeE
 CZxTG0uJ6bJvsYtUivxFVOaEurIQ8YL/vI3DYFChvKmZQetGCr0DOV7Uo2nBnQWVLR55
 TXkOs8W4tdMeb9f/HC2+F9qKyjmqWsWx3fv8NX1xCvgoOBhr6wha7NnxuqRoQ6nIP9aK
 Er9yEalN0f8VfHBFSGDlG3fCI4o6YJECYPIUhECsiXbNZv86WmG9rv5irlStrQqx5lhI
 syamiCt9zzjbYcli5JaUXftH3/dBvN9dQ67koBn9Y2Gx+4S/xUDF5uVby822qZcdBk+/
 hK7Q==
X-Gm-Message-State: AOAM53209pvpZvt7RF9nNfzksnju1jm6xZRxhBLoe/SvKmpdsANaquLI
 MGNkGaToegLwgRzsDsh2MkBGf6fKm9La1s0R7pHk7aXOvFJrdA7aGWahQkrrHPAZgDXWzu/xkUh
 krD1eBPvPhnbVu9U=
X-Received: by 2002:a17:90a:9ab:: with SMTP id 40mr8045117pjo.9.1626945393912; 
 Thu, 22 Jul 2021 02:16:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqmG8KhPCz3r5YqRRa3SOtwG6kJ4ZKB1uP8+LXa7TEGDq0q4v8qgMpqVhr2psrqKOR7niPpA==
X-Received: by 2002:a17:90a:9ab:: with SMTP id 40mr8045078pjo.9.1626945393619; 
 Thu, 22 Jul 2021 02:16:33 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id r15sm25145896pje.12.2021.07.22.02.16.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 02:16:33 -0700 (PDT)
Subject: Re: [PATCH v6 0/6] hmp, qmp: Add some commands to introspect virtio
 devices
To: Jonah Palmer <jonah.palmer@oracle.com>, qemu-devel@nongnu.org
References: <1626086137-16292-1-git-send-email-jonah.palmer@oracle.com>
 <11b4c5b0-e595-2b86-2dab-54e821e47ad2@redhat.com>
 <f6902815-df0b-949a-4eac-9f2a0093499d@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <d8c3705f-a99f-a7a7-c8d7-fa93e5367744@redhat.com>
Date: Thu, 22 Jul 2021 17:16:21 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <f6902815-df0b-949a-4eac-9f2a0093499d@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.117, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, thuth@redhat.com, qemu-block@nongnu.org,
 mst@redhat.com, michael.roth@amd.com, david@redhat.com, armbru@redhat.com,
 amit@kernel.org, dgilbert@redhat.com, eric.auger@redhat.com,
 dmitrii.stepanov@cloud.ionos.com, kraxel@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com, si-wei.liu@oracle.com, marcandre.lureau@redhat.com,
 joao.m.martins@oracle.com, mreitz@redhat.com,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/7/21 下午4:53, Jonah Palmer 写道:
>
> Hi Jason. My apologies for the delayed response, several work-related 
> things came up recently, but they're slowing down now so I'm turning 
> my attention these patches to get taken care of.
>
> A few questions and comments below (and in other following patches):
>
>
> On 7/13/21 10:42 PM, Jason Wang wrote:
>>
>> 在 2021/7/12 下午6:35, Jonah Palmer 写道:
>>>          Dump the information of the head element of the third queue 
>>> of virtio-scsi:
>>>
>>>          (qemu) virtio queue-element 
>>> /machine/peripheral-anon/device[3]/virtio-backend 3
>>>          index: 122
>>>          ndescs: 3
>>>          descs: addr 0x7302d000 len 4096 (write), addr 0x3c951763 
>>> len 108 (write, next),
>>>                 addr 0x3c951728 len 51 (next)
>>
>>
>> I think it would be nice if we can show driver area and device area 
>> as well here.
> Sure thing. And I apologize if it's obvious (I'm relatively new to virtio), but how can I expose the driver area?


So the spec defines three parts: the device area, the driver area, and 
the descriptor area. And they are all located in the guest memory.


> I understand that virtio devices are part of the Qemu process, but I also thought that virtio drivers are in the
> guest's kernel, which I don't believe I can see into from Qemu (or, at least, it's not obvious to me).


It works like how you access the descriptor ring (descriptor area).

Thanks


>
> Jonah
>>
>> Thanks
>>


