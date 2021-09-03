Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 361CE400279
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 17:41:41 +0200 (CEST)
Received: from localhost ([::1]:42504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMBK0-0000Qh-A0
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 11:41:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMBIS-0007Pe-H4
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 11:40:04 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:45943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMBIQ-0003gG-UY
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 11:40:04 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 j17-20020a05600c1c1100b002e754875260so3846148wms.4
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 08:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PIFk2K01jAKRusPKk5XtVjuo3Ueu7Huzkjhw5pa7brI=;
 b=Dwkwpicp4aU2cuuscfFaRSPj2wT+EQhJ25Gdq4/l/9GgWBkJcY7Pn8wg9h5CRNeRog
 NmVa7GEeKf+0baOVHugjcVe9QVi1bpQATJvezpO/R/u4SqWXl82WONPgIAwua24lAy95
 3l+kxbIfgKu/HTfKa1opJEX4UH/BMJqxonrOFQ+L7pv2NNuExWsHQnXfTiroju/jRKhD
 6xHfgT2PaYhJujJkI2wUZYCsSzKBqD0b5TXmVExkPWwNcoy7UKef8Z01sSk81nqFghcH
 KteUO/i1QEsHQLL6BHzHNHs55rxk5aOA3syihgqUJy2UdRHi7npGz2ud0cQUsALCNlbN
 E5mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PIFk2K01jAKRusPKk5XtVjuo3Ueu7Huzkjhw5pa7brI=;
 b=SGt825fyw6dEjRUaLKk281jkw6CGK8SSkjkgjJsp4V/nngUnAksf7VXnnTWQHDnz1Q
 LxblqIogsR8uOJJJddTuH0eu85Y70otaP/zjyNCN99A57G9rJVTRS88kiSmeg6GqTE6/
 tbDHbszHSUoxzFXIG1gndqkyOqYJIhSj5jIV3aIyK8jXT9DxJlfNfOyQ6LLsGGZmI/Y6
 ZNJ+4xb281ijBdCljI/grjBA+jw9AJNn1hCZLUP+R47nC/Cly3ZaBkM4+34jc/fa2tef
 2VEfEd5zUHgf+phFnWZ963GQblGekbKDDaybEzVqhOpGdhLqf3aooi2KHyrMTPr06Edm
 0poA==
X-Gm-Message-State: AOAM5312rZ8hnkio4z1qVXnKpwh/G5xdSRv9zRraIxzAdmLGZMrrn5Ix
 ile7KrepHRFqxjmtW6PamcTeQVJPMH1I/tihiNw=
X-Google-Smtp-Source: ABdhPJyRMmEqTmPY8Wu4/9FWDsJA1gfW6RjQLZ+XQOD5vPybHjc+YV+1mt0rUdjGpbjY+xb4PaUl0w==
X-Received: by 2002:a1c:7dd0:: with SMTP id y199mr1061193wmc.148.1630683601278; 
 Fri, 03 Sep 2021 08:40:01 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id l10sm5536109wrg.50.2021.09.03.08.40.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 08:40:00 -0700 (PDT)
Subject: Re: [PATCH v2 00/36] linux-user: Signal trampolines and vdsos
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210706234932.356913-1-richard.henderson@linaro.org>
 <CAFEAcA-xg=QEUqsBGqFAHiMVi2vBG_BSoC5nGbzdcpyHb_+Dhw@mail.gmail.com>
 <87zgstpy21.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f1325634-a0e8-be63-f8f9-77c29e0dbec1@linaro.org>
Date: Fri, 3 Sep 2021 17:39:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <87zgstpy21.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/3/21 3:39 PM, Alex Bennée wrote:
> The check-tcg compiler logic could be used to build the vdso's but it is
> currently optional so if we can't run them you don't get any tests. I
> suspect we still need to package the binary vdso blobs but use the
> check-tcg machinery to rebuild them when we can.

This is what I was hoping for.

I was going to suggest that we migrate the check-tcg machinery into meson, so that the 
tests could be migrated out of their special makefiles and that we could re-use that for 
the vdsos.


r~

