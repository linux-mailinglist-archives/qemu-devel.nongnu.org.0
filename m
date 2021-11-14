Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC4E44F757
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Nov 2021 10:22:15 +0100 (CET)
Received: from localhost ([::1]:44412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmBiH-00031h-NH
	for lists+qemu-devel@lfdr.de; Sun, 14 Nov 2021 04:22:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmBh9-0002Ls-Iz
 for qemu-devel@nongnu.org; Sun, 14 Nov 2021 04:21:03 -0500
Received: from [2a00:1450:4864:20::32d] (port=53224
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmBh7-0000so-Ri
 for qemu-devel@nongnu.org; Sun, 14 Nov 2021 04:21:03 -0500
Received: by mail-wm1-x32d.google.com with SMTP id o29so11267329wms.2
 for <qemu-devel@nongnu.org>; Sun, 14 Nov 2021 01:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VFzxhCJ4KmtgNIHMe4OAFfZBi+fdw6nf7WE0HNkxIvk=;
 b=Vac3S4qaKAH11VlxQSVJaeC7hFUCkBEpBatMP96/uBrX6hoc/oBp7KvZ4zQMkMKEwX
 qK9hjAhzCppd7BdbYYCAvipacY5OD+OXEURnUUF9GFzHa/klpFQqN7SHQ/HXVQNeRAqc
 Hcu0IwHmuXD8sNjf810ZopHXS4CiPex6T/tiWKgnCh5CBId4X2KHRCdOTNB7yXvaqENK
 8k7jnG62TjXG1VvWT3L2B10UrZtfk15qX/WILn8RhX2mejxeLYvEjXCC5ZCqBPeb5KeN
 dbOsGmNo7NkBBIvvRrB/aY/LCpNMcLzBNvIuOYZ2JWwxPcKf8vTRXV7lP+cUPdE/uaNf
 yhtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VFzxhCJ4KmtgNIHMe4OAFfZBi+fdw6nf7WE0HNkxIvk=;
 b=4xoOHqRgZ10HkezIY34v8e7RWSKdQr7STnenvROK/q8lWZ5fmP0hZ+2bfUfOYn6iXI
 TFdqZZydOW1T8OY4dPOR0s3ujJ4U5+lVSbjMXdcsxOL6cedzYIlV9A62PEiaIPLsMwHe
 Eo0dOKv+5dYCozMSxZmZpEtFKbxV42G8OUKolMwZlQnkovwfwH1GQFO+QCG96GgkMG43
 GM/CxJh18mFUO8COy9/5aDevPU43WqrzvogqnSeplGi4kbP1wAnUtWtSb6RWaEpHbmrb
 iQfAsQGATkJ0M6O6L3T/icsL0B7LuZd1ifQVlc+XjpcjxMIMTtTWmfFeoE7RPcSBlvK2
 dPiA==
X-Gm-Message-State: AOAM530ptjhknRwGWH2utFhEy5h5QJj/JCp3J99JwkqOkfTiyxT1WSun
 Dxd8hscP48nq6I6GPeUfXHywYw==
X-Google-Smtp-Source: ABdhPJycnHYAx6mPNo//t75KPs1Iu7jGdWv0VFFQw2FsNf8eaNW71TUweaoqGlVCoPfX/4iOCmmY0w==
X-Received: by 2002:a1c:ed1a:: with SMTP id l26mr51370160wmh.19.1636881660309; 
 Sun, 14 Nov 2021 01:21:00 -0800 (PST)
Received: from [192.168.8.105] (60.red-95-126-179.staticip.rima-tde.net.
 [95.126.179.60])
 by smtp.gmail.com with ESMTPSA id m21sm10395550wrb.2.2021.11.14.01.20.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Nov 2021 01:20:59 -0800 (PST)
Subject: Re: [RFC v3 4/5] common-user: Adjust system call return on FreeBSD
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211113045603.60391-1-imp@bsdimp.com>
 <20211113045603.60391-5-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ee72228f-6340-37dc-7559-dc731e4a6ef6@linaro.org>
Date: Sun, 14 Nov 2021 10:20:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211113045603.60391-5-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.402,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Konrad Witaszczyk <def@freebsd.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/13/21 5:56 AM, Warner Losh wrote:
> All the *-users generally use the negative errno return codes to signal
> errno for a system call.  FreeBSD's system calls, on the other hand,
> returns errno, not -errno. Add ifdefs for FreeBSD to make the adjustment
> on the 4 hosts that we have support for.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   common-user/host/aarch64/safe-syscall.inc.S | 8 ++++++++
>   common-user/host/arm/safe-syscall.inc.S     | 7 +++++++
>   common-user/host/i386/safe-syscall.inc.S    | 9 +++++++++
>   common-user/host/x86_64/safe-syscall.inc.S  | 9 +++++++++
>   4 files changed, 33 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

