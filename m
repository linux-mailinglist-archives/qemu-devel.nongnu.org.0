Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE26A43741E
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 10:58:16 +0200 (CEST)
Received: from localhost ([::1]:48346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdqNT-0006PM-Me
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 04:58:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mdqME-0005El-Du
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 04:56:58 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:51888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mdqMC-0001Uc-7Z
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 04:56:57 -0400
Received: by mail-wm1-x333.google.com with SMTP id p21so2170826wmq.1
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 01:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=3Vg9YlI/yWQf1i/iEjj4qoUzp4HvCVUfoWLhKSW4hV4=;
 b=FpSuRSEkCAB7qZgIjkl/H9QTzqkzrcLYUtHgMwgJHFNd8ocD4DUstljcz0DLgDAC+K
 iunV0KnD3lOQ4AtAlyoFs5AG+wtivwgmkKnZbFJtcfp7gIPYB2+5o7yNZ4Tf0BuaEoCv
 spBwNm3jbV2xjQFwok4M9PDI5P9VoiVXwy2ZGs+88DpcIrJblMqNuEWUFv2obGGXkEx/
 XvlJNsyI/KYdbwZFZxgf7Bc5Hlvh8O26uVycH5V2P17y+KCNTDu6VUl187LMl4l5w+FM
 TpJwf6jUE6SnF8IeBjymD+dmZxjScS83U3P5+t7GMuTIvZ7uCS5IwFFOha6chnivlCsN
 HskA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=3Vg9YlI/yWQf1i/iEjj4qoUzp4HvCVUfoWLhKSW4hV4=;
 b=v8J1IOBizw9uHZpSIcFepOWM4OUFVEv7nviZ8R+BnvRaqGwD033rFwG8vyPTEFY7Aq
 W4Yd9aZHI7cZ2qqKb/dONDFdexl16JtyQsPVIMHCZWfILLRZzF3A2uf8d+H9jBcTSdV9
 evjX0AKwU6EKQwg8pHYX3W2ZBa1b37h8mB7WozyYaJR6esS3n6Hd0dawSf2zRW+QhgJ+
 WjavgP2jkqfwRS+vsZWhjmCgGnd3iXr5jwdwb0BZ/aZwSUQLOWo3LwdTxKtMSBsyMpAy
 q+9ZTHZ9EfP75uueV1jiuHUPLdhV4pbcwyUydIM24dXfx/I25LHr5Ihbkt4VFNh9dVwn
 iDhw==
X-Gm-Message-State: AOAM533B+JP9zQJGRyk6gowXHLV+zvmGmDl9zWTqS8Se/faB6kFMSBh6
 Kd1Ns6Vqe+deJSWjb7jVpUB/Dg==
X-Google-Smtp-Source: ABdhPJzcXITFPW2A7U6pRTaBEHb2Rz1CFofpd66QNpMOdYMyuMObxwEypfPzsfm2dx5oxRL8RsyyOA==
X-Received: by 2002:a05:600c:896:: with SMTP id
 l22mr12725308wmp.92.1634893012308; 
 Fri, 22 Oct 2021 01:56:52 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n66sm7400711wmn.2.2021.10.22.01.56.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Oct 2021 01:56:51 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2E6201FF96;
 Fri, 22 Oct 2021 09:56:50 +0100 (BST)
References: <YUOssEF1lND+Rhsr@strawberry.localdomain>
 <87fsu3tppe.fsf@linaro.org> <YUpAXEYX0D27BnEA@strawberry.localdomain>
 <YUuQeSFsmM6YiBCp@strawberry.localdomain>
 <YXBN4UZvY5ESdz6v@strawberry.localdomain> <87cznzvavq.fsf@linaro.org>
 <YXCA62xdRDeueQR6@strawberry.localdomain> <87mtn2tv56.fsf@linaro.org>
 <YXHQORB9wMncI5uG@strawberry.localdomain>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: Re: plugins: Missing Store Exclusive Memory Accesses
Date: Fri, 22 Oct 2021 09:37:47 +0100
In-reply-to: <YXHQORB9wMncI5uG@strawberry.localdomain>
Message-ID: <87ee8dtp2l.fsf@linaro.org>
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
Cc: cota@braap.org, richard.henderson@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Aaron Lindsay <aaron@os.amperecomputing.com> writes:

> On Oct 21 13:28, Alex Benn=C3=A9e wrote:
>> It's a bit clearer if you use the contrib/execlog plugin:
>>=20
>>   ./qemu-aarch64 -plugin contrib/plugins/libexeclog.so -d plugin  ./test=
s/tcg/aarch64-linux-user/stxp
>>=20
>>   0, 0x400910, 0xf9800011, "prfm pstl1strm, [x0]
>>   0, 0x400914, 0xc87f4410, "ldxp x16, x17, [x0]", load, 0x55007fffd0, lo=
ad, 0x55007fffd8=20
>>   0, 0x400918, 0xc8300c02, "stxp w16, x2, x3, [x0]", load, 0x55007fffd0,=
 load, 0x55007fffd8, store, 0x55007fffd0, store, 0x55007fffd8=20
>>   0, 0x40091c, 0xf1000652, "subs x18, x18, #1"
>>   0, 0x400920, 0x54000040, "b.eq #0x400928"
>>   0, 0x400924, 0x17fffffb, "b #0x400910"
<snip>
>>=20
>> Although you can see stxp looks a bit weird on account of the loads it
>> does during the cmpxchng. So consider me stumped. The only thing I can
>> thing of next is to see how closely I can replicate your build
>> environment.
>
> I apologize, I had apparently gotten farther behind upstream than I
> realized since originally encountering this. I tried the latest upstream
> code and am now able to observe the same thing as you. Somewhere between
> v6.1.0 and now, the original issue I reported has been resolved.
>
> However, I am not sure reporting loads for a store exclusive makes sense
> to me here, either. My understanding is that the stxp needs to check if
> it still has exclusive access and QEMU's implementation results in the
> extra loads, but I would expect that the plugin interface would only
> report architectural loads.

Yes this is an anomaly. It's not reporting all loads and stores because
there are accesses to cpu_exclusive_addr and cpu_exclusive_val which we
use to simulate the exclusivity check. However we don't currently have a
way to signal to the TCG that a cmpxchg is only being done to simulate a
store.

I guess we need to either signal the helper someway to avoid calling
atomic_trace_rmw_post and call atomic_trace_st_post instead. Ideally we
could signal this in metadata somehow (although I suspect adding
something to MemOpIdx might be too ugly). The alternative would be
defining another series of cmpxchg helpers that did this.

Looking at the code also reminds me that we need to excise the broken
memory trace code.

> Is there any obvious way to omit the loads from the plugin interface
> here?
>
> -Aaron


--=20
Alex Benn=C3=A9e

