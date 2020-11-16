Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D53502B432B
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 12:52:31 +0100 (CET)
Received: from localhost ([::1]:60592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ked3e-0005ME-VK
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 06:52:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ked2W-0004si-81
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 06:51:20 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:36369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ked2U-0008Uw-HS
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 06:51:19 -0500
Received: by mail-wm1-x343.google.com with SMTP id a65so23382262wme.1
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 03:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=G0X9hrYmems051nyC2ahgyG2j/F7SvJQcwy/fdSZXSY=;
 b=sKsmboj3FoZ3AIohYV1UnXx7xBxIo6iV0+RFVIAqnHotRV707lxiub7C1n5JFC9WIR
 CSSW/rCdVDjJhO9lzd3p77rmLZQY4fu4EaStAvTs93XyX9R+/J2zbzmOfoLKEHyV9oG6
 G6utfh4fYvsJZ4DPAQY+vya+NRSgNN/4T63jOj7tS4kZ3yeyp1YJokXrillhC5X8CNr8
 ePw/AKYHqubqFtU0AtnwxkUgc90QPQagK4ckWFvVLqO9dab5zBqkIuEzXqusmJIvl7du
 dr9rq9dZoFw7GHIRtu9o61WVo33q+9l3OF00j8fR/l9wleoRbb5gzRAbnQF8A0Cwc1s8
 OiCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=G0X9hrYmems051nyC2ahgyG2j/F7SvJQcwy/fdSZXSY=;
 b=bDhAd8lWl0YkbAHxpwmSjZc0ullCaqF0Z26z3n7YnZ2fksllz2UaeOkQfRmjFNjPih
 cXqF6rXtvHGAqbyYBHpDR0M3VCXltQYEm5IHpmrcLq/pC/JTYtcTPHN8ZJ3hjq3x0qER
 6DWB7CMgtxYA/mXbXN04emiwPQQBFUa8dyxRZ6L51FSrGyYEHKUuWPaT4Q8nvlE8EPk0
 4QzQLe1rL178xdUJinYUuNdGK2IiGzz7dnNrOkwPqhUCyRD7FzjRPX6eSZ/XQkk2bvK1
 +RV2cpo6WR1xsTvpZBWjST92VsMqXZU2H/xZT8ZoMy4/EnGks4R9kyQs9BaZ/cNrHayt
 TrPw==
X-Gm-Message-State: AOAM532VacruKwEdVrZJVmZYBCo7jFAQDjA55Z0ncNQ+Ed15ZYzXoss7
 G5Po1hN/ranNO4hY6LD8NhA=
X-Google-Smtp-Source: ABdhPJyq0KLdoPGrB01Pr61PBM3o+n03Ur3b8hZRaGvo1uCjsrouC+me7hP6SY2Zw0mli44GiTaH6w==
X-Received: by 2002:a1c:8095:: with SMTP id
 b143mr15291487wmd.147.1605527476544; 
 Mon, 16 Nov 2020 03:51:16 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id 35sm22766232wro.71.2020.11.16.03.51.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2020 03:51:15 -0800 (PST)
Subject: Re: [PATCH v2 3/4] configure: Add a proper check for sys/ioccom.h and
 use it in tpm_ioctl.h
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20201114165137.15379-4-thuth@redhat.com>
 <20201115152317.42752-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <cf354b64-cd22-e6a1-31e7-baf62fcbc0ed@amsat.org>
Date: Mon, 16 Nov 2020 12:51:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201115152317.42752-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Alexander von Gluck IV <kallisti5@unixzen.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 =?UTF-8?B?572X5YuH5Yia?= <luoyonggang@gmail.com>,
 David CARLIER <devnexen@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/15/20 4:23 PM, Thomas Huth wrote:
> On Solaris and Haiku, the _IO() macros are defined in <sys/ioccom.h>.
> Add a proper check for this header to our build system, and make sure
> to include the header in tpm_ioctl.h to fix a build failure on Solaris
> and Haiku.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  v2: Check in meson.build instead of using the configure script
> 
>  backends/tpm/tpm_ioctl.h | 4 ++++
>  meson.build              | 2 ++
>  nbd/nbd-internal.h       | 2 +-
>  3 files changed, 7 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

