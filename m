Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A5348F635
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Jan 2022 10:49:27 +0100 (CET)
Received: from localhost ([::1]:56008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8fgb-0001DZ-NY
	for lists+qemu-devel@lfdr.de; Sat, 15 Jan 2022 04:49:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n8ffO-0000Ly-6I
 for qemu-devel@nongnu.org; Sat, 15 Jan 2022 04:48:10 -0500
Received: from [2a00:1450:4864:20::535] (port=45784
 helo=mail-ed1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n8ffM-0007X9-HN
 for qemu-devel@nongnu.org; Sat, 15 Jan 2022 04:48:09 -0500
Received: by mail-ed1-x535.google.com with SMTP id z22so43336778edd.12
 for <qemu-devel@nongnu.org>; Sat, 15 Jan 2022 01:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ugqvRi/CY++lmNcWtCHdm72LDKF/MSDdQpm+7XBxcHQ=;
 b=hlPGjN5nF2RA0GoPbpyprP7+yiqsqwpKClS5KXxF06JqmmFDzSglPGN40viuNsGXDZ
 A8oy/6HViLhKAXjCIT9N+PCBCYM2Exz9zv9Q4F+5v5jNHsQ+c4oRa9leaDCNceFBQW4i
 NV3D1yaE8BreRjK35XMFg+EJRV/8Zhe6JaPj0HPGgOwEFfXtDgUf77FWBSFDk32ypLIZ
 pNdH/+r7DfolK+d8oA0ysj8aPrEi/h4tw/JJiVoO9m++vaV8ujEzzXuVoX2S0Lg0oyuX
 L+cPWjtSKVRgt6YTzcNDL3TTCyIXFXDJAnPJJoSDvTp5Za+27WdDhE1y/uevxnD7B3wO
 3T6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ugqvRi/CY++lmNcWtCHdm72LDKF/MSDdQpm+7XBxcHQ=;
 b=o7ZPXtGaWl+gBugf22J4VtZIOSrRPvvDrOS4nWM3ymv7z4v5JAvQwnGeyCATBqW0Yz
 d8gnPKxdgykJcri83ARZElSWrgqK0E6iQQ8S2MP/iL/hJ8O5Etc6D6Qosb/sCAECcUv+
 tiEHPT5hqkIjuN3V7sfWfHU/kYfrFPNyPW3nPbzMIvnhYgIIY8eN3Y5R7MEMhuAPjg8w
 pO+bOlcIBRbzYvl26j3U+lioMmclkBYqhK5gspE8tefWRBe8Y3nqHI9h2nbSk0cHrBnZ
 cSi3JqJabc2oQ55UIqHzl0jZdxlpd5K6NEFUkdiexOSAsXeW1S4mDp/VQiFaycZAX6na
 yXbg==
X-Gm-Message-State: AOAM53093iSeVICIl5rCENxCJ0wyOj/+BmM1nJRYwDjLRy55S+DNtuaD
 zQ3LCk9zeIXh+XPRYdM2cv/RrQ==
X-Google-Smtp-Source: ABdhPJy7K7a43btZC+K0xvHvL72/8FHGLxtIq7kArkHVatL+SC98lTDU3tyL9GY5QdMyIRk87xmxlQ==
X-Received: by 2002:a05:6402:147:: with SMTP id
 s7mr12557416edu.8.1642240087032; 
 Sat, 15 Jan 2022 01:48:07 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l16sm3244979edb.3.2022.01.15.01.48.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jan 2022 01:48:06 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4D10F1FFB7;
 Sat, 15 Jan 2022 09:48:05 +0000 (GMT)
References: <20220114155032.3767771-1-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC] linux-user: Remove stale "not threadsafe" comments
Date: Sat, 15 Jan 2022 09:46:17 +0000
In-reply-to: <20220114155032.3767771-1-peter.maydell@linaro.org>
Message-ID: <87mtjxs52i.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::535
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> In linux-user/signal.c we have two FIXME comments claiming that
> parts of the signal-handling code are not threadsafe. These are
> very old, as they were first introduced in commit 624f7979058
> in 2008. Since then we've radically overhauled the signal-handling
> logic, while carefully preserving these FIXME comments.
>
> It's unclear exactly what thread-safety issue the original
> author was trying to point out -- the relevant data structures
> are in the TaskStruct, which makes them per-thread and only
> operated on by that thread. The old code at the time of that
> commit did have various races involving signal handlers being
> invoked at awkward times; possibly this was what was meant.
>
> Delete these FIXME comments:
>  * they were written at a time when the way we handled
>    signals was completely different
>  * the code today appears to us to not have thread-safety issues
>  * nobody knows what the problem the comments were trying to
>    point out was
> so they are serving no useful purpose for us today.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Marked "RFC" because I'm a bit uneasy with deleting FIXMEs
> simply because I can't personally figure out why they're
> there. This patch is more to start a discussion to see
> if anybody does understand the issue -- in which case we
> can instead augment the comments to describe it.
> ---
>  linux-user/signal.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/linux-user/signal.c b/linux-user/signal.c
> index 32854bb3752..e7410776e21 100644
> --- a/linux-user/signal.c
> +++ b/linux-user/signal.c
> @@ -1001,7 +1001,6 @@ int do_sigaction(int sig, const struct target_sigac=
tion *act,
>          oact->sa_mask =3D k->sa_mask;
>      }
>      if (act) {
> -        /* FIXME: This is not threadsafe.  */
>          __get_user(k->_sa_handler, &act->_sa_handler);
>          __get_user(k->sa_flags, &act->sa_flags);
>  #ifdef TARGET_ARCH_HAS_SA_RESTORER
> @@ -1151,7 +1150,6 @@ void process_pending_signals(CPUArchState *cpu_env)
>      sigset_t *blocked_set;
>=20=20
>      while (qatomic_read(&ts->signal_pending)) {
> -        /* FIXME: This is not threadsafe.  */
>          sigfillset(&set);
>          sigprocmask(SIG_SETMASK, &set, 0);

Looking at the history those FIXMEs could have been for code that they
where attached to. Could the thread safety be about reading the
sigaction stuff? I would have though sigaction updates where atomic by
virtue of the syscall to set them...

Anyway looks old to me:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

