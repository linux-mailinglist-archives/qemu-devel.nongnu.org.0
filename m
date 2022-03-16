Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9203C4DB6E5
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 18:07:07 +0100 (CET)
Received: from localhost ([::1]:36650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUX74-0006Ne-7C
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 13:07:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nUX5O-0005ay-FY
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 13:05:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nUX5J-0000wK-Ap
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 13:05:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647450315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mURKp2IPm5RiT7QS745sw5CusSq/g0F9EAS4uIkixCo=;
 b=EsBlXAATKsPRxpzyKKhdyAhZigqSMM1PNdzewWWhWYqdWS70UmckCdZLRYeTOjlr77nNTE
 3Bq3EvS5jvGcaqloZNH2q2Q05tY2LaPjxSzV5bjwG6Or+oBdnvh6RyBXVG/dar+Bc8AYwi
 kHUU7mLqniiXJv/EfVDR2yTME2c49Uk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-137-jFydJWFaOKqG5Xx4UUcnPA-1; Wed, 16 Mar 2022 13:05:14 -0400
X-MC-Unique: jFydJWFaOKqG5Xx4UUcnPA-1
Received: by mail-ed1-f69.google.com with SMTP id
 s7-20020a508dc7000000b0040f29ccd65aso1694600edh.1
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 10:05:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mURKp2IPm5RiT7QS745sw5CusSq/g0F9EAS4uIkixCo=;
 b=d7vrhAzkc5DFTflbR8RIJx9uzr3rXdPIMgI4Jy1FAJqGPrx4hlQoz6b8ERr3WTk7lq
 wPlaRQI+8qiwnqLWs7xSl17xbhhwLySo++zFPLPQDbZHZ25m3GGS7p0hvabhU+p+Vs22
 VwtKAI/6NuQ4LO9Hxn8ALznmFdeqn0aiPUduO+L0Kv47cOPRKkogpieY9O5Yo2YEuScK
 XYDDgt76j2M9pTXJ7d19mspwn77Iub4f4iZa7sSZkRtZnlmyh4rpLuGbbBIKGYbq2TCp
 ivTU52d1PYyl30Y+NgLbj7RWl60ygO9CWVojDBY8RWbJwRS7sunMIM16YXs/jHFSIw7v
 FdyA==
X-Gm-Message-State: AOAM532EgdHDU5HbodVM/DnRm514twjHrKQZUANDLThjLH/2wUtD8hjC
 8d921CKjxMPpYKdeN/1e60QlquMK3+gsEn99ybVFWTpaO2foizzUD6pgZxShm07ARv6bn2ew5yv
 ktTftBhMS5ZwfjIQ=
X-Received: by 2002:a50:fb19:0:b0:404:eb52:62cb with SMTP id
 d25-20020a50fb19000000b00404eb5262cbmr386107edq.363.1647450313256; 
 Wed, 16 Mar 2022 10:05:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJHmnCdSbuStIX3Mv/HRISu5ql8ch5lFxXogZm1HIIokmFuSEII5cQVpf0gn4+DwOSb2Uxsw==
X-Received: by 2002:a50:fb19:0:b0:404:eb52:62cb with SMTP id
 d25-20020a50fb19000000b00404eb5262cbmr386092edq.363.1647450313033; 
 Wed, 16 Mar 2022 10:05:13 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218]) by smtp.gmail.com with ESMTPSA id
 r19-20020a17090638d300b006d6e4fc047bsm1137676ejd.11.2022.03.16.10.05.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 10:05:12 -0700 (PDT)
Message-ID: <8e608283-b5d2-91d9-26b3-372c57422a30@redhat.com>
Date: Wed, 16 Mar 2022 18:05:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 2/3] hw/display: Allow vga_common_init() to return errors
To: Markus Armbruster <armbru@redhat.com>
References: <20220316132402.1190346-1-thuth@redhat.com>
 <20220316132402.1190346-3-thuth@redhat.com>
 <64353530-4488-8820-c58c-a5e104e93b4b@gmail.com>
 <e5e03938-d602-c928-07ef-da6486fb99b0@redhat.com>
 <87bky6ugmx.fsf@pond.sub.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <87bky6ugmx.fsf@pond.sub.org>
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/03/2022 15.16, Markus Armbruster wrote:
> Thomas Huth <thuth@redhat.com> writes:
> 
>> On 16/03/2022 14.32, Philippe Mathieu-Daudé wrote:
>>> On 16/3/22 14:24, Thomas Huth wrote:
>>>> The vga_common_init() function currently cannot report errors to its
>>>> caller. But in the following patch, we'd need this possibility, so
>>>> let's change it to take an "Error **" as parameter for this.
>>>>
>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>> ---
>>>>    hw/display/ati.c            |  7 ++++++-
>>>>    hw/display/cirrus_vga.c     |  7 ++++++-
>>>>    hw/display/cirrus_vga_isa.c |  7 ++++++-
>>>>    hw/display/qxl.c            |  6 +++++-
>>>>    hw/display/vga-isa.c        |  9 ++++++++-
>>>>    hw/display/vga-mmio.c       |  8 +++++++-
>>>>    hw/display/vga-pci.c        | 15 +++++++++++++--
>>>>    hw/display/vga.c            |  9 +++++++--
>>>>    hw/display/vga_int.h        |  2 +-
>>>>    hw/display/virtio-vga.c     |  7 ++++++-
>>>>    hw/display/vmware_vga.c     |  2 +-
>>>>    11 files changed, 66 insertions(+), 13 deletions(-)
>>>
>>> Please setup scripts/git.orderfile :)
>>>
>>>> diff --git a/hw/display/vga_int.h b/hw/display/vga_int.h
>>>> index 847e784ca6..3e8892df28 100644
>>>> --- a/hw/display/vga_int.h
>>>> +++ b/hw/display/vga_int.h
>>>> @@ -156,7 +156,7 @@ static inline int c6_to_8(int v)
>>>>        return (v << 2) | (b << 1) | b;
>>>>    }
>>>> -void vga_common_init(VGACommonState *s, Object *obj);
>>>> +void vga_common_init(VGACommonState *s, Object *obj, Error **errp);
>>>
>>> Can we also return a boolean value? IIUC Markus recommended to check
>>> a boolean return value rather than Error* handle.
>>
>> Really? A very quick grep shows something different:
>>
>> $ grep -r ^void.*Error include/ | wc -l
>> 94
>> $ grep -r ^bool.*Error include/ | wc -l
>> 46
> 
> Historical reasons.  We deviated from GLib here only to find out that
> the deviation leads to awkward code.  I flipped the guidance in commit
> e3fe3988d7 "error: Document Error API usage rules" (2020-07-10).  A lot
> of old code remains.

Hmm, you should add some BiteSizeTasks to our issue tracker then to get this 
fixed, otherwise people like me will copy-n-paste the bad code examples that 
are all over the place!

  Thomas


