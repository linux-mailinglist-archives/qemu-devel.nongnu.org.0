Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9F6632F76
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 23:01:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxEqW-0001p1-Er; Mon, 21 Nov 2022 17:00:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oxEqU-0001o1-Qt
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 17:00:54 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oxEqT-0005zc-3L
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 17:00:54 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 ay14-20020a05600c1e0e00b003cf6ab34b61so13838708wmb.2
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 14:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2h1fsgtjAC6Lxuh3f/4kzfGu13rV/fTcbDYnc+eiH/s=;
 b=c74qaSEiks7YMmzaninkUChCfdxqUbDjbhEIEVsWrm2DSp/vQOL8I8ZNALayNyJwbS
 m6AonaiP8zcF9gL/nw4T04KtzzZ3fTldc3jLxD+1dCF8zGSVQyc4lgtGZWTkfmV1p3RO
 stb37kpTKTlRKpTDxKDeqSmU7p6H/hOlTTkMbVHASQ3cpat+qXCqhM1zrxB+rizR0Tp+
 frw34NgzrOHWuqYBWOMDaItkismDr3cD9rcRfGoEu/rjJ6SRD27og2GiRPNWajKbMOoX
 IMDDLNde0HPLGVxPlrZUbNjFYes3PjXYI8/3DWJJ50hXWyRBHEqMihKO3izdrVXZRctM
 A0hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=2h1fsgtjAC6Lxuh3f/4kzfGu13rV/fTcbDYnc+eiH/s=;
 b=ZTHOVzCDZV7homLbuN7EWWHIOx/BGjJUSdAWdYaNS2p1x4unrNIIpTJXa/Yu9XUgrA
 Mw6JGn0VEUbkBH8S+932zRzDyJy13Y2QUTFwyh891q8HN1OG7XsworWPNxmxyH9XlUr9
 cxOu3QGI9YTiteHZ7uwBLxTpCddn9Blxu8i61i5Ui62KCZd5QaNml9bX1dFHO4pC3A3N
 Z5sUtUu2OBcql3xXulRDCPk9uEPmD2pryJZzXhP/r+i2GQR+T1SW2+mFwqzt+Qwv5G/3
 f2sxnm4kGtjymDEDhkzzGt28r7vFjBriu2tmje4+PuTM6623qa0qJHgAfW48NnRJFLSE
 iFgA==
X-Gm-Message-State: ANoB5pkAosuZoPjt1fm4m4K2OleXQ0JpBdXUuxiZw4Ph1QG3VUER8mQH
 tv98EfZFc/04CgGUSo9iD1TOnQ==
X-Google-Smtp-Source: AA0mqf7YiBcTGdTyZBqldKDL0JimAcjsKe38ingeks17LqbKCfjVO3MdRrRUUgHrNqAF8nutePw5Ug==
X-Received: by 2002:a1c:ed04:0:b0:3cf:d08d:3eb2 with SMTP id
 l4-20020a1ced04000000b003cfd08d3eb2mr14308021wmh.129.1669068050997; 
 Mon, 21 Nov 2022 14:00:50 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 e15-20020adffc4f000000b00241dec4ad16sm1201067wrs.96.2022.11.21.14.00.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 14:00:50 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 372C91FFB7;
 Mon, 21 Nov 2022 22:00:49 +0000 (GMT)
References: <Y3QNRWUK8BLRQlaQ@strawberry.localdomain>
 <878rkbalba.fsf@linaro.org> <Y3vdIHJrR1k1lmf8@strawberry.localdomain>
User-agent: mu4e 1.9.3; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Cc: qemu-devel@nongnu.org, "Emilio G. Cota" <cota@braap.org>, Richard
 Henderson <richard.henderson@linaro.org>
Subject: Re: Plugin Memory Callback Debugging
Date: Mon, 21 Nov 2022 21:51:02 +0000
In-reply-to: <Y3vdIHJrR1k1lmf8@strawberry.localdomain>
Message-ID: <871qpwc6i6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


Aaron Lindsay <aaron@os.amperecomputing.com> writes:

> On Nov 15 22:36, Alex Benn=C3=A9e wrote:
>> Aaron Lindsay <aaron@os.amperecomputing.com> writes:
>> > I believe the code *should* always reset `cpu->plugin_mem_cbs` to NULL=
 at the
>> > end of an instruction/TB's execution, so its not exactly clear to me h=
ow this
>> > is occurring. However, I suspect it may be relevant that we are calling
>> > `free_dyn_cb_arr()` because my plugin called `qemu_plugin_reset()`.
>>=20
>> Hmm I'm going to have to remind myself about how this bit works.
>
> When is it expected that cpu->plugin_mem_cbs is reset to NULL if it is
> set for an instruction? Is it guaranteed it is reset by the end of the
> tb?

It should be by the end of the instruction. See
inject_mem_disable_helper() which inserts TCG code to disable the
helpers. We also have plugin_gen_disable_mem_helpers() which should
catch every exit out of a block (exit_tb, goto_tb, goto_ptr). That is
why qemu_plugin_disable_mem_helpers() is only really concerned about
when we longjmp out of the loop.

> If I were to put an assertion in cpu_tb_exec() just after the call
> to tcg_qemu_tb_exec(), should cpu->plugin_mem_cbs always be NULL
> there?

Yes I think so.=20

> In my debugging, I *think* I'm seeing a tb set cpu->plugin_mem_cbs
> for an instruction, and then not reset it to NULL. I'm wondering if its
> getting optimized away or something, but want to make sure I've got my
> assumptions correct about how this is intended to be working.

We are expecting some stuff to dead code away (but hopefully in pairs).
We don't know ahead of the instruction decode if it will be a memory
instruction so opportunistically insert our empty helper calls. If no
memory access is done those ops should be gone. This is all done to
avoid doing a 2 pass translate.

Richard,

Have I got that right? I think thats how I remember the TCG code working.

>
> Thanks!
>
> -Aaron


--=20
Alex Benn=C3=A9e

