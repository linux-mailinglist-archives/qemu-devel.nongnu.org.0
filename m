Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00805481DDB
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Dec 2021 16:53:17 +0100 (CET)
Received: from localhost ([::1]:34316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2xjv-000577-Jp
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 10:53:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2xig-0004Rl-Kh
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 10:51:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2xid-0001uO-QQ
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 10:51:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640879514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yFX4VKWtGmT5PqMOb8nJtrxxNKDSTkB0+0PgeoBgomI=;
 b=RDkcTV+bpCWKH95aoj/U00PCrqPWWXrxMrwxsNZNDYR/1XH2Cg4sB58jBEutag31yfxnSa
 1mWomC1+ojtznq9lYRJygFJ3qkA3y/ujBcmJHdp+5fzUxGyknzSHf5NMYHINNHuVIInR3U
 A04l9tTMLmDoEnYE9gqsJZKGu09G+DQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-ulVelWa7OVmgEAWhSeG6Xw-1; Thu, 30 Dec 2021 10:51:53 -0500
X-MC-Unique: ulVelWa7OVmgEAWhSeG6Xw-1
Received: by mail-wr1-f71.google.com with SMTP id
 r9-20020adfb1c9000000b001a2981d9356so6360558wra.20
 for <qemu-devel@nongnu.org>; Thu, 30 Dec 2021 07:51:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yFX4VKWtGmT5PqMOb8nJtrxxNKDSTkB0+0PgeoBgomI=;
 b=Ec/L840NsmKwJeI1zde0DOW4pkebAIaAKgDKc2ipt7ued02yGIUM3tNK0BnC5CAlF8
 vkwZatWRxv/nqDiSC+nOW4+I0calSV9v8e17MLl6aP029kD+uGLIJV4fpYDbzJZIsQZY
 4CphMmHlhztBPNaxxepiX+hvQwn/qEO98bh0tKL5tLhavXj1om2VTAaSN/sdhNUfxr11
 vXp6RiyVYjpLLc5a5nunsXAu7CrjcEZkmMYdnM3P2zj6ZEVgMOJHIVvZwdxhy/d6KuCo
 cFk1s51nlCZQAUS69sNmwN2Tm9J4XZpLFpNeM9aEdqI0Q8RH7nCTH2V/hM13VIfkhCTR
 xrgg==
X-Gm-Message-State: AOAM531ctACBOrCENnOujUtEPgpFPFGPEz0aY3bwHi9E+1A/zZy2G+Is
 TvUQmYtxosQAZxckQdNytYFE9kuovjMU8MEibZyc60KN5p80e/MsyQmJGq/lu2vDq4yuJGspclQ
 7P6MwTnprZSoBDwiFAJ8XwGI4JJrM3xp4C8cvvt3Z0L2WA47tXgZr+pwXv2Yj71PB
X-Received: by 2002:adf:e88a:: with SMTP id d10mr25493607wrm.114.1640879512211; 
 Thu, 30 Dec 2021 07:51:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxyHmdI8FjX8tsL5EaUhlDBrAB3wZZysJAvs4QfJZbI1zBLR/5gMbVbuGK3oP/kNDpQnQxHqQ==
X-Received: by 2002:adf:e88a:: with SMTP id d10mr25493587wrm.114.1640879511985; 
 Thu, 30 Dec 2021 07:51:51 -0800 (PST)
Received: from [192.168.1.36] (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id f8sm25885720wry.16.2021.12.30.07.51.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Dec 2021 07:51:51 -0800 (PST)
Message-ID: <4cffe6bc-532f-9673-d126-ec2622f03623@redhat.com>
Date: Thu, 30 Dec 2021 16:51:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] gitlab-ci: Always upload artifacts by default
To: qemu-devel@nongnu.org
References: <20211229233355.217174-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211229233355.217174-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/30/21 00:33, Philippe Mathieu-Daudé wrote:
> GitLab defaults [1] to upload artifacts only when the job succeeds,
> which is not helpful to troubleshoot failing tests. Switch to
> always upload artifacts by default for QEMU jobs, by setting the
> 'artifacts:when' keyword in the global default section [2].
> 
> [1] https://docs.gitlab.com/ee/ci/yaml/index.html#artifactswhen
> [2] https://docs.gitlab.com/ee/ci/yaml/index.html#default
> 
> Reported-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  .gitlab-ci.d/qemu-project.yml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/.gitlab-ci.d/qemu-project.yml b/.gitlab-ci.d/qemu-project.yml
> index 871262fe0e8..24137c14dc4 100644
> --- a/.gitlab-ci.d/qemu-project.yml
> +++ b/.gitlab-ci.d/qemu-project.yml
> @@ -1,6 +1,10 @@
>  # This file contains the set of jobs run by the QEMU project:
>  # https://gitlab.com/qemu-project/qemu/-/pipelines
>  
> +default:
> +  artifacts:
> +    when: always

Hmm this doesn't work as expected... Please disregard this patch.


