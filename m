Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0162D47E0B8
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 10:10:38 +0100 (CET)
Received: from localhost ([::1]:58342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0K7R-0004BA-OY
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 04:10:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0K2c-0007sV-0M
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 04:05:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0K2Z-00067t-GU
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 04:05:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640250334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ssqhP49WQb9bj5YqgYaOkw1c6XcCWRf7c6Gkq8d+sfo=;
 b=gvFVls9MhEeKDlB26836w5VXzs54OJaDR4Gegr6rrCy52zLEhjtmD5mfkj+TACsS+sPvd3
 p8eGykBUSpw79AUuLPcQZckJ+A2E1HkakU6VLEpNcE3ChALc/PRtejM4/Hq3DuE/ELqcjS
 Zfn8IqD3eTQdfYxSObAokfM86MOaK40=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-265-LlsuTKApMomP27SiWB1a4w-1; Thu, 23 Dec 2021 04:05:33 -0500
X-MC-Unique: LlsuTKApMomP27SiWB1a4w-1
Received: by mail-wm1-f70.google.com with SMTP id
 n31-20020a05600c501f00b00345b15f5e15so1689206wmr.3
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 01:05:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ssqhP49WQb9bj5YqgYaOkw1c6XcCWRf7c6Gkq8d+sfo=;
 b=7/91cFLuk5/SsAXweE3vJxOnzf4WkMUaEftZ24fCKibWVnMTjMVCOzfFfb4gvQkai2
 hpIEAasyJDmur5cdZWyfLc4hFa+PcURfH7yxT6NIOGZrCY4DkcJcMb2zcFgeXMjHzwl5
 yHHj+LPCxAS7+RT6Jgstzs96Vu/ZbvzYfOkQMna/LtSCv8t65YXhLJ0H1lyBXnb0Com1
 DJXRHJRqjBp17s2IjxzPuSDZgJBDGKND6/j3+7Yl/Dz0cUhxvzvu/iHFZAj/Hzpm4Hob
 S5wgvnoIyXmX6eU3i3C3EHHwjVo4PGH64YXVOo2CHAchaozJO62nZKV0xEXZRIl4OrMN
 aJvA==
X-Gm-Message-State: AOAM533h/PbJKoSuenN5a6hbckGEyFtbWfMCqKIXLr3MP5Ayr2kE56p4
 IOVXUHKQK8ZZViEFDpKDIjImp5lNyhwRMNd+tcfdFWapq5N/eXgx3IGWZNS+YU4iwGjZ9dTycrE
 lTAux1QSJuW4qR/I=
X-Received: by 2002:adf:d0cb:: with SMTP id z11mr1053688wrh.470.1640250330347; 
 Thu, 23 Dec 2021 01:05:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz6lbAK7KKGdz7oi3lfyyWPWcUNyagd3sn00VLIjMTVeltPc06PV8vaSJR00eurKU1ZmeBTIQ==
X-Received: by 2002:adf:d0cb:: with SMTP id z11mr1053675wrh.470.1640250330199; 
 Thu, 23 Dec 2021 01:05:30 -0800 (PST)
Received: from [192.168.43.238] (33.red-193-152-124.dynamicip.rima-tde.net.
 [193.152.124.33])
 by smtp.gmail.com with ESMTPSA id d4sm4189458wrx.102.2021.12.23.01.05.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Dec 2021 01:05:29 -0800 (PST)
Message-ID: <f7baa65e-48b0-2d8e-1222-66b303757829@redhat.com>
Date: Thu, 23 Dec 2021 07:52:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH qemu master] hw/misc/aspeed_pwm: fix typo
To: Troy Lee <troy_lee@aspeedtech.com>, openbmc@lists.ozlabs.org
References: <20211222102423.3121181-1-troy_lee@aspeedtech.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211222102423.3121181-1-troy_lee@aspeedtech.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.264, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>, leetroy@gmail.com,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/22/21 11:24, Troy Lee wrote:
> Typo found during developing.
> 
> Fixes: 70b3f1a34d3c ("hw/misc: Add basic Aspeed PWM model")
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> ---
>  hw/misc/aspeed_pwm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/misc/aspeed_pwm.c b/hw/misc/aspeed_pwm.c
> index 8ebab5dcef..dbf9634da3 100644
> --- a/hw/misc/aspeed_pwm.c
> +++ b/hw/misc/aspeed_pwm.c
> @@ -96,7 +96,7 @@ static void aspeed_pwm_class_init(ObjectClass *klass, void *data)
>  
>      dc->realize = aspeed_pwm_realize;
>      dc->reset = aspeed_pwm_reset;
> -    dc->desc = "Aspeed PWM Controller",
> +    dc->desc = "Aspeed PWM Controller";
>      dc->vmsd = &vmstate_aspeed_pwm;
>  }
>  

No need for another patch, since it doesn't build.
Simply squash it in your commit 70b3f1a34d3c.


