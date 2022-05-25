Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 970095341A7
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 18:45:09 +0200 (CEST)
Received: from localhost ([::1]:50676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntu8C-0002v1-NY
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 12:45:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ntu2n-00013r-AV
 for qemu-devel@nongnu.org; Wed, 25 May 2022 12:39:33 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:37561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ntu2l-000283-Bi
 for qemu-devel@nongnu.org; Wed, 25 May 2022 12:39:32 -0400
Received: by mail-ed1-x52d.google.com with SMTP id d22so4068600edj.4
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 09:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=pQ7uvzhXlKIls1d+/Ib90WEudZ08aaOcW/Y2UTFe3RA=;
 b=pMDRIbflfz2UxZbs1fro7VhbMeVm4UCe3IA4xHgtStCZOG9Law7i8YEQhAzu/LezuV
 INNZfMrSfd6fw0A7wSHNec/VeQsznOCBzlm7RCiACzQXotaVwJHUngKVXY4ANETi6hSk
 bwNVnMhDrjcsiNzL96I4n944nMfEEI4qqWGiJR7QlgDsPiAeC3rI+r0LgiCAEg8CnQw5
 d8EK5MgTo8x/3kHu6UA08Nbvkm8//egiZyyPFUY0iz7D33RetDwi2bh0yo1uaGNm4qiH
 pqwQrX9kRi1KogzgZx3Y6OeCdYKC5GOeE21EnsVFc8V+KOfHAwezLtS40huwyfIjs5OI
 jW/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=pQ7uvzhXlKIls1d+/Ib90WEudZ08aaOcW/Y2UTFe3RA=;
 b=t4TDEOHEQIOR7+Ttwa+HA7kdgyT/PIks7VSuWylfHcBX7d7jSxjUPMNZFWUmkqX58E
 aeGu5DfOC5ILxaR75Gu/lxeGpSHZ9JJEpY/CvDBWY+CJ4+/rLBlxFXA8gZ8raipFKIWY
 kb+UmNzTml5sntVaRGsqCWAConVrxS+VoTPt3J0FzdQjqC/jV3RRdAAt/wnkMNshB5Rs
 Ee9/x/7ufYWRkSzrNgGX+BzDr+QyCPPscxtU0vDFnLeeYdtvvTpJa5c5ho39yLOZB0D0
 5l9uNM4cVCXKZ2+z0BSBAh416BV/Lfgl+wINh9DKAQedHXbljZyR/FtUlhwxRKiGCHA8
 vXcA==
X-Gm-Message-State: AOAM531S3E5A1z5Emf5CKlGY9liPkv2YyLDuhiz1tO4K1v3P82Sbi+Z5
 rIqrkepOmLLrzxCNsKtoHOTD7A==
X-Google-Smtp-Source: ABdhPJyoBTIlyLZb+Latpwf4s+sX2Vxoogvx6aBGGNmYYaljmIR8qQ2ZMQI9PYwaAIFNFSxZAxVM7w==
X-Received: by 2002:a05:6402:b12:b0:42b:cf04:3e11 with SMTP id
 bm18-20020a0564020b1200b0042bcf043e11mr2560392edb.85.1653496769544; 
 Wed, 25 May 2022 09:39:29 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 ej23-20020a056402369700b0042a2d9af0f8sm11121342edb.79.2022.05.25.09.39.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 May 2022 09:39:28 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AB8461FFB7;
 Wed, 25 May 2022 17:39:27 +0100 (BST)
References: <a430eb4a-20db-8c04-e9ce-0d3e1d4c3c46@linaro.org>
User-agent: mu4e 1.7.23; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: anjo@rev.ng, ale@rev.ng, tsimpson@quicinc.com, bcain@quicinc.com,
 mlambert@quicinc.com, babush@rev.ng, nizzo@rev.ng, qemu-devel@nongnu.org,
 Daniel P . =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v9 08/12] target/hexagon: import flex/bison to docker files
Date: Wed, 25 May 2022 17:38:16 +0100
In-reply-to: <a430eb4a-20db-8c04-e9ce-0d3e1d4c3c46@linaro.org>
Message-ID: <87czg11s8w.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52d.google.com
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


Richard Henderson <richard.henderson@linaro.org> writes:

> On 5/25/22 05:29, Anton Johansson wrote:
>> For clarity's sake, here are the exact steps taken to produce this patch:
>>  =C2=A0=C2=A0=C2=A0 1. Update QEMU's libvirt-ci to the commit
>> https://gitlab.com/libvirt/libvirt-ci/-/commit/43927ff508e8ecb1ac225dabb=
c95b37c890db917
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 which adds flex/bison, and a nativ=
e glib2 (required since
>> idef-parser
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 is a build-time tool.)
>
> This must be split out -- submodule updates should be a patch by
> themselves.  Otherwise it can look like unintentional rebase breakage
> (which, sadly, happens more often than legitimate submodule updates).
>
>>  =C2=A0=C2=A0=C2=A0 2. Copy in new `tests/lcitool/projects/qemu.yml` fro=
m `libvirt-ci`
>>  =C2=A0=C2=A0=C2=A0 3. run `tests/lcitool/refresh` to generate new docke=
r/cirrus
>> files
>
> And, yes, having one patch that's simply auto-generated is helpful.

To quote danpb:

   danpb: should our tests/lcitool/projects/qemu.yml match the one in
      the lcitool repo or are they different use cases?
  <danpb> the one in libvirt-ci.git should be deleted really
  <danpb> the one in qemu.git is the source of truth

so please just update the qemu.git qemu.yml for just what you need for
flex/bison without bringing in all the other (stale?) stuff.


>
>
> r~


--=20
Alex Benn=C3=A9e

