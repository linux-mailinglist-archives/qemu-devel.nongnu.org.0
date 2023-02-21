Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A6169DE58
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 12:00:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUQNB-0002Yj-Of; Tue, 21 Feb 2023 05:59:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUQN6-0002YH-3V
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 05:59:44 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUQN4-0004u2-E5
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 05:59:43 -0500
Received: by mail-wr1-x42f.google.com with SMTP id c5so4641104wrr.5
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 02:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gyY5ygyxKsmf7swk3BkLsHeuZym4yae/S1GrxYv1U8o=;
 b=rjJLdvzplpsKNWHEI5hz5nwciuL4VXA53Etyp27IjxayCsv+lI2ZMRtQ+RqYzxQZGH
 osyBwGWnVA1r5zb1o8TzzWvUgmL/vyI5F4Kk5ezLL+wn2tAwNWC/CTN0xlMK1ys0mQj3
 wUyoqDJQKw+GXl+pBGMpqQlySQLJZT18hNmjpIV5pwGJabiYysHNLVqhAIiLSKLB8DZR
 cT3qeENDsn/PONmXNF9WxwDk7sreI4Tln0MNYu3BM1yP/xCQ1zqvo0OCerh5pYGDFlru
 q+YUM5ZHTCoFimSWIlWTROoGN5LSP/HgmitIiH4lKV6F/r0xYvehx8pYYbHsKytG6YIx
 dVpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=gyY5ygyxKsmf7swk3BkLsHeuZym4yae/S1GrxYv1U8o=;
 b=1E89Jbu8oc2aS3APFDQD3DpyjoPQa7/Lu5Ovfihf48LNFUrhmx7nyir2OY2AdFqFQw
 vN1ka6uBu+gm/UV8tpRXTMCj2qI93HVV4O7NkxBJKbPLlxzEfnITHUo491SYGxyTuh8f
 WWeP7c8hIKk2mID1TL1+dczy0A3QT4LNM6Qn4Y2h/Yt4Y5HYH2fv3OmZ52mdaXzj4OzW
 lGDahw/G59X0T4Pf3t+yJv1Epy8P0Cn8+hbbchqCrIffzL6/mPs2NTA7sd4a86u7gpNw
 O0ImrUTXdP3xwxGej50KN4nQp0/EM1OfydpHDq28n7SF/ykDT9qpri8kd5g1rCUP89PP
 V7hg==
X-Gm-Message-State: AO0yUKXuRM/RBJWF1NhCNHO9Otx96IJLQNc4e8gS+BH2yMoQoFSkkOro
 TEI3lRJNmCC+OSlaWzVJPAEbPA==
X-Google-Smtp-Source: AK7set/Qtnw5iqMPrTgmtvjJpew9lU9U/HxzdiCuMDUAWnM7UYtkCh5PQHf1raduxjg6SH6pnH3Z+g==
X-Received: by 2002:a5d:58c4:0:b0:2c5:594a:a4f0 with SMTP id
 o4-20020a5d58c4000000b002c5594aa4f0mr4117045wrf.58.1676977180672; 
 Tue, 21 Feb 2023 02:59:40 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 t6-20020a5d4606000000b002c55306f6edsm7574678wrq.54.2023.02.21.02.59.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 02:59:40 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EF0761FFB7;
 Tue, 21 Feb 2023 10:59:39 +0000 (GMT)
References: <20230105164320.2164095-1-alex.bennee@linaro.org>
 <20230105164320.2164095-7-alex.bennee@linaro.org>
 <0daeb57d-28ec-4595-8b2e-32e4e01348d8@linaro.org>
 <87v8jvqppn.fsf@linaro.org>
 <8e5e407e-641a-f3b3-5547-bd0f3076aaf9@linaro.org>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 06/21] gdbstub: move GDBState to shared internals header
Date: Tue, 21 Feb 2023 10:58:33 +0000
In-reply-to: <8e5e407e-641a-f3b3-5547-bd0f3076aaf9@linaro.org>
Message-ID: <87r0ujqo6c.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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


Richard Henderson <richard.henderson@linaro.org> writes:

> On 2/21/23 00:24, Alex Benn=C3=A9e wrote:
>> Richard Henderson <richard.henderson@linaro.org> writes:
>>=20
>>> On 1/5/23 08:43, Alex Benn=C3=A9e wrote:
>>>> We are about to split softmmu and user mode helpers into different
>>>> files. To facilitate this we will need to share access to the GDBState
>>>> between those files.
>>>> To keep building we have to temporarily define CONFIG_USER_ONLY just
>>>> before we include internals.h for the user-mode side of things. This
>>>> will get removed once the state is fully moved.
>>>
>>> You don't have to have this hack if you don't ...
>>>
>>>> +typedef struct GDBState {
>>>> +    bool init;       /* have we been initialised? */
>>>> +    CPUState *c_cpu; /* current CPU for step/continue ops */
>>>> +    CPUState *g_cpu; /* current CPU for other ops */
>>>> +    CPUState *query_cpu; /* for q{f|s}ThreadInfo */
>>>> +    enum RSState state; /* parsing state */
>>>> +    char line_buf[MAX_PACKET_LENGTH];
>>>> +    int line_buf_index;
>>>> +    int line_sum; /* running checksum */
>>>> +    int line_csum; /* checksum at the end of the packet */
>>>> +    GByteArray *last_packet;
>>>> +    int signal;
>>>> +#ifdef CONFIG_USER_ONLY
>>>> +    GDBUserState user;
>>>> +#else
>>>> +    GDBSystemState system;
>>>> +#endif
>>>
>>> ... nest these.  What's the point?
>> Well you end up having to ensure the chardev definitions are then
>> available in all files that include internals.h and I'm not sure that is
>> better:
>> --8<---------------cut here---------------start------------->8---
>> modified   gdbstub/internals.h
>> @@ -33,18 +33,16 @@ enum RSState {
>>   };
>>     /* Temporary home */
>> -#ifdef CONFIG_USER_ONLY
>>   typedef struct {
>>       int fd;
>>       char *socket_path;
>>       int running_state;
>>   } GDBUserState;
>> -#else
>> +
>>   typedef struct {
>>       CharBackend chr;
>>       Chardev *mon_chr;
>>   } GDBSystemState;
>> -#endif
>
> No, these typedefs and their data can be completely private to the two
> implementations.

Ahh right, so I've split that up now in:

  gdbstub: define separate user/system structures

and its made the subsequent patches much cleaner

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

