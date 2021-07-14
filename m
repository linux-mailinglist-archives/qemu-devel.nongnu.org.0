Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9323C8945
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 19:02:35 +0200 (CEST)
Received: from localhost ([::1]:57140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3iHK-0008PG-H2
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 13:02:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3iCI-0008DL-2O
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 12:57:22 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:38685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3iCG-0003qz-F2
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 12:57:21 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 me13-20020a17090b17cdb0290173bac8b9c9so4244623pjb.3
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 09:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=qFcp67ZqRRFPiBAKMsoviIHgIUtz8pM6iGYMD1t3qdM=;
 b=B7JAoIS3qwFULu/3621yXyIoqiXFra5ZPtPmYaJeeI8d82g7JpMOyuR1gArcbjhFSp
 4RLjKVtNBM4ybWgNxm2HHg8V4Vygi1hIWtTNlEcIUFyyMZBiKdHKYkXqwJp2cNW3gkIe
 ApLa3pJsPpBi+YfuxAK58XKOtRSoZeaCbXwmcelUdsgglUkPhg5w/MdrUJOKyB/ywyia
 mqkrLNgopOOWtveBEjpqH77ixRLLZ2iBLwSbSunctNk64IB0B2ln/AHLzVM4rY3uS9sL
 m14YUQkWsS5V/k7Y63DO+tlArLOz824H3l5HBwrIHM8a+YRrww9MZH+NxljpFsTIl5my
 bL6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qFcp67ZqRRFPiBAKMsoviIHgIUtz8pM6iGYMD1t3qdM=;
 b=lDEAjoTSP+Gld78AtY/cM46xTFyNlv31fVTIgcaXAQg51RLo8FiuhKnX8FJbNO0d3S
 /bgAlzKGgTp69YhCsO3MusxWBUl9yq5YUfFGokj/Mcc2Y2g3o1i53HXT3cO5FNiEvVGp
 8WT46bNYYPCHni7HXQmPY4LzXdDm6Ft8oUhqIK7FjRRRHTh7uqB3gebqMmGFLMmeO032
 Sn4/CC6nAqEgbSW81xeo+5ix7TtV2t7tIReX5xkaUY0Aa8jDfdG94pGxcSC6DcPoHBBs
 O6l16QsiK1ArgXhGtbPI3T9rfre7PpzegK1oojmM6rVUUQhIWlUSRPWyhyC2OePWAS1B
 9xWQ==
X-Gm-Message-State: AOAM533ug2gvwJZMlqv4YoynIpVIYNFu9Ha0q3BV4KOxZMBwDkM1xkFP
 yzoJQ1ZC4bmfze87usBdV+JxVVtVVIeLcA==
X-Google-Smtp-Source: ABdhPJxnI3T6Mzb9+OupY9EbZ58vAMI6IJOQ9cprOU8ClPBMTcoiGP4zKkTKw44Rh9k+4cqtrsXKRQ==
X-Received: by 2002:a17:90a:f0cf:: with SMTP id
 fa15mr10564322pjb.83.1626281838439; 
 Wed, 14 Jul 2021 09:57:18 -0700 (PDT)
Received: from [192.168.101.210] ([75.147.178.105])
 by smtp.gmail.com with ESMTPSA id j15sm3415820pfh.194.2021.07.14.09.57.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jul 2021 09:57:18 -0700 (PDT)
Subject: Re: [PATCH 03/11] softfloat: Introduce float_flag_inorm_denormal
To: Michael Morrell <mmorrell@tachyum.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20210527041405.391567-1-richard.henderson@linaro.org>
 <20210527041405.391567-4-richard.henderson@linaro.org>
 <44a76e8c6504461cbd4dc5752f0d443b@tachyum.com>
 <c46f86e5-ab9e-1f64-f01d-7ec98413f1c5@linaro.org>
 <eca2d26624004ddea64c11b725c5f163@tachyum.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e6cb4333-fd32-bc64-0f7a-dc9ffd10a535@linaro.org>
Date: Wed, 14 Jul 2021 09:57:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <eca2d26624004ddea64c11b725c5f163@tachyum.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

On 7/14/21 9:44 AM, Michael Morrell wrote:
> Just curious.  What's the expected timeline to get these denormal patches in the tree?

Next development cycle, at minimum.  I need to fix the problems vs NaNs that you identified.


r~

