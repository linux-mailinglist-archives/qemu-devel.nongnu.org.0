Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D586358CC0
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 20:36:08 +0200 (CEST)
Received: from localhost ([::1]:49256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUZVe-0008V2-SA
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 14:36:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUZTF-00074N-SU
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 14:33:37 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:33301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUZTA-0001pI-H1
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 14:33:37 -0400
Received: by mail-pg1-x531.google.com with SMTP id t22so2042543pgu.0
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 11:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WgwC6+hFz+TB3NYM6gJhEjKyEs4qCMPETynqq+oMI90=;
 b=EmSSTWyRhagPmB4HheTS5kAyfM6XI24okBFT+svJ8KELdW+JEjHHc9xryV4VQukJhV
 4YwCppmm/KLoG2CVBwz2FTlwv5//Sai+H4Cdj5ItdY3ibLPTKiW0TOxLc0DoHn3+ajdZ
 8VMj6JFTpHhjdnG195ZEHjBksIwND8XGMfH18RV73RwqjPCwovhYP6Q9kOjPTZZpED63
 MnQfqQXrksG56RW5m81nfefRhQjPz7Kf+k5TD+DHEv6V7jhkofgolzmVtpI9TCXuLXtp
 WLXcIbXIuFgxlfECAixzQfMTaDPIpjZ+sb1Leue5VdCS0btraxvp5B8iThtxWIGHs6of
 FA6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WgwC6+hFz+TB3NYM6gJhEjKyEs4qCMPETynqq+oMI90=;
 b=WyhA/5CeVq4FkRMPAMD2RucJNutq/9CO8GoU2UszbOW8ZamJsDuJVRPR9ce7xL7FEk
 id32zn/Uej+WQeW/TcwxVg0A4gqxP6FdLmDpeHy0Pixs2iHBti05Ff0DAAc0NS6NIjV8
 B7DZBSq4zCj4+g6cWFapGQ8g39SkriXfwGDxiW5VDBSJkANe0O8FdPZdg8lRM2TPHP2q
 GkEyusgL9/iQoiESbq1rVMr4hJ8+QNYW/o+R+oTo2R4WeeC0Ef2R2yJPSJumTkv3xfLB
 SRzSDhmXdd7tmkU/q//Yos9p6prl5xbeHgwwse4jjOn1C2CBF6X7wbNo1CNGdHrnXvmA
 pbXQ==
X-Gm-Message-State: AOAM532ybniZLgXBGcOLZ4wJsOvGtdUvfxmiamucjEn1wIKDLFvFs93u
 eHpkkTPAHV6EcThsmNgZYzFiig==
X-Google-Smtp-Source: ABdhPJwtjUcHE1s2tBeINH5eFatV/aZtDToNEE6YmWCtXBNlgo37UTQgvDcOWFIUDYX1i7OxS3DGTw==
X-Received: by 2002:a63:eb50:: with SMTP id b16mr9127532pgk.270.1617906810785; 
 Thu, 08 Apr 2021 11:33:30 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id w134sm168281pfd.173.2021.04.08.11.33.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Apr 2021 11:33:30 -0700 (PDT)
Subject: Re: [PATCH] vmstate: Constify some VMStateDescriptions
To: Keqian Zhu <zhukeqian1@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-trivial@nongnu.org
References: <20210408140706.23412-1-zhukeqian1@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <65ecfe1d-4a88-e432-7689-390c76e64d45@linaro.org>
Date: Thu, 8 Apr 2021 11:33:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210408140706.23412-1-zhukeqian1@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/8/21 7:07 AM, Keqian Zhu wrote:
> Constify vmstate_ecc_state and vmstate_x86_cpu.
> 
> Signed-off-by: Keqian Zhu<zhukeqian1@huawei.com>
> ---
>   hw/block/ecc.c           | 2 +-
>   include/hw/block/flash.h | 2 +-
>   target/i386/cpu.h        | 2 +-
>   target/i386/machine.c    | 2 +-
>   4 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

