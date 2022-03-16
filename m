Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AD04DB1F8
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 14:57:39 +0100 (CET)
Received: from localhost ([::1]:40138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUU9h-0008No-UQ
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 09:57:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nUTsh-0004C7-M4
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:40:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nUTse-0006Yw-Q3
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:40:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647437999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fqmyphtfT9IMBPqWCDHRx4sBKeedmhVqPZsbFgnH/sI=;
 b=Pq7PNmgqGoH/7yT0/uaST2ZLWkxxqmxkCkN026Lz/2skBtGBVIiNLa4hQCJQ4tQUcMEfBJ
 N2fv7iWE78htxaD+UPCOd8wyJOxwf9PvXZbamWWafbPzJgk8xObYwiVsFeWH6YFQmNKZ9+
 Van3qhvf9tdAURNvIpqf4bBXSsTeW3w=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-457-BFxaZl_gNlWRzYp3lOqxVg-1; Wed, 16 Mar 2022 09:39:58 -0400
X-MC-Unique: BFxaZl_gNlWRzYp3lOqxVg-1
Received: by mail-wr1-f69.google.com with SMTP id
 x15-20020a5d6b4f000000b001ee6c0aa287so579271wrw.9
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 06:39:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fqmyphtfT9IMBPqWCDHRx4sBKeedmhVqPZsbFgnH/sI=;
 b=JuJI6hI9HB4lmQCjBW3C72y0x8F6SDbIDpJpb/Jw6IJQxVenhe0o8t7+dg84DfR0X5
 JvllIWTOp6K0XAnmxRqc4VSZuDlI/gxd7qc7LEoPjFDSFeShHOAi8nckn6KWfP/fByxE
 GGPATUg43/WSp2y1JAZTQjPFR7oK41Hw16reTvAa5vSsdEsFDhk9EBppOpQRYH7BN1l9
 fjKic0tA4hFgMYOcyASfx1zwF29EZi9KlyO0EF0TaFHvooMvz/a3GHzC2R+9DTfFPqh5
 02e3Sc6SD/nzbtainDFma9jh+1xpDPF5T02cEDCsfsxbw8TJ6Snm0rmNMLbvojRmMyLm
 MLFA==
X-Gm-Message-State: AOAM531dImEisDP/81QCyLilHezOZ+OStHvYkgIRx/l6A9+uwc7mqOjG
 /ZkR6qV5qBPJ9iOYA5TddKf2oETcFarS5vIaRvP6EJYPxfbSpskBLz3+7HJZW4bp9OjNL0I72Le
 +m8Va7gCn9JdPvBI=
X-Received: by 2002:a05:600c:3482:b0:38c:40:9b30 with SMTP id
 a2-20020a05600c348200b0038c00409b30mr5631159wmq.68.1647437996981; 
 Wed, 16 Mar 2022 06:39:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4k4lMyjwfMkfGhk5AMk7oz34JL/O212bqJZgmwbRA0Yw7Tjkq3QKXyR5mWx9qEcCDE2Hj1Q==
X-Received: by 2002:a05:600c:3482:b0:38c:40:9b30 with SMTP id
 a2-20020a05600c348200b0038c00409b30mr5631134wmq.68.1647437996687; 
 Wed, 16 Mar 2022 06:39:56 -0700 (PDT)
Received: from [192.168.42.76] (tmo-065-170.customers.d1-online.com.
 [80.187.65.170]) by smtp.gmail.com with ESMTPSA id
 11-20020a05600c22cb00b00382a960b17csm5041631wmg.7.2022.03.16.06.39.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 06:39:56 -0700 (PDT)
Message-ID: <e5e03938-d602-c928-07ef-da6486fb99b0@redhat.com>
Date: Wed, 16 Mar 2022 14:39:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 2/3] hw/display: Allow vga_common_init() to return errors
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org
References: <20220316132402.1190346-1-thuth@redhat.com>
 <20220316132402.1190346-3-thuth@redhat.com>
 <64353530-4488-8820-c58c-a5e104e93b4b@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <64353530-4488-8820-c58c-a5e104e93b4b@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/03/2022 14.32, Philippe Mathieu-Daudé wrote:
> On 16/3/22 14:24, Thomas Huth wrote:
>> The vga_common_init() function currently cannot report errors to its
>> caller. But in the following patch, we'd need this possibility, so
>> let's change it to take an "Error **" as parameter for this.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   hw/display/ati.c            |  7 ++++++-
>>   hw/display/cirrus_vga.c     |  7 ++++++-
>>   hw/display/cirrus_vga_isa.c |  7 ++++++-
>>   hw/display/qxl.c            |  6 +++++-
>>   hw/display/vga-isa.c        |  9 ++++++++-
>>   hw/display/vga-mmio.c       |  8 +++++++-
>>   hw/display/vga-pci.c        | 15 +++++++++++++--
>>   hw/display/vga.c            |  9 +++++++--
>>   hw/display/vga_int.h        |  2 +-
>>   hw/display/virtio-vga.c     |  7 ++++++-
>>   hw/display/vmware_vga.c     |  2 +-
>>   11 files changed, 66 insertions(+), 13 deletions(-)
> 
> Please setup scripts/git.orderfile :)
> 
>> diff --git a/hw/display/vga_int.h b/hw/display/vga_int.h
>> index 847e784ca6..3e8892df28 100644
>> --- a/hw/display/vga_int.h
>> +++ b/hw/display/vga_int.h
>> @@ -156,7 +156,7 @@ static inline int c6_to_8(int v)
>>       return (v << 2) | (b << 1) | b;
>>   }
>> -void vga_common_init(VGACommonState *s, Object *obj);
>> +void vga_common_init(VGACommonState *s, Object *obj, Error **errp);
> 
> Can we also return a boolean value? IIUC Markus recommended to check
> a boolean return value rather than Error* handle.

Really? A very quick grep shows something different:

$ grep -r ^void.*Error include/ | wc -l
94
$ grep -r ^bool.*Error include/ | wc -l
46

I also can't see that recommendation in docs/devel/style.rst. I think you 
either got that wrong, or the coding style needs an update first.

  Thomas


