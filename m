Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9967655ADF
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 18:49:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p98dB-0008A0-CH; Sat, 24 Dec 2022 12:48:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p98d4-00089o-J9
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 12:48:15 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p98d3-0001KA-0X
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 12:48:14 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 k88-20020a17090a4ce100b00219d0b857bcso7570805pjh.1
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 09:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+rSwuPF2RcGXyPwB6zpp11kWMcvlHZ8j7Z+PiDIp5QU=;
 b=plMC079rpsmAwczt47vRuRXhqtZ8leMnEaESdSJdwbJWr6uJm8yuxtnOaeHzyYzIeh
 Du0E+zLxBYKehnsHhtmUiPa6JNsAeLeYj1j1Q+ChFu7iwrNuJH8aUAYuJv3F57/6s0F+
 4AxWRI5QV2pDud8aU/vHkD0BWaQmtfT+ofi33GsUz+TMzhSFTW7xUyV11yqEXPVH8iNe
 IHXJ6QPXq6qMq5ab8zbAU8fluVoPP1SvuPHeupFxlmWS0BuQnd07h12m47YnpgNEjRXf
 lCogvKWWv6bEhktgBI2KhWiG3sUXmToTxk7zBrPyFWyJDjKVqa9Q9YDSJtw/5YB3Lcxy
 4bcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+rSwuPF2RcGXyPwB6zpp11kWMcvlHZ8j7Z+PiDIp5QU=;
 b=3AglxARKV7nryNtaN2CLMoAlOhADMv5SroJMBqTlHRYYE6SLZ5v5qwT6YSesZN2X4Y
 qOzpXy68wxAL5jsN/wQ/MhlY7gcIpJJVc6DzLHLx/fN2cL71g08DjTLGNEUKI/MQiGXS
 /zd4Mh4IMXuU/Hid9w/6fad/djJuYfgOFhmHuSkGGdXqPlkaE2bySsHzUckvphoA3fsV
 /rXZpdPcbXmvo3mvBil29zuRo/tlyo0h2zYMTSFPKXncgdb0Y/Zy0obc8b93iHu6HD+w
 ozb3ntVR2Htp/WlhWeaKLA+iQS719gw3cXzYiSqNwdVdoJEg5UdBgG/EQP7STEOyC51D
 IbCg==
X-Gm-Message-State: AFqh2kryZIlDUop5EprTK+2Y4CWwCpJ51HercTXyfa03VP2Mnqucn1J4
 lpc7poh5jTy7y3F8w3IFOVRLeg==
X-Google-Smtp-Source: AMrXdXthf2NC3t58bSZHMsvPvvzUqWA8CJSiN5S1trDumYlBPzpcIquQm2n20RG9+eLcO9482IV7Qw==
X-Received: by 2002:a17:902:a382:b0:189:b0e7:c5f0 with SMTP id
 x2-20020a170902a38200b00189b0e7c5f0mr29570663pla.14.1671904091232; 
 Sat, 24 Dec 2022 09:48:11 -0800 (PST)
Received: from [172.16.2.110] (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 q18-20020a170902c9d200b0018930dbc560sm4336986pld.96.2022.12.24.09.48.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Dec 2022 09:48:10 -0800 (PST)
Message-ID: <268ef762-fce5-ca47-d5f7-bd60955a3a0f@linaro.org>
Date: Sat, 24 Dec 2022 09:48:08 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 10/43] target/loongarch: Implement vaddw/vsubw
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20221224081633.4185445-1-gaosong@loongson.cn>
 <20221224081633.4185445-11-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221224081633.4185445-11-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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

