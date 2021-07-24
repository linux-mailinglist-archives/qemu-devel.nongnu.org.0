Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7003D496F
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Jul 2021 21:08:36 +0200 (CEST)
Received: from localhost ([::1]:44476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7N0k-0006wK-QC
	for lists+qemu-devel@lfdr.de; Sat, 24 Jul 2021 15:08:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7Mzs-0006Fa-77
 for qemu-devel@nongnu.org; Sat, 24 Jul 2021 15:07:40 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:53098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7Mzp-00061A-JS
 for qemu-devel@nongnu.org; Sat, 24 Jul 2021 15:07:39 -0400
Received: by mail-pj1-x1030.google.com with SMTP id m1so7086298pjv.2
 for <qemu-devel@nongnu.org>; Sat, 24 Jul 2021 12:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kmn+CUe20C0y+woycQT+lPomyezxHaphwQLXPwIoVr8=;
 b=mWkjaSN3jj1W17yRu7+54xWQvdijG3ZtuwsOG7aD0ginXtnutCm3D5YsRzWfuCvYIi
 Ho1IrPrv4lZhoKj0zlzRwR6951Y2pDjFRZJDPnr++s6Sx2svZU8O6ImTbv2gmETJObkX
 dKSZd58WxHnIucoGAe7tBW+oxxP0We5KpDlexVzRyMYERiJJhRHRsYlpor31MNBzvOqz
 wXo5FrPLZ5S3OQwcrYJCl6M8wXzq/jFawGshyePRTYE6J9JQGeUkLnzduRi7W6CMdgKS
 gnKhXXEs4VqDentgcLvpio3owshHeCoA3e47Hijw1XK40Us1hZm0u8GC22AcebtMatJT
 6ATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kmn+CUe20C0y+woycQT+lPomyezxHaphwQLXPwIoVr8=;
 b=LDRWhIUElLWQCCV2eR5W2WIO/+BmCF3nlNMd4Mm6Xe4g7WCLtZTi5Hdd7hy6pFw18F
 UhaWjY45N13nOgbYcbvGO/GkcLnoQ4C6vUTGG1KrWTdwjypeUz9hUqFs5bmi8EQc8FfZ
 XtJB+ontqCgaai42vCov4pLiEGeZp2i9tMA0jQJ2vxSWOmlYwnDiW9P/6tjGB3l5jIkK
 JKCYYrPFNX9tE/cMmYjorcaJQwwna0G/5ZQKo453RYpJ2YJzBw9/f0HUWRCMOz2Jcjlx
 muWaEs9t3VyXw8OolxnlbJmkvLYRNa73tnDxRgzQ2D6A1qxWPXV5B7j38nWenkc8f5bR
 mGww==
X-Gm-Message-State: AOAM531/QhciSMOhH0l+fn9tpg302Nlzn7tHz5gr5rK/bZ6/Lo7bykfB
 4BjLjm+pVpppzqFoKSdW/uoLbw==
X-Google-Smtp-Source: ABdhPJxvL4MH3b3v1OApsijcmBE3+PlmVYYJF83fkALP/00Vf7TlQp+JW9y7s7p+jKjC4vx0iRV4Jw==
X-Received: by 2002:a17:902:c111:b029:12a:fc96:6513 with SMTP id
 17-20020a170902c111b029012afc966513mr8446307pli.64.1627153655561; 
 Sat, 24 Jul 2021 12:07:35 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id a8sm21074972pgd.50.2021.07.24.12.07.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Jul 2021 12:07:35 -0700 (PDT)
Subject: Re: [PATCH for-6.2 0/2] target/sparc: Drop use of gen_io_end()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210724134902.7785-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <97776e98-6515-e4ee-4898-5decdf8b6382@linaro.org>
Date: Sat, 24 Jul 2021 09:07:31 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210724134902.7785-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.058,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/24/21 3:49 AM, Peter Maydell wrote:
> Peter Maydell (2):
>    target/sparc: Drop use of gen_io_end()
>    tcg: Drop gen_io_end()

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

