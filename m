Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7091C1ED5
	for <lists+qemu-devel@lfdr.de>; Fri,  1 May 2020 22:50:43 +0200 (CEST)
Received: from localhost ([::1]:59054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jUccM-0007tU-19
	for lists+qemu-devel@lfdr.de; Fri, 01 May 2020 16:50:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jUcbL-0007IT-FB
 for qemu-devel@nongnu.org; Fri, 01 May 2020 16:49:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUcbK-00013R-FC
 for qemu-devel@nongnu.org; Fri, 01 May 2020 16:49:39 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:40454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jUcbJ-0000yk-4J
 for qemu-devel@nongnu.org; Fri, 01 May 2020 16:49:37 -0400
Received: by mail-pj1-x1030.google.com with SMTP id fu13so364289pjb.5
 for <qemu-devel@nongnu.org>; Fri, 01 May 2020 13:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=bqA2N5qHSaN/96S8uEIJQDu9eWAHmE6V0JwP/OcECjY=;
 b=qhYZaDc0/BmUe4vt7UgMVEx8CPh1C76witNeOIjjSQ1jIWvJHw0U1jlNAqPQewc7h/
 AkE4AMoQev7x/IM4CG2fZSZ22aZdIwcsa39KTAduqyAG9mHKRCm0nkG8Ds6YjeQRS8Rm
 rMwQbFvtw5bPWAuWBzspQVzJdiyGrcDseh8tU5i5DYGwZFLeVATAEpvE1crt8RkxrY+j
 j3jC1We04itQDobFjcPDwIfwZYtpCGlKEruJy8tU+ixqFaqB4wfuTu4PNge2ZI37ImPz
 KDVP9L2lmzegOgcWjitUMUZYlV8Z4s4rbqjTA18z6PEIroknGWhm3Viz0EEm35KaNJS6
 8pJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bqA2N5qHSaN/96S8uEIJQDu9eWAHmE6V0JwP/OcECjY=;
 b=Pk6jaZLz4u+lAYeRJBY1+m7dHAKpmIwpLL6r7ARhJbNNCgbzlfHpl9UqkfMLhF6T51
 ZcRWTwWuTGgQmkJRNUfN++6CKjXPnroTH/4dIpKc/sBKCNRB49JYEO2uqIFalG5Ju1Tx
 u15KhKgQQRo/Mx/7hoi3BYrtp1Dq3HQ//HELorOK8ECUrvShjrNZtvgfnPjJ+9psT41g
 sO1V+Qt3U5CXmg21bWnFbkq1L5Vl7SBmsRR3lJZt7nDHnMF00mJdMAVIaQ9y012KMTYe
 ZqzeCxdi8DMk/MHaxfsRnforhNWA85WMuGkiX1f8GEkbllNiJbxGMtJb1JmuQ6PeP9uz
 MhcQ==
X-Gm-Message-State: AGi0PuZG3AOjGFmq/wzQ3QyvyVTlXUVwbL6L2WufizgSJr1mv0uncQpy
 Z+AKJVMWP5lYCJNLyjNu0jiYpg==
X-Google-Smtp-Source: APiQypKCAQYZie/ubHR94HCJbq0Wpo7UA+ZDl6GgXc8s8A8blQm54SInWNVl9oXbP//MjmBYrRD7oA==
X-Received: by 2002:a17:902:bd87:: with SMTP id
 q7mr6255497pls.92.1588366175112; 
 Fri, 01 May 2020 13:49:35 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id s44sm442145pjc.28.2020.05.01.13.49.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 May 2020 13:49:34 -0700 (PDT)
Subject: Re: An first try to improve PPC float simulation, not even compiled.
 Just ask question.
To: luoyonggang@gmail.com, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <CAE2XoE-XFG8r85yPOhuNS2YUMqhp70q1RXCy+KLT79doW8qHMg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <87605674-1cd8-2074-6730-355e20fbf7d0@linaro.org>
Date: Fri, 1 May 2020 13:49:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAE2XoE-XFG8r85yPOhuNS2YUMqhp70q1RXCy+KLT79doW8qHMg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::1030
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

On 5/1/20 1:04 PM, 罗勇刚(Yonggang Luo) wrote:
> And  fp_status can not represent all the  Invalid Operation Exception flags.
> What I need to do to represent all the  Invalid Operation Exception

Ideally, we add them to include/fpu/softfloat-types.h, expand the
float_exception_flags field in float_status to match, and generate the new
flags in fpu/softfloat.c.

This would actually help target/tricore as well.


r~

