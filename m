Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0B36D2E68
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Apr 2023 07:39:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piTwK-0008Hv-91; Sat, 01 Apr 2023 01:38:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piTwH-0008Hk-SH
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 01:38:10 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piTwG-0003Yc-3u
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 01:38:09 -0400
Received: by mail-pl1-x635.google.com with SMTP id kc4so23374174plb.10
 for <qemu-devel@nongnu.org>; Fri, 31 Mar 2023 22:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680327486;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=riMpAVR8IPUTrQeOGWyV7J5O3D+ebpf823lKzAxRRZU=;
 b=O9ts332Cd9xtz78mdt8se3bzcr6liX3kogNBorijBIfo2aeTHbAvQncMrJ242HxrPe
 pEWxQ4jDm6ikCg9XB1Zwrwt2l44kxgSEkJwOY8mJs7pkd3v1/RCLYH6cK7JIsiQ/tOeM
 DVRLPPCGMPsiDQLXC/BPEQOo+yQAC5f1lRUu0fB9wF1KQ4EVIsXkj5gZpQfQOAwST4w4
 5NiNcCWKQ/c/qxscNR5D0Cee08ZsboNf9BGF3p6sfkvK4U7Ahjx8Rnh5CBWPnxzPvus0
 YLYAXT03WAUqURd+J/VC9FapTWGF1pzVEk3itO4v0eyPJ976UExe732tLjMCL4D0tT8q
 qq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680327486;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=riMpAVR8IPUTrQeOGWyV7J5O3D+ebpf823lKzAxRRZU=;
 b=eIIf51pXQAS+73q3Vq6iT4Pc3az0nmGkPD1c/YLuxlAHBNsrpluX7+ov5M6y1BkCsk
 Nt4BjgzIKVI+k+bUTPzrRm6m0Nzbr47yV4ng4rClm3CzRMyPqiSPMWVY+q0NsNW535Tc
 ss5MAkhHWkY0ELE56gedXKfSbSJOUe5cM4T3pwou0K0Ykr/pTWJmsP5SrH59EWPz7+zH
 MtQbq7l2O68MKqVLn3kvdGM95sW6QiwpPnIggDG6mxyIWkcqUH5mUHH1vd4O2actxv2a
 Qscgy5+XACer5gwUbv+RXKoxVL/Vpc50kSp+9SD9tpFltTtw5cppMXXE3I1Tp/VotQwh
 8bSA==
X-Gm-Message-State: AO0yUKXaHqne7KTjBoiZkKxrv6oPp+0yRlU9wYBmAuFzdTClxZj5j0P4
 bFlgzFTYXzPn+ZpoRYSReAHk3A==
X-Google-Smtp-Source: AK7set/IYeiTzTxiIW2pJS/uwSqthKIxluefrp3NCv4F0Iv9L7Q9jo0DXx0Idb4i6ExdT6mh5u51NQ==
X-Received: by 2002:a05:6a20:4ca6:b0:d7:87ce:671e with SMTP id
 fq38-20020a056a204ca600b000d787ce671emr25267063pzb.52.1680327486365; 
 Fri, 31 Mar 2023 22:38:06 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:b714:1fce:85fa:2fc7?
 ([2602:ae:1541:f901:b714:1fce:85fa:2fc7])
 by smtp.gmail.com with ESMTPSA id
 i22-20020aa78b56000000b005e4c3e2022fsm2714384pfd.72.2023.03.31.22.38.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 22:38:06 -0700 (PDT)
Message-ID: <af4ce3b4-b8dd-0bc8-bff9-ff33bd9c70de@linaro.org>
Date: Fri, 31 Mar 2023 22:38:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH v2 23/44] target/loongarch: Implement vsll vsrl vsra
 vrotr
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-24-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230328030631.3117129-24-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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

On 3/27/23 20:06, Song Gao wrote:
> This patch includes:
> - VSLL[I].{B/H/W/D};
> - VSRL[I].{B/H/W/D};
> - VSRA[I].{B/H/W/D};
> - VROTR[I].{B/H/W/D}.
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   target/loongarch/disas.c                    | 36 +++++++++++++++++++++
>   target/loongarch/insn_trans/trans_lsx.c.inc | 36 +++++++++++++++++++++
>   target/loongarch/insns.decode               | 36 +++++++++++++++++++++
>   3 files changed, 108 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

