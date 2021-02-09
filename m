Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDE0315824
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 22:00:47 +0100 (CET)
Received: from localhost ([::1]:49484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9a7p-0000ZF-2c
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 16:00:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9ZxC-0000RQ-Nx
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 15:49:46 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:41099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9ZxA-0001aO-AE
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 15:49:46 -0500
Received: by mail-wr1-x42d.google.com with SMTP id n6so10878023wrv.8
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 12:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=8N5zSnX4ucBbGwyOemLoQgGCWjnAzEDwJu0H3nwl/YY=;
 b=eJ28As8HT2FKGxAy8sr2T13XC3uiZHNakOOyHH3uvgX1zUfN1YdvuMDZ0c3adKo/sB
 x5ov8UwvrEM0PqYfU0GMQdjqpVW2G7WweTPHvWBQFJMRZHapXGKx5LzvwcDOfEmsTuUN
 F0bbpEOsx6EOqdsTmpxVZmAxpvlOXBLt5I+n99zq9QdxfeoAopdpLJHwJDoYFZDbXCqH
 PHKhPHIb7piV2sXfszcwcmE8Szt+NE+FoVEB4InvapINnV024QPlng0a4hINWK9tMYUZ
 fHAOUCYyUuU2Io+kWodcbjVlvpSjHc84Qi/V9UJr+y3asKjJUioMCu9wl91rm+OpTPX7
 qxsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=8N5zSnX4ucBbGwyOemLoQgGCWjnAzEDwJu0H3nwl/YY=;
 b=qoFBZOO32v80C69423Pl/C8xf5RsCWf7AgKoyxBqOJ2fZEHxK+E7mPfVHjYGcm0rmG
 Jb4U38u9PQ6wgvnQ69z0xS0rukVT5ogxK9mvATsophf+fjSgM0p1/oFwBPpD/cmu+9YW
 386LEpe1OrQGB4t1ckxE3cM+ocq+E3WGN9/5Xwdcd9wId3wPvn+/FIAcHmllOFemIONd
 +wt0MoocrFGOo54ns6WusFffj8yMR7awq4eBYCGzNsCg6oSWK7xqjaSiEp9V49goQSXe
 eHp1vKCb+mVqagnBo805dUn6KLCZvbtQ55XyDNYexSStTt1JJ9ng8gl0euxENFrC5z8p
 hDSg==
X-Gm-Message-State: AOAM531GWJoV/2Ql4U6vD5lk8yCLyhxQs1+YRnOjfAG637spm0VDrspJ
 8iGbLclAZuv6hDKU7liNG2T9GcPJhZKQv+3b
X-Google-Smtp-Source: ABdhPJxtUGV1fccQPe1i8fot1NGmhTNsAueptQtCAncni2N2xLC+/9taB3iPwtS5bYaEtk6T8RL04w==
X-Received: by 2002:a5d:518a:: with SMTP id k10mr19459937wrv.214.1612903782557; 
 Tue, 09 Feb 2021 12:49:42 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y11sm36766112wrh.16.2021.02.09.12.49.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 12:49:41 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5A0831FF7E;
 Tue,  9 Feb 2021 20:49:40 +0000 (GMT)
References: <20210209182749.31323-1-alex.bennee@linaro.org>
 <20210209182749.31323-8-alex.bennee@linaro.org>
 <c5f00dee-fd56-5a7b-64f4-5ae873180246@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v1 07/12] accel/tcg: actually cache our partial icount TB
Date: Tue, 09 Feb 2021 20:49:25 +0000
In-reply-to: <c5f00dee-fd56-5a7b-64f4-5ae873180246@linaro.org>
Message-ID: <87wnvh7yqj.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: qemu-devel@nongnu.org, robhenry@microsoft.com, aaron@os.amperecomputing.com,
 cota@braap.org, Paolo Bonzini <pbonzini@redhat.com>, kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 2/9/21 10:27 AM, Alex Benn=C3=A9e wrote:
>>      /* Refill decrementer and continue execution.  */
>> -    insns_left =3D MIN(0xffff, cpu->icount_budget);
>> +    insns_left =3D MIN(CF_COUNT_MASK, cpu->icount_budget);
> ...
>> +        g_assert(insns_left < CF_COUNT_MASK);
>
> Why both the MIN and the assert?

Lack of faith in MIN I guess ;-)

I'll drop the assert.

>
>
> r~


--=20
Alex Benn=C3=A9e

