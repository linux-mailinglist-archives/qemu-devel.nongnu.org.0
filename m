Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2056839FB6C
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 17:59:12 +0200 (CEST)
Received: from localhost ([::1]:53314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqe8F-0008RD-5I
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 11:59:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqe1a-0006rg-6N
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 11:52:18 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:35373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqe1Y-0005sp-HC
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 11:52:17 -0400
Received: by mail-wr1-x42a.google.com with SMTP id m18so22149820wrv.2
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 08:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ARpbznkBzeQCsqFJBGLNaFBgArQuO4Av5n2rqhVHpgc=;
 b=Qpisw8netseL752+4VCEr3GshVepdDnhDq5bRNsLXcTWEyNMMwPa7yO0BiVQcpdrm0
 knhH4Vynn1gnluN/11IdGmp3vFKWxY5/tscbMxBNb0DlWlxkVh7t0yNdZm11+N0Ajwen
 2ace6wpqpLSh8XDOxExGjA0Xw47SVHva9xbAXDXlIih1s9UtkV6JeprL74DZMlPkb66F
 C2fdV/iYJlSxjWGEjGJ4TKdH5vQGE8N5X3dMv2nu5uyMqsevJNtWWzKQSRXKugDThNQ5
 ibia71YONiLg9Bh6G3q/0h1xvMuNazpFrSaPAvjHnlrsTiiEj55yny0bEIK1V4w4KELp
 KHfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ARpbznkBzeQCsqFJBGLNaFBgArQuO4Av5n2rqhVHpgc=;
 b=b1R9/N1l99+Q3056UYoty89zieK7JTh2APg+Zy0bHLmS87zyf4v2gbcTO4Z+xHFyM3
 wSCLt3nvMk+emTOeYTyVU/uTHcwp9IKhNW/5ova4Yuzz56Haw9/9qvcS9krlrPJR5vRM
 f0u86hj115UGQI9XVlI8CZeYTry3Nm1zd83Q4y+nrwq6vOdZNzRcy2mwmYvZjMQTmWkj
 tYSaA8x1h78HPqs/aHF9YwEHsel9J36cmvH/1WuUdh2l+vCuIUCuRfYWOke9bU9VSRN+
 YMLGzm1+vRN4mXqxCYP0yrRsY7jWLQi6tWcv2OjdiKVrTQ6dc3J1SBO4v1TYhTsFReAS
 UT3g==
X-Gm-Message-State: AOAM532WPciTyj5ZFXeTmSDEWq4l8apouiv4ya+0nXV+Vg4fWCjcjM/D
 zH1E31NCpYMzqavjDhGOPEqJGQ==
X-Google-Smtp-Source: ABdhPJwCTHZ7luq5uSZGFyyYi5yEOmHMwR1LOuNWRlDYgoKEndEClDpEoSe2/6Dbouq4iZ3vty52JQ==
X-Received: by 2002:a5d:494c:: with SMTP id r12mr23104803wrs.421.1623167534920; 
 Tue, 08 Jun 2021 08:52:14 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b15sm6677071wrr.27.2021.06.08.08.52.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 08:52:13 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 298621FF7E;
 Tue,  8 Jun 2021 16:52:13 +0100 (BST)
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-14-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 13/28] accel/tcg: Pass down max_cpus to tcg_init
Date: Tue, 08 Jun 2021 16:44:11 +0100
In-reply-to: <20210502231844.1977630-14-richard.henderson@linaro.org>
Message-ID: <87a6o0l5g2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Start removing the include of hw/boards.h from tcg/.
> Pass down the max_cpus value from tcg_init_machine,
> where we have the MachineState already.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
<snip>
> -static size_t tcg_n_regions(void)
> -{
> +    /*
> +     * It is likely that some vCPUs will translate more code than others,
> +     * so we first try to set more regions than max_cpus, with those reg=
ions
> +     * being of reasonable size. If that's not possible we make do by ev=
enly
> +     * dividing the code_gen_buffer among the vCPUs.
> +     */
>      size_t i;
>

heh TIL. That said currently this "fancy" allocation method does nothing
for user-mode code generation which just gets to share one big code gen
buffer.

Thinking aloud I do recall an alternative approach is to have regions
more closely aligned with the guest memory map with a region lock which
any thread can acquire when it needs generate code for the guest region.

In user-mode for example that would be a region per DSO. In system mode
it may be simpler to have the current per-vCPU layout but consider if
all kernel mode code is generated in one buffer and can patch jumps
within that region? Of course any TLB flush that hits code in that
region would force regeneration of all that code but it shouldn't happen
for kernel mode code.

Anyway random musings aside:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


--=20
Alex Benn=C3=A9e

