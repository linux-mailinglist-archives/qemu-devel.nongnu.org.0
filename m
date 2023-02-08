Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2951B68F150
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 15:55:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPlpo-0000ZE-H6; Wed, 08 Feb 2023 09:54:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPlpm-0000Yw-Sf
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 09:54:06 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPlpl-0006AF-Cf
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 09:54:06 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 l21-20020a05600c1d1500b003dfe462b7e4so2712390wms.0
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 06:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7BDVby5zLy1Wo7icY/6XirG89kuyzvIbhOVpDhua/Sc=;
 b=obGq0lgg3ZJvJqHy6Sna3jI30LY9VBLTBcQfltkNtrL/Iz/UwJzFVsqGF7W4ubYC/0
 YNJSwPxwNrj2S19nC3zY/13FI/gV7GEUAeIinfJEcQbXEyqShayX/7JHwBMWlVp0l6x1
 0Z3kzyYDFwE9Ee4XSOjiWjHCuAKybQdc4pKGO41ERDF7FKccjEqWOJ7hZvpypYaikAvK
 ewpVuPatZNHbJqiab2kDh6ZTEOXqNVNKmJQgt+SLWZX+gWUFw1Lvn4X0/YUMF6/2y1qe
 SLsJ79oTnnt57Fb7YbUCVyjjb05PZDZejYe9REsF48vaVEcO1UCYv1n6823yk7X40C7V
 V2pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7BDVby5zLy1Wo7icY/6XirG89kuyzvIbhOVpDhua/Sc=;
 b=K6fkc14RjI19ulGBCVXK5kPGaiqoPniPCwBKYYybejbfPM84JJ9jCLtKYpG7//KuRl
 WzAsVgrMzatWfzcQUN5aXRZ1SQ946qpPGJmu6IYIL0bP0i7AH7i18ZfhQo+3W5VDAG4U
 5EVkEeqGmBoJFb6NTLJ9wMI70WBNe7uvbbZ65S1xRF3d8Uv++bI8QjR3U5DT+shWqQST
 JTsuieDrxMr1Q6NDMf6d1pl0z1rIAxrCVt8mIUWFS9OwMvK8CTifX0cLwr0+a0TF+BrT
 kaTUjCMQfKPXmkaKc2k+nPrlKV+91n6SusxnnhoHHF0WYU74LEjxrjlXoNcd7H8CKVgy
 JBUA==
X-Gm-Message-State: AO0yUKXR0PDJtLuMrHlN3e6tZ/XG3oeNAKUv7sqqiiohm47vQ2gpnqYP
 El1L5TTMbnVyT6aK/VMaz6rObQ==
X-Google-Smtp-Source: AK7set9skzLVFvKS0RtY4eop5ZCiEejM/cRdN3j3SeKkMeXFQU/vvIdoQQ/OC/7uWj2bQfRZ00On5A==
X-Received: by 2002:a05:600c:4da2:b0:3df:e1d1:e14c with SMTP id
 v34-20020a05600c4da200b003dfe1d1e14cmr9052082wmp.20.1675868043696; 
 Wed, 08 Feb 2023 06:54:03 -0800 (PST)
Received: from [192.168.254.175] ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 bd6-20020a05600c1f0600b003e0015c8618sm2219123wmb.6.2023.02.08.06.54.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 06:54:02 -0800 (PST)
Message-ID: <64de90b1-cdb4-2b83-2a56-404afa4681ec@linaro.org>
Date: Wed, 8 Feb 2023 15:54:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v3 1/2] migration: Split ram_bytes_total_common() in two
 functions
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20230208141402.18865-1-quintela@redhat.com>
 <20230208141402.18865-2-quintela@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230208141402.18865-2-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.146,
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

On 8/2/23 15:14, Juan Quintela wrote:
> It is just a big if in the middle of the function, and we need two
> functions anways.

Typo "anyways".

> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>   migration/ram.c | 25 ++++++++++++++-----------
>   1 file changed, 14 insertions(+), 11 deletions(-)
> @@ -3222,7 +3224,8 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
>       (*rsp)->pss[RAM_CHANNEL_PRECOPY].pss_channel = f;
>   
>       WITH_RCU_READ_LOCK_GUARD() {
> -        qemu_put_be64(f, ram_bytes_total_common(true) | RAM_SAVE_FLAG_MEM_SIZE);
> +        qemu_put_be64(f, ram_bytes_total_with_ignored()
> +                      | RAM_SAVE_FLAG_MEM_SIZE);

Per CODING_STYLE the '|' should go under ram_bytes_total_with_ignored ;)

            qemu_put_be64(f, ram_bytes_total_with_ignored()
                             | RAM_SAVE_FLAG_MEM_SIZE);

>           RAMBLOCK_FOREACH_MIGRATABLE(block) {
>               qemu_put_byte(f, strlen(block->idstr));


