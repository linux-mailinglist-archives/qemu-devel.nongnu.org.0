Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0DB667936
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 16:28:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFyXY-0007eu-98; Thu, 12 Jan 2023 09:26:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFyXT-0007du-HP
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:26:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFyXQ-0001hr-Rv
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:26:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673533599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yj7k7Q8S83zKCwM9PvdgW0lmc+tfOH9sqoawaWxhZkE=;
 b=AwKDffcXtBfLvTFbyRWK/iLkbgERyVqCrFznkAZBcpF++3DaKsW38c8AXAyKBDPYjahncX
 0who6gpf8KNJUms05oLdqiCwzxwRo5xZtSWmuUhxGvUeJFtc186QKkbsolztvg8M9ZX6+U
 WMS14aBN63uXGsNNU4ncq7/qMvljADo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-642-qKAHd4o9PGK825aqOdMOcg-1; Thu, 12 Jan 2023 09:26:38 -0500
X-MC-Unique: qKAHd4o9PGK825aqOdMOcg-1
Received: by mail-wm1-f69.google.com with SMTP id
 m7-20020a05600c4f4700b003d971a5e770so9357279wmq.3
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 06:26:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Yj7k7Q8S83zKCwM9PvdgW0lmc+tfOH9sqoawaWxhZkE=;
 b=s8T+2jTsz8FKiDuwdKiDD1xThH4ysvVIh1dzcYMzH9YQ1liEakZh8tWfQvCH7W5/7h
 3aX1ekW7oqC45QASjbk/P0DDl9A8KKaMk0h1nO+EFp5JXA+le781Fw+bJ1aruEYUevql
 3wWvpxPt+dCsREdSWMycEzvFJNXqDceZZjME7ejQ4yfmTQS/B9+jMzQwoJRb+4uf4CWd
 kMkMpsW3fB67Dn0IlPkbfPQYOEf/z4FAP19dmoQdxrRED0P0PUH6h2pWYXln18JiqrG9
 sf6Fk4PoRhTVyukbNLKvd0tiYs43S3T+/7r/6T42f9ift2ObzgEPRoXhA1VcR6uNwm7u
 VDdQ==
X-Gm-Message-State: AFqh2kpW9NokAO+rG+Wcs3J1EbiIdMjqD7/BMUcELzUIDEuEp032MRCo
 7MGRcmyYNCMCKXOoOGdLUacK8ujEuiJ9UPS61Y8GFR4O7gWnfAjb+OvM8ikpvsdwqqtOCxd8axm
 k/cc2wSFVdUv6IZI=
X-Received: by 2002:a05:600c:3b93:b0:3d2:1bf6:5796 with SMTP id
 n19-20020a05600c3b9300b003d21bf65796mr56543873wms.35.1673533597603; 
 Thu, 12 Jan 2023 06:26:37 -0800 (PST)
X-Google-Smtp-Source: AMrXdXupqH51G02z/pd4VL0jCbCXe9vyy+XoIrB+/yAwMIeeZsYKTtCzNcE2N1y+g3TgV2+z3SuCPQ==
X-Received: by 2002:a05:600c:3b93:b0:3d2:1bf6:5796 with SMTP id
 n19-20020a05600c3b9300b003d21bf65796mr56543833wms.35.1673533597222; 
 Thu, 12 Jan 2023 06:26:37 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-128.web.vodafone.de.
 [109.43.177.128]) by smtp.gmail.com with ESMTPSA id
 m25-20020a05600c3b1900b003d9ed49ee2bsm17873817wms.1.2023.01.12.06.26.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 06:26:36 -0800 (PST)
Message-ID: <2e9e18ea-db55-72ad-0bee-2ef3d2543548@redhat.com>
Date: Thu, 12 Jan 2023 15:26:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 02/26] gitlab: add FF_SCRIPT_SECTIONS for timings
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Beraldo Leal <bleal@redhat.com>,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ed Maste <emaste@freebsd.org>,
 Yanan Wang <wangyanan55@huawei.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20230110173922.265055-1-alex.bennee@linaro.org>
 <20230110173922.265055-3-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230110173922.265055-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 10/01/2023 18.38, Alex Bennée wrote:
> From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> 
> Suggested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/base.yml | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/.gitlab-ci.d/base.yml b/.gitlab-ci.d/base.yml
> index 69b36c148a..50fb59e147 100644
> --- a/.gitlab-ci.d/base.yml
> +++ b/.gitlab-ci.d/base.yml
> @@ -6,6 +6,11 @@
>   # most restrictive to least restrictive
>   #
>   .base_job_template:
> +  variables:
> +    # Each script line from will be in a collapsible section in the job output
> +    # and show the duration of each line.
> +    FF_SCRIPT_SECTIONS: 1
> +
>     rules:
>       #############################################################
>       # Stage 1: exclude scenarios where we definitely don't

I was just about to create a patch from Mark's suggestion, too ... glad that 
there is already one!

Reviewed-by: Thomas Huth <thuth@redhat.com>


