Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1613BE449
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 10:23:38 +0200 (CEST)
Received: from localhost ([::1]:47648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m12qH-0005Yv-BW
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 04:23:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m12oa-0004U2-KL
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 04:21:53 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m12oZ-0004hl-Aj
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 04:21:52 -0400
Received: by mail-wr1-x42a.google.com with SMTP id d12so1411175wre.13
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 01:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GXwHmQEALe3qnW0JN0geCMFmf+PpGaMCXQK8kvRrDvo=;
 b=Le3bc00ya0YdnOXo7FBBl0WhGskeL2oj3SmXVZxfVpIBdtnutqobkU5AiBZMUbo12x
 WU2NWdqE5UyHk6QZmPCwP3KFAOYcMiTn+RsST5wSK/Oj6v80wl9lbRsRsrYQ6+NrMtmR
 5m8JRH1Ypfrkhs9Ja/egTAo+ShKTLixbZsfZHNrzHkj9IGdOe+GVU7r9qb3s3BHl+oUI
 ZiexlseK9DVKhxT8dBFZMKR5mggX9PYUkCXpBWMLIi5UdkcL510TbBBGmGsSV0sf5WQE
 3PhH9sD7UCs+AQ6zCiSMlEa4DUZEuItChHxhpTvvqSYV3iyT0IropBVMitw4b1Fd69UR
 LSwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GXwHmQEALe3qnW0JN0geCMFmf+PpGaMCXQK8kvRrDvo=;
 b=GwDy7BLQL5LfL+ctmB3vx1Y5tsF300LYfu30kz0s5cc+UmUkGKGmJ3Ep1+buF0V4rJ
 FXZPgKe7TenzOQJas5hYDUUVsNBEqZOGZqMdPzZcrbcWa0rTEtT6JMtlAmJO9+g5LYa1
 qUn+N09f4cj8lqCpowx2RpLm04tlkJ5K4d52ybl2VAY6FZk5eiAcDK7Ig9t2qUHkajhW
 JV6u2tUgLc9pt/Qj+9KjckwukdjLgbtq+7mS5J0OqrTQ4R+p4j2ks9VGXP5U1U6cNXmV
 ECIlMy5oXUg9lDYsiC2bFWrNEw5NsVMqhGy2kDmJ426t6g9XtZ1NwiiMO83SFmz8Y7ML
 iuuw==
X-Gm-Message-State: AOAM530bMB9UG2kENd6JumtlSd0lp59sTd7W1P0Y/mw9d/2QdwhTXuM7
 QCUlNi07OBu9Y75uMM8QXiHHWt9TePw=
X-Google-Smtp-Source: ABdhPJxz38oDQi7LvlIBWuBH+kqRPv+Yyt6WMT2gnWqL8Anbmbc3WyBnA5jfLOe0jm/ZDYSC0dklFA==
X-Received: by 2002:adf:ce82:: with SMTP id r2mr2216703wrn.161.1625646110083; 
 Wed, 07 Jul 2021 01:21:50 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id 12sm5846933wme.28.2021.07.07.01.21.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jul 2021 01:21:49 -0700 (PDT)
Subject: Re: [PATCH v2 04/36] linux-user: Tidy loader_exec
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210706234932.356913-1-richard.henderson@linaro.org>
 <20210706234932.356913-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ce75b7ee-3d5b-3046-5f0e-8ccaaf35b2e2@amsat.org>
Date: Wed, 7 Jul 2021 10:21:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706234932.356913-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/7/21 1:49 AM, Richard Henderson wrote:
> Reorg the if cases to reduce indentation.
> Test for 4 bytes in the file before checking the signatures.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/linuxload.c | 42 +++++++++++++++++++++---------------------
>  1 file changed, 21 insertions(+), 21 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

