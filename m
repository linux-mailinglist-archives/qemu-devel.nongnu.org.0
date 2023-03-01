Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C265B6A6BE3
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 12:43:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXKqU-00077J-Dj; Wed, 01 Mar 2023 06:42:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pXKqS-00077A-T4
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 06:42:04 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pXKqR-0007Lo-3v
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 06:42:04 -0500
Received: by mail-pg1-x52c.google.com with SMTP id s17so7530749pgv.4
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 03:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=braap-org.20210112.gappssmtp.com; s=20210112; t=1677670921;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xfc8giXJb1WnAnRHusX4u9naZC93lx6FXlxdPeKoHaA=;
 b=hGN0qHq1GSP19WdOinCmzRAsD6uHFfuYS5JQ2cEpr71T38cCeCcYmeQtb8WggshV7n
 SZI2omRpwQ6FODGvtg1x7qdbgqJEcj1ya5SCXNj2Y9dyrmBQbOjPZRYXjpX7CrDpMBCv
 tOUiSKt6UhzG9v+2mxi7UYWeXK5YqMsaKkWQUM96yzy7CSq4aUIcZajqvHBFr6M8Wy0b
 yVSL53tWtbKh4mVUHmTsMGNQRxaN/PxrLbuLLyTOvHlJtgPoP6TdAnXWuRdw/xrch9Ph
 7SyQXvio2+zfNhRDU/ve48mgQCI3iw7rUkoc4jTs9cw1XxwtjaqXp9GYqox/vkmI1d4Z
 1lcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677670921;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xfc8giXJb1WnAnRHusX4u9naZC93lx6FXlxdPeKoHaA=;
 b=BGV7KckWxoqRStqy5VSzFkkY9X301wV5Cz2UCaCy/Wn93uIWwbp5iHkUUKfJwIc+J7
 GjRMlL36qqwrxXruuzuHTVVbb/GiaKTOiaVstqFAyLXFfRM5YYeuq0R5ei3LPN+iMGSd
 E7yOH9jnlQuz5DTZlnP3Hr/kFeYU1RxRy9AfV0NxgBGk/PBfhlAImHVZYrSUQww77hmF
 zzXPnt0ai5F7N9a0xfYju3cNxlZGQS1K3XgIPP5h1QFR/EzbaCHQj3Q+/t/qzqpovEuD
 tzaRsYeUgVFQr7+OhkSQ//MC/P8M0YpHrDk4tF+YoVBIKcJDln7ufiGJX+uNNnWO7YbN
 awoQ==
X-Gm-Message-State: AO0yUKU3mWUz40FbfBD/7XX413sghBQUKwCWV8lx8fcGMqtlLCW2JEw3
 ZM08fcoWsceKf00GaxZ3gjtlQA==
X-Google-Smtp-Source: AK7set8rYI1G6woqHbNZATnaXPu67aTjCP5g5DhbMiqorxzuoMLL8+6S6vOA1U5fp1MceNbjVtZ29A==
X-Received: by 2002:aa7:9acc:0:b0:600:cc40:258c with SMTP id
 x12-20020aa79acc000000b00600cc40258cmr5445007pfp.10.1677670921026; 
 Wed, 01 Mar 2023 03:42:01 -0800 (PST)
Received: from localhost ([169.150.203.33]) by smtp.gmail.com with ESMTPSA id
 z3-20020aa785c3000000b00593225b379dsm7750190pfn.106.2023.03.01.03.41.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 03:42:00 -0800 (PST)
Date: Wed, 1 Mar 2023 06:41:56 -0500
From: Emilio Cota <cota@braap.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Aaron Lindsay <aaron@os.amperecomputing.com>,
 "Eli G. Boling" <eboling@draper.com>
Subject: Re: [PATCH] plugin: fix clearing of plugin_mem_cbs before TB exit
Message-ID: <Y/86BPnjTctXT4jz@cota-l14>
References: <20230222043204.941336-1-cota@braap.org>
 <e1fc5734-2548-eba1-cc14-5f2a6482fba0@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1fc5734-2548-eba1-cc14-5f2a6482fba0@linaro.org>
Received-SPF: softfail client-ip=2607:f8b0:4864:20::52c;
 envelope-from=cota@braap.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Feb 28, 2023 at 10:50:26 -1000, Richard Henderson wrote:
> On 2/21/23 18:32, Emilio Cota wrote:
> > Currently we are wrongly accessing plugin_tb->mem_helper at
> > translation time from plugin_gen_disable_mem_helpers, which is
> > called before generating a TB exit, e.g. with exit_tb.
> > 
> > Recall that it is only during TB finalisation, i.e. when we go over
> > the TB post-translation to inject or remove plugin instrumentation,
> > when plugin_tb->mem_helper is set. This means that we never clear
> > plugin_mem_cbs when calling plugin_gen_disable_mem_helpers since
> > mem_helper is always false. Therefore a guest instruction that uses
> > helpers and emits an explicit TB exit results in plugin_mem_cbs being
> > set upon exiting, which is caught by an assertion as reported in
> > the reopening of issue #1381 and replicated below.
> > 
> > Fix this by (1) adding an insertion point before exiting a TB
> > ("before_exit"), and (2) deciding whether or not to emit the
> > clearing of plugin_mem_cbs at this newly-added insertion point
> > during TB finalisation.
> 
> This is an improvement, but incomplete, because it does not handle the
> exception exit case, via cpu_loop_exit.

AFAICT that is already handled -- see the call to
qemu_plugin_disable_mem_helpers upon returning from the longjmp
in cpu-exec.c.

I do think that doing the clearing in C as done in your series
is a better solution. It is simpler and what I most like about
it is that it generates less code. In fact I wanted to mention
that approach as an alternative in the commit log, but forgot
to do so.

Thanks,
		Emilio

