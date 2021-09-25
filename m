Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C9941834D
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 17:48:25 +0200 (CEST)
Received: from localhost ([::1]:36414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU9ua-0005Mw-6t
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 11:48:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mU9YP-0001tm-Fv
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 11:25:29 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:35836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mU9YN-0006ou-7V
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 11:25:29 -0400
Received: by mail-qk1-x72c.google.com with SMTP id c7so31921143qka.2
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 08:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3lZ4Qdc8aFDkYts6drgy3wdV8W1gLx9mEbLw2R2ZAYU=;
 b=TWIN27nZa4dti4gG88khWQIs6Igj4xCMeTvS1dV1VzHy5qT13Rak/lipXZuqT4oSmN
 ko5BfhrcdAdGdrq7BewlCL1/qKG7RoSD7JqcIWPFYAMn0usP6PO5k8Qt5x+rDWVVaiHt
 yeS0fYWWZcSrZySytNUBVMNzn3lNofYpWzTQk2Izo/o20wIA6UO23foosb28SCbZrNaZ
 V/KtnpAaotgbfscdemoVPYaOBrQlAwJO5+QLJmajkDQsie9/U6IAIW5SSx+KTo6Np8RH
 xf2dHI9XBOhLyocxC8iTUZdEZyEg8Kb2qq6Nq6Cc4dog89puY4yASBY7QW42mQZGW2/e
 o47Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3lZ4Qdc8aFDkYts6drgy3wdV8W1gLx9mEbLw2R2ZAYU=;
 b=KXjju/0KVQ9hToy8/+DCDLqvNdEHZDs0JwRordoAGdgo5VifnlhDqmic9wik1OMCqg
 n1JiWPoCHfoNIkk7l1e1UYRBDVqyfACx5Kos4V7MOsJU5bwXYZnIfK0Q/mmOk1oP4NBM
 4j9rmR80K4C0DO84BRdih8k6FpFY5MQYSH+WjGK8OJcuIVu7hHLXgvxdaFE1vH5Wozs2
 S9UdZJV7UA2n4Q6fdfHen9EmzD3BeX+BWJVy4uL/EORze5/OODQqkX1BfmXih4kr7crj
 NbUGw1h76/nQl4jsQvitVdWhrOyBJQv+lN1czFOvF0I4vObM87yiyU0yqcGGFmRydZdF
 vUtA==
X-Gm-Message-State: AOAM533JQeHRxA9snwF3PFssUCymOvDyNbraSz93me/EYZBr04gdXygA
 KbIaTw2fVi7robuV/JxZ6yq3lA==
X-Google-Smtp-Source: ABdhPJxEKLyzYEdmFyxEGPM0B17IcXYi4ymRh14FkFMKvNlP6gpGKcET7MX6oQvns1Zq9C812dViTg==
X-Received: by 2002:a37:c0c:: with SMTP id 12mr16169164qkm.471.1632583526228; 
 Sat, 25 Sep 2021 08:25:26 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id g19sm8429570qki.58.2021.09.25.08.25.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Sep 2021 08:25:25 -0700 (PDT)
Subject: Re: [PATCH v7 01/40] accel: Simplify qemu_init_vcpu()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210925145118.1361230-1-f4bug@amsat.org>
 <20210925145118.1361230-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b51ba654-b160-3c4f-af31-f5f3a261d1c5@linaro.org>
Date: Sat, 25 Sep 2021 11:25:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210925145118.1361230-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/25/21 10:50 AM, Philippe Mathieu-Daudé wrote:
> cpus_register_accel() already checks for ops->create_vcpu_thread
> being non-NULL, so it is pointless to re-check for it in
> qemu_init_vcpu().
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   softmmu/cpus.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

