Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 827185068DF
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 12:37:41 +0200 (CEST)
Received: from localhost ([::1]:42780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nglEq-0002mX-77
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 06:37:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nglAw-00019y-2O
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 06:33:38 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:44000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nglAs-0004Ts-Jj
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 06:33:37 -0400
Received: by mail-ej1-x62e.google.com with SMTP id g18so31934581ejc.10
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 03:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=92PkayH47gYdDgz/dkI3iMDfoMCwptrM3jxWU3zpS/0=;
 b=qySqjhWetxqj4QtBxqRXWx1pJdPw1gyczWFwJ+BYlKPjkA+xD3BrQRFyMiUl02xliB
 PvZ+vrVRLaViGEGV6WqkN5lEwh7NQrcDHK1j9g0KVDafGGPua+s2a53xEZNxIzciLVVA
 xcgTrvUd1FoME3KbhQ6vw/wDQqaf3kLBaq9FWRYO8ocQ1ptmiaoMOt29WfOlwBfiG9mE
 xrgpO1xeg7mI1Z+UWKec7BO4f0wieOHi1cZ5s8qixcyU2gyeIjKVU1wFbPDrxsfs3/m3
 3HyUtrXiwjSUSauQz0SKY2S1+ThQ4M9a5Uq0Chn4putoaDI3TqIxN7mjw6Z/C8TMkBYC
 Qnow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=92PkayH47gYdDgz/dkI3iMDfoMCwptrM3jxWU3zpS/0=;
 b=iidMlnDmTBikq4YVqZNSOePPtukyB87iv+U4ARKLawtZ5Uxfn7Pn9HeqCQrvt5PzxX
 Vd+8LW9eODD4MCl/FBQF/LsNQviTWTL6ku50gSIduDpRj6NV0OGNFvaV/mwLqTyekasg
 U8CSFFN3adLW4g3UdnjjwfgyNvobNaAfUSJG8NIcRlYFi1qpNE83S5nxzuzA3thGr6UR
 MCav3u2ltFVZc/39uPiSNU3wxRn5DeWfHy7XwVe+fDLcwBjabH2yjpbpKro+w2TVX3aI
 k2xrgIGAMdmX2CeY2z3kWL1UY7+lPnvx//8oU6yo8CwGFb6qJiEvpSBD72U2aNDStGk2
 5RGA==
X-Gm-Message-State: AOAM532tIfN0XDrstupjPJVoK6i62yb9IO/9FrR1HLocxWegebiQYVN4
 8ZN9hpIe/2uf9stmVadPg0wlKw==
X-Google-Smtp-Source: ABdhPJy5Yg9TxSemSe/i9lQwWzyMq7uBxJiYe8RfepNyCxcaLDfpGhKU8c71YyYgmBlIuzA7lMD/hA==
X-Received: by 2002:a17:907:97cc:b0:6df:83bc:314c with SMTP id
 js12-20020a17090797cc00b006df83bc314cmr12704784ejc.587.1650364413048; 
 Tue, 19 Apr 2022 03:33:33 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 la16-20020a170907781000b006efa121a837sm2458037ejc.98.2022.04.19.03.33.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 03:33:32 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7940B1FFB7;
 Tue, 19 Apr 2022 11:33:31 +0100 (BST)
References: <SN4PR0201MB8808BF460C02884C603641A4DEF39@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <aa16cc6b-0ff9-5870-118b-ceb24b584fe4@linaro.org>
 <SN4PR0201MB88081EEA0FCEB2A1B3B49B87DEF29@SN4PR0201MB8808.namprd02.prod.outlook.com>
User-agent: mu4e 1.7.13; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Taylor Simpson <tsimpson@quicinc.com>
Subject: Re: Question about direct block chaining
Date: Tue, 19 Apr 2022 11:24:22 +0100
In-reply-to: <SN4PR0201MB88081EEA0FCEB2A1B3B49B87DEF29@SN4PR0201MB8808.namprd02.prod.outlook.com>
Message-ID: <87k0blxszo.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Philippe =?utf-8?Q?Mathi?= =?utf-8?Q?eu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Taylor Simpson <tsimpson@quicinc.com> writes:

>> -----Original Message-----
>> From: Richard Henderson <richard.henderson@linaro.org>
>> Sent: Monday, April 18, 2022 10:38 AM
>> To: Taylor Simpson <tsimpson@quicinc.com>; qemu-devel@nongnu.org
>> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> Subject: Re: Question about direct block chaining
>>=20
>> On 4/18/22 07:54, Taylor Simpson wrote:
>> > I implemented both approaches for inner loops and didn't see speedup
>> > in my benchmark.  So, I have a couple of questions
>> > 1) What are the pros and cons of the two approaches
>> (lookup_and_goto_ptr and goto_tb + exit_tb)?
>>=20
>> goto_tb can only be used within a single page (plus other restrictions, =
see
>> translator_use_goto_tb).  In addition, as documented, the change in cpu
>> state must be constant, beginning with a direct jump.
>>=20
>> lookup_and_goto_ptr can handle any change in cpu state, including indire=
ct
>> jumps.
>>=20
>>=20
>> > 2) How can I verify that direct block chaining is working properly?
>> >        With -d exec, I see lines like the following with goto_tb + exi=
t_tb but
>> NOT lookup_and_goto_ptr
>> >        Linking TBs 0x7fda44172e00 [0050ac38] index 1 -> 0x7fda44173b40
>> > [0050ac6c]
>>=20
>> Well, that's one way.  I would have also suggested simply looking at -d =
op
>> output, for the various branchy cases you're considering, to see that al=
l of the
>> exits are as expected.
>
> Thanks!!
>
> I created a synthetic benchmark with a loop with a very small body and a =
very high number of iterations.  I can see differences in execution time.
>
> Here are my observations:
> - goto_tb + exit_tb gives the fastest execution time because it will
> patch the native jump address

As we would expect.

> - lookup_and_goto_ptr is an improvement over tcg_gen_exit_tb(NULL, 0)

Yes - mainly saving the cost of prologue and coming out of generated
code to the main loop. However once we get to tb_lookup and fail the
tb_jump_cache its going to take some time to get a block via QHT.

The tb_jump_cache is pretty simple in its implementation but I don't
know if we've ever decently characterised the hit rate and if it could
be improved. I think we already have slightly different hashing
functions for user-mode vs softmmu.

(aside I suspect the trace_vcpu_dstate check can now be removed which
should save a bit of time on the hash function).

--=20
Alex Benn=C3=A9e

