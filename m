Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5D247E9CE
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 01:16:36 +0100 (CET)
Received: from localhost ([::1]:39110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0YGB-0008RW-6A
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 19:16:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0YC7-00050o-Fv
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 19:12:23 -0500
Received: from [2607:f8b0:4864:20::102a] (port=54006
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0YC5-0007Hn-6I
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 19:12:22 -0500
Received: by mail-pj1-x102a.google.com with SMTP id mj19so6233452pjb.3
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 16:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9NIGM75MQ02r5lGbfdBsYqbhsK6dfIw0fcuGdyHtOqA=;
 b=irVVnUrr9OOwln0P7CdlyqNJ6qlZKq4zwai6nat+Vre6XrJrALRiyDBcMA2rojJkwd
 MxY8dqnULBaHM43bA0Amny3kawwY3Lv4JdO/4Mi5lDbI4DRinUYsaVhAaM1s1drVntn4
 ZS2pdRA8zJU2XSToX/erc2yK7hyUDCuwEMuwHEHL7I0SerwaMzrHDkezwe9Vd+heEZqD
 DZSNfxCqe+n/m5cOyZzxRm0Q/iI/ILv2lYhKOr9x03ovyDK4syL6rZ8ihuecW2NwcPG7
 lZd4ErowjtupEVXQye+cybfNMXii2KKcBCULxGhJ5sjf996Hc6EYPrp9Fp0s8lu0c+6O
 RVHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9NIGM75MQ02r5lGbfdBsYqbhsK6dfIw0fcuGdyHtOqA=;
 b=7ElqgBxyIMdequ9p0VOp254seK7bojRr/ZUqaRtNUCI+tQubi9gzVpsaa7n4+a+Y2a
 DOjl+1wY4TXZ+SJZT0FBer4rD9EJ+MAlK7qHwV3ryKsAPa0zuXtpEdno/QapTIFoa7Ip
 0PKPF347eOEK39ojEuPiVFSt/u6H1IdnM+ndeSJo8afpFANzrgjUdvDwF9iVZYHFQQ3v
 in3UD6GV6UWolycssizpe/14z8Z/BmCZx87cpMfeec5EVwTOwuo5IxZQD3GwLpmBL8sV
 ozsI1O4xK7NaxA7xcTvBqyPoCz9GjieuRgpOXJy2gPOYChzMvE9GacCG+lQdhazKYBk4
 RmGA==
X-Gm-Message-State: AOAM532Bo3WEmu38Xp2eoI1YvOUY/GDZdWL80MszknqYuSZkX104q/Nz
 tgWNc2rURYkeBM7ucF6EwxsBFA==
X-Google-Smtp-Source: ABdhPJyz4ptddBXBKHO/WjUz3SjA2++G5kBFzIwzsDwq5GuxK9j5ITQ+JB5Gq+xdmorevUy3ybg9zQ==
X-Received: by 2002:a17:902:c745:b0:143:d220:9196 with SMTP id
 q5-20020a170902c74500b00143d2209196mr4425712plq.74.1640304738920; 
 Thu, 23 Dec 2021 16:12:18 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id f16sm8062758pfj.6.2021.12.23.16.12.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Dec 2021 16:12:18 -0800 (PST)
Subject: Re: [RFC v2 03/12] target/ppc: powerpc_excp: Move system call
 vectored code together
To: Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org
References: <20211220181903.3456898-1-farosas@linux.ibm.com>
 <20211220181903.3456898-4-farosas@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e363fb60-8469-7fdd-e2bb-338f85119d81@linaro.org>
Date: Thu, 23 Dec 2021 16:12:12 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211220181903.3456898-4-farosas@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.264,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/20/21 10:18 AM, Fabiano Rosas wrote:
> Now that 'vector' is known before calling the interrupt-specific setup
> code, we can move all of the scv setup into one place.
> 
> No functional change intended.
> 
> Signed-off-by: Fabiano Rosas<farosas@linux.ibm.com>
> ---
>   target/ppc/excp_helper.c | 13 +++++--------
>   1 file changed, 5 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

