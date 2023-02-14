Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C1469684F
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 16:40:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRxPt-0007xq-NB; Tue, 14 Feb 2023 10:40:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pRxPl-0007wO-Hz
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 10:40:18 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pRxPi-0006u2-OZ
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 10:40:16 -0500
Received: by mail-wm1-x330.google.com with SMTP id z13so11258577wmp.2
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 07:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OTMKVgEKUKF9VPS0QhqNJm7eG4gQDuzK2xo3WygZdAQ=;
 b=a4juAzJTA9elgfvQchALNenUbdAW1OoF/39yPAMFKd+kQ5LqnQASe2MPGBiHwAfIau
 Tdlzv+fT5TiXqxC51nAxRyoNHbEHmuI/7wryPuWT7lrheWMfLu3bnrVKChP3myY8BjxK
 CZlCF/S8X3+vSuwpuNv60/cXfMej0PSkuwNKcV/SHGPVtn3yntw5+GuH/AtDcuvgRD6r
 eQ66Ou/xf8Mlb8I23pFyvFuN75KcK0/EsqgRY552/Vghn7pFqYBFOKPHKiCc5MgpewUl
 U3W3U4RudESCmXuS3B/SYcaXCeBUE3AZ9Y9uNk1v8WT8GuJWasv3DCWcgkA3eloNxDa9
 1VWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OTMKVgEKUKF9VPS0QhqNJm7eG4gQDuzK2xo3WygZdAQ=;
 b=M+aFAfL/5X4nGuJFhp5FNNdn5f7uluZ7JL2y0zw3MJBeO1apNEtccUtSfk96BBzH4g
 u0qY6Gi/pay/81nWUHdrHjxY1Hss8f5dei4KmbZOBsE4FtXai7tNZab2GiC18UQLbYhd
 YkkT/MkuAZj9LTSIEIo0eG0lQGCQpB50uy6RJhl3XyWC2aq0qzsq31uYCpLsLvsKtCM2
 WfSY1fSMGZ1KerqZ+g7+ACvejwEFxhh7V3SnGeIs1zwprYJWaPqoZfonsf0wXEDWRYr7
 2YuciXqcwCVR4wotgR02OFPTnHWwz1b7c8W+nRkonnagxhzCK34RjZ5yrK0zYO6sDxv6
 RKCA==
X-Gm-Message-State: AO0yUKXyMD33RQOUuzSWMKi9BGgaAglO4k/jGDTEt8d6UStqDtxoqJUH
 wRL5Q0COVRyPt04Bhk+XNEM=
X-Google-Smtp-Source: AK7set8MABH7RJawwlI4r+LCuzCPvYmOu5+eGbu2H7VjV7YbogT3WcKOe2LbS7IrbwI/rN963HZUnw==
X-Received: by 2002:a05:600c:244e:b0:3df:f9e9:7600 with SMTP id
 14-20020a05600c244e00b003dff9e97600mr2442932wmr.25.1676389212922; 
 Tue, 14 Feb 2023 07:40:12 -0800 (PST)
Received: from [10.95.154.108] (54-240-197-224.amazon.com. [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id
 be7-20020a05600c1e8700b003dff2b493c8sm22262506wmb.36.2023.02.14.07.40.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 07:40:12 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <447a0a49-5079-249c-33db-e5e7765e8fd1@xen.org>
Date: Tue, 14 Feb 2023 15:40:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v10 44/59] hw/xen: Support mapping grant frames
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, Paul Durrant
 <xadimgnik@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com
References: <20230201143148.1744093-1-dwmw2@infradead.org>
 <20230201143148.1744093-45-dwmw2@infradead.org>
 <28fc143f-2de8-b893-0abf-210b4c34a7f7@xen.org>
 <4B49CF3E-A825-4017-B7DF-2339F7D6B92E@infradead.org>
Organization: Xen Project
In-Reply-To: <4B49CF3E-A825-4017-B7DF-2339F7D6B92E@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.35, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 14/02/2023 15:35, David Woodhouse wrote:
> 
> 
> On 13 February 2023 16:31:57 CET, Paul Durrant <xadimgnik@gmail.com> wrote:
>> On 01/02/2023 14:31, David Woodhouse wrote:
>>> From: David Woodhouse <dwmw@amazon.co.uk>
>>>
>>> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
>>> ---
>>>    hw/i386/kvm/xen_gnttab.c  | 74 ++++++++++++++++++++++++++++++++++++++-
>>>    hw/i386/kvm/xen_overlay.c |  2 +-
>>>    hw/i386/kvm/xen_overlay.h |  2 ++
>>>    3 files changed, 76 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/hw/i386/kvm/xen_gnttab.c b/hw/i386/kvm/xen_gnttab.c
>>> index ef8857e50c..cd8c3ae60d 100644
>>> --- a/hw/i386/kvm/xen_gnttab.c
>>> +++ b/hw/i386/kvm/xen_gnttab.c
>>> @@ -37,13 +37,27 @@ OBJECT_DECLARE_SIMPLE_TYPE(XenGnttabState, XEN_GNTTAB)
>>>    #define XEN_PAGE_SHIFT 12
>>>    #define XEN_PAGE_SIZE (1ULL << XEN_PAGE_SHIFT)
>>>    +#define ENTRIES_PER_FRAME_V1 (XEN_PAGE_SIZE / sizeof(grant_entry_v1_t))
>>> +#define ENTRIES_PER_FRAME_V2 (XEN_PAGE_SIZE / sizeof(grant_entry_v2_t))
>>> +
>>>    struct XenGnttabState {
>>>        /*< private >*/
>>>        SysBusDevice busdev;
>>>        /*< public >*/
>>>    +    QemuMutex gnt_lock;
>>> +
>>>        uint32_t nr_frames;
>>>        uint32_t max_frames;
>>> +
>>> +    union {
>>> +        grant_entry_v1_t *v1;
>>> +        grant_entry_v2_t *v2;
>>> +    } entries;
>>> +
>>
>> If you want to have v2 support, don't you need status frames too?
> 
> If/when we add v2 support we will need that, but not yet. Seemed harmless enough to have the union with the right types from day one though.

For someone reading this code, they might expect support to be there. It 
also makes things a little more cumbersome. TBH I really can't see the 
need to ever support v2 so my preference would just be to avoid mention 
of it and pretend it was all a bad dream.

   Paul


