Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC4766702F
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 11:49:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFv2j-0004Rg-RU; Thu, 12 Jan 2023 05:42:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFv2e-0004QR-R6
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 05:42:41 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFv2d-0003zg-Bj
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 05:42:40 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 p1-20020a05600c1d8100b003d8c9b191e0so14659961wms.4
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 02:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hvYqKawt0g6x1rSFY2px00DpXS0yLzrNo+sLNi0KWP0=;
 b=P/e/rmJ1H0rlEDf0Ym49stQJKmpKisHT9B1ZHsyt10ntJD8gFhAH+BmSSsFxMDFcE5
 T1jrtAgxRGWDQN49iX4Y7eWpPBlUGeyc4HFVykhZu2GiMeFqd6EfUcKv/7+Nr6nXX5xI
 u5taBmACxbuJVNLJu67X9X8CJfGA5K83xB1FFBjoNv/M8flMqoCA01Tdh9iEUw76fOcK
 UwUldwhv3NG9mbppoVi0jxFBkPGKeZYJk+tCL/d96xlBMvM42N9Bd9jtfQokiD+eAsOL
 J83QeR3DhQXyPt1pp7lZKUzKcDRJlbnI5p9ewZiHqg5YRc0CIUX0cFm1tLilr7iMj97U
 u2Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hvYqKawt0g6x1rSFY2px00DpXS0yLzrNo+sLNi0KWP0=;
 b=SkV+qxVrjDAhW/3KmF4O3mP+NoQchS9MT9qcO+a9kCmqCiEVeL3/OrvLZvkg/bWZWD
 V6UvIUatnhkbNN5pzhhIYFm7cvei+AO0DYgL5C1oeCmfWL6aU0wdRMrcZqE/wrkkhxAA
 +GVR73F4Wc7EPm/NXEUvbaTj4dF6RYzjVw5pazTN5Xt1QocqQeWiRq/HwlCo5xnYXKlv
 XE3tzskWlJ7JLFyGEdV90O+phOq7lM1983k4wo7v3tlD4YxYZgbLrdY/AeKPnZh2+WW6
 Pl04VwDo4y2+ZJpl08y1V7mdC8Kiyz+RbglExOtYhcR66gfCTlg+BQyNDL01P+oafbnu
 lxmw==
X-Gm-Message-State: AFqh2kpj0KRz6OzXHAG9elCvUqvTCBZ0xn4bvd6sNATdK7Fk2dgIAcD5
 cMjcb85PLseRRDRLr2eBLpbq3w==
X-Google-Smtp-Source: AMrXdXsfMqAaIRVr4MXup9i3rycSDpAXfx0Oi8vXm5a8Gj0dEhW2BhB63A7BVuGQNW/aljslzYGPdA==
X-Received: by 2002:a05:600c:3844:b0:3cf:7dc1:f424 with SMTP id
 s4-20020a05600c384400b003cf7dc1f424mr54503535wmr.3.1673520157755; 
 Thu, 12 Jan 2023 02:42:37 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 bw28-20020a0560001f9c00b002421888a011sm15817024wrb.69.2023.01.12.02.42.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 02:42:37 -0800 (PST)
Message-ID: <6b0f7785-f1be-d1f5-e662-9c82008f0f42@linaro.org>
Date: Thu, 12 Jan 2023 11:42:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 04/31] e1000: Use hw/net/mii.h
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
 <20230112095743.20123-5-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230112095743.20123-5-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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
> hw/net/mii.h provides common definitions for MII.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   hw/net/e1000.c         | 86 ++++++++++++++++++------------------
>   hw/net/e1000_regs.h    | 46 --------------------
>   hw/net/e1000e.c        |  1 +
>   hw/net/e1000e_core.c   | 99 +++++++++++++++++++++---------------------
>   hw/net/e1000x_common.c |  5 ++-
>   hw/net/e1000x_common.h |  8 ++--
>   6 files changed, 101 insertions(+), 144 deletions(-)

>   static const char phy_regcap[0x20] = {
> -    [PHY_STATUS]      = PHY_R,     [M88E1000_EXT_PHY_SPEC_CTRL] = PHY_RW,
> -    [PHY_ID1]         = PHY_R,     [M88E1000_PHY_SPEC_CTRL]     = PHY_RW,
> -    [PHY_CTRL]        = PHY_RW,    [PHY_1000T_CTRL]             = PHY_RW,
> -    [PHY_LP_ABILITY]  = PHY_R,     [PHY_1000T_STATUS]           = PHY_R,
> -    [PHY_AUTONEG_ADV] = PHY_RW,    [M88E1000_RX_ERR_CNTR]       = PHY_R,
> -    [PHY_ID2]         = PHY_R,     [M88E1000_PHY_SPEC_STATUS]   = PHY_R,
> -    [PHY_AUTONEG_EXP] = PHY_R,
> +    [MII_BMSR] = PHY_R,       [M88E1000_EXT_PHY_SPEC_CTRL] = PHY_RW,

Align off, otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> +    [MII_PHYID1] = PHY_R,     [M88E1000_PHY_SPEC_CTRL]     = PHY_RW,
> +    [MII_BMCR]   = PHY_RW,    [MII_CTRL1000]               = PHY_RW,
> +    [MII_ANLPAR] = PHY_R,     [MII_STAT1000]               = PHY_R,
> +    [MII_ANAR]   = PHY_RW,    [M88E1000_RX_ERR_CNTR]       = PHY_R,
> +    [MII_PHYID2] = PHY_R,     [M88E1000_PHY_SPEC_STATUS]   = PHY_R,
> +    [MII_ANER]   = PHY_R,
>   };




