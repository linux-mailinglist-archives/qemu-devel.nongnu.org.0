Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7D0546741
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 15:19:51 +0200 (CEST)
Received: from localhost ([::1]:35632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzeYI-0002aW-1F
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 09:19:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzeJi-0003Jg-Nu
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 09:04:46 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:41738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzeJf-0003go-Uo
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 09:04:46 -0400
Received: by mail-yb1-xb32.google.com with SMTP id e184so46894402ybf.8
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 06:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2Wy0HmuNgEz32yynGmzF5ZUrhABd42/TP1RDLl4LbaM=;
 b=VwihfmFlQDCgFOGIRRx79DbrmR4aIRpC8J8o+oZoCcFpVvArJTkfsu4AKvI+OtdyTP
 UOb79ct8U0cyZ911rS3QeSsaTuNxoKkRdAGw9kIOc424wTEu+i4+ghKvhQntYobFi+91
 U0A3lXOj0qSiFPvDCC24NlADPioPhrgdoISz6S2sfzxWGThtOsQpND+Z9ip1IJkMIWSm
 EQ3BPZv2Ad/Dk6qXIKWSW40d+Vh1lPTDK0dMjd/2zQyYNtCZ4XEHKqgElBaQev5s9iNY
 auXNymofiHAYm5a01KV0GpHCn211E52tOFjPvwO5R86dNXgauBk9guBpwM7SeikQG9+T
 mhKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2Wy0HmuNgEz32yynGmzF5ZUrhABd42/TP1RDLl4LbaM=;
 b=dzI/nn9VxOegCg3s46Kjo8w5/Am8anFSqdqN/5XNQAGtzLx+aih55+5QPcmntSGzjS
 kBvhnLYaCd+BQH6Ibs7I8jEEczcq1efrGdfFhYUql6GvM7NnFxE0l3Wk134FtNxWBTlY
 QfTmGeuY7MTMj1iDgyKks+bCyx09vxl2TnMWBpHcu2wevjTUVsEZjKMiHa+LnVAkwm5d
 D0FC75saSKiR/kUWWrpvugbPoNHtLzfMlIIvlnFH+zPOn/4WmHFLlUkaSfIRtuEcgSTu
 34B2CSCHfIIddr8jMpypz8pKBS5z7+zwPlsmmRwY6YnqFONA5FajBgrK7nIAbu4/5MIR
 ziKQ==
X-Gm-Message-State: AOAM5310kfndpYSUP/VKgOssXyv1EwBL+jmJNbMlePsYMXJJonkn8caK
 zrIbRL7I6e5JphF3yjkjYBHH2i12PzrJu/1a1vi2OPB2URs=
X-Google-Smtp-Source: ABdhPJwIg9Of2Zy6DYsBjjEOJS4jSGT9h/XTPv+Rzyr47qgZPJrHkYE0vGUvmfetmgoAGVsywEMNMDK6QV1HeHp04wI=
X-Received: by 2002:a5b:d42:0:b0:65c:a0d7:4c6 with SMTP id
 f2-20020a5b0d42000000b0065ca0d704c6mr44281166ybr.193.1654866282711; 
 Fri, 10 Jun 2022 06:04:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220526190053.521505-1-peter.maydell@linaro.org>
In-Reply-To: <20220526190053.521505-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Jun 2022 14:04:32 +0100
Message-ID: <CAFEAcA9CA_eD19OcvXh_UmZyV3Lu21tC1=X04eMYkifz3+7UrQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] gdbstub: don't crash if no gdb attached and gdb
 syscall attempted
To: qemu-devel@nongnu.org
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Liviu Ionescu <ilg@livius.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 26 May 2022 at 20:00, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> This patchset fixes a couple of bugs reported by
> Liviu Ionescu related to semihosting syscall handling.
>
> Firstly, if the user sets up the gdbstub but doesn't connect a gdb
> (ie passes '-s' but not '-S'), and we try to use gdb for semihosting
> syscalls (either because the user explicitly set target=gdb or else
> via autodetection) then we currently segfault.  This patch adjusts
> the behaviour so that "gdbstub initialized but no gdb attached to a
> vCPU" is treated the same way we already treat "gdbstub not
> initialized".
>
> Secondly, we weren't handling commandlines where
> --semihosting-config appears multiple times: these ought to be
> merged together but instead we were effectively ignoring
> all but the last one.
>
> thanks
> -- PMM
>
> Peter Maydell (2):
>   gdbstub: Don't use GDB syscalls if no GDB is attached
>   semihosting/config: Merge --semihosting-config option groups

I'll take these via target-arm.next.

thanks
-- PMM

