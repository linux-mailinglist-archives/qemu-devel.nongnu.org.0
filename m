Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DA0416027
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 15:39:51 +0200 (CEST)
Received: from localhost ([::1]:50994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTOx4-0001vt-PV
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 09:39:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTOuz-0008Od-Qc
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 09:37:41 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:41910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTOur-0001LS-Go
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 09:37:40 -0400
Received: by mail-ed1-x531.google.com with SMTP id s17so5284366edd.8
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 06:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=innJT4adYpTZDgPbOUm4yaLAcv5no0LJupKq0mjrc48=;
 b=Nsmt2UHCU2bAeoGDaH5nDVu5/Kyht5/f9XY3c21SSWMOh1mik3zzhOnOzo1VIhHD2A
 TFnBk9RkWPMLK4GC3XdMjY+ZFuROY4kZcxHbN9e5Ok2LA6wZ/LoKUehrYoCWvmJH1jzy
 T0oNAxqn8pQ0sK1vvAtPRhWo9V9AHveOAd1aNEaecLT/ALer7ABgT8emRlAx3//NUes/
 hnqMtGpHbe7eDXdECoHF8YKZf+W5rXcDYFZ8VZG2CsE/touFbRYtsVnA52NXpR7oaPsI
 iKER/LO3cgKWjy94MQndGrlsgU9i7zo13km6BybNqO39wmb3dey5Wgb3mS2JK/04rEn5
 8tdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=innJT4adYpTZDgPbOUm4yaLAcv5no0LJupKq0mjrc48=;
 b=hbSKi/lT1GDFh3E9LezS2mrzWcqlux1UwIkHznuRa/dK8TEoJglThx47VQBXW0W46B
 ETPR8DIZL1Zl0NcTfaC5Gr4kUaHRYbb2D8+kbXSVHWHz/vXPOCK+d4KsCDPaOmpDMi7a
 ZhyHkv4XKVRC9zh4Lqs7Pf2Gyjf4rQtyrghxOcKEMPniCQktbLiAfnAjCRZBfYbgEcsw
 2b83f1q3tqniTUT2uPP9Z3HtHllnVqggakaU5t+DNyAshgkfM8OGKY2W0ZYPRu2/nu79
 Ep9CyDWF9g4t9inW1Dr+EXpX26qWbzKgiQ5/H+kfd0sxAaCtymexmg/J5pMqaFzaT/0Z
 7kSQ==
X-Gm-Message-State: AOAM5326HVyXHkD9Veus1H3oimhmc1tJNJWNkPXFzcRcV0LhfSu/0Bu8
 kU20WhohWuKvbjQ2pcPS6fs=
X-Google-Smtp-Source: ABdhPJzudyOJSn+xWGfLB172Q7Ue+wSR6cdcojm5fk4ciyJgMXNrubiaHlMhEBjYLMal/eI86zhZkg==
X-Received: by 2002:a05:6402:5163:: with SMTP id
 d3mr5717753ede.220.1632404251728; 
 Thu, 23 Sep 2021 06:37:31 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id b3sm3595209edx.55.2021.09.23.06.37.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 06:37:31 -0700 (PDT)
Subject: Re: [Qemu-devel] [PULL 18/18] qapi: move RTC_CHANGE to the target
 schema
To: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
References: <20190218140607.31998-1-armbru@redhat.com>
 <20190218140607.31998-19-armbru@redhat.com>
 <CAFEAcA9tzLOwbzO56HjhPUM2yTT7xxfkkOYX3OHVfKT-UC14gA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <202e75d5-e2b4-780e-a282-099ac33c2986@redhat.com>
Date: Thu, 23 Sep 2021 15:37:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9tzLOwbzO56HjhPUM2yTT7xxfkkOYX3OHVfKT-UC14gA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Eric Auger <eric.auger@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/09/21 15:14, Peter Maydell wrote:
> 
> It also means that now rtc devices that emit this event need to
> change in meson.build from softmmu_ss to specific_ss, because the
> qapi_event_send_rtc_change() prototype is in the generated
> qapi/qapi-events-misc-target.h header, and that header uses
> TARGET_* defines which are poisoned for softmmu compiles.
> So instead of being able to build the RTC device once for
> all targets, we need to build it over and over again for
> each target.
> 
> Could we reconsider this change? It seems to me to be adding
> complexity and build time and I don't really see the advantage
> that compensates for that.

I agree, RTC_CHANGE is part of the management API.  If only some devices 
implement it, that's only laziness and not an intrinsic property of the 
event.  In some sense, lack of support for RTC_CHANGE is an incomplete 
transition and this patch is making it harder to complete it.

Paolo

