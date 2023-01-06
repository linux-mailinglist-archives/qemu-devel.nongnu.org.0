Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5C265FC9B
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 09:20:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDhxU-0007wk-6p; Fri, 06 Jan 2023 03:20:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pDhxI-0007vt-Fh
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 03:20:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pDhxG-0001Ym-4I
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 03:19:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672993196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IWzUDHH8bSrtQRK3auwHby1VJyp+qKxzwRpImywmsbo=;
 b=VhJU5yoTzOCiOUvwz9KhjksUywi+/4g2RIo3ymC0qIdAJOKYHvfUL7Hqfqn0Aj5VI1vn8Y
 4puOvnQq2g+oB2Y7TVNVvEaUsKG6MhMESiXbOLqSVy4esYGAgCLTMfI7l4xAjNtkPzClQX
 +FJwwbNtzNNgoOmKpRfUjIQtgE9Xhd0=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-373-waAlsfEANHaYNITpOXpq2Q-1; Fri, 06 Jan 2023 03:19:55 -0500
X-MC-Unique: waAlsfEANHaYNITpOXpq2Q-1
Received: by mail-qv1-f70.google.com with SMTP id
 ng1-20020a0562143bc100b004bb706b3a27so443315qvb.20
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 00:19:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IWzUDHH8bSrtQRK3auwHby1VJyp+qKxzwRpImywmsbo=;
 b=Cbs25tyZ1ZOeQA+r/prAprSyGvRj2HCUrSddu7bMsM31AYGjjqtkFWI3pIvO/kF1l3
 VKtAokaE28+4FvhjTfmSqo+IcjsynPDp3EUiMzbx20qM/X3D/1KQZ9/EEMYxn6WNY+ST
 /O08eAcBW3DKC3gKifPh7crRrghuBlB0HNJP82x8rhSYJY7mBK3NeWrANuawZQrrdMt5
 z3UBeFtw00caFz99hZbF0UuVWNOSDnLStlQVITwLrWJPXgtpbdLtKj0hRWSNOMZbUrrk
 FcCCGp4DgOvRuvoAIHIXIhclLjWA5z//qRZG5p+zb5e/gaZuTPzLhoXzsdR6hKKCioG9
 1E/g==
X-Gm-Message-State: AFqh2kqsGlyE0sIFP/gTC7/7mlP/sqWZCSsTikI12PELr0383CnMWzog
 jxaFkIVSacdFsXafvv5bd5FiA/7UeD08yoBd89nvg+e+QBE5qsoYZk9SSylF8gYqtSg1CEcxhG9
 mOSby1gP12NmMnWo=
X-Received: by 2002:a05:6214:398f:b0:531:dea1:acd4 with SMTP id
 ny15-20020a056214398f00b00531dea1acd4mr16607647qvb.3.1672993194933; 
 Fri, 06 Jan 2023 00:19:54 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsLk/2fqSMPfi97BAnXvE19Q3VxpLEw3GfeSVjspS+kzvcCAV2IGi2p3O5k+5DU7un4ywZVDQ==
X-Received: by 2002:a05:6214:398f:b0:531:dea1:acd4 with SMTP id
 ny15-20020a056214398f00b00531dea1acd4mr16607631qvb.3.1672993194657; 
 Fri, 06 Jan 2023 00:19:54 -0800 (PST)
Received: from [192.168.8.100] (tmo-098-170.customers.d1-online.com.
 [80.187.98.170]) by smtp.gmail.com with ESMTPSA id
 dm30-20020a05620a1d5e00b006bbc3724affsm185927qkb.45.2023.01.06.00.19.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jan 2023 00:19:54 -0800 (PST)
Message-ID: <95c8fd9a-9dd8-249a-1509-084910fbb7de@redhat.com>
Date: Fri, 6 Jan 2023 09:19:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] .gitlab-ci.d/windows: Do not run the qtests in the
 msys2-32bit job
Content-Language: en-US
To: Stefan Weil <sw@weilnetz.de>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Bin Meng <bin.meng@windriver.com>
References: <20230105204819.26992-1-thuth@redhat.com>
 <4ff2d01a-e6bb-5a99-356b-6b2ade61b667@linaro.org>
 <5a2d8ef1-a478-0b6d-3c65-d792f162feaf@redhat.com>
 <373666f9-7999-9628-b3ae-a749fcc2e1c3@weilnetz.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <373666f9-7999-9628-b3ae-a749fcc2e1c3@weilnetz.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.939, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 06/01/2023 09.15, Stefan Weil wrote:
> Am 06.01.23 um 08:49 schrieb Thomas Huth:
> 
>> On 05/01/2023 22.42, Philippe Mathieu-Daudé wrote:
>>
>> > That said, maybe it is time to deprecate the 32-bit
>> > hosts?
>>
>> Certainly fine for me, but that's up to the Windows folks to decide. Maybe 
>> you could just suggest a patch to start the discussion?
>>
>>  Thomas
> 
> 
> Download numbers from yesterday for my latest Windows installers:
> 
> qemu-w32-setup-20221230.exe - 243
> 
> qemu-w64-setup-20221230.exe - 6540
> 
> On Wednesday the ratio was 288 : 3516.
> 
> As expected the 64-bit variant is used much more often, but it looks like 
> there is still a certain desire for the 32-bit variant.

OK, thanks. Could you maybe also check the browser types in the logs? ... 
I'm wondering whether a big part of those w32 downloads were just automatic 
web crawlers?

  Thomas


