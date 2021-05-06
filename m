Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E18375A27
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 20:24:44 +0200 (CEST)
Received: from localhost ([::1]:43234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leifz-0006qO-5v
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 14:24:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1leidv-0005wq-KX
 for qemu-devel@nongnu.org; Thu, 06 May 2021 14:22:39 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:41748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1leidh-0003Bs-0G
 for qemu-devel@nongnu.org; Thu, 06 May 2021 14:22:33 -0400
Received: by mail-pg1-x52f.google.com with SMTP id m37so5308084pgb.8
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 11:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=128m2cj7wuZQ/SyFKZ32TrID+aFkr81rKCpUJSdA/Mo=;
 b=jH7zTSs0X6Sa/HpXOgu1/3UlXL+OW/2Wjkv9HVLp0cl2Zjr8MUGI9HGvlWiMJCeyQg
 XEqA5eN9vudUUhiytVjAiwP+D15o5be2pr9fN6ioIdn9tVu0LQlQRoj1NpHFfnNoIy9X
 YU9QezkpPEFyGRseMJK5J+B6evk4C+Ts65pzX8+LVb9ViNG/qz7CW1sjviGAeF3Uh3aR
 vAi4JMv/J4dNyT9yhW4RXfvTq+dIEE+VazZcQ6FGFrnL+EPLpWj6nXH2mXdjVrDXUuIN
 AsmZXlu1MQYqIQraExVSgL+zrgVCqfc+9wkeI6hZobi+d9rIWhwn6S76CCSv2HvPlCqU
 cSoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=128m2cj7wuZQ/SyFKZ32TrID+aFkr81rKCpUJSdA/Mo=;
 b=jS7QuRI+VOMN6OcIdqY7XSPVgG7ICq6d18bF8aPQ9akH6lpmy2XqooWHpxZYbXr7jd
 jXI6loTtCdCK8Wpn7MZdNWbwdhzJYyD1fUHHwIwSJFl3nhydVpIhjwFas6Fv2Qy5XaFD
 AkF84IGjgYGEIaWl5fn/gsaddQr8LvXlYfQ8tNY9HIoGs0aU1WxzOIJhl+Ggn6xpQnZG
 iiOSZGWOpifLogfdLlatf+P30x+j1fQe2EjWOm39XNafOlzaC9ThdB8xRd/DgxbDLmld
 BrMyk15qtU7OYYqC2lMIQRa1Dc2hDAo5hV1dXiuT0U3AwIh78ufEgOj+RgtSQOATBAvx
 JdeQ==
X-Gm-Message-State: AOAM532GYn0vVagEGHbpupKB1bG0KM13hcdNneIm5Cdg8To9WPX0DZmk
 QfIPVZHeBDvAiZbw+t8aaAEl5w==
X-Google-Smtp-Source: ABdhPJxlNOhSl5FQNGvcjLNrIokfWWUTitu1Uj7h8gO/fA78UeVfMr+WCh6sl0no4Z2aKQoXDvWTyw==
X-Received: by 2002:a63:1a07:: with SMTP id a7mr5535713pga.139.1620325336833; 
 Thu, 06 May 2021 11:22:16 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id y64sm2769017pfy.204.2021.05.06.11.22.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 May 2021 11:22:16 -0700 (PDT)
Subject: Re: [PATCH] virtio-blk: Convert QEMUBH callback to "bitops.h" API
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210506155419.1796056-1-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fdf97a71-1359-e186-a895-3383c31ca20c@linaro.org>
Date: Thu, 6 May 2021 11:22:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210506155419.1796056-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Li Hangjing <lihangjing@baidu.com>,
 Sergio Lopez <slp@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Chai Wen <chaiwen@baidu.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Xie Yongji <xieyongji@baidu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/6/21 8:54 AM, Philippe Mathieu-Daudé wrote:
>   static void notify_guest_bh(void *opaque)
>   {
>       VirtIOBlockDataPlane *s = opaque;
> -    unsigned nvqs = s->conf->num_queues;
> -    unsigned long bitmap[BITS_TO_LONGS(nvqs)];
> -    unsigned j;
>   
> -    memcpy(bitmap, s->batch_notify_vqs, sizeof(bitmap));
> -    memset(s->batch_notify_vqs, 0, sizeof(bitmap));
> -
> -    for (j = 0; j < nvqs; j += BITS_PER_LONG) {
> -        unsigned long bits = bitmap[j / BITS_PER_LONG];
> -
> -        while (bits != 0) {
> -            unsigned i = j + ctzl(bits);
> +    for (unsigned i = 0; i < s->conf->num_queues; i++) {

Is this bitmap dense enough that you want to iterate by index, or is it sparse 
enough to iterate via find_first_bit/find_next_bit?

In either case, leave the copy of  s->conf->num_queues to a local variable.


r~

