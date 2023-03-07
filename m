Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AF36AE7D6
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 18:02:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZag5-0007PB-4U; Tue, 07 Mar 2023 12:00:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZafw-0007HK-N2
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:00:33 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZafv-0002iy-2Q
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:00:32 -0500
Received: by mail-wm1-x32e.google.com with SMTP id c18so8246341wmr.3
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 09:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678208429;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GUDIygacfCGVR8fGo1IJ3EdUPNHwyAGo+roo8APTsNk=;
 b=ph1sfvMxY+XZesLpU7cO7ml/bRJUJG2DNJ7+XYzCof2Z2t+1m3vq5apYJFeYV7Aice
 zfSv7AUvd+MEntffGDYCodsF89eozNPxKdE5O/3ShJU/Fzsb7Cjs7sRdVxhfNb/eT1rX
 mOK2EcUqV6oBobYdaqtKv7z1VtoVpokXETVoOQvlhI75I8/DLXAcGlNz3ZypvOcfAcNs
 PJ/wyx/Y7Agnp3QZHEUuD0wojqHtujpfhaWhd7tGgCc6wVWvWA/gHKTSTZ+5ErvcIVRK
 skFzghgn8xvfJaC9naklym9POMszOYVbhrQwjFxOaIy0GuO/NytKp+xJN76mz/pWdKkL
 i02g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678208429;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GUDIygacfCGVR8fGo1IJ3EdUPNHwyAGo+roo8APTsNk=;
 b=cSPB1zN6k4PK4YpnsL3W1rWG4ySctXeq6XxL3BaYxK2xT9WpO310GRK6d1/L3I1KiM
 LzEyb7A2KdIcG9egWUyzSR/jnx/iqlm6cPVWYjdFjag/msiYhhnYTtfnmmP3H/aKfYvv
 kFFQK9Ur1TDilq0PkBjxBt56vowdX5L4WxgS34iko4cLpHtv5zvqxAoDuZtwEU52kjTa
 ql3maWh+dukx1cAy5dNWcMmtz/V8pk3XNobAv+nIsylUvyn95/iRmAL9Hckulvl5zUev
 EBpnXPvaF3es8LXZqG7jfbDV+IBvibbKjTZi2vlaUsVnd4YYORA5Fe2nHyNQJ/2vujqA
 0MwQ==
X-Gm-Message-State: AO0yUKWxzH9EklNy8gfmZMF+BHBSh7OFmaVQY2yCMPeCHfBLq36SLFYf
 zVZ63IJnVOrO4xemGz+nXYc=
X-Google-Smtp-Source: AK7set88xSK51uoh3VVvDUs/jOF+Gr5Ee1CiOxaq5zxqImeG9T02U2YrY4P93URvNhWTORPq7ylJaw==
X-Received: by 2002:a05:600c:4751:b0:3eb:578d:decb with SMTP id
 w17-20020a05600c475100b003eb578ddecbmr12283511wmo.28.1678208429602; 
 Tue, 07 Mar 2023 09:00:29 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-230.amazon.com. [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id
 o33-20020a05600c512100b003e209186c07sm20143602wms.19.2023.03.07.09.00.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 09:00:29 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <c97bd1cd-5540-bfb0-0fda-68d2cb6254d0@xen.org>
Date: Tue, 7 Mar 2023 17:00:28 +0000
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
 <335a946a-6eae-00e6-b30f-142522cc4c26@xen.org>
Organization: Xen Project
In-Reply-To: <335a946a-6eae-00e6-b30f-142522cc4c26@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x32e.google.com
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

On 07/03/2023 16:59, Paul Durrant wrote:
> On 07/03/2023 16:52, David Woodhouse wrote:
>> On Tue, 2023-03-07 at 16:39 +0000, Paul Durrant wrote:
>>> On 07/03/2023 16:33, David Woodhouse wrote:
>>>> On Thu, 2023-03-02 at 15:34 +0000, David Woodhouse wrote:
>>>>> From: David Woodhouse <dwmw@amazon.co.uk>
>>>>>
>>>>> In fact I think we want to only serialize the contents of the domain's
>>>>> path in /local/domain/${domid} and leave the rest to be recreated? 
>>>>> Will
>>>>> defer to Paul for that.
>>>>>
>>>>> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
>>>>
>>>> Paul, your Reviewed-by: on this one is conspicuous in its absence. I
>>>> mentioned migration in the cover letter — this much is working fine,
>>>> but it's the PV back ends that don't yet work.
>>>>
>>>> I'd quite like to merge the basic serialization/deserialization of
>>>> XenStore itself, with the unit tests.
>>>
>>> The patch is basically ok, I just think the serialization should be
>>> limited to the guest nodes... filtering out those not owned by xen_domid
>>> would probably work for that.
>>
>> Yeah, so let's just do this (as part of this patch #7) for now:
>>
>> --- a/hw/i386/kvm/xen_xenstore.c
>> +++ b/hw/i386/kvm/xen_xenstore.c
>> @@ -235,6 +235,7 @@ static int xen_xenstore_post_load(void *opaque, int
>> ver)
>>   static const VMStateDescription xen_xenstore_vmstate = {
>>       .name = "xen_xenstore",
>> +    .unmigratable = 1, /* The PV back ends don't migrate yet */
>>       .version_id = 1,
>>       .minimum_version_id = 1,
>>       .needed = xen_xenstore_is_needed,
>>
>>
>> It means we can't migrate guests even if they're only using fully
>> emulated devices... but I think that's a reasonable limitation until we
>> implement it fully.
>>
> 
> Ok. With that added...
> 
> Revieweed-by: Paul Durrant <paul@xen.org>

Typoed, sorry...

Reviewed-by: Paul Durrant <paul@xen.org>

> 


