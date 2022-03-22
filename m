Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 255154E44A3
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 18:03:21 +0100 (CET)
Received: from localhost ([::1]:58904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWhuh-0002Mq-Ot
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 13:03:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWhrZ-0000fU-OE
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 13:00:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWhrW-0002dQ-HX
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 13:00:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647968401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pNPQf56m77E2rxuZ+saHbPPWsvBn/im/6kuiBoqMJ6Y=;
 b=HZyjmbnN9cvd6IXnIuYDH7ZE/dfJj88xcQ0enVYUusUYEFAzJyFweI9pXUwm0NlJmbEWES
 nw1O4hK2Dce7O8TF2XboUfHm5TrxtWIyuiCjrK36GiMNBTDuy3ax1Vc59qvQ9MDcjHNS4N
 O/wJgRuFgWePxYFxN4/LUYJWf6HgrBk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-644-RN2d6uFgMSybRDo-Jg2OPw-1; Tue, 22 Mar 2022 12:59:59 -0400
X-MC-Unique: RN2d6uFgMSybRDo-Jg2OPw-1
Received: by mail-ed1-f71.google.com with SMTP id
 l14-20020aa7cace000000b003f7f8e1cbbdso10863457edt.20
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 09:59:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pNPQf56m77E2rxuZ+saHbPPWsvBn/im/6kuiBoqMJ6Y=;
 b=3ajuhBFn7+hWZ6KclM3HycNDeffPWznj16P3r93sj9kauItRujryg2YSPYhvzfdWA4
 OUdt23HdxvXmFZj4LUSWXJGabQRa4reh9VL23Wlre1lU21P/TJgyIZr06lHMlLXOMzBG
 ur9yGHcwwwn9xFoeA3tR2h6ts5YHJmnsST2C6aa8B7GBRdjfB2H3tTnXS3SfGyN2nsPu
 hPoMjIR24BkMekw2qdb4pNPGHpwPRxj0lLAN5t0Ji9pHqN1dlzdRPFA85A5bQKc1NIhc
 QtX2OLe7JOngdHQ6Kq/KC4IIbK5lBkVCtP3ZGTGgN2olqxmpOJgeqXXf1qq5gcomFVNL
 +1Ww==
X-Gm-Message-State: AOAM5311i+J0HsJUN0z7+WydjjRw7FNrOaZHGm+PgFTYmYYOcDzQ5ash
 VIc9HmlNJA7DRwy4e6PIz/ieVrZOyiZuy0R5agPJxs2KeZV1d7Lrm48FyVEelS9N74BJRARlHHl
 C4Nz+4flCaVbdmQc=
X-Received: by 2002:a05:6402:4305:b0:419:2aeb:2a9b with SMTP id
 m5-20020a056402430500b004192aeb2a9bmr16124173edc.346.1647968398449; 
 Tue, 22 Mar 2022 09:59:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3LGHkZ1N9hsbP/6fDH94OAD7OUdbGKTOjbAiP/+8KcYvN63nsVVJn4fVrDFiZhM3Yp3ewhA==
X-Received: by 2002:a05:6402:4305:b0:419:2aeb:2a9b with SMTP id
 m5-20020a056402430500b004192aeb2a9bmr16124152edc.346.1647968398248; 
 Tue, 22 Mar 2022 09:59:58 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 g13-20020a50bf4d000000b00410d407da2esm10169961edk.13.2022.03.22.09.59.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 09:59:57 -0700 (PDT)
Message-ID: <6d1bcfb1-312c-f36b-e512-f4091af37084@redhat.com>
Date: Tue, 22 Mar 2022 17:59:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 14/15] iotests: remove qemu_io_silent() and
 qemu_io_silent_check().
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20220318203655.676907-1-jsnow@redhat.com>
 <20220318203655.676907-15-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220318203655.676907-15-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18.03.22 21:36, John Snow wrote:
> Like qemu-img, qemu-io returning 0 should be the norm and not the
> exception. Remove all calls to qemu_io_silent that just assert the
> return code is zero (That's every last call, as it turns out), and
> replace them with a normal qemu_io() call.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/216                        | 12 +++++-----
>   tests/qemu-iotests/218                        |  5 ++---
>   tests/qemu-iotests/224                        |  4 ++--
>   tests/qemu-iotests/258                        | 12 +++++-----
>   tests/qemu-iotests/298                        | 16 ++++++--------
>   tests/qemu-iotests/310                        | 22 +++++++++----------
>   tests/qemu-iotests/iotests.py                 | 16 --------------
>   tests/qemu-iotests/tests/image-fleecing       |  4 ++--
>   .../tests/mirror-ready-cancel-error           |  2 +-
>   .../qemu-iotests/tests/stream-error-on-reset  |  4 ++--
>   10 files changed, 39 insertions(+), 58 deletions(-)

qemu_io_silent_check() was unused anyway, right...?

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


