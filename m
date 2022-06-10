Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A49546892
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 16:42:10 +0200 (CEST)
Received: from localhost ([::1]:44758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzfpx-0007eT-MW
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 10:42:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nzfol-0005md-Se
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 10:40:55 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:39628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nzfok-0002j5-BR
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 10:40:55 -0400
Received: by mail-ed1-x52c.google.com with SMTP id v25so35584788eda.6
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 07:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=3eVwBDQXWSbZircOBE+dnVlBoE8W3Wk5CJCSpgOms4A=;
 b=Lfr+5uB9xDWWLh2J7CTeYZRTib8sbAFPTyuUcwF7abqoMOzL/spG0kXKi/s++SavDw
 GGgk9k3j/zb18Hf/PiFrE9newkigS+pDW3NNLVoRfktxyavcnAfDT/49XmxK7zMoW1Qc
 yyRWjW4gZ/hSOGM8yvCuzrkVZdK3mbdmvwUyua9pxdNqC8RTgwqgqGNDzawEod8hx3QT
 wYBw689C6pPcrx6SrN4U+rUKBliKfoashyeFoQbdDdXZxdRB6cWceqWs669l+gT4YoCT
 VKIlCunMWQ7TxK44d49gMj6kjiPmjlA3i/lQM37zZG9W940rqObAMdLlIDgXQVSPj8pG
 rDDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=3eVwBDQXWSbZircOBE+dnVlBoE8W3Wk5CJCSpgOms4A=;
 b=7gZ+XI0oHxH93sXKEhYETsDXa7IxaT6bjs5NFeFysI5bo7cm81DJKtYgjVwClwXCfF
 x9JEn25qqIfc7HEYwlRWQo5eIoNlmijRbvOsXE7PaGCBe27XynUEfDLZxos1j1OiHgLJ
 yXoRxmH6K4E16IHcdkn4YUx2TsC88wi1i8m4MnF+cMLtN2eDpqKzFNXSydXgObbejc5M
 133CbDkmhxX5TZq80eJvC3thg9wlQceecPU6R9A7OLhXsC2CAFsuqYJQXoeEmQHbKpOr
 cQ51TcnPcJpaUtt2RtonFkUc4fYEibnxB28UvUamzRLLtJaXCz5PjjMM/5sfW/KQITM0
 Yw/Q==
X-Gm-Message-State: AOAM532m/7Yq4e5+4R0WKOYAGPq2skzt3RTBtWU4iLUuKuqVW1qKUrHX
 y195HNFry/ImSbEO0WPgrEByFw==
X-Google-Smtp-Source: ABdhPJzICJNUx1A2cF7u+S+NOaTEf20ttFrDGVkFX1aBqVtpARaQfqN2MKKyJHWtJC+xoaNWSD24yA==
X-Received: by 2002:a05:6402:3484:b0:42e:1f3b:4a4c with SMTP id
 v4-20020a056402348400b0042e1f3b4a4cmr46826430edc.326.1654872052845; 
 Fri, 10 Jun 2022 07:40:52 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 cx12-20020a05640222ac00b0042bd6630a14sm16968945edb.87.2022.06.10.07.40.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 07:40:51 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0C00B1FFB7;
 Fri, 10 Jun 2022 15:40:51 +0100 (BST)
References: <20220526190053.521505-1-peter.maydell@linaro.org>
 <CAFEAcA9CA_eD19OcvXh_UmZyV3Lu21tC1=X04eMYkifz3+7UrQ@mail.gmail.com>
User-agent: mu4e 1.7.26; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Liviu Ionescu
 <ilg@livius.net>
Subject: Re: [PATCH 0/2] gdbstub: don't crash if no gdb attached and gdb
 syscall attempted
Date: Fri, 10 Jun 2022 15:40:45 +0100
In-reply-to: <CAFEAcA9CA_eD19OcvXh_UmZyV3Lu21tC1=X04eMYkifz3+7UrQ@mail.gmail.com>
Message-ID: <8735gcshsd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52c.google.com
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


Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 26 May 2022 at 20:00, Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>>
>> This patchset fixes a couple of bugs reported by
>> Liviu Ionescu related to semihosting syscall handling.
>>
>> Firstly, if the user sets up the gdbstub but doesn't connect a gdb
>> (ie passes '-s' but not '-S'), and we try to use gdb for semihosting
>> syscalls (either because the user explicitly set target=3Dgdb or else
>> via autodetection) then we currently segfault.  This patch adjusts
>> the behaviour so that "gdbstub initialized but no gdb attached to a
>> vCPU" is treated the same way we already treat "gdbstub not
>> initialized".
>>
>> Secondly, we weren't handling commandlines where
>> --semihosting-config appears multiple times: these ought to be
>> merged together but instead we were effectively ignoring
>> all but the last one.
>>
>> thanks
>> -- PMM
>>
>> Peter Maydell (2):
>>   gdbstub: Don't use GDB syscalls if no GDB is attached
>>   semihosting/config: Merge --semihosting-config option groups
>
> I'll take these via target-arm.next.

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

