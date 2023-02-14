Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 906C6697008
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 22:49:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pS3AC-0002ps-K6; Tue, 14 Feb 2023 16:48:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pS3AA-0002oo-2Y
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 16:48:34 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pS3A7-0004HK-Jm
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 16:48:33 -0500
Received: by mail-pl1-x62c.google.com with SMTP id k13so18472695plg.0
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 13:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VEgc8xjaATqeRQPys/WvAYF8wE20D9Hv6y4wd82pIa8=;
 b=iV8jRhHONAqEEtMJaHyy5F3JlxGOxreSeq95U1qalK2rbjD8SnlTtapnxh4t1QhVeI
 ts23HPaiakHkjoD2cXHeihzh15c65yt46caEY6y0rUJI1NF91vdWL9ioRq2EcfsPy9KC
 a7AT08bEfodRUqzIWT4ivBfZcrNnoJzIQ8xY9OVs6EfpRZ4NH581QdH5KDmxLavHQn9m
 NGmYjX83oAokGF1x79l5X1JVFWa6gHugbs/DKjOh59Y5puajc1IaA/UMvaX3hgE7HISS
 HOT4Q8O6RxLCnjPl9+EoNqaNPveHM4kBgXUHNntmUYWt/Q/gOSL98QFAy7MJC2LvRQc5
 Psyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VEgc8xjaATqeRQPys/WvAYF8wE20D9Hv6y4wd82pIa8=;
 b=fDb/izPZYfybuWftfLIn/R39pxY+AOUwXKsKZG+ECkh3unnUTaG1pEp9zDQSO7k0cd
 du/5pK55Ou9eDak9WSwtnvu43G4aY4RH/KZVPfsYiYpDt5Vk36u85o7bIZagZ1oAN0dj
 7HITrA1zpDNF9wk/rhEQvsoROM4NYWywOjZqHMRE89Ql4QJSFmzYeMbc9GnW5b2UJ/a0
 ZBsrA33IX7Ie4WlKKfKsnFBfDn1K3e/G834OeMWQhFWV5yVuR3Ho04HBw4SrBIQ/RR7/
 y6c+Vk2mxF3cWO/GSjuHFv+X2uEOWIXtcuL64mjDv245bOXkS5YQsTJJZiRf1fxYi3gB
 VEHg==
X-Gm-Message-State: AO0yUKUzslSK5DxoQ4I/DTNAIDHGo2vlHD8mu6uawMb/Yjcm8jAxk7pO
 hYySxYeannwtOG3eD8yiPN3jbzljCuky17f8/bA=
X-Google-Smtp-Source: AK7set8O782oRWmQhzZSUTiBrOem9DfWgx0IwnkqC16H0lg9D3RSpzTpZTWrU972nhiEfMZqKu8ETw==
X-Received: by 2002:a17:902:e850:b0:196:44d4:2453 with SMTP id
 t16-20020a170902e85000b0019644d42453mr253439plg.7.1676411310053; 
 Tue, 14 Feb 2023 13:48:30 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 q5-20020a170902b10500b0019258bcf3ffsm10667052plr.56.2023.02.14.13.48.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 13:48:29 -0800 (PST)
Message-ID: <fc4b0d1e-2dc2-ec89-5ef8-7dd40d0fd206@linaro.org>
Date: Tue, 14 Feb 2023 11:48:24 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 11/12] bsd-user: implement sysctlbyname(2)
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, kevans@freebsd.org, f4bug@amsat.org,
 Thomas Huth <thuth@redhat.com>
References: <20230214002757.99240-1-imp@bsdimp.com>
 <20230214002757.99240-12-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230214002757.99240-12-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 2/13/23 14:27, Warner Losh wrote:
> +    oidplen = sizeof(oid) / sizeof(int);

ARRAY_SIZE(oid)

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

