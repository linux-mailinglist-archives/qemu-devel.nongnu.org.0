Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB16E644199
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 11:55:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2VaU-0002vd-4K; Tue, 06 Dec 2022 05:54:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2VaS-0002vP-AM
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 05:54:08 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2VaQ-0007f9-Hj
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 05:54:07 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so822989wms.2
 for <qemu-devel@nongnu.org>; Tue, 06 Dec 2022 02:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dp1fTxZjOWj5S5niYtU6BvsNGIKAoobEYMziwoT3Jyg=;
 b=Dz5972tP7kcmI2RGXWwD8J+WQnpg4YYojEK3SviWZey0Ab6nUlo5se5frXYMubluHl
 z4sPDEGP+ttDwn/LItLBZVV+hz0PmPtzormjCRYmyQsiC6+tFnzqGUMtmBg2RXQesosL
 UGBlaOwdyjWCfGwBOZ3A7AVJD0su9D6cdYPxX09cbMmrVsLoyiK9ypYc46hRvK87OsJ3
 Y24HGuk6sqRAmoVQmy1qz059gSslhElaoPVhE+AEtAtUpdrcgZjN6VcPR5oi5DGIFLHw
 s7oNhcsH5aeYu9TQQ3O6qnDhkKxNJl2c9OWcfBTqVgnIz3LjiRUwKSoH+WpmlZDkwb1G
 W5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dp1fTxZjOWj5S5niYtU6BvsNGIKAoobEYMziwoT3Jyg=;
 b=lchKsACfFRM3G/QJaXQ2tTcHPi24CLGzik77nzWycyRKyGz8AC26xf+0gR6bvEzOz/
 Pz+Vv0J+1Fj4BlNRgOOjHS8g6Q0EbvMvFRJszZVlMv5SRTW0Bb0OmQs3/b4khzDuxKzX
 7hWeJgILZlwLMEvShl4aj6qriZ6+F5/M6zhx6/FKCBt7f4YCIXsgzQK7SAKSjMnMFNhs
 dSC1UQji7ORntXC4DTNns7jJE8VXTrHm9d+EWB5EQcecScOwFcATemIdaOaQRgbYxOhd
 /duUgHiswRkFlTCy5mybulWtn1bsBOGHdOPSllyHoxh7cn9I775ThwOeJ3o6Cp2D6hzv
 LYuA==
X-Gm-Message-State: ANoB5pkD36iVfvLvQ+7vcLX3gGzHsFZsLljDV6jZuWLQH0eGPB0XzHV6
 6DTNUc1hmXOH99/DpaKhbxX83A==
X-Google-Smtp-Source: AA0mqf6w6K60t3t9m6LOxGRzRhbSqZ81eslLhQ1zwIdbRKWMjGuNcvYGb6B80Zg6MMhYhQaAZmBgfw==
X-Received: by 2002:a7b:c048:0:b0:3a8:3e58:bb9b with SMTP id
 u8-20020a7bc048000000b003a83e58bb9bmr52448997wmc.168.1670324044868; 
 Tue, 06 Dec 2022 02:54:04 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o35-20020a05600c512300b003a3442f1229sm26463367wms.29.2022.12.06.02.54.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Dec 2022 02:54:04 -0800 (PST)
Message-ID: <8a59c8b5-eabe-7b3e-29bc-e7d71533a6a0@linaro.org>
Date: Tue, 6 Dec 2022 11:54:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v1 13/13] virtio/vhost-user: dynamically assign
 VhostUserHostNotifiers
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: slp@redhat.com, mathieu.poirier@linaro.org, mst@redhat.com,
 viresh.kumar@linaro.org, stefanha@redhat.com, marcandre.lureau@redhat.com
References: <20220321153037.3622127-1-alex.bennee@linaro.org>
 <20220321153037.3622127-14-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20220321153037.3622127-14-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.265,
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

Hi Alex,

On 21/3/22 16:30, Alex Bennée wrote:
> At a couple of hundred bytes per notifier allocating one for every
> potential queue is very wasteful as most devices only have a few
> queues. Instead of having this handled statically dynamically assign
> them and track in a GPtrArray.
> 
> [AJB: it's hard to trigger the vhost notifiers code, I assume as it
> requires a KVM guest with appropriate backend]
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   include/hw/virtio/vhost-user.h | 42 ++++++++++++++++-
>   hw/virtio/vhost-user.c         | 83 +++++++++++++++++++++++++++-------
>   hw/virtio/trace-events         |  1 +
>   3 files changed, 108 insertions(+), 18 deletions(-)


>   void vhost_user_cleanup(VhostUserState *user)
>   {
> -    int i;
> -    VhostUserHostNotifier *n;
> -
>       if (!user->chr) {
>           return;
>       }
>       memory_region_transaction_begin();
> -    for (i = 0; i < VIRTIO_QUEUE_MAX; i++) {
> -        n = &user->notifier[i];
> -        vhost_user_host_notifier_remove(user, NULL, i);
> -        object_unparent(OBJECT(&n->mr));
> -    }
> +    user->notifiers = (GPtrArray *) g_ptr_array_free(user->notifiers, true);

Since you replaced an iteration by a single function call, the MR 
transaction guards can be removed now, right?

>       memory_region_transaction_commit();
>       user->chr = NULL;
>   }

