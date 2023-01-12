Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6BB66704B
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 11:55:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFvCS-0001ig-IS; Thu, 12 Jan 2023 05:52:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFvBs-0001Xz-9d
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 05:52:15 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFvBq-0005wb-RI
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 05:52:12 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so16281196wmb.2
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 02:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZSckl1N5Xoqzf+kk7FYrQqgKYE0SGmc3xBfeNhyMpe4=;
 b=F1RdbYRV73u07K3UqyFM/DT7F++cPN3ON8MG/yUui7tKw0h+dSInR0U586dNGiKerv
 Qtl40Blsnz29x72SMQlYyZMcEf+N6vhn5hpG7fBv4lPhp9m5XbtIFdJyPPsj7tBYZO94
 YXct8KQPknnqXoSIB3YVZyOZ1XddxTqekLSllQK5Z3GGGhLJ1CyjHiL4/XMtBFjAOENu
 mAh2RApaOJMB/iyLhsFuRu8EtgU2ylF7/9ReEAUE/W1+sO0uN+mbz1pQAJNBwO3Knd6l
 yCT9jAVjWnsw7FmRVYsBbK7Jhn6GQlnIASwJN78NQtXNMs6vUfgiAh/0M+pSoCp/p0lO
 nJ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZSckl1N5Xoqzf+kk7FYrQqgKYE0SGmc3xBfeNhyMpe4=;
 b=6Xf5ExrBAfwLBMziocdIHpPd6pdrr8jELHkXWgEAfAwp72dv8Kpq5N2myBfkZ77esg
 YbEKKZLPvvN8LnFHspNC3p9fmZnBAE6Jg/K0LPUqjAwNRXjjgyz5P09KN9h6TmrWC+N8
 FYl357oiE8nbpqQ63gwsHN/Jh9Xf483kabALZCzig1Budbu0l19G6KiIY5vwLWT571rY
 or7hg+Xud2B9GCzx6AsEfrMyz7BtJJisXuRX9yKn8G7hxayONrvK9EIx2wBMEn5M4xtr
 duIeGr9a58H+nxUYOnYQTPwkyp1hAu7+2pft1nUuFe9DVUBfEeCp4XQRFC9ddy16F38i
 Q+Sw==
X-Gm-Message-State: AFqh2kpw9Ioc/IQ+fJs2S/hYLG21x7uIsljFOEkyS2i2Ux6hQ+/cSxdN
 CnOi+IrbD6wTaHgO1OOjkvrDsg==
X-Google-Smtp-Source: AMrXdXsK5R2S6rZ0xFwEXtm6YeIIrKH7mqbvMujR40BhaiP5bXiUIUusTyrfcGLm7dm2ThY6wTFS2w==
X-Received: by 2002:a7b:cd11:0:b0:3d9:e9ad:d9bf with SMTP id
 f17-20020a7bcd11000000b003d9e9add9bfmr13214812wmj.6.1673520729307; 
 Thu, 12 Jan 2023 02:52:09 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 r126-20020a1c2b84000000b003d35c845cbbsm25271316wmr.21.2023.01.12.02.52.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 02:52:08 -0800 (PST)
Message-ID: <71f1d48e-7e88-204e-c615-17b466deb3ed@linaro.org>
Date: Thu, 12 Jan 2023 11:52:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 18/31] tests/qtest/libqos/e1000e: Remove duplicate
 register definitions
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Darren Kenny
 <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, devel@daynix.com,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
References: <20230112095743.20123-1-akihiko.odaki@daynix.com>
 <20230112095743.20123-19-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230112095743.20123-19-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 12/1/23 10:57, Akihiko Odaki wrote:
> The register definitions in tests/qtest/libqos/e1000e.h had names
> different from hw/net/e1000_regs.h, which made it hard to understand
> what test codes corresponds to the implementation. Use
> hw/net/e1000_regs.h from tests/qtest/libqos/e1000e.c to remove
> these duplications.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   tests/qtest/libqos/e1000e.c | 20 ++++++++++----------
>   tests/qtest/libqos/e1000e.h |  5 -----
>   2 files changed, 10 insertions(+), 15 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


