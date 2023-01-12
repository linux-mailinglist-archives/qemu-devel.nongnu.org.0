Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB8D66702C
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 11:49:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFv6S-0006n0-Ek; Thu, 12 Jan 2023 05:46:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFv5u-0006Xf-GU
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 05:46:04 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFv5s-0004da-3K
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 05:46:01 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 m26-20020a05600c3b1a00b003d9811fcaafso14661925wms.5
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 02:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hGsJHZVBqejxBi4DBZUFkbpL+bzzAzmvwsuU7or9Yg0=;
 b=fYIij4HuoYGgILXGumdgQT1O4UWpuKNcShWRJwSuBdeu+Y1JXu0lSMBleMr+DaD1vH
 qSsKqTgZjvJklx0jwIyRuMjuey7G3PFsKdw4WWl7E8Gx9uY0Fb1kPq+LpeLa94WkzkjI
 ZAxkr2zQbRuAAFtBV1f/V/c76TWp3IlaMnsAFbmy094YRxtTNWvYznM4JhWrcvY2ROWs
 yLj5AD7QlrgDF6HuOY0EzygHi/FVAVDKMlOivCOb4zhxxmOAJqOcJ30HOyy9o+O9hBYD
 lw5eaC3KdPTKe01dWsaon9kvKEu7/R1Uk1cfJk/O22bFY3yT2dwrU67N/keHj2XqzwAl
 lS6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hGsJHZVBqejxBi4DBZUFkbpL+bzzAzmvwsuU7or9Yg0=;
 b=rn5g6ZeQWyeUXOLVZpOdDRdRSTAGFc/WeL7rM+Ws21bsViwQwtuwm4lYx18aoWRNRC
 EPl2NsoWNIF0uewHY7y/Mp8UwG6AlqNkRDE9DyL4hW7NV3R4CjQk1rUC0pk/o1O04Aap
 ueC/8Sw+7DxUe9VbUU3ugVWENQzxFkpUyx7TObmOfUeCZoWrCK+6nW07mSE4mhOoNUwn
 vtFn/eU39ejIHNbGs56JxS2n7Ama5ObIblZ3Sq3ov8XhsLg94o5ajonQK4P1ndKK8DBN
 hivp4Xo8iJ7Lf4/3/iBo6F41x/jdPWei45pJK/VetBVsbpcY5bG5LDeFjHkz3T85haiH
 GUdw==
X-Gm-Message-State: AFqh2koKKSUszxcn9KcNwDB+OeDbpPcGNP0D1wUHSCcro6hkQIBJGS+o
 STmBQOcdoDHJlOjra6Ufljq69Q==
X-Google-Smtp-Source: AMrXdXuNN8vHC25V0JCxJRsdJ1NBcmNZGXlkMsHdwbavdgRWANBjZXvIdqfnOVpgJx+mX0ZEZVe9xw==
X-Received: by 2002:a05:600c:22cc:b0:3d1:bd81:b1b1 with SMTP id
 12-20020a05600c22cc00b003d1bd81b1b1mr54042406wmg.18.1673520358362; 
 Thu, 12 Jan 2023 02:45:58 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l27-20020a05600c2cdb00b003a84375d0d1sm28508006wmc.44.2023.01.12.02.45.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 02:45:57 -0800 (PST)
Message-ID: <0f22e884-93f2-237e-e44a-6dd1b7443349@linaro.org>
Date: Thu, 12 Jan 2023 11:45:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 07/31] e1000: Use more constant definitions
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
 <20230112095743.20123-8-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230112095743.20123-8-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
> The definitions for E1000_VFTA_ENTRY_SHIFT, E1000_VFTA_ENTRY_MASK, and
> E1000_VFTA_ENTRY_BIT_SHIFT_MASK were copied from:
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/net/ethernet/intel/e1000/e1000_hw.h?h=v6.0.9#n306
> 
> The definitions for E1000_NUM_UNICAST, E1000_MC_TBL_SIZE, and
> E1000_VLAN_FILTER_TBL_SIZE were copied from:
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/net/ethernet/intel/e1000/e1000_hw.h?h=v6.0.9#n707
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   hw/net/e1000.c         | 50 +++++++++++++++++++++++-------------------
>   hw/net/e1000_regs.h    |  9 ++++++++
>   hw/net/e1000x_common.c |  5 +++--
>   hw/net/e1000x_common.h |  2 +-
>   4 files changed, 41 insertions(+), 25 deletions(-)


> diff --git a/hw/net/e1000x_common.h b/hw/net/e1000x_common.h
> index 3501e4855a..b991d814b1 100644
> --- a/hw/net/e1000x_common.h
> +++ b/hw/net/e1000x_common.h
> @@ -102,7 +102,7 @@ enum {
>   static inline void
>   e1000x_inc_reg_if_not_full(uint32_t *mac, int index)
>   {
> -    if (mac[index] != 0xffffffff) {
> +    if (mac[index] != UINT32_MAX) {

I wonder if using -1 wouldn't be simpler, otherwise great
cleanup!

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>           mac[index]++;
>       }
>   }


