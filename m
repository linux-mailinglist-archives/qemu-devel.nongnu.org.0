Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2D151D526
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 12:04:56 +0200 (CEST)
Received: from localhost ([::1]:47230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmupS-0007vm-Ps
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 06:04:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmuoC-0007Fz-54
 for qemu-devel@nongnu.org; Fri, 06 May 2022 06:03:36 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.129.74]:50930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmuoA-0007HD-AS
 for qemu-devel@nongnu.org; Fri, 06 May 2022 06:03:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651831413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jBVEUPRZsGnJ/ez9AekaBRaRjESEUqmhNjC1+mF3dyA=;
 b=XSTY4uGl55jLMClACD0mByryIKCU3aI2MrT9qIFbzUX5NHgCBgZVOEtr+YiQd4e1uWlfUj
 LeuXrq09iGvXECFpFpR0w64Lpu2cfdtkuBe/O0cdoBqn4CWF1KOslHwzqIEvnX/gNde9vJ
 4LrnlO0pGu4POl0kdUzStNoRQifWgrY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-_CX7Ib9fMS6m0v1O54xwPA-1; Fri, 06 May 2022 06:03:32 -0400
X-MC-Unique: _CX7Ib9fMS6m0v1O54xwPA-1
Received: by mail-wr1-f72.google.com with SMTP id
 j27-20020adfb31b000000b0020c4ca11566so2386578wrd.14
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 03:03:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jBVEUPRZsGnJ/ez9AekaBRaRjESEUqmhNjC1+mF3dyA=;
 b=Ee0YsARUhdhob/ouDuT+Zmb6I0AKsdQoKoxJqs+X3ccne+eKDxt6qpPh5XpD4D0SUc
 gXBiatQ/qNiIdAaZyzmockAj3wutt344CK/zfq6SQZiIVD2M6JO6vRz/UdNmzbW5qwm4
 R0tenQgE/pP76eKx4a0DJTbI/ne/gEbkRNqwVPn0LGUYv9SwwSGJCIOHn3vcJsQG0lmB
 PAVL4EuDI4sJHl7GSfqfB3uTMMvbANGAq5HM+RAkgKKnMBdaFtLJVZki+Zl7UzZqL/y+
 Rdd1YkSZt+cJTwdlS4USxhfqzAXDEVXQLoShSfaXZCjLrqVZyANFRKJZ7lrug8rLQoXk
 g7lw==
X-Gm-Message-State: AOAM530RvICgeoae+ZcLd1htTvT/ord9GEq5Z4yLXtG/OesVXlw8DJWh
 OIphufY00pptITehKhTGtXbHAtL1UXGhlwrZHkDSQLgH7mjKDT3i+Y7ZUyHCGv9K9hWtvpoHrpO
 4YgfZv061+L9MVCY=
X-Received: by 2002:a5d:4a84:0:b0:20c:47b6:61ee with SMTP id
 o4-20020a5d4a84000000b0020c47b661eemr2118687wrq.68.1651831394928; 
 Fri, 06 May 2022 03:03:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2zXHcbahvfGDg09fgAz29wl4LO0/61fxhgw4UaNjRtMG0/ZrkTQFDu/yb5kpu2MwCDyVf/A==
X-Received: by 2002:a5d:4a84:0:b0:20c:47b6:61ee with SMTP id
 o4-20020a5d4a84000000b0020c47b661eemr2118665wrq.68.1651831394639; 
 Fri, 06 May 2022 03:03:14 -0700 (PDT)
Received: from [192.168.8.104] (tmo-082-126.customers.d1-online.com.
 [80.187.82.126]) by smtp.gmail.com with ESMTPSA id
 q1-20020adf9dc1000000b0020c5253d8b8sm3478295wre.4.2022.05.06.03.03.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 May 2022 03:03:14 -0700 (PDT)
Message-ID: <27272743-d039-e30e-0f5d-1062f7fdb23a@redhat.com>
Date: Fri, 6 May 2022 12:03:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] hw/s390x/s390-virtio-ccw: Improve the machine description
 string
Content-Language: en-US
To: Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org,
 Eric Farman <farman@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>
Cc: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>
References: <20220506065026.513590-1-thuth@redhat.com>
 <878rrf5dkw.fsf@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <878rrf5dkw.fsf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.74; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/05/2022 09.23, Cornelia Huck wrote:
> On Fri, May 06 2022, Thomas Huth <thuth@redhat.com> wrote:
> 
>> The machine name already contains the words "ccw" and "virtio", so
>> using "VirtIO-ccw" in the description likely does not really help
>> the average user to get an idea what this machine type is about.
>> Thus let's switch to "Virtual s390x machine" now, since "virtual
>> machine" should be a familiar term, and "s390x" signals that this
>> is about 64-bit guests (unlike S390 which could mean that it is
>> 31-bit only).
> 
> Do we foresee any s390x machines that don't default to ccw virtio
> devices in the future?

I don't think so. And if we ever get another type of para-virtualized 
machine, we still can change the description again to be more specific to 
distinguish them.

>> Also expand "v" to "version, since this makes it easier to use
> 
> s/"version/"version"/ :)

Thanks!

>> this macro also with non-numeric machine names in downstream.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   hw/s390x/s390-virtio-ccw.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
>> index 8fa488d13a..11a942a325 100644
>> --- a/hw/s390x/s390-virtio-ccw.c
>> +++ b/hw/s390x/s390-virtio-ccw.c
>> @@ -768,7 +768,7 @@ bool css_migration_enabled(void)
>>       {                                                                         \
>>           MachineClass *mc = MACHINE_CLASS(oc);                                 \
>>           ccw_machine_##suffix##_class_options(mc);                             \
>> -        mc->desc = "VirtIO-ccw based S390 machine v" verstr;                  \
>> +        mc->desc = "Virtual s390x machine (version " verstr ")";      \
>>           if (latest) {                                                         \
>>               mc->alias = "s390-ccw-virtio";                                    \
>>               mc->is_default = true;                                            \
> 

  Thomas


