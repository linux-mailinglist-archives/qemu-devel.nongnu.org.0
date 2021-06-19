Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD353ADA72
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 16:38:38 +0200 (CEST)
Received: from localhost ([::1]:37278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luc7J-0005bA-8t
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 10:38:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1luc64-0004Pb-KD
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 10:37:20 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:53050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1luc63-00018Y-6H
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 10:37:20 -0400
Received: by mail-wm1-x32c.google.com with SMTP id n23so7449895wms.2
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 07:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gQvZJb8DARmf9fdEnl6tBn2GOdRTz0AmyMuC7DHa9kk=;
 b=nM4p0D683hP900Z34BF1yldbM5BrLdLDju7or1xiou/DdQn9YSPMohT9Du0Z1iCtXG
 DBXbVSX6lhvbV1YtMku1RnQElp7TvLgDvjHuSndqQB6Y1fCXW4ELpeOcztMWzVMs3DHV
 UQh8hBf2oznYjyIpRc2OYB6xWic7CXNXuuh+AMlPqiUdz9z3MLXD2b6IA6kUu6MZOg+4
 +08B+sdZbb6VkvJLW2+FUQQeJvlJnk46mMEHjBpibfhwjchevnh9QLDESxIaLvpKEk82
 Awqzdga/sNgGB3sBI0MIWdUBbXsD0Ai65MJbFujxKysIK9Wr+rYDDgkTt2aBEo90roD+
 tb7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gQvZJb8DARmf9fdEnl6tBn2GOdRTz0AmyMuC7DHa9kk=;
 b=gi3MzA/cZzSfdjP3qYje+pnglyhSJgkNx1RzVLqV1F6H7OB9UKACgI2GAqwJM/WqUf
 D2ELebgkHlkQl2yBONZAeCIB75VMYmL8tuuJpnXR1VCyPwWb11215JoB2RhWAlOpA8tM
 E+phxNgHnEG64y/0ZNSD6g6uI8HEHFqDJXsV4LKQTsAzjkmK7D1+5Mc2iMPp9xTf1PpI
 BDBcaDKjS29t18rbDxPYybafjzhQ4wtN5ey2VM1NSF6/a3L478pA/S45npf6SbeJfuJg
 IY3uO+cdU1K0flazI7VnaRLfNHUkWDdL8v56bnY7s3J93omHUuJSfIokTxMagqQZWvWd
 fE0g==
X-Gm-Message-State: AOAM530ftkNzepJGF8TiPfpErydcqW65vAeAN+YSzSZYstxy5r4c2EGX
 55qEr/YwE21gS+pu/UkzcF2Q4FPaBBSFMA==
X-Google-Smtp-Source: ABdhPJwdP6Y6EISHS5Fu4rkKVxkeTEHajSjkwgvCvzozKU72xP0Dcgy6NMGaWXvX7IDOHHlRbkEOlA==
X-Received: by 2002:a7b:cb55:: with SMTP id v21mr16157717wmj.19.1624113437654; 
 Sat, 19 Jun 2021 07:37:17 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id n13sm7571399wms.37.2021.06.19.07.37.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Jun 2021 07:37:17 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] tcg: Restart when exhausting the stack frame
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210619134216.590423-1-richard.henderson@linaro.org>
 <20210619134216.590423-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a9ae6eb4-e877-5648-f3a7-ace521639a49@amsat.org>
Date: Sat, 19 Jun 2021 16:37:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210619134216.590423-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.202,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/19/21 3:42 PM, Richard Henderson wrote:
> Assume that we'll have fewer temps allocated after
> restarting with a fewer number of instructions.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tcg.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

