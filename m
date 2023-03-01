Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0116A67AD
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 07:39:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXG6Q-0006Kb-DM; Wed, 01 Mar 2023 01:38:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pXG6O-0006KL-IT
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 01:38:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pXG6M-0007Rw-PI
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 01:38:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677652689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DzMm3fUBKREDceB/hwB0g6aZBhTXaxovuybVbMipqtM=;
 b=DXj1wR47wpMcRPlgfhSkLRjar7Zpf36fwWINAWcQooVZVe8W6YjUR7h9x3do4aNYp4dFAZ
 3LNZjQaCLJlbE0AJehOdijIBVb7+hsXRQHKrZmHZN2GoUuV7HKHiP9IaT3kGnEcytsSOuj
 2K6n0OulCAQdf/U20/ppfVyMeq1qF4w=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-367-oyNuBGi7NCWySic4joSZCA-1; Wed, 01 Mar 2023 01:38:07 -0500
X-MC-Unique: oyNuBGi7NCWySic4joSZCA-1
Received: by mail-wm1-f70.google.com with SMTP id
 k26-20020a05600c0b5a00b003dfe4bae099so4965356wmr.0
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 22:38:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DzMm3fUBKREDceB/hwB0g6aZBhTXaxovuybVbMipqtM=;
 b=tUZMOqSo77zBaEMeNAUyN/WGcnVjYv3mcx0RjhtVmZEL+J2iAMzYntP5fXkPxOiCAB
 Yrrz1nMwrpsJ7reZShmr7QzO60+yrTrTbAnwL1lYcuPoRTZR4g55sVi6kJan+Ff4mXSQ
 5TTk+9jeoFDa+ItbqwHbmoeDX5ImdClSGwlwtQvFpVrlpInk6qd2vkh/ti/U+HctvHTP
 puF7hQ/JBrYCCF8uv+d2ssye57r2lrCs+6u4fT7h9VuhOjAHPOIo9N4QqyRrYLYU2oPS
 nUDC20kHEpAKJ2aLCOdwZdRQOk8gtMjAxGZq6u1E9x1UtQxuMBseQV5wODokDIdhRELD
 9shQ==
X-Gm-Message-State: AO0yUKX76gQrxmxW48FEf8hOmaFxVnbSodg7lQADzNP5QsUHd8m4qCxV
 yPKc8VdfTJxfNAtSqwDm5U4Oyt5ejWmDBKy231WrLbTJZwmRNzsPqSq4pAPmVXKrCYFY3NegORe
 WPRQhb7qtMURRdbQ=
X-Received: by 2002:adf:ed8f:0:b0:2c9:e5f0:bd4f with SMTP id
 c15-20020adfed8f000000b002c9e5f0bd4fmr3769338wro.18.1677652686747; 
 Tue, 28 Feb 2023 22:38:06 -0800 (PST)
X-Google-Smtp-Source: AK7set+V39Q49fA9fFcyx9YeNU/nuEuV9BMhuxhc3OI7luNwKM5DIGf2neEPGFF8ADivpvznnmg9sw==
X-Received: by 2002:adf:ed8f:0:b0:2c9:e5f0:bd4f with SMTP id
 c15-20020adfed8f000000b002c9e5f0bd4fmr3769321wro.18.1677652686484; 
 Tue, 28 Feb 2023 22:38:06 -0800 (PST)
Received: from [192.168.8.100] (tmo-114-247.customers.d1-online.com.
 [80.187.114.247]) by smtp.gmail.com with ESMTPSA id
 u4-20020adff884000000b002c70851bfcasm11667249wrp.28.2023.02.28.22.38.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 22:38:05 -0800 (PST)
Message-ID: <85aa3a6c-63a5-ad1c-b7c5-201ceedcc3ce@redhat.com>
Date: Wed, 1 Mar 2023 07:38:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 0/2] Deprecate support for 32-bit x86 and arm hosts
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230227111050.54083-1-thuth@redhat.com>
 <Y/z4rwv09Ckhbtfp@redhat.com>
 <001bedba-b12f-4dd8-0866-7ccb9ce877d0@redhat.com>
 <Y/3C+jC3Lk5MJxfu@redhat.com>
 <99a83e65-273a-ea1b-e7d9-bbdd8ca32145@redhat.com>
 <20230228162938-mutt-send-email-mst@kernel.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230228162938-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.092, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 28/02/2023 22.32, Michael S. Tsirkin wrote:
> On Tue, Feb 28, 2023 at 09:05:16PM +0100, Thomas Huth wrote:
>> Well, without CI, I assume that the code will bitrot quite fast (considering
>> that there are continuous improvements to TCG, for example).
> 
> We have lots of hosts which we don't test with CI.  They don't bitrot
> because people do testing before release.

Other hosts don't bitrot completely since there are still people out there 
who are interested in those host systems. But are you aware of anybody who's 
still actively interested in 32-bit x86 host systems and thus makes sure 
that QEMU would still work fine there when we publish release candidates?

  Thomas