On 12/24/22 00:16, Song Gao wrote:
> +TRANS(vaddwev_h_b, gen_vvv, gen_helper_vaddwev_h_b)
> +TRANS(vaddwev_w_h, gen_vvv, gen_helper_vaddwev_w_h)
> +TRANS(vaddwev_d_w, gen_vvv, gen_helper_vaddwev_d_w)
> +TRANS(vaddwev_q_d, gen_vvv, gen_helper_vaddwev_q_d)
> +TRANS(vaddwod_h_b, gen_vvv, gen_helper_vaddwod_h_b)
> +TRANS(vaddwod_w_h, gen_vvv, gen_helper_vaddwod_w_h)
> +TRANS(vaddwod_d_w, gen_vvv, gen_helper_vaddwod_d_w)
> +TRANS(vaddwod_q_d, gen_vvv, gen_helper_vaddwod_q_d)
> +TRANS(vsubwev_h_b, gen_vvv, gen_helper_vsubwev_h_b)
> +TRANS(vsubwev_w_h, gen_vvv, gen_helper_vsubwev_w_h)
> +TRANS(vsubwev_d_w, gen_vvv, gen_helper_vsubwev_d_w)
> +TRANS(vsubwev_q_d, gen_vvv, gen_helper_vsubwev_q_d)
> +TRANS(vsubwod_h_b, gen_vvv, gen_helper_vsubwod_h_b)
> +TRANS(vsubwod_w_h, gen_vvv, gen_helper_vsubwod_w_h)
> +TRANS(vsubwod_d_w, gen_vvv, gen_helper_vsubwod_d_w)
> +TRANS(vsubwod_q_d, gen_vvv, gen_helper_vsubwod_q_d)

These can be implemented with a combination of vector shift + vector add.

> +TRANS(vaddwev_h_bu, gen_vvv, gen_helper_vaddwev_h_bu)
> +TRANS(vaddwev_w_hu, gen_vvv, gen_helper_vaddwev_w_hu)
> +TRANS(vaddwev_d_wu, gen_vvv, gen_helper_vaddwev_d_wu)
> +TRANS(vaddwev_q_du, gen_vvv, gen_helper_vaddwev_q_du)
> +TRANS(vaddwod_h_bu, gen_vvv, gen_helper_vaddwod_h_bu)
> +TRANS(vaddwod_w_hu, gen_vvv, gen_helper_vaddwod_w_hu)
> +TRANS(vaddwod_d_wu, gen_vvv, gen_helper_vaddwod_d_wu)
> +TRANS(vaddwod_q_du, gen_vvv, gen_helper_vaddwod_q_du)
> +TRANS(vsubwev_h_bu, gen_vvv, gen_helper_vsubwev_h_bu)
> +TRANS(vsubwev_w_hu, gen_vvv, gen_helper_vsubwev_w_hu)
> +TRANS(vsubwev_d_wu, gen_vvv, gen_helper_vsubwev_d_wu)
> +TRANS(vsubwev_q_du, gen_vvv, gen_helper_vsubwev_q_du)
> +TRANS(vsubwod_h_bu, gen_vvv, gen_helper_vsubwod_h_bu)
> +TRANS(vsubwod_w_hu, gen_vvv, gen_helper_vsubwod_w_hu)
> +TRANS(vsubwod_d_wu, gen_vvv, gen_helper_vsubwod_d_wu)
> +TRANS(vsubwod_q_du, gen_vvv, gen_helper_vsubwod_q_du)

These can be implemented with a combination of vector and + vector add.

> +TRANS(vaddwev_h_bu_b, gen_vvv, gen_helper_vaddwev_h_bu_b)
> +TRANS(vaddwev_w_hu_h, gen_vvv, gen_helper_vaddwev_w_hu_h)
> +TRANS(vaddwev_d_wu_w, gen_vvv, gen_helper_vaddwev_d_wu_w)
> +TRANS(vaddwev_q_du_d, gen_vvv, gen_helper_vaddwev_q_du_d)
> +TRANS(vaddwod_h_bu_b, gen_vvv, gen_helper_vaddwod_h_bu_b)
> +TRANS(vaddwod_w_hu_h, gen_vvv, gen_helper_vaddwod_w_hu_h)
> +TRANS(vaddwod_d_wu_w, gen_vvv, gen_helper_vaddwod_d_wu_w)
> +TRANS(vaddwod_q_du_d, gen_vvv, gen_helper_vaddwod_q_du_d)

Likewise.

For an example of how to bundle vector operations, see e.g. gen_gvec_rax1 and subroutines 
in target/arm/translate-a64.c.  There are many others, but ask if you need more help.


r~

