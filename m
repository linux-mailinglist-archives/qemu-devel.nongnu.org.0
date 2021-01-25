Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D876302F25
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 23:37:03 +0100 (CET)
Received: from localhost ([::1]:42232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4ATl-0002Bx-Vw
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 17:37:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l4AS6-0001BQ-9Q
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 17:35:18 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:36521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l4AS4-0002b9-Eq
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 17:35:17 -0500
Received: by mail-pj1-x102e.google.com with SMTP id gx1so558476pjb.1
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 14:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=T9DmXEOJUmlVsSD3RI4iW4MSaXLFo+DhO06v4a8eotY=;
 b=LAcr5sEeA9SGRsemDFwUMigq6VlXnLG1P8qAiSJhkbBoEHcFYTBecI9q65BTYbebMW
 mxeW81BPPn6BBpd17BGwkcX8TjCDzig58DRoBwxjNyrahAjSSc23pW3swrNV/HbYtVsY
 A0FGJwZGw1pdcDSZ1EvTnbnXwPQypazIpA5UZCeG5oY08PhtW8AoVwH1tkdKwrPii7GW
 pdMPX8F55xf+yhZiLZc/g0cuvvsqVG1hCqVEi6WzFNcfrcxqvRSiLfHXEOWDCL9740vO
 HkhUT28bKBND6lTw4C0KhwwcqiUjWZuZhghM7UCjyRXx7+EN373ZMYG5RHk4BoGdOMrn
 6lvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T9DmXEOJUmlVsSD3RI4iW4MSaXLFo+DhO06v4a8eotY=;
 b=YypeeJkbCOWhxP56kvDx8jx1MfkDyj2r/9v20p8p0pZhDU7+6YskpeDdi6li1FGuPy
 XM4wUeYiH/u7xoVYTI4iVIYk4OOiHznX66bLgbwFQ/oSwuHZRWMYPP7m0ZO6SBNejFmo
 yiEwE1+zGb6C0bg+k2/pxHwsFeAW+i1jBK5wbFdw6D3zAGuZ7iaQUv0ozdBD4cNnGYnY
 EwCK1fdrPyGKJkMnYf9FjS+U76CSPU2sBbjRtVXoVq+oeypYGFSKoUO6D/bfqatP56ZC
 gjiK9oovsjEnTF+i+fdYRBnPUr+RQmXn40OOnl7DiipgqEop5/UTD7hEfsKJj9jwKRAI
 kX8A==
X-Gm-Message-State: AOAM5307vCnE3KPlLH9mXk09/TnuhrPyXTw4foxd3wPcRjhTJ9/Igu4C
 06xXNmKtCG+FnsTh71CVDWwnRA==
X-Google-Smtp-Source: ABdhPJz0+5r2ulXWJh3tZZ/gzCJTSI6JVXbMMNfho1E/UAKTbs5VFdaxNhCXaq5BZHZm6DsCLRVY1w==
X-Received: by 2002:a17:90b:257:: with SMTP id
 fz23mr2480291pjb.162.1611614114691; 
 Mon, 25 Jan 2021 14:35:14 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id z68sm11686162pfb.198.2021.01.25.14.35.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jan 2021 14:35:13 -0800 (PST)
Subject: Re: [PATCH v4 4/4] meson: Warn when TCI is selected but TCG backend
 is available
To: Stefan Weil <sw@weilnetz.de>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20210125144530.2837481-1-philmd@redhat.com>
 <20210125144530.2837481-5-philmd@redhat.com>
 <20210125164746.GE3538803@redhat.com>
 <992cbe66-dfae-7950-0d92-516b2f0c9717@redhat.com>
 <9f22d4b0-34ca-6798-3661-36057609c152@weilnetz.de>
 <30cc0c14-fbec-bb21-2b6b-8e295029bc1f@linaro.org>
 <8f1f2dc6-5ad2-7d48-c2f9-9afa1e4d4065@weilnetz.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <81c810b4-1bd3-631d-4b5b-7e54a27a5b4c@linaro.org>
Date: Mon, 25 Jan 2021 12:35:10 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8f1f2dc6-5ad2-7d48-c2f9-9afa1e4d4065@weilnetz.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/25/21 11:02 AM, Stefan Weil wrote:
> Am 25.01.21 um 20:02 schrieb Richard Henderson:
> 
>> On 1/25/21 8:58 AM, Stefan Weil wrote:
>>> I have no evidence that TCI is less reliable than TCG, so I would not write
>>> that.
>> It can't pass make check-tcg.
> 
> 
> Where does it fail? Maybe an expected timeout problem which can be solved by
> increasing the timeouts for TCI?
> 
> I have just run a local test of `make check-tcg` with native TCG and with TCI
> and did not see a difference. But I noticed that in both cases many tests show
> "skipped".

You need to enable docker or podman for your development, so that you get all
of the cross-compilers.

Then:

  TEST    fcvt on arm
TODO ../qemu/tcg/tci.c:614: tcg_qemu_tb_exec()
../qemu/tcg/tci.c:614: tcg fatal error
qemu: uncaught target signal 11 (Segmentation fault) - core dumped

  TEST    float_convs on m68k
TODO ../qemu/tcg/tci.c:614: tcg_qemu_tb_exec()
../qemu/tcg/tci.c:614: tcg fatal error
qemu: uncaught target signal 11 (Segmentation fault) - core dumped

which is of course one of the TODO assertions.
It's positively criminal those still exist in the code.


r~

