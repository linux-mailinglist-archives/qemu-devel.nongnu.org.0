Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2EF39D109
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Jun 2021 21:28:40 +0200 (CEST)
Received: from localhost ([::1]:55306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpyRr-0006Kr-7T
	for lists+qemu-devel@lfdr.de; Sun, 06 Jun 2021 15:28:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpyQo-0005e5-Ib
 for qemu-devel@nongnu.org; Sun, 06 Jun 2021 15:27:34 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:38727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpyQm-0005v8-Vd
 for qemu-devel@nongnu.org; Sun, 06 Jun 2021 15:27:34 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 m13-20020a17090b068db02901656cc93a75so10561129pjz.3
 for <qemu-devel@nongnu.org>; Sun, 06 Jun 2021 12:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=QsWswt9B3rqthVv0KoRtXScL0xjpudFcqumWBeV+Psk=;
 b=rF1w7UBnzIz/mXvW2XfahxjbWTTcViwIoXc9hNREponIB3zTgsPthgOa0spvaA6i7b
 o/4GhzGvHazKmbfXK6hIiKdd5r6yhy1WfAdAUQcUl+G/VnK3YL5gYTaz525/THTXAqKd
 DpYmLpOrVnGjZFYc4DoiDf4zHMqtyxCGS1MHiLfhyFQJtq4RDgCVnsyE71hcWAjtjVYF
 nShl5T7qytHLmA2SJovNorf/QWe6BfPMo81VR2swiquTug42m3BAgC3R45VitkBjZUih
 2QFKSxWrpWE6sDXnOimOw+1oAjacUKLfIvOPVmMTqaI8er733180w03+YnmhjFWJ9VuD
 vQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QsWswt9B3rqthVv0KoRtXScL0xjpudFcqumWBeV+Psk=;
 b=pyFO4FAnS4P4943G/yHNzCh4xlkun4HRMVDV1fj1fm4pOp49t/Oi6M5e8Q+UqcbCa3
 UpPeLCkMn2Ig9LW10AKMcaNhZ3UJy3YNGCS1qwjpybsR72cZ5SZkMb6J8duSEdI/xRPa
 F55Wzyt3xd2tyitFTvTP8b5t3BQ77S6i+icwykutqqzlSDh98De/IFlB9b8JH98Sg3G1
 +UFeKvXzIWFwHPkbV+iZh11XqzVs9q0RQVQrCZBdQSqbf+Z3Nwy9XhlPxt3d/1hXtiya
 AmgsMb6dwCMzNNjB+WXCg+MpWLI3AP81WY9woAY+Pu9/M8My5k+LYScSAF7tBcHxNUxX
 tp2w==
X-Gm-Message-State: AOAM531s72Dyf9l2InRVgrVmdmk4wHGWaBV6GGk/vKlNkM4LIclbD1XU
 kBzGGiAkxR4OvzSZTTX52patO3jacZ2jng==
X-Google-Smtp-Source: ABdhPJwIya+3lM5+r5YujPIqlx++zU9rZ42rQvgboz+iFYqO7zF4V+Qy6pV1vVOkXP5s7UR0rGMssQ==
X-Received: by 2002:a17:90a:8818:: with SMTP id
 s24mr2324990pjn.41.1623007646193; 
 Sun, 06 Jun 2021 12:27:26 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 g141sm6236938pfb.210.2021.06.06.12.27.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Jun 2021 12:27:25 -0700 (PDT)
Subject: Re: [PATCH 7/8] Provide a Console Terminal Block in the HWRPB.
To: Jason Thorpe <thorpej@me.com>, qemu-devel@nongnu.org
References: <20210603035317.6814-1-thorpej@me.com>
 <20210603035317.6814-8-thorpej@me.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <00e68b2d-0f5e-8c3b-f7b4-91977e5bb60f@linaro.org>
Date: Sun, 6 Jun 2021 12:27:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210603035317.6814-8-thorpej@me.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

On 6/2/21 8:53 PM, Jason Thorpe wrote:
> +  hwrpb.hwrpb.ctbt_offset = offsetof(struct hwrpb_combine, ctb);
> +  hwrpb.hwrpb.ctb_size = sizeof(hwrpb.ctb);
> +  if (have_vga && !CONFIG_NOGRAPHICS(config))
> +    {
> +      hwrpb.ctb.term_type = CTB_GRAPHICS;
> +      hwrpb.ctb.turboslot = (CTB_TURBOSLOT_TYPE_PCI << 16) |
> +			    (pci_vga_bus << 8) | pci_vga_dev;
> +    }
> +  else
> +    {
> +      hwrpb.ctb.term_type = CTB_PRINTERPORT;
> +    }

I'm concerned that you're initializing only 1 or 2 slots of 34.

It would seem that at a bare minimum the struct should be zeroed, and the 
device-independent header (4 slots) should be set.

I notice you're setting term_type (offset 56) and not type (offset 0), which is 
where my documentation says that CTB_GRAPHICS goes (Console Interface 
Architecture 2.3.8.2 Console Terminal Block Table).

I'm also confused that this

> + * Format of the Console Terminal Block Type 4 `turboslot' field:

says "type 4", but you're actually using type 3 (GRAPHICS) above.

But I do see that what you're filling in is exactly what netbsd examines -- no 
header checks, no size checks, or anything.  And that openbsd has an exact copy 
of that code.


r~

