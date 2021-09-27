Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA626418D31
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 02:03:24 +0200 (CEST)
Received: from localhost ([::1]:56294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUe79-0006dM-QB
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 20:03:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mUe4q-0005G0-Mj
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 20:01:01 -0400
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:36509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mUe4p-0004VB-29
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 20:01:00 -0400
Received: by mail-qk1-x733.google.com with SMTP id p4so35118817qki.3
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 17:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=o75QXbzluXkxXOzruOABo8Z3MiLJZrqv1k+Lkt+NDwU=;
 b=LktOAz2epomo7CFofRdIU1jm7F2AwDu3QPX8IXXgqKf+9anQ39aqgQXDWHM5OIJSii
 DPwfveO+6BgTc1JSkE32Rq56GXaoU80C6+iEt+KhBV6wBSVpN3o0CFHB8sE8Ewkq3t0M
 +a7k6ZLH00Ldkkty/b2NkMEWVCIUgSkdnIDTpxQmrr5uuoABGJAvF52Wtu3rdbilyOq1
 sJ9EeE7v/61nfcZhAVre6vt/Q3gw49KKBFukfGAjMIC5T4o2R+1dbV19Q+ChUZ1pOs8L
 LWhGNE6XIQOniFcSjL/jaCHmAd8/EflSzJIYVxmf0ssC+QgikhSLZbJ+alB91knzvhDS
 lKlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=o75QXbzluXkxXOzruOABo8Z3MiLJZrqv1k+Lkt+NDwU=;
 b=LRyxeVFlDTqSjspVmh6E1VL7ss2yMsONEvEAtobzoAmlZ2JDe72a5nmXlczsZN/CAQ
 QSQJZXK39ECaPPJcgQPQ+YxWFJLMNRfJyYOQYj3etK1mRH3uL+pKY1KuiAAd+9kaUakj
 DzHQEBqJjEWXvHFZZHY3ZmFLkUrzUvrQ8JuPj78ncYObNUu5xULjFrL6aBC3KkTAdEgB
 G7bXbAaLCW8eev7uPaTZIW+lxVvm+rPEcOZ8M/0wpRW57qLvJnSvIL/FnjoOurC87z8E
 gnZGlxsnU8BDVPMU3CT8zum4i7PsplZU5p9NCHD6YzDUg5+fwK+eCWoEkLJP9lnifARP
 4eSQ==
X-Gm-Message-State: AOAM531hthgtjxXmHRgGdLbHv0USzkqVurCt9lNvtGaP8PkNyflIdUth
 v6IUyPH6R/dgbP1MBZdmo2rh+ZyOMPTD9Q==
X-Google-Smtp-Source: ABdhPJw8ajv53MBne03TMbcEUkQq81PfKJPa72XowPBM3QTwlLbyG+orbpvndBiwTssXHdLuxeVYIw==
X-Received: by 2002:a37:a60f:: with SMTP id p15mr21519071qke.114.1632700856787; 
 Sun, 26 Sep 2021 17:00:56 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-31-215-130.sc.res.rr.com.
 [24.31.215.130])
 by smtp.gmail.com with ESMTPSA id r196sm578162qka.119.2021.09.26.17.00.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 17:00:56 -0700 (PDT)
Subject: Re: [PATCH v8 08/40] accel/hvf: Implement AccelOpsClass::has_work()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210926222716.1732932-1-f4bug@amsat.org>
 <20210926222716.1732932-9-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f2af31e0-c891-1150-76ad-b1c79dcbfd63@linaro.org>
Date: Sun, 26 Sep 2021 20:00:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210926222716.1732932-9-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x733.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.478,
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

On 9/26/21 6:26 PM, Philippe Mathieu-Daudé wrote:
> Since there is no specific HVF handling for cpu_has_work() in
> cpu_thread_is_idle(), implement HVF has_work() handler as a
> simple 'return false' code.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   accel/hvf/hvf-accel-ops.c | 6 ++++++
>   1 file changed, 6 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

