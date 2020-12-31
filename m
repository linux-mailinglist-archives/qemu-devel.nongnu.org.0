Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D00D2E7F60
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Dec 2020 11:24:07 +0100 (CET)
Received: from localhost ([::1]:33454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuv7m-00064O-3z
	for lists+qemu-devel@lfdr.de; Thu, 31 Dec 2020 05:24:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kuv6C-0005WH-Tk
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 05:22:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kuv66-0007va-UE
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 05:22:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609410140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qOCi7L/7x9sfXH6KiJBXdwpcImUVM0c5hYRqRtzWYQQ=;
 b=ZV+7J3hi9ryip2H2LthO4tzLQMW9QYkodhWTDNWR4SHE201Wf/En/BGiyyuf9kLRgaXZKx
 cvbXtLETuFJZcEQsnfTzXwyiZMFfTtNClUzrt+vIUxrjUX4nqxCRDzElbEkpKpewuMIChU
 jNEqlbr2yrtsQZtJbTEGPLKrhovv9O0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-cBgzPM9aMKCTJMxrv4GyTw-1; Thu, 31 Dec 2020 05:22:16 -0500
X-MC-Unique: cBgzPM9aMKCTJMxrv4GyTw-1
Received: by mail-wr1-f72.google.com with SMTP id o17so9741963wra.8
 for <qemu-devel@nongnu.org>; Thu, 31 Dec 2020 02:22:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qOCi7L/7x9sfXH6KiJBXdwpcImUVM0c5hYRqRtzWYQQ=;
 b=T+76H3/dHpZIbUIjTzRnGKyRKvPcwvq8rReZhz22BTdhQFGiz/YyjfluUmxLPLEKCR
 n+U2p7GOAQAOALSRZ+jLTlH1coIpYpHsd8e8OKwgM7MokKQBmKJasTqKSIFKP6RbuTK7
 VIS017hsgjocHRS0gNdYtFFCPQ6fr1q+8dr+8Tc01HqerKFVJbaSMpPMIGApCmIECo2d
 awG1BeyfG3//YaA+ss0ZOFZoHABvoNAubZrNaYb4cpSFwSPWLrN9ZnDSIPjdbIr7PAuo
 gCAsiNbigKE836CDaxFV7IlH4sm+cDbOZcXiRBTQXhoyFuKCQMkLf05QEqP60XL0pREc
 ohVQ==
X-Gm-Message-State: AOAM53113BQVLjH/R+yHz32KboDPrc3q1nVv7ocPow0N29sv3allnL4V
 hfLrPeyfETdetpMOiH6S2gcon3oy0UgfCzNxaN/d7QDk9Hi7mduK3TPV+slqn0ccocsVvsowXPV
 s5jA6OWLYDv09k60=
X-Received: by 2002:a5d:6a4c:: with SMTP id t12mr57702531wrw.249.1609410135858; 
 Thu, 31 Dec 2020 02:22:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx9YfKHATSaZeyUTSDBS49NF+pmLOIUN4H38Li9O+vMB2jWbAZ9yrtEtG51iLGs3/+Z0p1N7Q==
X-Received: by 2002:a5d:6a4c:: with SMTP id t12mr57702520wrw.249.1609410135706; 
 Thu, 31 Dec 2020 02:22:15 -0800 (PST)
Received: from [192.168.1.34] (239.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.239])
 by smtp.gmail.com with ESMTPSA id y13sm66709861wrl.63.2020.12.31.02.22.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Dec 2020 02:22:14 -0800 (PST)
Subject: Re: [PATCH v2] meson: fix Cocoa option in summary
To: Chris Hofstaedtler <chris@hofstaedtler.name>, qemu-devel@nongnu.org
References: <20201230221623.60423-1-chris@hofstaedtler.name>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4030fc76-2baa-7e1d-4ff4-6d2a227dae6e@redhat.com>
Date: Thu, 31 Dec 2020 11:22:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201230221623.60423-1-chris@hofstaedtler.name>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.399, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/30/20 11:16 PM, Chris Hofstaedtler wrote:
> Cocoa support was always shown as "no", even it if was enabled.
> 
> Fixes: b4e312e953b ("configure: move cocoa option to Meson")
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Chris Hofstaedtler <chris@hofstaedtler.name>
> ---
>  meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meson.build b/meson.build
> index 372576f82c..1112ca8fc2 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2082,7 +2082,7 @@ summary_info += {'strip binaries':    get_option('strip')}
>  summary_info += {'profiler':          config_host.has_key('CONFIG_PROFILER')}
>  summary_info += {'static build':      config_host.has_key('CONFIG_STATIC')}
>  if targetos == 'darwin'
> -  summary_info += {'Cocoa support': config_host.has_key('CONFIG_COCOA')}
> +  summary_info += {'Cocoa support': config_host_data.get('CONFIG_COCOA', false)}
>  endif
>  # TODO: add back version
>  summary_info += {'SDL support':       sdl.found()}
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


