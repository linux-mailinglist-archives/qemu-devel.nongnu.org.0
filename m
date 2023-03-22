Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 173836C4AEF
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 13:44:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pexox-0002ga-O9; Wed, 22 Mar 2023 08:44:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pexoq-0002gA-37
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 08:43:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pexoo-00062Q-Aa
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 08:43:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679489033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vUpK6R/Xruf7DNUiFfpxCOMcKic106h/n1Bbruw5vig=;
 b=PpS68KwspiDwySiuvKEOhQsdaXeEzqFTv6NmbfNfz47GZ5gp9VK2I/h96qmsRDl47QYOtI
 rVdcuj/UGZH2EmIleVnjVEVsTLqj/MsYBPHufIrRk5kUBmlCn+mAjoLgypBcE7qIgcWN6f
 5j5cg9h0JBug26zMKB/NnSaHWpmzsvk=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-248-t1vXHXVPMQegECH7T5qyaA-1; Wed, 22 Mar 2023 08:43:51 -0400
X-MC-Unique: t1vXHXVPMQegECH7T5qyaA-1
Received: by mail-qk1-f198.google.com with SMTP id
 z187-20020a3765c4000000b007468706dfb7so4228014qkb.9
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 05:43:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679489031;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vUpK6R/Xruf7DNUiFfpxCOMcKic106h/n1Bbruw5vig=;
 b=nwpEDe8xrDew21rkKAhnNijPQtFYfFG1CQjBUP60IfjsVTQ8WL5HokcdorNUG+DY3Q
 wZ1jT5YdNlKpyKjGWzibR/xeQq0w2dHsFXVhYf1t1OgaMOTQZGahkbr/DZN7QxdTuFCZ
 z8RXCFyEO1iAmhOa8dgScymkLhkJBpkFKbj/Q6Qpg3f0pkTy/T4I8/JPyG1r5NtYTEHR
 HyxN3kGqd5l2dWp6t/6skRtFHukendufTO27Z9uF+5XD6fDNd8IdkwM2WiaTscvMLON4
 KwrExt11VdBxdCuTjBrqeB2Wz/awIxiAboGcwOUdcWjt2v92/cbf21oYOApCtA/7ZP3X
 8Urw==
X-Gm-Message-State: AO0yUKW7nMfMf8OlzKDY22ASmX4S8QdQdILV7fu/pZ5Qn5XSn1UfqbTT
 riqlTC92ph1NYiV6crW9INcYdnaaKg/ntlkQGbveExHRSACLIHFFBMJ7k2ewaStQWLiy6tbQ/nB
 gmhL92hv4geCI95w=
X-Received: by 2002:a05:622a:50a:b0:3e3:7c8a:2917 with SMTP id
 l10-20020a05622a050a00b003e37c8a2917mr2833462qtx.3.1679489031320; 
 Wed, 22 Mar 2023 05:43:51 -0700 (PDT)
X-Google-Smtp-Source: AK7set/tJfI55JMJgGEdwYuzmWBUfmueaHHZV42/CbwgzfjzQ+gIR0ZXanfyL8k8LeFTpr8ljcDyZA==
X-Received: by 2002:a05:622a:50a:b0:3e3:7c8a:2917 with SMTP id
 l10-20020a05622a050a00b003e37c8a2917mr2833438qtx.3.1679489031074; 
 Wed, 22 Mar 2023 05:43:51 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-177-44.web.vodafone.de.
 [109.43.177.44]) by smtp.gmail.com with ESMTPSA id
 w19-20020ac86b13000000b003e38bae141dsm842188qts.27.2023.03.22.05.43.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Mar 2023 05:43:50 -0700 (PDT)
Message-ID: <d3fa5ebc-100e-25e4-6b73-11604ef755cd@redhat.com>
Date: Wed, 22 Mar 2023 13:43:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/2] tests/vm: skip X11 in openbsd installation
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Brad Smith <brad@comstyle.com>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230322123639.836104-1-berrange@redhat.com>
 <20230322123639.836104-2-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230322123639.836104-2-berrange@redhat.com>
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

On 22/03/2023 13.36, Daniel P. Berrangé wrote:
> As a VM used only for automated testing there is no need to
> install the X11 stack.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   tests/vm/openbsd | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/tests/vm/openbsd b/tests/vm/openbsd
> index eaeb201e91..6af7afac0d 100755
> --- a/tests/vm/openbsd
> +++ b/tests/vm/openbsd
> @@ -106,8 +106,7 @@ class OpenBSDVM(basevm.BaseVM):
>           self.console_wait("Password for root account")
>           self.console_send("%s\n" % self._config["root_pass"])
>           self.console_wait_send("Start sshd(8)",           "yes\n")
> -        self.console_wait_send("X Window System",         "\n")
> -        self.console_wait_send("xenodm",                  "\n")
> +        self.console_wait_send("X Window System",         "no\n")
>           self.console_wait_send("console to com0",         "\n")
>           self.console_wait_send("Which speed",             "\n")
>   

Reviewed-by: Thomas Huth <thuth@redhat.com>


