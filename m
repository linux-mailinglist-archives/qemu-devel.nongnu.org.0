Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BD347404A
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 11:20:26 +0100 (CET)
Received: from localhost ([::1]:37586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx4v3-0005dO-D2
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 05:20:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mx4tF-0004nw-IQ
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 05:18:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mx4tC-0001Wm-7a
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 05:18:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639477108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/5YfKMTdyjD6T5jzQ2ksQLavM5w0apmY1ui/FghlGUo=;
 b=dEWu9HyqkMLh9zxBtsB+KmjXhCLJB6/qa29K/titb57NYei874ndROFA4vlXpd1FR6SoQg
 C9uajb473oy6Vg9appgA5KtnX5428OUmrxdE/JCbJrmoUc8Jv0RMtowaMZc7Nk8aHkJFzJ
 LHjoEHm6tidtUSTL9llm745KPoDjjiQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-488-_pWjApksPzmBN78uFEQx_Q-1; Tue, 14 Dec 2021 05:18:27 -0500
X-MC-Unique: _pWjApksPzmBN78uFEQx_Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 j23-20020a05600c1c1700b0033283ea5facso5484121wms.1
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 02:18:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/5YfKMTdyjD6T5jzQ2ksQLavM5w0apmY1ui/FghlGUo=;
 b=poiBpXH0RwqBSGPOp9sktx2SS44PCznh/PlkXWs3MAJR6hhuebxQ5e9gV2vYXN/vw2
 iYICYRK/ZkVYl45B1J4D7jrcPdaClZOXy9qyCB2ht15padxIcIxoF3vH4m2bCtKAeXDY
 YqgdQfpyUlYkpogyhpM+Z9j6DgwH/kkmyeDZZuGxzv7fAH6eieMZDwfVw4rIuU1WvhcL
 +Ps/1BEkk7Ss9vwGv7GTnNdzja55PM3NbOdbW3wyePnnS8ww6LEazR5r+7/CyN1HjI7u
 bPcJSebJH4XsOXyoAyuQ8nCCZVcj4r1+2YU/5aPQ2Z8dCLM9ayXeCdcTBcoZteg7Jg3v
 Ftnw==
X-Gm-Message-State: AOAM530dWFt2cjyKCew3HG1TIV50g4xQK6UsFtCL3TQ643DJnbxxrn5i
 ansMfWFrusdf//Jive2csMNqdpA7aIIMY+omoZNrpNcscYJHhRZOqI0XeK/GYmXnlk01VG7L0MK
 qY4p/tK2vECOseeA=
X-Received: by 2002:a1c:a54e:: with SMTP id o75mr5070936wme.121.1639477106659; 
 Tue, 14 Dec 2021 02:18:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwjcDbUD2YreJO4heUONAfgPMByPsVLv9heqkxXcUFhvH+M8iobf6oQHBMrkqOmulUydHL2vg==
X-Received: by 2002:a1c:a54e:: with SMTP id o75mr5070900wme.121.1639477106411; 
 Tue, 14 Dec 2021 02:18:26 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id o4sm507177wmr.22.2021.12.14.02.18.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 02:18:26 -0800 (PST)
Message-ID: <b96112c8-c279-5cec-8670-25f12b560f5b@redhat.com>
Date: Tue, 14 Dec 2021 11:18:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2] MAINTAINERS: Change my email address
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20211214075424.6920-1-zhanghailiang@xfusion.com>
 <fc7b5d91-98f6-b146-4a67-5e6800bccadc@redhat.com>
 <YbhiU8ARoS5LcORY@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <YbhiU8ARoS5LcORY@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.962, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Hailiang Zhang <zhanghailiang@xfusion.com>, quintela@redhat.com,
 Wen Congyang <wencongyang2@huawei.com>, qemu-devel@nongnu.org,
 dgilbert@redhat.com, Gonglei <arei.gonglei@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/14/21 10:22, Daniel P. Berrangé wrote:
> On Tue, Dec 14, 2021 at 10:04:03AM +0100, Philippe Mathieu-Daudé wrote:
>> On 12/14/21 08:54, Hailiang Zhang wrote:
>>> The zhang.zhanghailiang@huawei.com email address has been
>>> stopped. Change it to my new email address.
>>>
>>> Signed-off-by: Hailiang Zhang <zhanghailiang@xfusion.com>
>>> ---
>>> hi Juan & Dave,
>>>
>>> Firstly, thank you for your working on maintaining the COLO framework.
>>> I didn't have much time on it in the past days.
>>>
>>> I may have some time in the next days since my job has changed.
>>>
>>> Because of my old email being stopped, i can not use it to send this patch.
>>> Please help me to merge this patch.
>>
>> Can we have an Ack-by from someone working at Huawei?
> 
> Why do we need that ?

To avoid anyone impersonating Hailiang Zhang...

But it doesn't have to be from the same company, as long
as someone knowing him vouch the change. Anyhow I am not
nacking this patch, I am trying to have a safer process.

> Subsystems are not owned by companies.
> 
> If someone moves company and wants to carry on in their existing
> role as maintainer that is fine and doesn't need approva from their
> old company IMHO.

I agree, this is why it is better to send that kind of change
from the to-be-stopped email address while it is still valid.

Thanks,

Phil.


