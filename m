Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CD632DB18
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 21:21:29 +0100 (CET)
Received: from localhost ([::1]:46522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHuTQ-0003Fz-Qx
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 15:21:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHuPF-0001PE-4K
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 15:17:09 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:45863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHuP8-0005kY-Of
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 15:17:08 -0500
Received: by mail-pl1-x635.google.com with SMTP id u18so10613401plc.12
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 12:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=vyLU5mOz9NgyPH1LOUzWyR58Sz5FeK7erFam5MAyee0=;
 b=mlFIKmz39MLFGVdd2jplxzXofBgNajR92doV6ZQ9RRaSCqQ8Z1TlBKBCNb+6AC3EAX
 82NhOjRayOQe3hP39udpZ/xcLEaAdo5I3yRfym/JLNVyFZVh97ciDbbKoLpjk4/gTjVM
 3Ao/qK4dMs/sNUbEy/afGEn8aeiUUx7se6K7aw4zBJbsw6eanE6rgARK69Zg6GohzNtB
 lL2MoUkJDc658cuzc7EM/GmW3ltJhjrpHUX+dgxYbQldbVyqkCIPoBENgOi2ujHTlINC
 ODfSzDRe5EmEGkNK6qLS9qhtt6CKhBNbHQcgHaxYlVBG5bleWyk/AbabnMz+hNqpkXv4
 pHMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vyLU5mOz9NgyPH1LOUzWyR58Sz5FeK7erFam5MAyee0=;
 b=nsT6iIguv9HDidDyvlHU33pI3rikK799r6zynQcWxRsTNSuaFA8es9o4nFb4+MH6dv
 T1cKhT4T+10LOOjk2wjss+vmAHWqrHTMURYTUg1R5cw0D+BPNXnCKvtnUWjr3OBidJbY
 dAscJhpryQtg/3CZ6SVwJ/xr6g5nOc+RqBxdwTknzpUVLzMOhWGIyhUWj18iPg41NKKT
 5VeGfSyw/MraAcSgXxOx9vYUxLRj2/6g5Dn+0iSW5Ih3/qbqP/bVIoFQ3hSC1Ap1uJJ4
 0Qw15RbKzDJ4xwl/1CshD/k40/KyBBNIHc1zgN1WyvVzCezhMe3dpMrgrrAHNU3v9hQS
 5OPg==
X-Gm-Message-State: AOAM530fdIYQhlFzibwwMlvRwpQC0agrE194gMX7ovtISV/9K2e03kqz
 2npBt8/iCnDOrScTfmAgQayZMVh7vctVQw==
X-Google-Smtp-Source: ABdhPJwDy8DRHcX0ceui15MhXotft7/YqhgT72sppVvd16oFftsrNLPN7rx/cSS481I6agHJH9o2UQ==
X-Received: by 2002:a17:90a:db49:: with SMTP id
 u9mr6500783pjx.181.1614889020724; 
 Thu, 04 Mar 2021 12:17:00 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id o62sm231765pga.43.2021.03.04.12.16.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 12:17:00 -0800 (PST)
Subject: Re: [PATCH 26/44] hw/arm/armsse: Move s32ktimer into data-driven
 framework
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-27-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5d6ec2d5-1315-bb21-e321-ef3b60cfddf9@linaro.org>
Date: Thu, 4 Mar 2021 12:16:58 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-27-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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

On 2/19/21 6:45 AM, Peter Maydell wrote:
> Move the CMSDK timer that uses the S32K slow clock into the data-driven
> device placement framework.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

