Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B792ECBA4
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 09:12:17 +0100 (CET)
Received: from localhost ([::1]:45472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxQP2-0000Fg-VR
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 03:12:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxQOJ-0008IA-Ot
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 03:11:31 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:33374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxQOI-0002MK-Bb
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 03:11:31 -0500
Received: by mail-wm1-x334.google.com with SMTP id n16so4429777wmc.0
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 00:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hDGBMJo9aVdh+UbJagth4T/znofRW6/B05geGc2WU74=;
 b=b9xipJx/glLRT13Qav6xU2i58blNy2BIcDIPJT4SFKheUCHi+0DOr2K54if/T7OydJ
 f8PeeZ3oUIbwYCV/6GWM3a38l46lB7Jl451np/huSRTjot53C8W0g9zM0h8Y+3MGsdXD
 E8LALhwg/QZFrNCx/ltZJcet0WnNgtigqllbiH8cY1V9J3/4L8UvUVHBoZgzPLS/5YnV
 R7w9EDZL3Qvu/5bwJfEyXVwph13J/jWnIJ6ZK8oIcX2bm3ot+KNN9iXImRnEKfzxYIje
 nBLYrHlKg7robEBwXLDBDLP2KaTjLl0U6Onpeoe2GUoH8GTwSQkXZSxZd7LM6M4vSkNK
 yvPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hDGBMJo9aVdh+UbJagth4T/znofRW6/B05geGc2WU74=;
 b=rRRrQtX5V/SXGCai9H9i6ybTmMRh2jtnMy9YqoQKA/OqtkD55Xzq191YtTIwSlQx5E
 ka/tUyzIwO2YT9JDLEw7+GJTAl2XCKt0qiXbfLJVs9hLxdhAUMVFSodwrpo4cUbCcRQt
 ZD9B3fHFzKzIcdeZr5ad9kakPLHMwWSoqUGoQNAXq+ncb8wNcCOwTxHvyv2+y/og6A9N
 tfFFaVeMEnVJzhDYbYLPvySqAJIZy+NCj6R/gxpJCkdZAwioyFo9jFN0wo+srpbPWjWK
 UuCcOZXvtSUlYeD8X2X9+NZdJGnkYv0ek/JBhOqBknX0+ql2Q9BsZLk+3XKmVMkTKGah
 eCNg==
X-Gm-Message-State: AOAM530jjvmBFFcKxf6IfmzH0Nn/2pZ9oTHEu8HEeYQtOY0P/OIoIyfj
 LYxpUyatNUpSg2hjPcGITWI=
X-Google-Smtp-Source: ABdhPJzSkEgmQ8DVUlDlMDHfPkdoCspCmdVKSZb2hnKeJjMoYuwjHasmbLydS77zrr+T540pQjQq/w==
X-Received: by 2002:a1c:2586:: with SMTP id l128mr6952015wml.78.1610007088955; 
 Thu, 07 Jan 2021 00:11:28 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id n11sm7550607wra.9.2021.01.07.00.11.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 00:11:28 -0800 (PST)
Subject: Re: [PATCH 06/12] vt82c686: Simplify vt82c686b_realize()
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1609967638.git.balaton@eik.bme.hu>
 <a8d1368df3627d3eed4a1702a066054cde213cfc.1609967638.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f4cc48eb-2760-f80f-2a22-05c7ba82baa7@amsat.org>
Date: Thu, 7 Jan 2021 09:11:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <a8d1368df3627d3eed4a1702a066054cde213cfc.1609967638.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.249,
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
Cc: Huacai Chen <chenhuacai@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/6/21 10:13 PM, BALATON Zoltan wrote:
> Remove unneeded variables and setting value to 0 on zero initialised
> data and replace check for error with error_fatal. Rationalise loop
> that sets PCI config header fields read only.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/isa/vt82c686.c | 20 ++++++--------------
>  1 file changed, 6 insertions(+), 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

