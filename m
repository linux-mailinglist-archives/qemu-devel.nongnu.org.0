Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B82EC6F35E6
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 20:39:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptYQ0-0000aK-La; Mon, 01 May 2023 14:38:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptYPv-0000Zi-Gh
 for qemu-devel@nongnu.org; Mon, 01 May 2023 14:38:31 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptYPt-0000WD-Ee
 for qemu-devel@nongnu.org; Mon, 01 May 2023 14:38:30 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-2f40b891420so2681163f8f.0
 for <qemu-devel@nongnu.org>; Mon, 01 May 2023 11:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682966307; x=1685558307;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FbTdzPwla7XOIikXl547MkBZjcN1EgaV854lLRq6Emg=;
 b=ln/FOru5guLgE3YGPCFioWnYV8xmcMTFYWwGcUrTf5dX1J5S+HTBJTO5on87/9aHwM
 mFNr/aKZ/fmoMiEPnXT9UmEEkXxS4+voa1uV4xV/GxAuIjA18kuhC1Ld9W88dDTRIthR
 faCVB7+R8tXb6rm00YXSKL+GOOMpJ/zC8i2qO0aHs0WHvqSw4WNt2BDSVVKDrNZdXC2Y
 BMtLD/SGhc1RcFko2zDqbpd/zKOnSkbkiguEF9dH5vXIg68iV36qqMw7iZLoJIhlO2IL
 oGnpTqUEMwJLYRJ9cFZczX0BhPPLJ1jZlgv+bkGaJBJxAxCdlIKS8gg1amWxPMmKhzcR
 sCQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682966307; x=1685558307;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FbTdzPwla7XOIikXl547MkBZjcN1EgaV854lLRq6Emg=;
 b=Io8QM+Rp03fIlgT5JiHvOvwU1PZRyLG9vWGIgqG/ktyv9ZOZ2eWZdGLdlG7VN7rfOP
 eiKXT3d8w+gutPBxpUspn1tIjyXQAVL2F0eYrDfW3DoG/GYUvS4uYp3fjML+6L+lcIUG
 FBvH+x25ZxNgsf/EugLbCpgc4R+EBZebBLu7/4MpBfupUB36/dstZDfgHOthVXuHj7xN
 /ZARJ0uXGL4pbjPE2hmfNF00rsTl00Mtd6LgqVSCf0wZ4lZbVNHPz7Iczu8vSrNfBi+p
 l0fSsvJcl2R3hLfR8HgkDgYOckzrgKMy/s4sXdQr2jrE7HboPDQDv9pD7tWmSZlaslvE
 cYMg==
X-Gm-Message-State: AC+VfDzP0qoR0TsEVE3s/7sLdBLuv20LQEzD1eU0+f/8Q3W45gQDAYE7
 powDQENBoQINN+EB/BVJqpuF65mJbQYvqy95f4reUg==
X-Google-Smtp-Source: ACHHUZ72Xa1ZTU+yM6/MEp1kEzwr3n7GvBb9bF8YjU1begPXgU2SL/ZwAPH7xuWJDAclc7WiBpD/PA==
X-Received: by 2002:a5d:4563:0:b0:2ef:eb54:4dc0 with SMTP id
 a3-20020a5d4563000000b002efeb544dc0mr9540332wrc.51.1682966307410; 
 Mon, 01 May 2023 11:38:27 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:eca5:8bcb:58d9:c940?
 ([2a02:c7c:74db:8d00:eca5:8bcb:58d9:c940])
 by smtp.gmail.com with ESMTPSA id
 u12-20020adfdd4c000000b0030635735a57sm259668wrm.60.2023.05.01.11.38.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 May 2023 11:38:27 -0700 (PDT)
Message-ID: <caabb423-f8d6-f16c-062c-0901343ae152@linaro.org>
Date: Mon, 1 May 2023 19:38:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH v4 34/44] target/loongarch: Implement LSX fpu fcvt
 instructions
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230425070248.2550028-1-gaosong@loongson.cn>
 <20230425070248.2550028-35-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230425070248.2550028-35-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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

On 4/25/23 08:02, Song Gao wrote:
> This patch includes:
> - VFCVT{L/H}.{S.H/D.S};
> - VFCVT.{H.S/S.D};
> - VFRINT[{RNE/RZ/RP/RM}].{S/D};
> - VFTINT[{RNE/RZ/RP/RM}].{W.S/L.D};
> - VFTINT[RZ].{WU.S/LU.D};
> - VFTINT[{RNE/RZ/RP/RM}].W.D;
> - VFTINT[{RNE/RZ/RP/RM}]{L/H}.L.S;
> - VFFINT.{S.W/D.L}[U];
> - VFFINT.S.L, VFFINT{L/H}.D.W.
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   target/loongarch/disas.c                    |  56 +++
>   target/loongarch/helper.h                   |  56 +++
>   target/loongarch/insn_trans/trans_lsx.c.inc |  56 +++
>   target/loongarch/insns.decode               |  56 +++
>   target/loongarch/lsx_helper.c               | 376 ++++++++++++++++++++
>   5 files changed, 600 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

