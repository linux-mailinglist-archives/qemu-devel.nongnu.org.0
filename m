Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B462A3CC4ED
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 19:37:57 +0200 (CEST)
Received: from localhost ([::1]:47782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4oGC-0006pf-PX
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 13:37:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m4oFP-0006B4-DI
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 13:37:07 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:41571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m4oFN-0007MV-RM
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 13:37:07 -0400
Received: by mail-wr1-x42a.google.com with SMTP id k4so15818972wrc.8
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 10:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Sn6M/r+F21AWqOr3U0dDH0d3GtCDgIibQjaVlZEpegU=;
 b=G6V0sm7IuJ9Yu04xb1i+GzhwYFBdsP3Z8aWDRBPOwCERNCoTgUzcO6RhFt51ve2ae0
 rNGWySa1ef72WPIrnNz7V4XanKYf/pVy71Tmq/B4UwzI7D52MsnV93JOfYPamp7+/5B9
 ayoKpRQRYE5ZXNkkPEvf6B6HDbm0zNwA29ydTikp2RZSpiy1RGhy2+BgXIoovRHZBJuG
 sKDGuFy5XmVy4IK5pV/d0HGcm0CuGK3aq3U8gYKrifG6jDz/D1s5KZd0mGV/YmIcq9TS
 0Po3fEqkjDZuhY1DzAhfXUH/d5LTGL+GE1+WraKj9IEv5F1ARFgBTdhFD3l2uQk1/Rjs
 hDdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Sn6M/r+F21AWqOr3U0dDH0d3GtCDgIibQjaVlZEpegU=;
 b=kAQ5I3/b/QzdIlrNtXWJ3ouYrf+mP868ziyMPqOqzlsZ8xDAy4PzE8ujzz3i1RX17K
 brQ7B95mdL2/DCmBTKddsm4rs4P9HBRMw5Cvhsge+DN4iwkRR34Ga/l5Lm06oY1/1uwj
 wB+L8b1Ga7kCRXY0rm4CSeNeAejqIRKIiEwC6NwVfWc4j/pOk8bfj1K7HhZTFSRowR7t
 TfttOdGcKTHVVJQQ1gfBE/J6Ve/AjwPWgnUqiVsoVjRWBBjkQ1dfn8krkuU93MIFUKSZ
 UhTnGLpjmHdAYnODF4E70qhziXISzONpkelVdqv2wc0/Bi/zjEEKvMWirgKtmYbn6Mfc
 Y2FQ==
X-Gm-Message-State: AOAM533LimOE+BJO9PIUypjqMX45/WrNFI0BxbH80So4OGbNYIGW/pjk
 QHSFkrOjai7xdugN1oAIetNkeQ==
X-Google-Smtp-Source: ABdhPJzhKccWiITRK0L+4jcutReVdI1wqiFvDgsoezSHrCvHq5MfKbLVoOd18sS7sU5Efc+QoYRWDA==
X-Received: by 2002:a5d:59a1:: with SMTP id p1mr20101674wrr.100.1626543424209; 
 Sat, 17 Jul 2021 10:37:04 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x8sm14290142wrt.93.2021.07.17.10.37.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 10:37:02 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 94E4B1FF7E;
 Sat, 17 Jul 2021 18:37:01 +0100 (BST)
References: <20210712154004.1410832-1-richard.henderson@linaro.org>
 <20210712154004.1410832-4-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 03/10] accel/tcg: Add CF_NO_GOTO_TB and CF_NO_GOTO_PTR
Date: Sat, 17 Jul 2021 18:36:55 +0100
In-reply-to: <20210712154004.1410832-4-richard.henderson@linaro.org>
Message-ID: <87fswc3kqq.fsf@linaro.org>
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
Cc: mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Move the -d nochain check to bits on tb->cflags.
> These will be used for more than -d nochain shortly.
>
> Set bits during curr_cflags, test them in translator_use_goto_tb,
> assert we're not doing anything odd in tcg_gen_goto_tb.  The test
> in tcg_gen_exit_tb is redundant with the assert for goto_tb_issue_mask.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

