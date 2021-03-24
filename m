Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4526347464
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 10:19:26 +0100 (CET)
Received: from localhost ([::1]:46680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOzfh-0007hr-Fm
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 05:19:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lOzeN-0006nP-Tn
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 05:18:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lOzeM-0000Kq-F5
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 05:18:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616577481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aE4xx/quxc+DjL9k6zSDQW/iS9u1t9zw1Ri1SNqHSjY=;
 b=a5cRIbshA4YOeR302DL6R2CgJqgTbHi2FPJb6ehMVkHLRsSgOLsZUDRcFLoR8dG6gSQ5hw
 nHXLSYWE0sSQPM7y+ojAYlwGSDlUDak8gn5U6ckFfr0IRx3OeU/E1FJwvwXwH5f1MW0BgG
 vfBZ9Ohq3B86S3fjAK7yNLY9w7qI8OA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-9zuGvIWuP0yj5NSIhoSgig-1; Wed, 24 Mar 2021 05:17:58 -0400
X-MC-Unique: 9zuGvIWuP0yj5NSIhoSgig-1
Received: by mail-wm1-f70.google.com with SMTP id j15so222234wmq.6
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 02:17:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aE4xx/quxc+DjL9k6zSDQW/iS9u1t9zw1Ri1SNqHSjY=;
 b=p/fKc/APgQB8/Fzhb4CrIgZw0fUeudpEQUfA0XNLX3qXOU+gYlhf5fGE2ez/a8JdYI
 44M7/H8qfzNr3WexCGKjPpgcpXoEzxbjxqbyxi9HqreL43bHI90injGuH1am0WUTA5bV
 JIz0Q84vm0Q93ig6U+Lbr6LdMXEISHwn+rbhLps0QmegBOKSq62CZN9NiTKtZmj6WLzj
 RUj50j0PNV0rlne2z6VscRoKbHxfxh7OcqiCFlu+1VUGc3llkhuEVftn8sSUsb+mFBLG
 TLC+I+9CnHNVV5SlYHjgk0jaFNpY3bOZuIQ6BAqJJHHgYEsk43Rr+1i/dUvB+Lb7u+9z
 Gc+g==
X-Gm-Message-State: AOAM53253J+h4lHRzonYfWYmUZbtZmmRmmUMmjwNOnNRR5gb135No+pE
 KL/zxr5YEj+8cUEtNLiteoOxqzDAt7ScHl9rNhpbx/YHoub0+ZKv787HrzdkF7o7qaAseHwlSpO
 tQQ2qckH4YO9JDfw=
X-Received: by 2002:a1c:e084:: with SMTP id x126mr1909572wmg.37.1616577476774; 
 Wed, 24 Mar 2021 02:17:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsM8bAQsLbyenkQbjoVIkD+896aa9KrdbdV9r8ZxPWbg2l2O2ROD6+T1i81jE9CYvijKJ6Aw==
X-Received: by 2002:a1c:e084:: with SMTP id x126mr1909558wmg.37.1616577476590; 
 Wed, 24 Mar 2021 02:17:56 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id w11sm2236368wrv.88.2021.03.24.02.17.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 02:17:56 -0700 (PDT)
Subject: Re: Crashes with qemu-system-ppc64
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Greg Kurz <groug@kaod.org>, Thomas Huth <thuth@redhat.com>
References: <1e4835a5-b785-5d0d-64d8-bb01afeea432@redhat.com>
 <20210324000056.349b6782@bahia.lan>
 <72f4839a-2a0d-f73b-bbde-8cad398dbbc9@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <bcf868fa-c9b8-2f6c-489c-2b35b859789b@redhat.com>
Date: Wed, 24 Mar 2021 10:17:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <72f4839a-2a0d-f73b-bbde-8cad398dbbc9@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/03/21 00:35, Philippe Mathieu-Daudé wrote:
> Hmmm does this assert() matches your comment?
> 
> -- >8 --
> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index cefc5eaa0a9..41cbee77d14 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -1130,6 +1130,8 @@ Object *qdev_get_machine(void)
>   {
>       static Object *dev;
> 
> +    assert(phase_check(PHASE_MACHINE_CREATED));
> +

Very nice use of phase_check!  Kudos.

Paolo


