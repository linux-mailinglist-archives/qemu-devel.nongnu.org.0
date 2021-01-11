Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 241CD2F19B5
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 16:33:06 +0100 (CET)
Received: from localhost ([::1]:49998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyzBo-0003sb-NK
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 10:33:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kyz8z-0002zW-Bn
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 10:30:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kyz8x-0005V4-G3
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 10:30:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610379006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XOm5IjlxtCHB3DoTOT5779aRChsKjuwcEa6MV131Tao=;
 b=W/iEhBFtcvA88TkrlvOluR0WOub+zPDtzHVHBAZSJ6Lm5hsFS6l7qypgI/XrjnXOZGPyGV
 W7NRT4Psz4XBGuc+gCNtZ6ImFarnLzfcWkduN9dpRlmeCfVEaSJt1rOOwrTTWNX9yDp6t8
 EWLs8NF5dky5fyf56USgZsYaBhkRbE4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-nO9oz8WZMUCImftbzZEt5w-1; Mon, 11 Jan 2021 10:30:04 -0500
X-MC-Unique: nO9oz8WZMUCImftbzZEt5w-1
Received: by mail-ej1-f72.google.com with SMTP id ov1so58975ejb.1
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 07:30:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XOm5IjlxtCHB3DoTOT5779aRChsKjuwcEa6MV131Tao=;
 b=s0Uve3Jm1H7pV2fCCzb1WctRFUziSts/ZR/i/5RAl+0snrrXxujQPih5RccRGS/IWv
 ZNLmnqXsBnOIkNUKPpfzh2Nt8h0q3u3Oyc7eZn9h4tg43E9skw7sVCG9SgCkPbkCaxPN
 T70TQk5C6Zr9aSFVb99X56vS0ybYPfkUwmP4HT/MxhKmRuyZ8labF5bznh/hivRzzsuR
 4p/prJ6WxutSfFM3KwEpbJpL3vSE/dILqyppO/xTQKUAQZr02skKRrsHLo9GeClIK1Om
 ayXE75w+qkzP0qEyH3SgMrE41TkaIsK439wTSzadl9UooALYEmK5o/zCZ41g5ahAT+8Q
 CYSA==
X-Gm-Message-State: AOAM530DsixpxTR1bq0mTJc+BQtsTVQ2kHmtlsKazB/MrNRAZ7Ydva4v
 0lpkF5akxvVxq56aHCXa72xtFnihdB1QJAfOI0DvUHnvre87Xv1QYT6HTY08suARa6Wo5tjLs6F
 UFjgiGj+S4DslfyQ=
X-Received: by 2002:a05:6402:17:: with SMTP id
 d23mr14583616edu.341.1610379003406; 
 Mon, 11 Jan 2021 07:30:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyv2+Jw3CYjdBhHypXtdBUf0JrVTftWqJSvl+ABPgp7irvHlJogeJkHiV0FC0wAU2J4OuFHow==
X-Received: by 2002:a05:6402:17:: with SMTP id
 d23mr14583595edu.341.1610379003243; 
 Mon, 11 Jan 2021 07:30:03 -0800 (PST)
Received: from [192.168.1.36] (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id x17sm85147edq.77.2021.01.11.07.30.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 07:30:02 -0800 (PST)
Subject: Re: [PATCH v1 12/20] semihosting: Move ARM semihosting code to shared
 directories
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210108224256.2321-1-alex.bennee@linaro.org>
 <20210108224256.2321-13-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <15248375-2760-8e5c-4468-b952b247ed2d@redhat.com>
Date: Mon, 11 Jan 2021 16:30:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210108224256.2321-13-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Keith Packard <keithp@keithp.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/8/21 11:42 PM, Alex Bennée wrote:
> From: Keith Packard <keithp@keithp.com>
> 
> This commit renames two files which provide ARM semihosting support so
> that they can be shared by other architectures:
> 
>  1. target/arm/arm-semi.c     -> hw/semihosting/common-semi.c
>  2. linux-user/arm/semihost.c -> linux-user/semihost.c
> 
> The build system was modified use a new config variable,
> CONFIG_ARM_COMPATIBLE_SEMIHOSTING, which has been added to the ARM
> softmmu and linux-user default configs. The contents of the source
> files has not been changed in this patch.
> 
> Signed-off-by: Keith Packard <keithp@keithp.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20210107170717.2098982-2-keithp@keithp.com>
> ---
>  default-configs/devices/arm-softmmu.mak               | 1 +
>  default-configs/targets/aarch64-linux-user.mak        | 1 +
>  default-configs/targets/aarch64_be-linux-user.mak     | 1 +
>  default-configs/targets/arm-linux-user.mak            | 1 +
>  default-configs/targets/armeb-linux-user.mak          | 1 +
>  target/arm/arm-semi.c => hw/semihosting/common-semi.c | 0
>  linux-user/{arm => }/semihost.c                       | 0
>  hw/semihosting/Kconfig                                | 3 +++
>  hw/semihosting/meson.build                            | 3 +++
>  linux-user/arm/meson.build                            | 3 ---
>  linux-user/meson.build                                | 1 +
>  target/arm/meson.build                                | 2 --
>  12 files changed, 12 insertions(+), 5 deletions(-)
>  rename target/arm/arm-semi.c => hw/semihosting/common-semi.c (100%)
>  rename linux-user/{arm => }/semihost.c (100%)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


