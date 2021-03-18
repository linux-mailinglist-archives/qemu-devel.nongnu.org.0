Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5AC3406B3
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 14:19:11 +0100 (CET)
Received: from localhost ([::1]:50628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMsYQ-0004FM-9P
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 09:19:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMsUC-0002Dh-Cq
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 09:14:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMsU6-0002r8-Ub
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 09:14:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616073281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BA+uJn4Ntz99Gp12CgG1dlcwx0agf5Wm10r7y0nxsOs=;
 b=ViJhiISxgCeetwX2iciJKBBSk6CSDsfvazRyPLVI4q6xJFx0a0RVtSEQu8WPi3rTZH3O2i
 Etb0s5nm8dpZ17wbJQ4AenIgzXwUq3ls10oqlGlbjcSynJo+Em7et2TawMuGm77b6lCCEy
 PfGAbbg3OIWyn9KGV43xjXLVLh+Tc2g=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-bOo_lvlEObKuTKkZj_t3sw-1; Thu, 18 Mar 2021 09:14:39 -0400
X-MC-Unique: bOo_lvlEObKuTKkZj_t3sw-1
Received: by mail-wr1-f69.google.com with SMTP id z17so20085645wrv.23
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 06:14:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BA+uJn4Ntz99Gp12CgG1dlcwx0agf5Wm10r7y0nxsOs=;
 b=ras4MkQopeRUikLVQ6UmdbcpLc3e2zXKJMvKOiwCNj0Zhij9Ns90aHfYcuXQCsw29B
 HIM4wXQio84S6EiQjjtT6b3VEXlIFmKTdoMl1+8AWTfyRyPEfHcOeIkwdSxaUCTWCQLi
 qeKwLKLMfOfYTrj3MIQWldbDT59fY70VEcm4069NS7rcXEw+wMFlKgDQN23HQWlfALHA
 patj8fmkvZNcEKT1S4Be/4ceMCdpLydlDmFwj7+zQlOMg+U8DpXMgRGCpn/3JlxyFVrY
 XaJMxNdQOATjjAv/54kP8L5SKgd4NPFPWbyNaSmp8mhi+SuH3QWgTQwJVfEu5RJuJbYW
 PD2w==
X-Gm-Message-State: AOAM531YNJxjCPkyF+2P9kvZssj6eB7/TNUAF8+tnYlhjO2sWFZz6zoK
 rK+VYHFtXygZpnnEgCpgYK/uOWltEhG0DC8ujohpLh8FKQze6Qpit2QMicGvmhL1qNb/fif7QXK
 DR3pV9EAjCU/osf8=
X-Received: by 2002:adf:b609:: with SMTP id f9mr9329701wre.223.1616073278617; 
 Thu, 18 Mar 2021 06:14:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDfWmSW5F2qKKFzwmJKvqv9ntqgoApVfKkoMvuMDvxEgQFDa1XArd2T40Sg+igym839enkJw==
X-Received: by 2002:adf:b609:: with SMTP id f9mr9329682wre.223.1616073278436; 
 Thu, 18 Mar 2021 06:14:38 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id j123sm2316078wmb.1.2021.03.18.06.14.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 06:14:38 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] target/arm: Restrict v7A TCG cpus to TCG accel
To: Claudio Fontana <cfontana@suse.de>, Andrew Jones <drjones@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210221222617.2579610-1-f4bug@amsat.org>
 <20210221222617.2579610-4-f4bug@amsat.org>
 <c395479b-d2e0-a862-3446-4afef601ca1f@suse.de>
 <8a302c84-b69c-b0c2-de45-607dd1f686a6@redhat.com>
 <e0d11b2c-7b1c-c968-feb2-675a8c98c7a4@suse.de>
 <ec296129-2c4d-fd74-d044-50c470e29609@redhat.com>
 <cd4caf9d-c32c-25fd-a27f-d352ece74ed3@redhat.com>
 <CAFEAcA8YybFf1=wQ7-scC2JnQEHr9nx0LBvt16dTBOXV0KuMAg@mail.gmail.com>
 <28540fd5-3bd3-30d7-624d-da21d0f39806@redhat.com>
 <CAFEAcA8t3Roq2qL1RTru1H+WZAQMVmWcN=VjCtJkvAzmyws_YQ@mail.gmail.com>
 <20210318123727.vfjaecuklzicmprn@kamzik.brq.redhat.com>
 <f41c34dc-2cad-5929-06d8-6ea098ab5b8a@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <cec1eb2b-197f-b3d5-4187-f06b59be1657@redhat.com>
Date: Thu, 18 Mar 2021 14:14:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <f41c34dc-2cad-5929-06d8-6ea098ab5b8a@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/18/21 1:50 PM, Claudio Fontana wrote:
> On 3/18/21 1:37 PM, Andrew Jones wrote:
>> On Thu, Mar 18, 2021 at 11:38:51AM +0000, Peter Maydell wrote:
>>> On Thu, 18 Mar 2021 at 11:31, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>>> I tend to agree. The problem is for the running VMs started before
>>>> 82bf7ae84ce (so up to any fork based on v5.2). I don't know what
>>>> the forks are supposed to do with the running VMs if they want to
>>>> migrate them to newer QEMU (or upgrade the host QEMU).
>>>
>>> Anybody with a Cortex-A15 KVM VM is just going to have to stay
>>> with their pre-existing ancient hardware, their pre-existing
>>> host kernel and their pre-existing QEMU binary. That's what
>>> "we deprecated and then dropped support for this" means:
>>> we no longer support running that kind of VM, so users who
>>> were doing it need to either do something else instead, or
>>> else just keep on going with the old versions they have.
>>>
>>
>> I strongly agree.
>>
>> And, downstream-wise, I can't speak for anything but RHEL, but RHEL
>> cannot have this problem. There are no 32-bit ARM builds for RHEL.

Great then. Sorry for the confusion.

> I don't see a strong issue with this either, there is no 32bit support for KVM ARM.


