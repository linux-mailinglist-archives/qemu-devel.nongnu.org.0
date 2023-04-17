Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DDF6E413E
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 09:37:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poJQ6-00065D-U3; Mon, 17 Apr 2023 03:37:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1poJPz-000639-47
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 03:36:56 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1poJPx-0001Hj-3t
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 03:36:54 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-2f62b1385e3so738562f8f.2
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 00:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681717011; x=1684309011;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=R6fEUVSxFDexx1wAOYs4QzPTH84Q3sfVsUSeBTtb3vA=;
 b=O7uQfyoZb+xbCz1qG3DdrfBAHyxzRodYLIVhayIQX9zgeuL8/sjO+/EqJ8P5knX1X2
 HEdtqd5bM/wf43vTlt3YAKzZUcM0X1B6h6f5sgMgwfnPVFTMjqO6Iv4ztp1A+pSZQUde
 0PAh1P2vAUQ/kZv4TuJzjBAKmZN4Aaz/BciPTmMWYDYRFdNW4IEivNG9n6/b/jnBUAtF
 KXmpLx15OvHtwkRZnHM4w0DZxUEehuQwacE8WGU+qSzkh7nPihR4hiMXeFz7Zlo1iyaU
 JLi1R9pY3tl7BSw8ocLCMDNYfMrR1GcZCMl8SDuLzDLH2l3++b7sHdLMdzzVFGcGnD1b
 NLNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681717011; x=1684309011;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R6fEUVSxFDexx1wAOYs4QzPTH84Q3sfVsUSeBTtb3vA=;
 b=JhNxJOqUWBjYOh2mexdfpoGy8q4upjPYRru5PJD7KI3rJ5ntNJmQUq7aH929unKVfk
 hBGx6+Ou+bU8L0rIu/cWA7uEY/OqSlR9YVbXmbOT45GD18GovJrwoPsS236c3AUSqoTJ
 33ml1XF+zVyu5eqOzR+sZ8OjG0d98P4cQgmVIoq3L6BPm9OZwFO5Ez+aEu81mRo7NVDO
 9I5sS5gO846q0IXFQSkZws/0ZoByVmr0ol5FHcvi6as6jAZKvv5ZUYYylmH+PkO7JaBD
 1SlIOkEfwSytAPklRb2qz7Gw3zBabZJXdVXA+Qa4uN1oblB1ATZ6MRehhxD9ceWl9n8G
 16Mw==
X-Gm-Message-State: AAQBX9c7jErYCoG/OiOfb0Tc4l3t00Yqd9Gb5zBNe2mNvhK3QIwemJhb
 7N3+EHpqNofVEPmwNuuCM4podw==
X-Google-Smtp-Source: AKy350bjjsoXxjFWgy9rUgQiNkgL0iCXzYZetazIQsRnxuNp5l+VGWJ5tO7pBc/0aIdEZPhaP45pmg==
X-Received: by 2002:adf:f4cb:0:b0:2f7:53ff:7239 with SMTP id
 h11-20020adff4cb000000b002f753ff7239mr4793691wrp.33.1681717011107; 
 Mon, 17 Apr 2023 00:36:51 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 y14-20020adffa4e000000b002f5fbc6ffb2sm9689409wrr.23.2023.04.17.00.36.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Apr 2023 00:36:50 -0700 (PDT)
Message-ID: <cd1e974b-2bbf-4b9a-c538-95268de9f449@linaro.org>
Date: Mon, 17 Apr 2023 09:36:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH] virtio: i2c: Check notifier helpers for
 VIRTIO_CONFIG_IRQ_IDX
To: Viresh Kumar <viresh.kumar@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 stratos-dev@op-lists.linaro.org, Cindy Lu <lulu@redhat.com>
References: <89d47285e882a99a0513411edcc96aa575512f13.1681710993.git.viresh.kumar@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <89d47285e882a99a0513411edcc96aa575512f13.1681710993.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.976,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 17/4/23 08:02, Viresh Kumar wrote:
> Since the driver doesn't support interrupts, we must return early when
> index is set to VIRTIO_CONFIG_IRQ_IDX.
> 
> Fixes: 544f0278afca ("virtio: introduce macro VIRTIO_CONFIG_IRQ_IDX")
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>   hw/virtio/vhost-user-i2c.c | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/hw/virtio/vhost-user-i2c.c b/hw/virtio/vhost-user-i2c.c
> index 60eaf0d95be0..45100a24953c 100644
> --- a/hw/virtio/vhost-user-i2c.c
> +++ b/hw/virtio/vhost-user-i2c.c
> @@ -128,6 +128,16 @@ static void vu_i2c_guest_notifier_mask(VirtIODevice *vdev, int idx, bool mask)
>   {
>       VHostUserI2C *i2c = VHOST_USER_I2C(vdev);
>   
> +    /*
> +     * Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
> +     * as the Marco of configure interrupt's IDX, If this driver does not

Copy/paste of pre-existing comment, still I wonder who is "the Marco of 
configure" :P

> +     * support, the function will return
> +     */


