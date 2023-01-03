Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DCB65BFA4
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 13:10:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCg6g-0000H9-5c; Tue, 03 Jan 2023 07:09:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pCg6b-0000G5-NN
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 07:09:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pCg6Y-0007em-V5
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 07:09:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672747758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6fVBeCwaag8GE6Wd2oEvLfB8WiRomLZIMFer21IvtHQ=;
 b=Wz3NMSOOTRTCVvLAm0UOJD2ISBf0caLsVmVdP7xYxuNFbFBGsfyECgyar8oJ3q/xTf6iCW
 FkMX/o6FLObYC13A8JwwkprhbU4t/zDvnyYzdL+azu4SDbS1v/k5QmW2SYIMIJcTErfMwu
 TrIS0pDoP0LutJhR44vVre1rMrxvmrc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-518-wMtgCF7bPfSofFALdJEMqQ-1; Tue, 03 Jan 2023 07:09:17 -0500
X-MC-Unique: wMtgCF7bPfSofFALdJEMqQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 j18-20020adfb312000000b00293def622d1so969221wrd.17
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 04:09:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6fVBeCwaag8GE6Wd2oEvLfB8WiRomLZIMFer21IvtHQ=;
 b=uFRWU9fyU+xPSkyTUZJnwmRPKtKA9K6HFaRD6vV+5363ILZrvLa9g0/o9j4nSxk3gE
 34thbN3vFi3eSv/wZ2uCD11Eb6lpPx0qfebZrLRSgPlVCSpvkBBuyi8aGEtCmW/xnj7/
 Cjgg3CJ4556rLx0cNAjh5LLy+PUq0q3zdyEHfACPruoCobdyY+6zNmHTzqyaT8DP6Lmm
 7mBPXdhG6/11MtZ7fL/orFkrPyjATPAJ9cs893a+ZI8/DRi50ZGy/ylunQPDAQsZzljd
 W4yZzZnx+A5bJV7R3TlH8xH47/gbNOZZlyERiB790C+demtrI+Y2tIS71mqM8qiR8pUX
 +w2w==
X-Gm-Message-State: AFqh2kqwxpv6yVEDu3y3I/YqjzTTfJeWI4/QsxU1sNC9zNjeyrhIucrO
 Od2rKvjSv9fueqggEQkWL6BFh1VOsp9qnvhHH0VXCCFj8QFjnVXUJa+btgQmQYpUcw6nQCCD7sr
 lL8MLhecVipmtT9Y=
X-Received: by 2002:a05:600c:1f11:b0:3d0:57ea:319c with SMTP id
 bd17-20020a05600c1f1100b003d057ea319cmr31121545wmb.13.1672747755645; 
 Tue, 03 Jan 2023 04:09:15 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvhNcIknlHkNqX2TcwfzoYo5WKNOqty6npVeF7FAPl7mIqT2UvpLR9BVv267yct1bmAKElEng==
X-Received: by 2002:a05:600c:1f11:b0:3d0:57ea:319c with SMTP id
 bd17-20020a05600c1f1100b003d057ea319cmr31121538wmb.13.1672747755492; 
 Tue, 03 Jan 2023 04:09:15 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-177-55.web.vodafone.de.
 [109.43.177.55]) by smtp.gmail.com with ESMTPSA id
 x7-20020a05600c188700b003d9aa76dc6asm14521959wmp.0.2023.01.03.04.09.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jan 2023 04:09:14 -0800 (PST)
Message-ID: <2e590bb3-0e5c-65fb-9c36-e0eb9a11ab36@redhat.com>
Date: Tue, 3 Jan 2023 13:09:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 05/10] tests/readconfig: spice doesn't support unix socket
 on windows yet
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Eric Blake <eblake@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20230103110814.3726795-1-marcandre.lureau@redhat.com>
 <20230103110814.3726795-6-marcandre.lureau@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230103110814.3726795-6-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.103, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 03/01/2023 12.08, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   tests/qtest/readconfig-test.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/qtest/readconfig-test.c b/tests/qtest/readconfig-test.c
> index c7a9b0c7dd..9ef870643d 100644
> --- a/tests/qtest/readconfig-test.c
> +++ b/tests/qtest/readconfig-test.c
> @@ -109,8 +109,10 @@ static void test_spice(void)
>       QTestState *qts;
>       const char *cfgdata =
>           "[spice]\n"
> -        "disable-ticketing = \"on\"\n"
> -        "unix = \"on\"\n";
> +#ifndef WIN32
> +        "unix = \"on\"\n"
> +#endif
> +        "disable-ticketing = \"on\"\n";
>   
>       qts = qtest_init_with_config(cfgdata);
>       /* Test valid command */

Reviewed-by: Thomas Huth <thuth@redhat.com>


