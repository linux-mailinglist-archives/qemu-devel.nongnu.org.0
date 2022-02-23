Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFB74C1047
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 11:28:42 +0100 (CET)
Received: from localhost ([::1]:39174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMosz-0004V3-7f
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 05:28:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nMoDd-0007Op-I5; Wed, 23 Feb 2022 04:45:57 -0500
Received: from [2a00:1450:4864:20::529] (port=44014
 helo=mail-ed1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nMoDT-0008Bf-1c; Wed, 23 Feb 2022 04:45:57 -0500
Received: by mail-ed1-x529.google.com with SMTP id m3so37230650eda.10;
 Wed, 23 Feb 2022 01:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JbH41I4Um98pbivwcjpkoMfoSLOeYLevNeUp8ITzlPs=;
 b=JEHbvjlcvgaTy1nEeiGuzu8UK9NtZMLTSnhBTlUtlCADtlbQIIuzskjsQNAmZ5Ai3V
 Y52ecv/7rPB6r1nfEf1LvI01Rei/80yHtkU+0SRW9CM1VqDT0Ld0yqs8nAmiFa2+TzQf
 QO5ZlYROY8Yjo7hViJ9ZfK/ExEzfz4kiPYtSWvW20c/osNIlfAZXYvWjrizWCvCrAox8
 RPVvwx6CSAXkgL7o9RzjOlyjFMWWR3bL9vnvKIe0J0kACIDEwdGqcJk3Wr8f7sYIfUvM
 fJPoMleemY6gmOXeS+aMbXXb5JE4EcLpLcsTO9nQ2fp6h38U98HzvCCZpV/iJk6upzik
 sMMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JbH41I4Um98pbivwcjpkoMfoSLOeYLevNeUp8ITzlPs=;
 b=UNyQL5+p0DhoZ2CKcrO358AyMgO54GqEQPVxCgUw//5eInwVME+Dhe1mQh/Kf4Tb9y
 TeAHOthp9GFBrekdoKnPvcrHq/ma+1QlMNmoMdVo6famivMb0swuLsiI6edXd1MgMQPV
 AOGG1yPGgRs5bqrGrO3WTN5GFuPfdQ8ik5gc2t2cqqiRDfI8KZumcq1RzcH+h51b/A4J
 j1UjfxrNsMJmhEKEDDHS7AbstbMhPsVdBe9Y0jHahNjyr7c3+iNGmSNtixruIekB0uX4
 6IccRSGnNII1WVurMJqnw5rKYjIEKhW1TQBkmdkHvWzjm3tFuRoN5v70vEtOjLYwcOfd
 2xjA==
X-Gm-Message-State: AOAM530LhPw6JY3nFS2/L7TEFjeCSK42rPkMQvqFk/Q2nPimS8lPfbOn
 Mh/NkQpxjXrvSK11FgfLQpA=
X-Google-Smtp-Source: ABdhPJzTPxMwGmHs1xTrZU5idqQRK5kV7X5TdkVKSjFxS5eVQDs6rp+Mi6RApOv6rVwuIZ9jVZZZQg==
X-Received: by 2002:a05:6402:144b:b0:410:b990:a68a with SMTP id
 d11-20020a056402144b00b00410b990a68amr30499943edx.25.1645609545273; 
 Wed, 23 Feb 2022 01:45:45 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 o11sm10988599edq.101.2022.02.23.01.45.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 01:45:44 -0800 (PST)
Message-ID: <847d8aa2-66a4-f0e0-8709-5b4775755d83@redhat.com>
Date: Wed, 23 Feb 2022 10:45:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 4/4] cpus: use coroutine TLS macros for iothread_locked
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20220221142907.346035-1-stefanha@redhat.com>
 <20220221142907.346035-5-stefanha@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220221142907.346035-5-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::529
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Florian Weimer <fweimer@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, Fam Zheng <fam@euphon.net>,
 Serge Guelton <sguelton@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/21/22 15:29, Stefan Hajnoczi wrote:
> -static __thread bool iothread_locked = false;
> +QEMU_DEFINE_STATIC_CO_TLS(bool, iothread_locked)
>   
>   bool qemu_mutex_iothread_locked(void)
>   {
> -    return iothread_locked;
> +    return get_iothread_locked();
>   }
>   

Can we rename either the variable or the function, and avoid the wrapper 
altogether?

Paolo

