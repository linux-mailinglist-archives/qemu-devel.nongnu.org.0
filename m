Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DA62FDC23
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 22:53:55 +0100 (CET)
Received: from localhost ([::1]:50724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2LQH-0001H0-PP
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 16:53:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2LPG-0000qz-4q
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 16:52:50 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:37758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2LPE-0000OU-Ja
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 16:52:49 -0500
Received: by mail-ej1-x636.google.com with SMTP id b5so19218005ejv.4
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 13:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FPEsvx3H4jh8NIwHv56ejvgHAKwVGK0j4C9JlT6wtHw=;
 b=QcODc+G2c9arFuO4DvjMnqN6KotQRCBe16Ea8q7s3FJLXALZae2LSQt5lmOF3EUjHr
 clwxTyTZS0S0fQxfZO31D5rh5cZ6DrcVf6tu1XI1K8rmLCIWuaOhEeo3PWsGeaTzjtab
 zqXUjkzityGoRhxyXifJn8S+GuI/Gr6vlpSCLRlIR2LqLPUmVkjZKzMECBnPtKZsJCnh
 LRiwWz2p+O8fpPi0/sDzpNtQ9zIneM0Twz5mVMxbtv8vZOY5tYk3v7YsxMGbJLCzirfj
 dH6qcAxsvIebTB1xlf2cqBdXBO+y3lBAIcr7mqpUWITgAtofNaEmX7OmO2MhbjpkTq9C
 J3RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FPEsvx3H4jh8NIwHv56ejvgHAKwVGK0j4C9JlT6wtHw=;
 b=mZCH4hX2VlOJdaAMYWRWWW4wPPAD9f5s+SyTfAL2fxIckrjN3SMyl5RubrVT0jabnn
 UhQQEuDGNscq+/GIlv/qrzTLQRelAltXg7+FVVzhuj7E+RBh1eMILuqztuj9bgWl3xML
 SKlL0d2sK2kkEjgLOqN2AuaIhTZzmjEpiM3O8vf9+jd4mTyMABsK95E9DYLR/BEqmyJi
 No4T80flDuRKa00NSZ8k8DdxG46G0L/rRd6dcm1bRP6MpKrSXL/+IgLPjjS2iPSwL32J
 az/6PJTQphuw0ubtoAznFBWYiIUrsCn5p0LCJF7JZJZcSlVMFHXPpSJZaiDhVVZL2mKr
 KUtw==
X-Gm-Message-State: AOAM531k45oYFaEi0VPpNzX8foayxmg4OqSf04mOqqD1fadP85v71Tko
 qykkTf3MF0DuxqwdDlrV2O+145Mklc0=
X-Google-Smtp-Source: ABdhPJxwPX8WRXl2k7V7cf9ywfVFs8yJ68gMTIPqDx/oivx4MxQ/CW97xIa1cHiTuopkQ2C5Gi62tQ==
X-Received: by 2002:a17:906:5618:: with SMTP id
 f24mr7293739ejq.517.1611179564610; 
 Wed, 20 Jan 2021 13:52:44 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id m10sm1721630edi.54.2021.01.20.13.52.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jan 2021 13:52:43 -0800 (PST)
Subject: Re: [PATCH 0/4] Introduce a battery, AC adapter, and lid button
To: Leonid Bloch <lb.workbox@gmail.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20210120205501.33918-1-lb.workbox@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b866c8ad-9336-5305-131d-5ccd63be2166@amsat.org>
Date: Wed, 20 Jan 2021 22:52:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210120205501.33918-1-lb.workbox@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.094,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Leonid, Marcel,

On 1/20/21 9:54 PM, Leonid Bloch wrote:
> This series introduces the following ACPI devices:
> 
> * Battery
> * AC adapter
> * Laptop lid button
> 
> When running QEMU on a laptop, these paravirtualized devices reflect the
> state of these physical devices onto the guest. This functionality is
> relevant not only for laptops, but also for any other device which has e.g.
> a battery. This even allows to insert a ``fake'' battery to the
> guest, in a form of a file which emulates the behavior of the actual
> battery in sysfs. A possible use case for such a ``fake'' battery can be
> limiting the budget of VM usage to a subscriber, in a naturally-visible way.

Your series looks good. Now for this feature to be even more useful for
the community, it would be better to

1/ Have a generic (kind of abstract QDev) battery model.
   Your model would be the ISA implementation. But we could add LPC,
   SPI or I2C implementations for example.

2/ Make it a model backend accepting various kind of frontends:
   - host Linux sysfs mirroring is a particular frontend implementation
   - mirroring on Windows would be another
   - any connection (TCP) to battery simulator (Octave, ...)

Meanwhile 2/ is not available, it would be useful to have QMP commands
to set the battery charge and state (also max capacity).

Ditto QMP command to set the LID/AC adapter state.

> But of course, the main purpose here is addressing the desktop users.
> 
> This series was tested with Windows and (desktop) Linux guests, on which
> indeed the battery icon appears in the corresponding state (full,
> charging, discharging, time remaining to empty, etc.) and the AC adapter
> plugging/unplugging behaves as expected. So is the laptop lid button.
[...]

In patch #2 you comment 'if a "fake" host battery is to be provided,
a 'sysfs_path' property allows to override the default one.'.

Eventually you'd provide a such fake file as example, ideally used
by a QTest.

Another question. If the battery is disconnected, is there an event
propagated to the guest?

Thanks for contributing these patches :)

Phil.

