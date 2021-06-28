Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9327B3B66A2
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 18:22:45 +0200 (CEST)
Received: from localhost ([::1]:48716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxu20-0006qF-Kn
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 12:22:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxtxs-00007s-2N
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 12:18:28 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:38816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxtxq-0007Ij-FE
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 12:18:27 -0400
Received: by mail-pf1-x42f.google.com with SMTP id c8so14534745pfp.5
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 09:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=eaQM/ID7VJl8El7cDZdSxre1XraI4UpTegocCvvBfFM=;
 b=YuNvPybnAqOPdEyg++hVcpX3ANRLnAmOO5PhRAfZUQGHdmDu+1sAPVe61oYtKGyqUy
 vdbS0Zi3o4uZblptr6p83JeFVGrcZLNoZnBAiOUacQfFfu8zAmDlfCE2LmRNF27E3DV0
 XCBZuo/76IpQPJBruQV3gxPdeRI6EYVNcfTWmUhvE4fha8F1Qbb14M9cIiKEsWApYepf
 SaBU193ZMq8cV9Gh3YU3UQey0VGtF32qrEmaeBWgA0HeJwQ1+BTMVd91poZZfTJevhuj
 sFCmD+tftnPmHz/DAHat6L2u2mmGoXsjFqyS/sM7wUh85E87pMvGwvUS57remGaICrmi
 RtEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eaQM/ID7VJl8El7cDZdSxre1XraI4UpTegocCvvBfFM=;
 b=Z6BLzH3CD6tj+SImUcpfQSUc5JdaSlxGZnpgi8ZHI+DZTiD7vgpzCqUtv8CvBW/gMP
 ZjcZ3BRedqFHbD9XIMOReHf05t2jzqDtPUThCD2Oj+gaNGBI3IFOmEGDU9NEHkkgIUkJ
 PU99Vcm3YD2Z4DnKw8Z+O8dBTElpbFR0/tCYsgPdNU7ewhqaDPsvLOC0jYuK5vGKrYgD
 Ah8eJLmpS2YiHeyPd20JStWQ9FuNmfExoJlZmcLFIZp4g467OYux2aqJts1kzfZpBiPt
 O/4Nu58GBHE8YZrtbcinZMrVNwBQO3+pjHaDMo1ccgDvI+dODthX85Tb5KZPKkkb17pH
 MpCQ==
X-Gm-Message-State: AOAM531Fw4QWIQGzUTmGTOUHzxNc1Auwe3dx5vBna26H3dzhm/4t1Y0x
 t1o4mgh+ccteugueKMEYZ/0r7Pyp9PpX6A==
X-Google-Smtp-Source: ABdhPJwgKxDYwqtYNfTYp30LkG0vwJeN2QUWcha8CZpaWeR13iJnbdzq1Wn3jQRa/AXPpXjwnncBwQ==
X-Received: by 2002:a65:6243:: with SMTP id q3mr24217024pgv.297.1624897104337; 
 Mon, 28 Jun 2021 09:18:24 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id m13sm8857751pfc.119.2021.06.28.09.18.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 09:18:24 -0700 (PDT)
Subject: Re: [PATCH 09/18] target/arm: Implement MVE VSHLL
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210628135835.6690-1-peter.maydell@linaro.org>
 <20210628135835.6690-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e1fe2c37-cbaf-489f-580a-fdcf808cdae3@linaro.org>
Date: Mon, 28 Jun 2021 09:18:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628135835.6690-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/28/21 6:58 AM, Peter Maydell wrote:
> Implement the MVE VHLL (vector shift left long) insn.  This has two
> encodings: the T1 encoding is the usual shift-by-immediate format,
> and the T2 encoding is a special case where the shift count is always
> equal to the element size.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  9 +++++++
>   target/arm/mve.decode      | 53 +++++++++++++++++++++++++++++++++++---
>   target/arm/mve_helper.c    | 32 +++++++++++++++++++++++
>   target/arm/translate-mve.c | 15 +++++++++++
>   4 files changed, 105 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

