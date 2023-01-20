Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F41F3674F78
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 09:29:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pImmA-000711-01; Fri, 20 Jan 2023 03:29:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pImm7-00070Z-UR
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 03:29:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pImm6-0005jj-DG
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 03:29:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674203365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JRyBmUb0kmG0Q27J3jrlahQU/nwgXi87B8CD4lN3CR0=;
 b=Akzu9YPHbkTljimMs5AD/QJEscCf1l53vgkk1MjTFGC49f0h3KLQit1kGJ+AhWrDFIpJhw
 pV8NV8MZQQILVz39G24D8mgzTS6GiCASJV4lz9P3xnpIH7l6LAlpOsP0dL4mgpMT9kjLFs
 zcHOPJ88y1TsGYnl6Wq/KI6fuAa7XCw=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-8-I_FY-MDIMB65C8afyOh_-w-1; Fri, 20 Jan 2023 03:29:23 -0500
X-MC-Unique: I_FY-MDIMB65C8afyOh_-w-1
Received: by mail-qv1-f70.google.com with SMTP id
 x6-20020a0cc506000000b005349c8b39d6so2186091qvi.2
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 00:29:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JRyBmUb0kmG0Q27J3jrlahQU/nwgXi87B8CD4lN3CR0=;
 b=OUl9ldvkKmdTCIGdvtbE/xI2s5IHIdLPC7gWl+8vWbR9q6thqLgMlhr9Uqi/k/JHNs
 xywDYTDp0DrGOx5Gj7eJ45eTxwg7aR4vIO4sK87JYpVAMC1Xpq054Y3Zqh8gzHaTevB3
 4wh3HjQ6pezdWuhoAOVJc+ZwhnprZBpwGX6+KUFGlvBLhYnIry/agiLNtWZsrOPGZYQ6
 SDbUX19ngoaLYcDIiUTeGd+8kRNVCrcUu9xiJ0vQVy0iMOJgZfIpR0RzCD37LXCTRDyx
 2YCi64J3DR1PPZBwd4stYY85qfxFMP0teOEZQ5J7ul+TRUyttHGzulo2aNjBm3vrnjX9
 UNeA==
X-Gm-Message-State: AFqh2koUC6vStvYHh7g2py2HwuefEy/H9t5uMnzCncwpuAEurbpF+JHU
 /P+dG622/7ChRiNllxJObuIpKOuLYlmlsp8NUbhSAdNfM3USyz5xsyhqaRKkfwvo6UmAgD2KxeP
 w4fEI9AJZ/QkdwCs=
X-Received: by 2002:ac8:6b02:0:b0:3b4:752e:246b with SMTP id
 w2-20020ac86b02000000b003b4752e246bmr19695479qts.7.1674203363035; 
 Fri, 20 Jan 2023 00:29:23 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv85wSSpEu9IP5Uhn1CH+hx2rc8QwefpYCMYps9eoK0f+siRF8elishj9tniFOxmnSDjJfb8g==
X-Received: by 2002:ac8:6b02:0:b0:3b4:752e:246b with SMTP id
 w2-20020ac86b02000000b003b4752e246bmr19695468qts.7.1674203362812; 
 Fri, 20 Jan 2023 00:29:22 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-118.web.vodafone.de.
 [109.43.177.118]) by smtp.gmail.com with ESMTPSA id
 q3-20020ac87343000000b003b6464eda40sm4005587qtp.25.2023.01.20.00.29.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jan 2023 00:29:22 -0800 (PST)
Message-ID: <3cc1367b-d47b-5d58-14ff-fa880ddaf52a@redhat.com>
Date: Fri, 20 Jan 2023 09:29:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2] gitlab-ci: Check building KVM-only aarch64 target
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20230120082548.60144-1-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230120082548.60144-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 20/01/2023 09.25, Philippe Mathieu-Daudé wrote:
> Add a manual new job to cross-build the aarch64 target with
> only the KVM accelerator enabled (in particular, no TCG).
> 
> Re-enable running the similar job on the project Aarch64
> custom runner.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> Based-on: <20230118193518.26433-1-farosas@suse.de>
>            target/arm: CONFIG_TCG=n part 1
> 
> Successful job:
>    https://gitlab.com/philmd/qemu/-/jobs/3630178191
>    Duration: 15 minutes 25 seconds
> 
> Since v1:
> - mark job as manual (Alex)
> - re-enable on custom runner
> ---
>   .gitlab-ci.d/crossbuilds.yml                         | 11 +++++++++++
>   .gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml |  4 ----
>   2 files changed, 11 insertions(+), 4 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


