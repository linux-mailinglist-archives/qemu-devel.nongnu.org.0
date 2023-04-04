Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E64E6D55BF
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 03:12:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjVCg-00080X-9n; Mon, 03 Apr 2023 21:11:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjVCa-000809-1r
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 21:11:12 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjVBO-0000G4-CJ
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 21:11:11 -0400
Received: by mail-pg1-x531.google.com with SMTP id q191so1378245pgq.7
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 18:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680570596;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=D/TULkRTYB1gywjQGgft5T10GALztRdeMH68V/ZkH0w=;
 b=iVC2q0OYFMGLpwPQyXgceniZsvvrp2aT1XnLQp4ONeEhkHlCaV+HmhqwEPTLMlhb8d
 8b0JhHteZpMrwvpBd8y4gvvttjxg55wE/HmGtXWsUa06AUJ9uwQoFJcmIZHiCluD41VN
 70+GNJJhAIrUnr2uCsPA5kb4xthuS1uON9Ye5IIcVYRSOS67Nm2VjbM5VNkiYDoRRzcR
 FVEQJRDnzNrAeSkrS35Fx/XRzzbhgv9sMtMuqWzpGBD6KVK1PfCT3y/4cWq48bNXOWz2
 IlxLkDHrXpkr1XAY0E4rULsltvjJgyE6j5Xx2pACot4Fi3WC258Rc2nc7Chhp598cA+a
 pgEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680570596;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D/TULkRTYB1gywjQGgft5T10GALztRdeMH68V/ZkH0w=;
 b=QzJM+yhWMVro6Xsys/XigxtaC9GaaCSiSYvW6sI3APf2rBwY+AOvDSt8qw8ErY3/ck
 4hgp9MhikDpFTvUSCw09nwvfMv1WzTub42n11Vnhe7tr3Hs7RJ3lPrznUJKGFwsYh/Z6
 2QJyp4CG13pY3/PnvlTrNXz7E9+SDZlYzGAeuoBm6WJylMaSSzbScIaWOBhxXEXTyQpp
 nLaMpgAZswiwaVr7la40orEvhdbhgOP4NJIeIROQ7hT4uGR8P5eBkQYkbXWitzRAMSjj
 nZZayT80HDmLPumwl1ec/rooBByP7PA5DpFMbcAAAhN6nRG3Od+H5PUi/Ur9prj2gN/B
 6BUg==
X-Gm-Message-State: AAQBX9dSDADvJ0J1J/FTcZGw3U/aoLvYwq4GU2wtzoy0wF3mbGcdv/yb
 KcWEXO1hhPDnl/3Ydm9cad9VXw==
X-Google-Smtp-Source: AKy350bdqqybP6UWCgIM9dFJBcCN3+YzEtQIbo6mn3ZB2i3XCfgJ3Ry4T/YcaibW+OnErFeXSfi++A==
X-Received: by 2002:aa7:9718:0:b0:628:650:4835 with SMTP id
 a24-20020aa79718000000b0062806504835mr541214pfg.13.1680570596439; 
 Mon, 03 Apr 2023 18:09:56 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:c7ce:2c40:3ee4:21c4?
 ([2602:ae:1541:f901:c7ce:2c40:3ee4:21c4])
 by smtp.gmail.com with ESMTPSA id
 q22-20020a62ae16000000b006258dd63a3fsm7541507pff.56.2023.04.03.18.09.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 18:09:55 -0700 (PDT)
Message-ID: <52b98564-137e-56f7-7db0-12c17f6acb7f@linaro.org>
Date: Mon, 3 Apr 2023 18:09:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH v2 39/44] target/loongarch: Implement vinsgr2vr
 vpickve2gr vreplgr2vr
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-40-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230328030631.3117129-40-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.349,
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
> - VINSGR2VR.{B/H/W/D};
> - VPICKVE2GR.{B/H/W/D}[U];
> - VREPLGR2VR.{B/H/W/D}.
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   target/loongarch/disas.c                    |  33 ++++++
>   target/loongarch/insn_trans/trans_lsx.c.inc | 110 ++++++++++++++++++++
>   target/loongarch/insns.decode               |  30 ++++++
>   3 files changed, 173 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

