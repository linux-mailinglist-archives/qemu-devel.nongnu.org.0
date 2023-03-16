Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CD16BD4B3
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 17:08:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcq8M-0001zF-8p; Thu, 16 Mar 2023 12:07:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcq8I-0001yw-WB
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 12:07:15 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcq8H-0000yy-77
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 12:07:14 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 c8-20020a05600c0ac800b003ed2f97a63eso3504017wmr.3
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 09:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678982831;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6Q2+l+0N+IZN/SHLxOylATejDmtpy+1r6rkUg0rqyl8=;
 b=fy4m95jBCLVWB819HkCazd2WOjzZYdK5nR9of/oeQDsqfIGDUXiaTCzxoUmiwUf7CF
 mZOdsDTHiZ07dMko2j+8PL1xbJe64wjab/iFOC31MvkO5uRJVekAeqsvAomnYHEZcwJp
 F6/LA8LpfAVvjN2TAVoKx/MwxC5GTDP9AYecXgOyv/m0C8AEOmTsZnMHupjv0QnxgzMf
 71FKC5VDuXvp2TVTEaihTcT+kxX0y+P1gF2rYbY+9xs++RNdpSEDjbCSCpTc5zp5Z9Qt
 xNPm7xiQYeqSdyRupOSePyLB+7stdidTnBLf7WrkmsL2VuoqXCQ6StlNmI78AIt1xmAf
 844w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678982831;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6Q2+l+0N+IZN/SHLxOylATejDmtpy+1r6rkUg0rqyl8=;
 b=J0xMbaHzNtUkCCA2+XURCBQidi64AuyCdVGHZcgHgIandSQILaGou2o90RwAKnx52T
 lQQjsOMABOV95PJy1agTHJEMaOAYvjYaIm2PMVgMtq7F/gyuRgjMLzzrqJ3MzVsDJVx+
 X4EW1A2bJBXdqdlBXit66K6AIb3yxDwrpEbzPQOerrSK23KWPFITKkLdQZzPtAM2Oxe2
 U3WbF34RpwxcBvy6LjGGPri8EGh5Fb/q8LahoQEvSnt2AyOraRCgLOtaOx9FImPBeTiZ
 hUv2kO/hySqGGkEChClPPf2SPnu0xAxxKcV/Sz1T4uK/xdq/jsvcrD4ACXRWY/uvAgYb
 cAcA==
X-Gm-Message-State: AO0yUKUQmFjr6uYDwqTZWpfH10uFqq6a/Me9oD9qZslcbxsxiCY9tMjV
 vaRAlzVoxEybme2XmJgADCLdTQ==
X-Google-Smtp-Source: AK7set8rvYHTHO0LVvnjne+xkr+AJBgok3974IwQdQ0w0vdHV2yIrSFgDVNAeZuwKh+w6Mxo4Y4EfQ==
X-Received: by 2002:a05:600c:190c:b0:3eb:38e6:f65d with SMTP id
 j12-20020a05600c190c00b003eb38e6f65dmr21917871wmq.11.1678982831355; 
 Thu, 16 Mar 2023 09:07:11 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 bi7-20020a05600c3d8700b003e89e3284fasm5312930wmb.36.2023.03.16.09.07.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Mar 2023 09:07:10 -0700 (PDT)
Message-ID: <5b224a32-cad8-28e9-3314-b57282771819@linaro.org>
Date: Thu, 16 Mar 2023 17:07:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH for 8.0 v2] igb: Save the entire Tx context descriptor
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, quintela@redhat.com
References: <20230316155707.27007-1-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230316155707.27007-1-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 16/3/23 16:57, Akihiko Odaki wrote:
> The current implementation of igb uses only part of a advanced Tx
> context descriptor because it misses some features and sniffs the trait
> of the packet instead of respecting the packet type specified in the
> descriptor. However, we will certainly need the entire Tx context
> descriptor when we update igb to respect these ignored fields. Save the
> entire Tx context descriptor to prepare for such a change.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
> V1 -> V2: Bump igb-tx version
> 
>   hw/net/igb.c      | 10 ++++++----
>   hw/net/igb_core.c | 17 ++++++++++-------
>   hw/net/igb_core.h |  3 +--
>   3 files changed, 17 insertions(+), 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


