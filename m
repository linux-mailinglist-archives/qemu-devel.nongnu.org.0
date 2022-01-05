Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0E34855C8
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 16:23:47 +0100 (CET)
Received: from localhost ([::1]:34646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n588g-0007IF-Nw
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 10:23:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n5852-00040o-C7
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 10:20:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n584z-0007xe-7e
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 10:19:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641395996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wixdfRcrJ3EHAcrGtwTBn1el9oz6VCE1NevX1tyjLCY=;
 b=HaNVK9pAoKanZRhm/LTJy5hiuojHZACNBfjSwm2WAtHYOqN5kmrwms17dRos9ef2r7fIrU
 BFaC0kIo0NZ1x0SVQONBZQbvSM1FUas/iDMnVgtUfYlbUtlPdoFA+CzrA86nWBqV5hdWe0
 CmbPMbl0KAU5rhEifmEPMRrMvbr/HGk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-6-_6iR4XnQMrCOqSUIzBiUfw-1; Wed, 05 Jan 2022 10:19:53 -0500
X-MC-Unique: _6iR4XnQMrCOqSUIzBiUfw-1
Received: by mail-wm1-f72.google.com with SMTP id
 m19-20020a05600c4f5300b00345cb6e8dd4so10233228wmq.3
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 07:19:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wixdfRcrJ3EHAcrGtwTBn1el9oz6VCE1NevX1tyjLCY=;
 b=1/sWPpZfPWEWZU+gcs7fZUPfPn5gsWFk5eagupEyF3YMSl/AnEDhh3USuBsVKMNtpq
 e75JYCVF7sARTJdmSulBsDGrRQ0iIVwcVpBdPyziK3lau5mxxVTvnhG//cyDzX95FE0F
 7qt1DFa8S0d+40XpaI5cs/zfmgYf+qDIffXYmZGJownrELdBEvHnJUxS9pRO5EDRMp8D
 5OAVM9qlN7ThMNvE9OKwlTu49RTPfqWELkMEf1HzgcMCO4W4/qOKR694OeQ/X3TKfO6y
 WKjnuRMZFVfUj3pOsj1Wj8IdHNYRmMvgLFj0xoENnk8ScMcx89Y+QHiz4/Ys27bPFiXU
 qklA==
X-Gm-Message-State: AOAM530GGy1cTcNxk0HAsryUxSmHAcF3519BQS/SqPcrfE+IPfUlyhfk
 mgLx6fmBma5Alh9ISpl7y6wsLKUDextVBEfa5UVjiYFMAP9GhdbrTG+DNJ+6Wo1cnM92wwOFy8M
 Rl2/RKwJ2ZadKUBY=
X-Received: by 2002:a05:600c:1e05:: with SMTP id
 ay5mr3280926wmb.131.1641395991982; 
 Wed, 05 Jan 2022 07:19:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwMO98o0abDeloT7X/w3MnK1dPI23tUT5ZyrKLKtBZctXj5c1lwgmCfwwl/O8XnGR/HWUTKcQ==
X-Received: by 2002:a05:600c:1e05:: with SMTP id
 ay5mr3280902wmb.131.1641395991766; 
 Wed, 05 Jan 2022 07:19:51 -0800 (PST)
Received: from [192.168.8.100] (tmo-098-68.customers.d1-online.com.
 [80.187.98.68])
 by smtp.gmail.com with ESMTPSA id y11sm41787911wrp.86.2022.01.05.07.19.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jan 2022 07:19:51 -0800 (PST)
Message-ID: <a75ba9dc-92d1-7b10-7d50-cc0155df9c5e@redhat.com>
Date: Wed, 5 Jan 2022 16:19:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 1/1] softmmu: fix device deletion events with -device JSON
 syntax
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
References: <20220105123847.4047954-1-berrange@redhat.com>
 <20220105123847.4047954-2-berrange@redhat.com>
 <a2a94c4c-190f-9be6-eadf-bd1404a2e272@redhat.com>
 <YdWxZ0DYZT0zDuWP@redhat.com>
 <ef04e0ee-4349-a9cb-a3e7-2abfcc7aaedc@redhat.com>
 <YdW2qk19K5N7gr9W@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <YdW2qk19K5N7gr9W@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.057, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Peter Krempa <pkrempa@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/01/2022 16.18, Daniel P. Berrangé wrote:
> On Wed, Jan 05, 2022 at 04:00:54PM +0100, Laurent Vivier wrote:
>> On 05/01/2022 15:55, Daniel P. Berrangé wrote:
>>> On Wed, Jan 05, 2022 at 03:49:12PM +0100, Laurent Vivier wrote:
>>>> On 05/01/2022 13:38, Daniel P. Berrangé wrote:
>>>>> The -device JSON syntax impl leaks a reference on the created
>>>>> DeviceState instance. As a result when you hot-unplug the
>>>>> device, the device_finalize method won't be called and thus
>>>>> it will fail to emit the required DEVICE_DELETED event.
>>>>>
>>>>> A 'json-cli' feature was previously added against the
>>>>> 'device_add' QMP command QAPI schema to indicated to mgmt
>>>>> apps that -device supported JSON syntax. Given the hotplug
>>>>> bug that feature flag is no unusable for its purpose, so
>>>>
>>>> Not sure to understand: do you mean "now unusable"?
>>>
>>> An application wants to known whether QEMU can support JSON
>>> syntax with -device. If they look for the 'json-cli' feature
>>> as a witness, they'll end up using JSON with QEMU 6.2 which
>>> is giving them broken hotplug. This is unusable for any
>>> non-trivial use cases. So we need a new witness to indicate
>>> whether JSON is viable with -device, that only the newly
>>> fixed QEMU will report.
>>
>> I understand that, my problem was with your sentence:
>>
>> "Given the hotplug bug that feature flag is no unusable for its purpose"
> 
> What's the problem with that ? It is reasonabled to say a -device impl
> which is broken for hotplug is not usable for non-toy use cases.

So it should be "not usable" instead of "no usable" in the commit description.

  Thomas


