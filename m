Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C087435586
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 23:49:28 +0200 (CEST)
Received: from localhost ([::1]:53154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdJSh-0000M4-LK
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 17:49:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdJR3-0007zk-JE
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 17:47:46 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:33456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdJR0-00080W-VH
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 17:47:45 -0400
Received: by mail-pl1-x62f.google.com with SMTP id y4so17118489plb.0
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 14:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fQ41YMjLjjAgkT4whZZHIg0VWXaZjCRxOnXpBqEXV9g=;
 b=s0sek1Ea7hw4kb+HCkQxvD17pr1Lc4JmEIB/9S3dwhMxEQz5MMroXTyfsTEGX4tCWL
 g4YUZXRILLAUdAzEXJHHx1QDpkru/7HpxL7U2XITLK/HoiafyZGTI0P7LEUrxwVkI6M/
 /xHDYpGIFS0h23586iKfFAtb2gAIs5SEa7OaxxmZVzZKYO3wc1hTGia/UFp3UYzpB+6R
 lDmOjCWEPbAhsTzzkl0C6y/P3sUYUbiitJw0JbVS6zipamJ0xnCVnoDQgm8xz6tvnOJk
 06dWrLdl5fmukGxInT87wDemGb2/iMRA1D9U7r7Hgt+NdZbgYOh/udJKXiLOgS913DJX
 txFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fQ41YMjLjjAgkT4whZZHIg0VWXaZjCRxOnXpBqEXV9g=;
 b=3nNIs1p9yGpkjGWQRJ/jqeHF41rCYoLIkTzKAoOQrQfLr5TcYmy9zgtCUf/fE6Yuki
 TdCkoGnatZnwD0iR2NjD9UJbCAEQugpLKnqVV3du7wGJnLStgV011QP8Yg6r3Wsh4zjS
 n/VGPKiN8QVdLMDYwAQgGtGI0XMdVIsWgNf1o3FxHe845ChGjpEIASvzR4yp6ZaaBZY6
 CvCc3vNVtMobk9GfFqKoTuAsjhNycPV84Uq1v1nEiUP/hFrxW2Dew3NOwLnEY76HanS0
 Ewg8UiJH3deoH98740JLhW5hCN87iHYlr6BKWsTnMD2axSZB2jgut4DZpRS956kSmxbU
 ztLQ==
X-Gm-Message-State: AOAM533TYV5Rp4xFqt9AFfLId5uwO4fpWq9/ciB3dM4pv1fUBViHGmaM
 5cLKvEqpE9raXziVKKzLtuA+fw==
X-Google-Smtp-Source: ABdhPJxe93jqP5pHu5OrPxKsx83pHCazKGu/UWDKYxm5HizbHBNmYEGQMzxTSPrZmVqvaLfbxsiHZg==
X-Received: by 2002:a17:902:d202:b0:13a:709b:dfb0 with SMTP id
 t2-20020a170902d20200b0013a709bdfb0mr1514807ply.34.1634766461297; 
 Wed, 20 Oct 2021 14:47:41 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t22sm3962323pfg.148.2021.10.20.14.47.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 14:47:39 -0700 (PDT)
Subject: Re: [PATCH v3 17/21] target/riscv: helper functions to wrap calls to
 128-bit csr insns
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20211019094812.614056-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211019094812.614056-18-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3def0c73-e419-b2a5-7a38-b9782f502d2f@linaro.org>
Date: Wed, 20 Oct 2021 14:47:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019094812.614056-18-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.267,
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
Cc: philmd@redhat.com, bin.meng@windriver.com, alistair.francis@wdc.com,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/19/21 2:48 AM, Frédéric Pétrot wrote:
> Given the side effects they have, the csr instructions are realized as
> helpers. We extend this existing infrastructure for 128-bit sized csr.
> We have a slight issue with returning 128-bit values: we use the globals
> we added to support div/rem insns to that end.
> Theses helpers all call a unique function that is currently a stub.
> The trans_csrxx functions supporting 128-bit are yet to be implemented.
> 
> Signed-off-by: Frédéric Pétrot<frederic.petrot@univ-grenoble-alpes.fr>
> Co-authored-by: Fabien Portas<fabien.portas@grenoble-inp.org>
> ---
>   target/riscv/cpu.h       |  4 ++++
>   target/riscv/helper.h    |  3 +++
>   target/riscv/csr.c       |  7 +++++++
>   target/riscv/op_helper.c | 44 ++++++++++++++++++++++++++++++++++++++++
>   4 files changed, 58 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

