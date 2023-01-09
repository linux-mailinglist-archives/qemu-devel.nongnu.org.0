Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1BA662AD8
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 17:08:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEugT-0001fo-HP; Mon, 09 Jan 2023 11:07:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEugQ-0001ev-QC
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 11:07:34 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEugP-0008Qw-9z
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 11:07:34 -0500
Received: by mail-pf1-x434.google.com with SMTP id s3so3959766pfd.12
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 08:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EuagkxqdICRbC/KkI17Zz5DvIDXxkxYxKfwjKj7pM4s=;
 b=zpYZBQjD7P4yAEX9d6ZyBAuIE1/BsFCp4p5+9nzRRaZBaX6NMaLQWNy/1DErf2Lyb7
 zOmTz+BszAjnICQ5pL/xz6lTd6xI414TkYrbtffTs1dc2npZBuu0mYb1bkQ2vM44cWOI
 HFwhNCJgnZnD428Zqj2pO5OgMUFOA4XSbjZ2X2KU6NunJltYLcbhgbrAJ0WdubEBF3++
 tnsBLU1YizgafCGVvPGr55ViZmiHhs4K6l2MP8lusB+VWgBolOlMt7iQ6A0KUqwi4TlY
 RAOer8CBxB3dJ3K7hG+XN1UncJdyVHICiIVK7w51vgFSQFMFVRtLGWvF5LTaVLZp01Wl
 acFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EuagkxqdICRbC/KkI17Zz5DvIDXxkxYxKfwjKj7pM4s=;
 b=cLS+LGPCbd7GfRSBwJiVpzDsQZ3Z/9GowAs6T2QAlxSBZly8Zb1ozgqK/1GBPby3GB
 DPRLGjlD/m0jTiL9/PJd/7Z8RLmKh8HjNTng9CcNSlSIerrmnBrv36SVHdLgQI6XzX7v
 YUWNfzPszBgSmTY6FxKgcwYhQfU6yCgn05QQ84N5Vt4g50HVoO4Qt4kgRwjQz8vpZT9Z
 dikP0oghwhTmFxW5aoBTnqyILQX/RqrnPXKju12D/Kx7Jrbz7WVI3SOLohH97JbhGONo
 PPJYCaLpPM5SH23rrm4bqGP8EUC4ObWUehorWGqa6IePVLOHMktIMkl7To2Tf7OFTdP2
 rb+g==
X-Gm-Message-State: AFqh2kp/1EgJTszkMxXAPlo8QEU0u230c8xLGm7kLNBTkfZ383RUGwQT
 BmDOYdNtaqrw0iPvVsfy76p9sg==
X-Google-Smtp-Source: AMrXdXt8pvoE2vtRD/TCG0Ll9FYlEqhcNB3AsoIjKZlYbiTCkhzJl5A5ZbylKgPtXak1y0Az+k0dXA==
X-Received: by 2002:aa7:9436:0:b0:589:78:80cd with SMTP id
 y22-20020aa79436000000b00589007880cdmr3081575pfo.8.1673280451819; 
 Mon, 09 Jan 2023 08:07:31 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:a909:891c:953d:a6b0?
 ([2602:47:d48c:8101:a909:891c:953d:a6b0])
 by smtp.gmail.com with ESMTPSA id
 u197-20020a6279ce000000b005855d204fd8sm5891291pfc.93.2023.01.09.08.07.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 08:07:31 -0800 (PST)
Message-ID: <55413dee-6141-2f36-ed8f-964df43aa578@linaro.org>
Date: Mon, 9 Jan 2023 08:07:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 4/5] hw/i2c/bitbang_i2c: Trace state changes
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
 qemu-arm@nongnu.org, qemu-trivial@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>
References: <20230109084121.72138-1-philmd@linaro.org>
 <20230109084121.72138-5-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230109084121.72138-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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

On 1/9/23 00:41, Philippe Mathieu-Daudé wrote:
> +    NAME(WAITING_FOR_ACK),
> +    [RECEIVING_BIT7] = "RECEIVING_BIT7 (ACK)",
> +    NAME(RECEIVING_BIT7),

You've overwritten your special case.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

