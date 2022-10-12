Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 512CD5FC2A3
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 11:05:04 +0200 (CEST)
Received: from localhost ([::1]:40264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiXfj-0004um-CQ
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 05:05:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiXat-00014y-2U
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 05:00:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiXar-00087m-Cj
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 05:00:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665565200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jhXDswJPTve0XxjRjnn4uGLNsVyWcJcUQ/Np3G6rT/0=;
 b=FFGHZYf13ax86KtyWGY878pjt0W2h374aDHpRWJw7x4NoRdLWS7D6aQrCCsfMEXl+RvfdM
 mnefRB+HeieZUsKz+5IB4ZtrHlEOI4DN/KnWLefaUXy0h3L4QGKT+vRT0mna2KPIyUq5BR
 NaUK53P7Fpdt8JuJCH9+tfxqimYYkGw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-203-EAfc9ui-MG-S5r4G5R56iw-1; Wed, 12 Oct 2022 04:59:57 -0400
X-MC-Unique: EAfc9ui-MG-S5r4G5R56iw-1
Received: by mail-ej1-f70.google.com with SMTP id
 qf25-20020a1709077f1900b0078c02a23da3so7028562ejc.0
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 01:59:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jhXDswJPTve0XxjRjnn4uGLNsVyWcJcUQ/Np3G6rT/0=;
 b=r3BGca1mgfquaIn/Lsd6RgbuZOVufpxP6pUp4Oiv1r/S/feEYDA/wAe6PAjZdq0Bxw
 Z75f8AGZtFFTi6fQMI1NcyhgTeWzECwKcp5YLXCyTaiTZVr6O5oofS2Gz1IwxAf2lvM0
 Ib8BOoPeyNeqbjeabiiKAYUZF1p6Eou5xhrD1tWlKIE/wLm7cjEj6txXR8vWjgmsNjr7
 Vonx0SGjsNCLtrdEyHCIfIE5E3bqJ35u7DepAUYFzvC9cC93f7Cn3TtxXAGSrDKPjTQk
 NqvJnt5QP4P/9VlJL92pSUeZOc7fMUGcYAbRnHFKQBq+3nFQPLxtjMcUSRg9M+25QshJ
 un9w==
X-Gm-Message-State: ACrzQf1XF6A4b5wkJgMG3ZAAG7+cIHbVjf30hPFIW3gUDnihtGPUBM4i
 e8PSwCwp+aoz6ZvdAv9RCo7pp9OdlmgzCQFfjGObt7Ud0y5tNYpaqmMtRd/yeRZpS32ZiIZvalv
 gKgY/7B1D28gqT7c=
X-Received: by 2002:a17:907:d02:b0:78d:b3cd:a277 with SMTP id
 gn2-20020a1709070d0200b0078db3cda277mr12342339ejc.622.1665565196582; 
 Wed, 12 Oct 2022 01:59:56 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7T3ZQ/yV3KEVI5GnnpnKuash7GhFK/s9G6qNaOjAJWbnCg1rfUsb1aU12i2gs9yrRQ2+rW4Q==
X-Received: by 2002:a17:907:d02:b0:78d:b3cd:a277 with SMTP id
 gn2-20020a1709070d0200b0078db3cda277mr12342321ejc.622.1665565196364; 
 Wed, 12 Oct 2022 01:59:56 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:2f4b:62da:3159:e077?
 ([2001:b07:6468:f312:2f4b:62da:3159:e077])
 by smtp.googlemail.com with ESMTPSA id
 hv13-20020a17090760cd00b00782539a02absm896999ejc.194.2022.10.12.01.59.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Oct 2022 01:59:55 -0700 (PDT)
Message-ID: <bd325ff3-831e-ca4d-4ada-e2650a0a908b@redhat.com>
Date: Wed, 12 Oct 2022 10:59:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PULL 1/1] Revert "configure: build ROMs with container-based
 cross compilers"
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, "Hajnoczi, Stefan"
 <stefanha@redhat.com>, Daniel Henrique Barboza <danielhb413@gmail.com>
References: <20221011192858.956078-1-alex.bennee@linaro.org>
 <20221011192858.956078-2-alex.bennee@linaro.org>
 <CABgObfY42pEWRe67qZJ78LdnEmL+xK+V5c_Ut+cxoqJ7Gw4mzQ@mail.gmail.com>
 <Y0Z3fMpQo+8fz9ul@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <Y0Z3fMpQo+8fz9ul@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.934, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/22 10:14, Daniel P. Berrangé wrote:
>> Daniel, does building the TCG tests work for you? If not, I think we should
>> just disable containers by default.
> 
> I've never (knowingly) tried running TCG tests. IIUC, they are strictly
> an opt-in test needing explicit 'make check-tcg', so any container usage
> wouldn't be encountered by most contributors ?

Yeah, that is true.  But the problems below affect all container usage 
rather than just firmware builds, so they should be fixed there. 
configure is able to only run 'make check-tcg' for targets which have a 
compiler installed.

> IOW, I'd like to see
> 
>   - Explicit opt-in at configure time for use of container
>     downloads during 'make'

This is what I'm proposing, and extending to all targets.

>   - Tailor downloads wrt the target list configured

This is already done.

>   - Suppress the verbose output to preserve meson progress
>     readability

That's in general a tradeoff with long-running tasks.  It's difficult to 
say which is better, for example "make check" also has a verbose output.

Paolo

>   - Handle failure during container builds correctly
> 
> 
> The problem of data downloads during 'make' arguably applies to
> submodules too, but few submodules are needed when the distro
> has provided the required deps in packages, and so those submodules
> left are small and their download isn't noticably slow / large data
> volumes.


