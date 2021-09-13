Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF0C409580
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 16:42:07 +0200 (CEST)
Received: from localhost ([::1]:34474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPn9q-0007Ku-Ba
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 10:42:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mPmdS-0005mM-Jh
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 10:08:38 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:36392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mPmdP-00054b-OM
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 10:08:38 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 l18-20020a05600c4f1200b002f8cf606262so7105510wmq.1
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 07:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=sPTyeh14OAqiCnCZ0H4i0wkCcCmCzNwCQ1t43dAxVZE=;
 b=Wo4ay9FwfnvXwVwgK1pUcTclZHAtKBwAtSCKHy7ZJaDwWdTz5qljsPFlDvXz4Hq6SI
 nOsJi+5gsMfK9fvDl2+HRT63G2JnGgPwDgywidFyObHambp7I73oIB+cQ6lzUntz1Bm8
 04WIFczQhU6RrxUjHvQbxz8g0BwAYOwjPj4NL8f699W92xr63ydjy48ZmOZ5JLxj7ez+
 TZzyX/Nx6Al1Cg7M4F62pCMCkMW5kJgAFfRYl7b9M22A0W8cHlIcZbLYcUJnO8eREYI1
 R+Aq2WCdCmhb47SftR3z83V4wvt14rbW6V+4pWexhjcXRGracPo7mXpf6Q4VQBeUEanP
 K69Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=sPTyeh14OAqiCnCZ0H4i0wkCcCmCzNwCQ1t43dAxVZE=;
 b=w2rzBILzRxj2PTUlhSZWEdgzv7Xy0aLd1AYQWXyDI+jbQGM570mf3nNvKCOfoUKxZ0
 nwAShU3AlAqQO29Cg1PzVfar3laREnpP8N7m1BZiH4JKci/29PmvvfBccleueOErNhmm
 8fHcZI8y9Cim6s3V5uCjguYOerJccmCsL0SkeszAl02JfNuXPoffx2UoaJp1MometGGN
 /2AV7i6ZOo30NRCud03a3nad/9JGAa14/SkF8yzfbrQaAmWRUo+XPG50Y68fV/HndNca
 LRjrL+IuOasKG1oqWTujjZFiKkuygMfJhpBBEyM86bBMFMbXoeRqzAwuZ8A23QnXUVaN
 c6wQ==
X-Gm-Message-State: AOAM530II+FQMyqmRBGPhdAi/tQ6knI4AF9fubkNgjb2LqRJxnxDeXz6
 f7Wf1lxXWwTEMb132PWHlO+NiQ==
X-Google-Smtp-Source: ABdhPJyvruI++h2n+zThnn+XZeQY7xg42GZn6prUimosdJBy4kSzjcHX8EetRBxnqE2cWshMOTdizw==
X-Received: by 2002:a7b:cb89:: with SMTP id m9mr11496954wmi.123.1631542112811; 
 Mon, 13 Sep 2021 07:08:32 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f5sm6906898wmb.47.2021.09.13.07.08.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 07:08:32 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5F01E1FF96;
 Mon, 13 Sep 2021 15:08:31 +0100 (BST)
References: <20210903145938.1321571-1-alex.bennee@linaro.org>
 <36bc7691-c0d9-9e18-dade-4d95405dcd62@linaro.org>
 <871r5swztj.fsf@linaro.org>
 <a925ce89-7134-c26a-c967-942f98b71a29@linaro.org>
User-agent: mu4e 1.7.0; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] accel/tcg: assert insn_idx will always be valid before
 plugin_inject_cb
Date: Mon, 13 Sep 2021 15:06:03 +0100
In-reply-to: <a925ce89-7134-c26a-c967-942f98b71a29@linaro.org>
Message-ID: <87h7eova8w.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 9/13/21 3:06 AM, Alex Benn=C3=A9e wrote:
>>> Also, existing strageness in insn_idx being incremented for non-insns?
>> It shouldn't be - it's just using the presence of the memory
>> instrumentation as a proxy for the start of a instruction and dealing
>> with the slightly different start of block boundary.
>>=20
>>> Should it be named something else?  I haven't looked at how it's
>>> really used in the end.
>> We need the insn idx to find the registered callbacks for a given
>> instruction later. We could maybe embed a metadata TCGOp that could
>> track this for us but that might make TCG a bit more confusing as it
>> doesn't really need that information?
>
> We have a metadata op for marking instruction boundaries already:
> INDEX_op_insn_start.

Hmm so we have a separate list for speedy access:

    /* list to quickly access the injected ops */
    QSIMPLEQ_HEAD(, TCGOp) plugin_ops;

I wonder if we should drop that and just scan QTAILQ_HEAD(, TCGOp) ops
so we can be properly aligned with the current instruction.
Alternatively we could just emit INDEX_op_insn_start to the plugin list
as well?

>
>
> r~


--=20
Alex Benn=C3=A9e

