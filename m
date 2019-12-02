Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0649210EEF5
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Dec 2019 19:11:11 +0100 (CET)
Received: from localhost ([::1]:42780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ibqA9-000814-NO
	for lists+qemu-devel@lfdr.de; Mon, 02 Dec 2019 13:11:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58524)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ibq8I-0007Fg-OT
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 13:09:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ibq8H-0002J0-Mr
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 13:09:14 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:42000)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ibq8H-0002Im-Gt
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 13:09:13 -0500
Received: by mail-pf1-x444.google.com with SMTP id l22so28782pff.9
 for <qemu-devel@nongnu.org>; Mon, 02 Dec 2019 10:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3i0gqRIZR7MOB9y3SV/8qk3Dk62rM1kFev6OWDH78cM=;
 b=QkJA3Wi3kkcLfdbzcYxgjfXrzEFTN9ytWm/VKpj/4nKOPvT7yFXiWYn+PhQSMW+zvC
 ouUAAtOkF5+DlHQETtgagHTp/uTFdCZcxbbzZiwqoT8zB9vErcWz8lzc0PBGDCl1fMU7
 wIeh3jAcl7M972vWyDalsRso8qCMMZCvvksTGaKKRRg427I6Eg5h/pwkmdmso/xF9tbs
 JCRiYQyaqmv24HaLIpMgZAiVAaj5M5Ij7WX1j+hdPWPJj0cwQUTiyjPuSUwIJqucSWhG
 bcVijfTahx0x57HZkaTq1rB4Ykq7IC1io/dJBvpThUrkzHJWp2qW5CLiw1Z0TFFXGLfc
 CrdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3i0gqRIZR7MOB9y3SV/8qk3Dk62rM1kFev6OWDH78cM=;
 b=I8SER39dz2+kwaKhKFpmF1lXHnhLg8BX8a6EicyEHv77Wjb/wOUJCUMBqyOwsRf2yW
 6jZxxtnLPr13MT41E8ECIrkLRxJiElEhSsqsACGMRwHltCLRoMqgHvs6vKyqVyoi2ml1
 VDix1oYWCnkM6xnnjV8Co7p5XeHMKfNE3BHmdp5My9uqTjoTHjGEom+zZKi+BXEMniwo
 BToBKLwfGNpml+c4o18G2YhejetYpXWr41LbnPHWmes9HCygl4oHCI2HMjAaBU6yGtN4
 lM1uPvuqjx7gOXoGk7hryUWGv2FQIdiqJfEJwhl13JL/nSBoC8QbQROLhbzdyW5jXPn1
 oP5w==
X-Gm-Message-State: APjAAAXAjk/CeGjLsa3P2jrFPOg1CuVTn5yH63Y2w82Grf9Pb37g0oni
 xFQdf1jsyblhI9bq89HnZHH0mw==
X-Google-Smtp-Source: APXvYqy8Lj5cOKGdaj4sYpeGH16BvGUTd8c6FTDR25i5Y6KRcAcCMeLfdDPvQQ91Fn3PS2ey1rMzbQ==
X-Received: by 2002:a63:4946:: with SMTP id y6mr278236pgk.377.1575310152321;
 Mon, 02 Dec 2019 10:09:12 -0800 (PST)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d85sm128126pfd.146.2019.12.02.10.09.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2019 10:09:11 -0800 (PST)
Subject: Re: [PATCH 0/4] Expose GT CNTFRQ as a CPU property to support AST2600
To: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org
References: <20191128054527.25450-1-andrew@aj.id.au>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7aed21dd-a0f9-baf3-70e8-023dcd16ce6f@linaro.org>
Date: Mon, 2 Dec 2019 10:09:09 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191128054527.25450-1-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
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
Cc: peter.maydell@linaro.org, joel@jms.id.au, qemu-devel@nongnu.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/27/19 5:45 AM, Andrew Jeffery wrote:
> Andrew Jeffery (4):
>   target/arm: Remove redundant scaling of nexttick
>   target/arm: Abstract the generic timer frequency
>   target/arm: Prepare generic timer for per-platform CNTFRQ
>   ast2600: Configure CNTFRQ at 1125MHz

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

