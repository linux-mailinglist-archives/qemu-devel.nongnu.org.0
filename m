Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CCE3FCCC8
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 20:12:19 +0200 (CEST)
Received: from localhost ([::1]:51854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL8F0-0002lX-Na
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 14:12:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mL8Dj-0001Rc-DV
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 14:10:51 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:52112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mL8Dh-00048A-RK
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 14:10:51 -0400
Received: by mail-pj1-x1031.google.com with SMTP id c6so116302pjv.1
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 11:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2h2ocJqJHoGXgIiWFFsa0hkmDjW26tuwTgSZ1+2iBqI=;
 b=EU03WrH7qeSv5DgnjCELsyYyR3UinsN6SPbQ57MnZcYAS3XyxgjQ35pUG+XU1Ry98S
 bEYJM3cwbaz73qNFvCYiBu0LPi+1+STsfYf7SbTZkewqlEzrWzVcPZdqx0dlOEpx91dX
 xJ9/hP82YFXueco/iWX6u5AIYIQxTi7IrJfBVzYLwlgfxNbL0wSE8Y8SDYBrXsme0Id2
 EZqhK3DRu6HyQ5sQmzlqF5CXA30ZfuTbh2J5koTUfkLHciYAtA8AGHZQyAcIpOnKbaMW
 jZTDckpY2uRed+0CDzuOfyj4JWwolT+bB0d3A/CMseqhN2CvDEQUF1XTG46Edd8T3MF6
 BHnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2h2ocJqJHoGXgIiWFFsa0hkmDjW26tuwTgSZ1+2iBqI=;
 b=U1VbPAdV8ZIxeEW5USJVqejMWLPY+HGOhiRiK6/+WNFvgyvzXm3/oVOfZwMyEyiaYl
 E4/2PlZVzGSV9X58wszFIGMGY1evsZC9JlRrPfIzg/0fikLbrqlDSaYpoDpVClwAfZTL
 74DuYPp9Glyim0hm5kN0ZA3jNW7Y6orXJp0Eh3ucxORa+xxO4/5c2jRb31c1JLsgCU5k
 GDT11kKDkQp7nBhHCxINB/yG/d1Up9SFKZ8cJYfGyN9kbeI8ZbZNcOJsaitUVDEVsCnO
 UXApT/zDNpWbVylCvb5iXm2G2hC4KEYcwN/4RYn5HuGgz7sODK26GRy72yUQMIYh98Az
 +YNA==
X-Gm-Message-State: AOAM5336ytZNXkO4B2sNmqcT0RbIM8Ut1nygxqPh04gVKXqjELkKSWXf
 Nc3WIpbovl30x4qsBmq95BOMEg==
X-Google-Smtp-Source: ABdhPJzY/NBBJ+IkLYXMso7lHEIsm9qWuTOHRCyDWI8nyCkNJf/uBc1UkN5NMiRN9IxMZEozmBURFQ==
X-Received: by 2002:a17:90a:bb0b:: with SMTP id
 u11mr6898600pjr.18.1630433448168; 
 Tue, 31 Aug 2021 11:10:48 -0700 (PDT)
Received: from [192.168.1.11] (174-21-72-39.tukw.qwest.net. [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id o16sm17561121pfk.86.2021.08.31.11.10.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Aug 2021 11:10:47 -0700 (PDT)
Subject: Re: [PATCH v2 06/19] libdecnumber: introduce decNumberFrom[U]Int128
To: Luis Pires <luis.pires@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210831164007.297781-1-luis.pires@eldorado.org.br>
 <20210831164007.297781-7-luis.pires@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a554cd1e-d222-9e87-f474-44e436454176@linaro.org>
Date: Tue, 31 Aug 2021 11:10:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210831164007.297781-7-luis.pires@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.932,
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
Cc: groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/31/21 9:39 AM, Luis Pires wrote:
> This will be used to implement PowerPC's dcffixqq.
> 
> Signed-off-by: Luis Pires<luis.pires@eldorado.org.br>
> ---
>   include/libdecnumber/decNumber.h |  2 ++
>   libdecnumber/decNumber.c         | 36 ++++++++++++++++++++++++++++++++
>   2 files changed, 38 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

