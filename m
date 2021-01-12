Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FCC2F3BB5
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 22:05:31 +0100 (CET)
Received: from localhost ([::1]:36230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzQr5-0007hq-04
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 16:05:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzQoK-0004cy-Oo
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 16:02:40 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:34585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzQoH-00080H-Ki
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 16:02:40 -0500
Received: by mail-pj1-x1035.google.com with SMTP id my11so1301457pjb.1
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 13:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ij1bGkqoJJMpf52GUDQp7vKgAGhOWr/gUxAAsGdkCpo=;
 b=Uyvk4PqfHzMci7of3y19jT+azlSpVLipBvD4VGZBzhj46723EYkoFDwW2ILo6mTIdt
 KCy9sS+FtW2uJvIghyjck37+MElZZF5ifM7yaWlb4W9llj7dJ50twY1VkfYwS0m14iap
 yPNg2ENOLspqXpZ4Hycv/X7MQ1Cs5U7plwFImPqL7Sky5ZN7DCGjss16M7xvL1fvlw3J
 F776ySf6vFD3XZNoaBm1SIGtVQSCT2oQrcHDsLx0tTsQsTww+eNeioujfbxOxkVqNxxc
 69tv5q0XrSt7GYYtZwUQ92ImOPBTw2oTk1KZ8DathDtMppoubRgEMeFaeCS89H1T/F7W
 Y1vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ij1bGkqoJJMpf52GUDQp7vKgAGhOWr/gUxAAsGdkCpo=;
 b=LPngISY0SHOPys81Dr3GntRBNmkhB+f/+H4wC21UMcCYAuDV8OAzrcPoTZF/xfa7sj
 SptbbtEfSw5XHJ/H6UfnTGY+rPKNMZ4l/Ia6tg4wIZJykpTiYUtk8i/P5Azx2u0YubHr
 SZ8e9S+ApLjo5ta33R8zlFWJOjvQORnA5MgrsVIgrifcv3muR/FFpiBIqwiVoWRA6cI5
 3TUhFo5lFDvITcd5giCuM/pK9p3aR09qEQ//JSBa2wD8KHmVTbF7MtBQXK9GMdeskRRo
 3TdT0+SDM/Jse3zO4HfFhGUmgdKbnPpazommk+zgIgbjVhxodVBaRlSc4dcVdr01gNzs
 TnKA==
X-Gm-Message-State: AOAM530ZATGOmDBBUruIMGm5xE6fRQ9mJiXbqO3UWkEbJSQXZyg7aiV+
 NSD9IjeEkgA0vzvnshGRnJeJ1GiQRj+VKQ==
X-Google-Smtp-Source: ABdhPJyBIE+eMHlkFiLE+csFjnIYycdbEglQw/1adv2MoNEEGm0e6b61OQ0ukX75y7zEP3CkoUG45g==
X-Received: by 2002:a17:902:8ec1:b029:dc:8ae1:7a22 with SMTP id
 x1-20020a1709028ec1b02900dc8ae17a22mr1286320plo.6.1610485355982; 
 Tue, 12 Jan 2021 13:02:35 -0800 (PST)
Received: from [10.25.18.36] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id g202sm3971950pfb.196.2021.01.12.13.02.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jan 2021 13:02:35 -0800 (PST)
Subject: Re: [PATCH 14/19] target/arm: secure stage 2 translation regime
To: remi.denis.courmont@huawei.com, qemu-arm@nongnu.org
References: <12681824.uLZWGnKmhe@basile.remlab.net>
 <20210112104511.36576-14-remi.denis.courmont@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3a1c73a8-865f-f18d-ebf7-d736d5e7e2d0@linaro.org>
Date: Tue, 12 Jan 2021 11:02:32 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210112104511.36576-14-remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/12/21 12:45 AM, remi.denis.courmont@huawei.com wrote:
> From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> 
> Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

