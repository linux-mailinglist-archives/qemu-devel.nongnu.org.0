Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7A0646CE8
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 11:33:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3EBx-0003uR-9j; Thu, 08 Dec 2022 05:31:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3EBv-0003tZ-ET
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 05:31:47 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3EBl-0006Gs-Bz
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 05:31:40 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 f13-20020a1cc90d000000b003d08c4cf679so676067wmb.5
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 02:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qOfUPJE+/WqOb3J+ozCG4eX4qkN6yoB56S9HL9xN4f4=;
 b=s/RvpTGlYlqaA6pdzBg2iPpDFio8vMux/s5qHsJRufIHJXnLDdeWzzYABjMTK7kIrm
 vsJV+XkO0Qkk8r1FmPE2fMaBoxy1ki8mb3N7kB45Vt5fGkMyXQ7sxfgmag6IsbOwz4k3
 0puZ7+lW2405KRwCpRUhf0H5drEMPFExLC/ZtfBd2u5Pxjd558/Ih19rS0XrTct24LQO
 YgQJSwEc/BTx+gWMoydMC8Pp/iIWwHhOBE7IiMdkzIAfsZ9pCw1fCiE7IWTAQtckyy3j
 o0ASX3OzJBaT5QQrfiCJsTccaobf5abGlAkR7ycPc9sfZIAPwqUn7HW3e0cnW7BwGKdk
 g/BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qOfUPJE+/WqOb3J+ozCG4eX4qkN6yoB56S9HL9xN4f4=;
 b=NiwSvIwTQAeB1A441U/PUhW5UhckwBagI4KFUw5J4/HDjV1mFrZ7ghpa86cuVaAHQ8
 MGoxC2lxNm/sQ5zdyujeCrn+Agav5j8LuR+PjmfZciWvrCsskz5lUkRmE36O5csK1eTv
 UVz6Q+qahTzmGA5VSlmPRpU4D5JDrx5BVV+xnhDjfqlj9dqf1UrtiWx5iA+sf7bYOyTv
 NAgr2speyvxT32oU4XTDlbq07zJvset3czCezE8qL3f6HpP/gfRKagNbMxp0Dh/C30Pw
 7FuZ8iSK8Y+VFU9gddXIDL4lR+wjn3GuKKLuI9yUaNP/SXWSEQZn8XeDARRwJ0QjcSZa
 4Xmw==
X-Gm-Message-State: ANoB5pnN/v68oSrUC0caaF1QFREvUYNrkUZCa03ms5bfNq9+newMqgQ5
 AZTIFeDy+2aU5lpOZ4LjDJxMJg==
X-Google-Smtp-Source: AA0mqf7iJQjMtAp1a/1LyDjCYeeyspune0wUDS/qwyCvoDmfL1nlLrj18EdSuocGIpfphwfgrQX+5A==
X-Received: by 2002:a05:600c:213:b0:3d0:869a:4e59 with SMTP id
 19-20020a05600c021300b003d0869a4e59mr18229348wmi.169.1670495491611; 
 Thu, 08 Dec 2022 02:31:31 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 f13-20020a7bcd0d000000b003b47ff307e1sm4315894wmj.31.2022.12.08.02.31.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Dec 2022 02:31:31 -0800 (PST)
Message-ID: <ab6b5e11-90ed-a7f3-93d6-904d131dd5dc@linaro.org>
Date: Thu, 8 Dec 2022 11:31:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 0/1] hw/nvme: shadow doorbells broken on riscv64
Content-Language: en-US
To: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org
Cc: Keith Busch <kbusch@kernel.org>, qemu-block@nongnu.org,
 Jinhao Fan <fanjinhao21s@ict.ac.cn>, Guenter Roeck <linux@roeck-us.net>,
 Klaus Jensen <k.jensen@samsung.com>, qemu-riscv@nongnu.org
References: <20221208082955.51732-1-its@irrelevant.dk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221208082955.51732-1-its@irrelevant.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.262,
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

On 8/12/22 09:29, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Guenter reports[1] that hw/nvme is broken on riscv64.
> 
> This is a regression since 7.1, so this does not warrent an rc5 for 7.2.
> I'm sure Guenter can carry this patch in his tree, and maybe we can get
> this out in a stable release.

Delaying to 8.0 and adding a 'Cc: qemu-stable@' tag seems wise.

Cc'ing riscv list in case.

> I really wonder why this issue only shows up on riscv64. We have not
> observed this on other platforms (yet).
> 
>    [1]: https://lore.kernel.org/qemu-devel/20221207174918.GA1151796@roeck-us.net/
> 
> Klaus Jensen (1):
>    hw/nvme: fix missing cq eventidx update
> 
>   hw/nvme/ctrl.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 


