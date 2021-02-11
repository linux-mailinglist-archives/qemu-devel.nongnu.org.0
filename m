Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2874F3196C7
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 00:40:28 +0100 (CET)
Received: from localhost ([::1]:36978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lALZR-0007VG-Qx
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 18:40:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lALXv-0005kD-8a
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 18:38:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lALXs-0005h9-RU
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 18:38:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613086728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5CBN3CGlSVIN1xHboJPDACFMuE0xWDM+nomM1SI2oWg=;
 b=Q4k59zuh3WcpWcd9uHF/T1qXrH91Jz0Izh318EhOBsOTIrcVnmICVPP24pBmmsC74omPRn
 Q2lUD4zxJJ2QSA/cNKvGs6gAyNpAXAFvmbjhdeDAaLQWvO0G416MrwS2ts9cUP6dZ+qose
 N11ygeTbtSvhOW69tkVVypYzMmelcE8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-IVf-BNVoO1CHTaZNyG3-_Q-1; Thu, 11 Feb 2021 18:38:46 -0500
X-MC-Unique: IVf-BNVoO1CHTaZNyG3-_Q-1
Received: by mail-wr1-f70.google.com with SMTP id x12so3354970wrw.21
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 15:38:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5CBN3CGlSVIN1xHboJPDACFMuE0xWDM+nomM1SI2oWg=;
 b=SQVVQtwaMvyXryMPJQWAnO8CZSUeofdH8w6s4V8PYG4b+FPi0oabc+J/5ZhGf66K+e
 uS+MZJK5o9trIkOvHjA0449fZjFwAq03Aj8AXf7ujGt9E7slH87McE1MMKJSzig1jvgy
 bjOLokuf+X1/9rxMGIUoMwU/4sVq9j7aZxu9lZ43kPHQGPY29zTjf4mqOdSKETduAmyM
 uFaonLadZAQ3EDRpl9cZJx87XGsyr81Tqm1q1M+e4nQOxRX5EFB5aa+Z43/pKfKL7Gjp
 2eTNULulIfzC7ZWEekDMr8e8HbfLk93+orO6MQmHzg/wnLqwD1pKDt2Gy1zhVm/sttV+
 PYsQ==
X-Gm-Message-State: AOAM533DjnZK9u8F7At50VuuGP7nIv5AntBMlRTypWiIU0OBXaT2taeS
 sw3liS65g7Fh/u95AGN+k5h/FSEaLYDzSNE2XHSgMt7ABOMWvAF6HxQfcjXolNWjAufGOspjQfh
 q32cESCl883CSwq4=
X-Received: by 2002:adf:f544:: with SMTP id j4mr220934wrp.318.1613086725557;
 Thu, 11 Feb 2021 15:38:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxedCR5CVO2J9Aas9ORAis6baZCySglcRCwAngOFhLsOnNENUtyLbOJPHBhY9/zzBwNfd38XA==
X-Received: by 2002:adf:f544:: with SMTP id j4mr220813wrp.318.1613086723261;
 Thu, 11 Feb 2021 15:38:43 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id f2sm7053515wrt.7.2021.02.11.15.38.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Feb 2021 15:38:42 -0800 (PST)
Subject: Re: [PATCH 1/1] Acceptance Tests: bump Avocado version requirement to
 85.0
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210211232835.2608059-1-crosa@redhat.com>
 <20210211232835.2608059-2-crosa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e5b6956d-3214-f20e-1d12-9925d0a354a5@redhat.com>
Date: Fri, 12 Feb 2021 00:38:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210211232835.2608059-2-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.119, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/12/21 12:28 AM, Cleber Rosa wrote:
> This version (and 84.0) contain improvements that address specific
> QEMU use cases, including:
> 
>  * Being able to download and use Fedora 31 images and thus
>    re-activate the "boot_linux.py" tests
> 
>  * Being able to register local assets via "avocado assets register"
>    and use them in tests
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/requirements.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/requirements.txt b/tests/requirements.txt
> index 62e8ffd28c..91f3a343b9 100644
> --- a/tests/requirements.txt
> +++ b/tests/requirements.txt
> @@ -1,5 +1,5 @@
>  # Add Python module requirements, one per line, to be installed
>  # in the tests/venv Python virtual environment. For more info,
>  # refer to: https://pip.pypa.io/en/stable/user_guide/#id1
> -avocado-framework==83.0
> +avocado-framework==85.0
>  pycdlib==1.11.0
> 

Acked-by: Philippe Mathieu-Daudé <philmd@redhat.com>


