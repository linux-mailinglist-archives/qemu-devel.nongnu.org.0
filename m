Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE266920C9
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 15:26:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQULh-0000cp-Rw; Fri, 10 Feb 2023 09:26:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pQULe-0000cc-Dd
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 09:25:59 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pQULc-00005S-SR
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 09:25:58 -0500
Received: by mail-wm1-x330.google.com with SMTP id u10so3940625wmj.3
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 06:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZmOVI6HMoWyBBurPCuEALL2ilYGCj4sAPQcX3roRgP8=;
 b=FtV0lV2w7moB+qzjBkFLxvVbbvdYyvNs4cmykgK0vWXZapDeyvE/S9MiYf2/V1ZCLr
 zl1SnDVRJUBvevJkSW/jmdtaEb8Vy63dol6hRLX0OWoR/27p7nv73lHk3TGjsRONe59L
 Zrt1V0TvsnFtP4EfCJVCuIQfvhmnHwrHWFvNvj9ea6g6nB3Ls2frTJTSi1WWbCckF0Ob
 0gQ6X8FyvuAQShWid5/kFuDEKqh4I3fTPTUxbhpNJLuogB8G2VbLHh2Jr796Vs+jpxAJ
 ARdG3Zf3H/fQmDfW+061SfMUYwVyREseGCESSWh13TbFbcPkBBxZ9JoNhV4OhmqY3kYs
 Y63g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZmOVI6HMoWyBBurPCuEALL2ilYGCj4sAPQcX3roRgP8=;
 b=DTyhJeY2dxS2Nu73xXt86J08p+q8DWS2q5LcA+nxAxDQ9+1dLgDQg/+SrGEbnI6XfJ
 rBvKtpysVHq6aKHGAVrROZ52cty4LHALCIueMkN3O9ZeqRhRaQmh93csg4JTyH9uJTqO
 18rVDvBChqB/jDjwGrYwEecx1/z7CmWwuLa0Be8LJKi+TdHu4Xy3wa5Nhn51Giis/AMc
 kreST0O67syWhcOJkUq9kCmYeA4bHjh6sU6Xu/9e7fUbq3aJWwfNcAQjsiHNE3/ffR4D
 HXxvwKWzybMqCOlRtnsGsIXcbOeltjymm3aCBhbpn/8EN4UVuk39Dlx3GBEJhOX3SJbQ
 IKCQ==
X-Gm-Message-State: AO0yUKWseaq90R0nnmFGYDV0nr84LORVk6b2IpOUDs5vSNO01HW7eXtV
 EwJZOreYPwZ/YHc7EEIXbN4=
X-Google-Smtp-Source: AK7set/lIKTLvq6mF1oiT2HYyarbi6yiCGZON65nVjHvX4y4xqfAoaCjraAUOwxBziWUiee771RVMg==
X-Received: by 2002:a05:600c:810:b0:3de:25f2:3aee with SMTP id
 k16-20020a05600c081000b003de25f23aeemr14136271wmp.31.1676039153886; 
 Fri, 10 Feb 2023 06:25:53 -0800 (PST)
Received: from [192.168.15.58] (54-240-197-232.amazon.com. [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id
 o5-20020a1c7505000000b003dc48a2f997sm8258252wmc.17.2023.02.10.06.25.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 06:25:53 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <8547c888-3176-de11-c3ca-2549917e42e8@xen.org>
Date: Fri, 10 Feb 2023 14:25:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v10 33/59] hw/xen: Implement EVTCHNOP_bind_ipi
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
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
 <20230201143148.1744093-34-dwmw2@infradead.org>
 <165620ad-7a99-8287-d5fa-0fd2d4b4aa6f@xen.org>
 <6d690ae541c5714242d933a4b63cd6803ee63527.camel@infradead.org>
Organization: Xen Project
In-Reply-To: <6d690ae541c5714242d933a4b63cd6803ee63527.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.149, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 10/02/2023 14:15, David Woodhouse wrote:
> On Fri, 2023-02-10 at 13:55 +0000, Paul Durrant wrote:
>>
>>> +    ret = allocate_port(s, ipi->vcpu, EVTCHNSTAT_ipi, 0, &ipi->port);
>>> +    if (!ret && s->evtchn_in_kernel) {
>>> +        assign_kernel_port(EVTCHNSTAT_ipi, ipi->port, ipi->vcpu);
>>
>> Should the error not be propagated here?
> 
> 
> Nah, we'll just fall back to doing it in userspace.
> 
> The kernel acceleration is nice to have (and I mean *really* nice to
> have, for IPIs), but it works without.

Ok.

Reviewed-by: Paul Durrant <paul@xen.org>

