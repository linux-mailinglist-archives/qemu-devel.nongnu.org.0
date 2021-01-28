Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C42B13075D3
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 13:20:36 +0100 (CET)
Received: from localhost ([::1]:39112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l56Hr-0007Qw-P5
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 07:20:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l56Av-0002bv-LH
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 07:13:25 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:33218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l56At-0007mQ-Ac
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 07:13:25 -0500
Received: by mail-ed1-x532.google.com with SMTP id c6so6360344ede.0
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 04:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=o1MPU8r9HSmLvy6ehcR6sHJeNxsgx0I9ZQfq80tgEmo=;
 b=pifV/XKylliHX4mHla34pIWNX/uEqWi71GxxL2chwR6xIIAxdkhniHgc2DySzLgDP+
 Du5mVdPq715SeNmPDb7eMOI9QNbWDskmc9BbCLJMZY6B9oNS/BZLdiguY7zBvLWwTfqs
 aKxoAKk4VpIjCet/azNSvJcmnFM7vZuusP7Ev35oRhukqHIBLcKQvbbcZIN2HnLn0qCb
 1OhAxwr3DFqd5vkhkvl5RucfTSXSEmPFZYZ9RuH9NXGC7hIRXNUbTN+KHbvS95kF6cvv
 GM3pME5VlPcj6CGHeHKTnXQq9uq6u6afNYNo4DR/4Aie7EEgaIjgohbAG0wwFURP3wMM
 C46A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=o1MPU8r9HSmLvy6ehcR6sHJeNxsgx0I9ZQfq80tgEmo=;
 b=YezMy/IXCIN19+ycNzwvMxikU0xqzXyiEuNJK5RMAmW4VyjuK6XqLpgeicmNoN2IsU
 GDMhp3qOW/7wetNaxysIfBfohgO6qqtmghwSd0CiAbpnCzFP3c/CUVMxoD3OkYqvLD0M
 6ZmKApT6fGan9YMvsD55h22gZOWct+NZSM69WU45a6YnKJOmc0fbgYKoRno+d0NSnPGG
 BwyLaCy2poiYaYWIodmyH/Uv9SGkWcdPPvlGoLuSjwqqsRb00/WgU9EFCDCboX19iQuB
 /tO1nLvspkAv+nGg64vcBC+i/8gkoSp6fZcVyiIgHe2WPE9sNb1jsazm0ywJ8JVzAM9D
 nN4Q==
X-Gm-Message-State: AOAM533pLTqa/PE+FEmDm2W/RYoUptZShLcxn7L36vi+QUE/t/9TbgRc
 GORHWQtr/57BWhENBFMMoyrn8fYqMXN8PAJmuq39RA==
X-Google-Smtp-Source: ABdhPJyujDN3CNla7a3gKXSduC9aTbF/poNqnhEgjPWz6S/Nodsobf35s5Q4NzCiQDdYQV5HWHEEW2fZibIqPAgMzBY=
X-Received: by 2002:a05:6402:b2f:: with SMTP id
 bo15mr14125279edb.146.1611836001301; 
 Thu, 28 Jan 2021 04:13:21 -0800 (PST)
MIME-Version: 1.0
References: <20210127232822.3530782-1-f4bug@amsat.org>
In-Reply-To: <20210127232822.3530782-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jan 2021 12:13:10 +0000
Message-ID: <CAFEAcA_Brm2KH35i9OkihORA9RnOYUUH1Fngh+rJrPccZOrKrg@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Replace magic value by MMU_DATA_LOAD
 definition
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Joe Komlodi <komlodi@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 27 Jan 2021 at 23:28, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> cpu_get_phys_page_debug() uses 'DATA LOAD' MMU access type.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  target/arm/helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)



Applied to target-arm.next, thanks.

-- PMM

