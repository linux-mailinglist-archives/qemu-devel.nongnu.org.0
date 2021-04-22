Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E82C3687E2
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 22:28:46 +0200 (CEST)
Received: from localhost ([::1]:38376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZfwL-0008U0-BO
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 16:28:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZfuq-0007tG-9T
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 16:27:12 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:39478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZfuo-00073c-Im
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 16:27:12 -0400
Received: by mail-pl1-x62a.google.com with SMTP id u7so22317118plr.6
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 13:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aT/M51OHD1tN2+CZdZUhJraRs5DJoV7iGAe4rTA/RJA=;
 b=vE7QeUWniq8FI5xBrJEEFRAOP95gcKyt5tST5owej2Xjj71lNAZbsfRCc+DS+qB+Sn
 ifQy1wleLXwLnxmTbFvVNvOt8ntIwtBMNBKzQg1lDGo0bcBWJOvQiUYLtilFSrh9toL4
 d+mJKjBIRKoKd9ByUQp0qEbsJfYaEYSt51+hQfugYQRZQ2CORtx9iLqWtRy+uOi2HOBK
 drW/FuxPGuI2H13HMtGI93viq20hCUw4FFQ/023+1pMzz17UFe+T8xEQxKSsZge/Y+by
 UB04//J0wMCGh44Kow18lRZWO/c0fgMGYpmkyJQej2bDDyqmd+YLt3NDBWeUwXRkMauz
 sIOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aT/M51OHD1tN2+CZdZUhJraRs5DJoV7iGAe4rTA/RJA=;
 b=LgOnHCxKomTGiBJGF7rGsN+qBIsfiQ11G5ANGQyG0EZ1Kt0/PCmkBn3GEbmS7lrXC+
 hdJxHISJXFwCXZx2izhzhyD25TmAc5BYIX0D7tX1bRbpTRnrzC29r5DlCEYIJbep3Eol
 qdzIJnT9RZoCT0m+d7ayrqeGPLXZsOCQW1XinnjXEAhqfMtaYZMQCtR6ejIJBlveiN1O
 g/tcwypKkXK6u47gcD0j/3hc4jVP6CzZuxsIJnYVq5IbOWK0+rHcWt8h98MpRUnRKqvW
 AnbI7v922K6I+tFraHxZ7oOl6XcN+jr8O454KEYWQm9waEY6qLx2TfI/alKY77Pdu0bJ
 iDDQ==
X-Gm-Message-State: AOAM532sDspOafcLPfzhbpDTw6anyiJFyK1DltPjS0KqkUpppL+yjTBG
 rIrpIsdjBnd8Bg15roK0/I7Dcg==
X-Google-Smtp-Source: ABdhPJw5un4kuGMaxeN4B4SCU52XbP4MfGJzaQkKht8FA2496VX8nGtJO0raqbhmn3pDwBd0PTgQhA==
X-Received: by 2002:a17:902:9a84:b029:ea:e627:f7c2 with SMTP id
 w4-20020a1709029a84b02900eae627f7c2mr571912plp.57.1619123228383; 
 Thu, 22 Apr 2021 13:27:08 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id ne22sm5746307pjb.5.2021.04.22.13.27.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Apr 2021 13:27:08 -0700 (PDT)
Subject: Re: [PATCH 2/2] linux-user: Clean up sigaction ka_restorer
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20210422180819.252121-1-richard.henderson@linaro.org>
 <20210422180819.252121-3-richard.henderson@linaro.org>
Message-ID: <730cc28f-56e6-9b70-9c03-34a7a10fe6ef@linaro.org>
Date: Thu, 22 Apr 2021 13:27:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210422180819.252121-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/22/21 11:08 AM, Richard Henderson wrote:
> Pass the ka_restorer value as an argument to do_sigaction,
> and put it into the sigaction table.
> 
> Drop the separate TARGET_ALPHA struct target_rt_sigaction
> and define TARGET_ARCH_HAS_KA_RESTORER.
> 
> Tidy up TARGET_NR_rt_sigaction, merging TARGET_ALPHA, and
> TARGET_SPARC into common code.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

I'm going to split this patch further.
I should be able to clean up alpha further as well.


r~

