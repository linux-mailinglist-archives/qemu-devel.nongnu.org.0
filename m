Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 047496AE7AB
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 17:59:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZaf7-0006Yq-4L; Tue, 07 Mar 2023 11:59:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZaf4-0006YE-Ok
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 11:59:38 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZaez-0002J3-8n
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 11:59:36 -0500
Received: by mail-wr1-x436.google.com with SMTP id r18so12847239wrx.1
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 08:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678208369;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FP/kP9sLcpCuLCw0esZoAmg3jKAAmnrlfS+QSo9YyCw=;
 b=MvOB5b+1KMpQB3yysitnKHhLEb3b2Bv7lHUgfyzXLnywW/ObXguSKIk4RM5p3l6M84
 c6mnKNCmagmgMIiAgszyrdFuN5fnTEmznbWXIdS8fUE5m5kxCTlExaZpH7L1t61Mzla8
 8tZMA6o+bdTKOn7sXUpmDCb85Fe2vG1hks0PQCfcqBp8lUq8x4wI6Q7zXyu2SxbRkK9C
 gm6RVuSzD2GPCjsTZiE8WWsuEOag6oQZ3DIVzvIClMRUPyXLgDzNUsTshOMVqdSNQITN
 HQK1RpR/43rEpMl2bQ9rll0x+2Fmm6V6jjLQrQKvvU8yfIhdGohdP5Lb7QK0wfvg+3vs
 WPSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678208369;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FP/kP9sLcpCuLCw0esZoAmg3jKAAmnrlfS+QSo9YyCw=;
 b=bdynuly1yZzyjQUs9O3ZKvdyksbUftyizzq8sFkV1G/JrJTiVkOpvILVOA0BvaT5s3
 a1oWR4NmQ/KoLWUe+emCEJofWrCJNttCMx+5b7Mov53S/f9MO60XJXN8DRxCJj5vN2BF
 7cBONH2xPGXbskFhgheXGt0apRUZCbSi8xZiQzZGUTIwu7Ce5qiKpg5t08JnY2SY4W0v
 Q3vzvWVhTlsBfE44A9OGheT8E5iuFmLEde4a27MBiFr/zUWTyWemOa4D33mvyJ8y8Etc
 hRM6lEStGWmre44zrPoPP0cIc+oJkRzlN5Kxzl1Z5s5TiNKaWPO5HeON+0ddV3xckS0G
 fLAA==
X-Gm-Message-State: AO0yUKUs/vCloupE8gdbvlxQR7Ddw2GoF2lM9uqWyf7nisE7CuHuva7A
 kPHCg+UXnx9yxhlL2+kgtaY=
X-Google-Smtp-Source: AK7set+t/WQFpoA92F2tLgxx4+F1P6LExXIvvbui9CFAkZ48Rz/j1Z8RbWBn/5wh1yoEdzOO1FCiSA==
X-Received: by 2002:a5d:457c:0:b0:2ce:5106:36ee with SMTP id
 a28-20020a5d457c000000b002ce510636eemr7359301wrc.27.1678208369023; 
 Tue, 07 Mar 2023 08:59:29 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-230.amazon.com. [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id
 c18-20020a5d4cd2000000b002c551f7d452sm13378718wrt.98.2023.03.07.08.59.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 08:59:28 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <335a946a-6eae-00e6-b30f-142522cc4c26@xen.org>
Date: Tue, 7 Mar 2023 16:59:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH v1 07/25] hw/xen: Implement core serialize/deserialize
 methods for xenstore_impl
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-8-dwmw2@infradead.org>
 <5f03307a80c33b62380128bf3f638d47eca74357.camel@infradead.org>
 <e1e4f027-25bc-2e1c-4451-b4d304493f16@xen.org>
 <1ab939956031328a9a16fb4e76417e23f292e6ba.camel@infradead.org>
Organization: Xen Project
In-Reply-To: <1ab939956031328a9a16fb4e76417e23f292e6ba.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 07/03/2023 16:52, David Woodhouse wrote:
> On Tue, 2023-03-07 at 16:39 +0000, Paul Durrant wrote:
>> On 07/03/2023 16:33, David Woodhouse wrote:
>>> On Thu, 2023-03-02 at 15:34 +0000, David Woodhouse wrote:
>>>> From: David Woodhouse <dwmw@amazon.co.uk>
>>>>
>>>> In fact I think we want to only serialize the contents of the domain's
>>>> path in /local/domain/${domid} and leave the rest to be recreated? Will
>>>> defer to Paul for that.
>>>>
>>>> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
>>>
>>> Paul, your Reviewed-by: on this one is conspicuous in its absence. I
>>> mentioned migration in the cover letter — this much is working fine,
>>> but it's the PV back ends that don't yet work.
>>>
>>> I'd quite like to merge the basic serialization/deserialization of
>>> XenStore itself, with the unit tests.
>>
>> The patch is basically ok, I just think the serialization should be
>> limited to the guest nodes... filtering out those not owned by xen_domid
>> would probably work for that.
> 
> Yeah, so let's just do this (as part of this patch #7) for now:
> 
> --- a/hw/i386/kvm/xen_xenstore.c
> +++ b/hw/i386/kvm/xen_xenstore.c
> @@ -235,6 +235,7 @@ static int xen_xenstore_post_load(void *opaque, int
> ver)
>   
>   static const VMStateDescription xen_xenstore_vmstate = {
>       .name = "xen_xenstore",
> +    .unmigratable = 1, /* The PV back ends don't migrate yet */
>       .version_id = 1,
>       .minimum_version_id = 1,
>       .needed = xen_xenstore_is_needed,
> 
> 
> It means we can't migrate guests even if they're only using fully
> emulated devices... but I think that's a reasonable limitation until we
> implement it fully.
> 

Ok. With that added...

Revieweed-by: Paul Durrant <paul@xen.org>


