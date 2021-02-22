Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B13321ED5
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 19:11:00 +0100 (CET)
Received: from localhost ([::1]:50762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEFff-0006Hs-Oh
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 13:10:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEFQl-0008Bz-Hc
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 12:55:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEFQk-00031D-4n
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 12:55:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614016533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t89lZKLqCO4VYd6O0PpdgWByUVQCD0QvoT+H52iM000=;
 b=B04a+SxC4ZULPQ3jzjUD0oBEeVgG6LTFj7ISRld919N2PGPn3Az+N6mwMXVSjIaSe8duBE
 ARViygPTzhNhNtxopSc6vkB5505Ig+K8vw7sD+vDi5mJ26faRlcesDQ4Mo8BdkdDc0l1ON
 YkDLFxBnD+nxkxXAaHqIXmYKn4hTj4w=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-9nVMTJj2NZmKm8mfmSK38g-1; Mon, 22 Feb 2021 12:55:31 -0500
X-MC-Unique: 9nVMTJj2NZmKm8mfmSK38g-1
Received: by mail-ej1-f70.google.com with SMTP id f3so2547954eje.20
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 09:55:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=t89lZKLqCO4VYd6O0PpdgWByUVQCD0QvoT+H52iM000=;
 b=MDQQ0cwXZizEJb5dmlsdBwsrmJLKQEKDaMRACrcFBmXYKUAF6hvaZ38sPDW4I5VOBp
 sZvd/bZxx+kjrRyDFbdtX5odR5aaK4xYzfV8b8dlDmVz3+p9m4nM8Mn4daqZvq78XgfY
 xwxOd5u+1yf1RJx4ljZNZsjlfbdRWp9awjs1Obfo3kq86speXK6NEfaGFAev4I7a02+w
 XdnzYY21GjSImpMf7+vjRemd7N7hF750anRGkuiks76F60QKsc63G/eN0FZkP6Tl/mzq
 gkGFsNzqAnm2aov+28n5hmkEizyxGQjsQ843bqFKN16H3ZZTCNY6OWMFHKORd7Ri4CqY
 tgVg==
X-Gm-Message-State: AOAM533mh8AAZ0vBPigDIoViEhjgYUHh5N1DjzLFNAJBs52lWd2zOnRY
 0npZJzeUi797HJowgGTXjc9FzVQfk/sfDUNP6RwoJsvD0ynSRDRI/QQRDdeq+HSUhkk3I6M0EOm
 f733DssaHh3bnQYE=
X-Received: by 2002:a17:907:1b02:: with SMTP id
 mp2mr22528108ejc.419.1614016530386; 
 Mon, 22 Feb 2021 09:55:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyDb0MhC/DdyeV92Vo4GkIDlIBGmJ+hn6v0PQMxa90uJkyAmwqOnVaD9mx60FGQ9ufhUfLBMw==
X-Received: by 2002:a17:907:1b02:: with SMTP id
 mp2mr22528078ejc.419.1614016530191; 
 Mon, 22 Feb 2021 09:55:30 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id h4sm13219476edv.80.2021.02.22.09.55.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 09:55:29 -0800 (PST)
Subject: Re: [PATCH v2 0/2] block: Use 'read-zeroes=true' mode by default with
 'null-co' driver
To: Fam Zheng <fam@euphon.net>
References: <20210211142656.3818078-1-philmd@redhat.com>
 <20210213215448.GA67780@ip-172-44-255-31>
 <3da6a2aa-472e-d9e1-b803-303891513274@redhat.com>
 <38dd38eb-af59-8baf-b908-fb6c4e842cd1@redhat.com>
 <20210222173532.GA117898@ip-172-44-255-31>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5f6c8e8f-ccc9-7098-0fb0-53ec1da33466@redhat.com>
Date: Mon, 22 Feb 2021 18:55:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210222173532.GA117898@ip-172-44-255-31>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/21 6:35 PM, Fam Zheng wrote:
> On 2021-02-19 15:09, Philippe Mathieu-Daudé wrote:
>> On 2/19/21 12:07 PM, Max Reitz wrote:
>>> On 13.02.21 22:54, Fam Zheng wrote:
>>>> On 2021-02-11 15:26, Philippe Mathieu-Daudé wrote:
>>>>> The null-co driver doesn't zeroize buffer in its default config,
>>>>> because it is designed for testing and tests want to run fast.
>>>>> However this confuses security researchers (access to uninit
>>>>> buffers).
>>>>
>>>> I'm a little surprised.
>>>>
>>>> Is changing default the only way to fix this? I'm not opposed to
>>>> changing the default but I'm not convinced this is the easiest way.
>>>> block/nvme.c also doesn't touch the memory, but defers to the device
>>>> DMA, why doesn't that confuse the security checker?
>>
>> Generally speaking, there is a balance between security and performance.
>> We try to provide both, but when we can't, my understanding is security
>> is more important.
> 
> Why is hiding the code path behind a non-default more secure? What is
> not secure now?

Se we are back to the problem of having default values.

I'd like to remove the default and have the option explicit,
but qemu_opt_get_bool() expects a 'default' value.

Should we rename qemu_opt_get_bool() -> qemu_opt_get_bool_with_default()
and add a simpler qemu_opt_get_bool()?


