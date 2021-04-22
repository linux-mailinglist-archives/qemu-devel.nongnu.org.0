Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 564EE367EB0
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 12:35:06 +0200 (CEST)
Received: from localhost ([::1]:50470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZWfo-0000U7-7p
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 06:35:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZWeP-0007n9-Vd; Thu, 22 Apr 2021 06:33:38 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:41897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZWeO-0005Bq-EM; Thu, 22 Apr 2021 06:33:37 -0400
Received: by mail-wr1-x434.google.com with SMTP id c4so5352375wrt.8;
 Thu, 22 Apr 2021 03:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rSZ3OloesEwPGjxkaTwRU08mivndC4n+YKh3hssX1Ec=;
 b=svATepzg8CeIfJDcwneMeJyXastA+oi4vG6L6nZbwbRFIMwrownX7L0iDYA2yINgnB
 5Dgl2nyYM8288Q2GnIYxJL2q0zoJi75VOkyFB9nI9hLGQlTEsg+HfrJD5m/cFhAsTyFz
 /dntFigJy9VTTWEN2JbMp5c0HNuFgv97Rf1LYDQJPgezRM0Ku4fM6XB6xaYPvJpYzgb9
 JpCbKjfwGqOVLoRbMk0Ndqt2eaOst3EOtepYy/JpOrezQcuON7ONFQ/0UpKTxx+SsDPr
 K7Asqcp8Jq8KX2Gal0pFDrKMXIq0mu55CA5QiMuNMGzNm9ntMhBc/1hcK4FCJn4IWNkU
 QiXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rSZ3OloesEwPGjxkaTwRU08mivndC4n+YKh3hssX1Ec=;
 b=drvHkjPor31hBnDB22WDAbhNPt9niam/laTwkIAMWaWy/B0oHOKUYw6dBXf7bJSogZ
 CUoZxi0ld5AO8aSs9Wg4NK43m5w5NI2n90QgrbCcOnrTtSHQ2lhmNtTaHeSvtezicYgQ
 DZdwYNA2IN4+pobAsplvF3V1FA4v6DVg5axiDyyFLVTl7YvFkfcnbNWmr+HpYZfzMDmX
 ckf4+hxKgOlrQj/VUPCpf5muvTwHoLzXR06upcynsMvdIpJmoNCRo0n47o5t7opL5CvJ
 Oiiufiz6Oh//8/kiJyty9ZS/6JSgH9dpEUJo3Ma6/3rpdDshCvlmzvWDtNBCcIxpvb9R
 l80Q==
X-Gm-Message-State: AOAM5332DWtbHnCKuy2BJ0jlh/U+IutImtX5eUABQSIO20HaARy1yJlc
 ArpGt24k/C0U3vdqVdP33j8=
X-Google-Smtp-Source: ABdhPJxAkTUoOIz004nFsiizMGLpEEQQJYJ7uCxb6EePo62iQPbKK5cOV7ndFmWwnnTdYeBeMAxdwg==
X-Received: by 2002:adf:f410:: with SMTP id g16mr3279350wro.345.1619087614057; 
 Thu, 22 Apr 2021 03:33:34 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id z17sm2903290wro.1.2021.04.22.03.33.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Apr 2021 03:33:32 -0700 (PDT)
Subject: Re: [PATCH v4 03/28] cpu: Introduce cpu_virtio_is_big_endian()
To: Greg Kurz <groug@kaod.org>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20210303214708.1727801-1-f4bug@amsat.org>
 <20210303214708.1727801-4-f4bug@amsat.org>
 <20210303170743-mutt-send-email-mst@kernel.org>
 <20210304085142.34e960af@bahia.lan>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <28ae5a0f-5755-b0c7-fda4-3596261a243b@amsat.org>
Date: Thu, 22 Apr 2021 12:33:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210304085142.34e960af@bahia.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Michael,

On 3/4/21 8:51 AM, Greg Kurz wrote:
> On Wed, 3 Mar 2021 17:08:32 -0500
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
>> On Wed, Mar 03, 2021 at 10:46:43PM +0100, Philippe Mathieu-Daudé wrote:
>>> Introduce the cpu_virtio_is_big_endian() generic helper to avoid
>>> calling CPUClass internal virtio_is_big_endian() one.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
>> Using virtio in the name here probably because virtio wants this?
>> That doesn't sound like a good naming strategy, name should
>> tell us what function does not how it's used.
>>
> 
> I tend to agree but there was a consensus to deliberately put
> virtio in the name when this was first introduced, so that
> nobody else ever try to use it, as recorded in the commit log.
> 
> commit bf7663c4bd8f8f619d6dbb5780025d92ace250a8
> Author: Greg Kurz <groug@kaod.org>
> Date:   Tue Jun 24 19:33:21 2014 +0200
> 
>     cpu: introduce CPUClass::virtio_is_big_endian()
>     
>     If we want to support targets that can change endianness (modern PPC and
>     ARM for the moment), we need to add a per-CPU class method to be called
>     from the virtio code. The virtio_ prefix in the name is a hint for people
>     to avoid misusage (aka. anywhere but from the virtio code).
>     
>     The default behaviour is to return the compile-time default target
>     endianness.
>     
>     Suggested-by: Peter Maydell <peter.maydell@linaro.org>
>     Signed-off-by: Greg Kurz <gkurz@linux.vnet.ibm.com>
>     Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>     Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> 
> Is there something new on this front ? I'm not convinced that anything
> but legacy virtio en POWER (or any other target that can change endian
> at runtime) needs this. The next step I see for this is_big_endian()
> stuff is deprecation and removal. In the meantime, I think we should
> keep the virtio wording to prevent additional users for this.

On 3/3/21 11:15 PM, Michael S. Tsirkin wrote:
> On a more concrete proposal, how about using this change
> to rename the virtio_is_big_endian field to guest_is_big_endian(),
> and put the wrapper somewhere in a virtio header instead?

Due to Greg comment, I'll keep cpu_virtio_is_big_endian() in
the v5 respin. This doesn't seem a real blocker for the rest
of the changeset. We can settle the name and send a patch on
top.

Regards,

Phil.

