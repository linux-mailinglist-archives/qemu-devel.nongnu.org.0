Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BA74AF894
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 18:35:40 +0100 (CET)
Received: from localhost ([::1]:57390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHqsV-0002Z1-86
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 12:35:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHpsc-0001eq-RJ
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 11:31:42 -0500
Received: from [2a00:1450:4864:20::432] (port=34402
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHpsZ-00022Z-Rv
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 11:31:42 -0500
Received: by mail-wr1-x432.google.com with SMTP id f17so5083719wrx.1
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 08:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=aD46pGr9G3RUEsW9PdwwIueEwxm15KKGfxYxya1h0Js=;
 b=ppxA3PHriTrSpO5nP9WF00iDvVhkmCnsxWiNqjQsCWtQAML7fKreBJvKJNJXzkM0st
 fNGxBN1OXy9QTkUH+Ofto7y94Xjnk+wem9JTm9ocN9+0aGlJ4/K8sFLodcXPOlaffWml
 K10QP37Mbjl6GKTjCMTnoAXDdYG9ViRDXNes5gZ5muwVi2lQMA4q5DFdTMXI2OjpMjN4
 zXu/ZyoST+xtT1KXLNTx3/hc6QCpU2GwLFhyMF5wd2vmZWK2isbG4vyfhT+LIGkLHZzn
 B4JrXqFxEtXZ99e92p2ADXVWH+KzIjUpqnntdLzKHt+KoPqbmfAWj1EX58Jho66gbqxl
 2FMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=aD46pGr9G3RUEsW9PdwwIueEwxm15KKGfxYxya1h0Js=;
 b=31WXLfwAIGsd84pwDO8YyVOqEXFMnuar7qyBxUcHsYiUeWf3IXyRkdZPXCv0YXgzWS
 ooUvDdFbbG8yIoDXZcri+dIzVjW8TbFQtlvkfqK5AOXcwk95012VKkCcEIHTfoCKnwPk
 7tEAyxVTxeMwlj/BxImfhKPPK4hsrRzOgw94RiJuyf6mBXVfYjZ7gv+LcSpEW0AhM6eA
 BiY2dMvC9WUvDVXxbMaMB6qpCl/UKpM0nZnWnrQ4Av4cTsbeyjopSxd3LlM1Avj2io1T
 gyz9wTGFQauznQ2C4Mt5TQmRfzIis91V0ww2GWY0PZBWpTWtU957Ji7+PlO4qskT+mE6
 Xj4A==
X-Gm-Message-State: AOAM531FDlMunAJZOy3ch/NtxwEiNuFy5csdLeIxLZRociKXN9X/Wy4i
 cvEO3jwqrv7FMuWEsxkC0wHBog==
X-Google-Smtp-Source: ABdhPJzfCuYwI1ijQXVh90S/xuEbghyltRXTQy5Vw3QbrDNmwG2nZJDl/cPdmtPI6LhPkefdu1+otA==
X-Received: by 2002:adf:ebc2:: with SMTP id v2mr2797365wrn.498.1644424298027; 
 Wed, 09 Feb 2022 08:31:38 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g9sm17106982wri.95.2022.02.09.08.31.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 08:31:36 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 278D31FFB7;
 Wed,  9 Feb 2022 16:31:36 +0000 (GMT)
References: <20210623134756.30930-1-alex.bennee@linaro.org>
 <20210623134756.30930-2-alex.bennee@linaro.org>
 <CAFEAcA8TCTEBnjibsUTyqRXL0tWXGUih-TATNLHuWW-5=VQHLA@mail.gmail.com>
User-agent: mu4e 1.7.7; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v4 1/2] semihosting/arm-compat: replace heuristic for
 softmmu SYS_HEAPINFO
Date: Wed, 09 Feb 2022 16:29:32 +0000
In-reply-to: <CAFEAcA8TCTEBnjibsUTyqRXL0tWXGUih-TATNLHuWW-5=VQHLA@mail.gmail.com>
Message-ID: <87sfssdms7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Keith Packard <keithp@keithp.com>, qemu-arm <qemu-arm@nongnu.org>,
 Andrew Strauss <astrauss11@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Wed, 23 Jun 2021 at 14:47, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> The previous numbers were a guess at best and rather arbitrary without
>> taking into account anything that might be loaded. Instead of using
>> guesses based on the state of registers implement a new function that:
>>
>>  a) scans the MemoryRegions for the largest RAM block
>>  b) iterates through all "ROM" blobs looking for the biggest gap
>>
>> The "ROM" blobs include all code loaded via -kernel and the various
>> -device loader techniques.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Cc: Andrew Strauss <astrauss11@gmail.com>
>> Cc: Keith Packard <keithp@keithp.com>
>> Message-Id: <20210601090715.22330-1-alex.bennee@linaro.org>
>
>> @@ -349,4 +349,20 @@ int rom_add_option(const char *file, int32_t bootin=
dex);
>>   * overflow on real hardware too. */
>>  #define UBOOT_MAX_GUNZIP_BYTES (64 << 20)
>>
<snip>
>> +static gint sort_secs(gconstpointer a, gconstpointer b)
>> +{
>> +    RomSec *ra =3D (RomSec *) a;
>> +    RomSec *rb =3D (RomSec *) b;
>
> /*
>  * Sort into address order. We break ties between rom-startpoints
>  * and rom-endpoints in favour of the startpoint, by sorting the 0->1
>  * transition before the 1->0 transition. Either way round would
>  * work, but this way saves a little work later by avoiding
>  * dealing with "gaps" of 0 length.
>  */
>
>> +
>> +    if (ra->base =3D=3D rb->base) {
>> +        return ra->se > rb->se ? -1 : 1;
>> +    }
>> +    return ra->base > rb->base ? 1 : -1;
>
> This has forgotten the "equality" case, which you will
> see if two blobs start at the same address (at least in
> theory; at the moment the rom blob loader will try to
> reject overlaps, though it might not do so forever).

I'm confused what you mean by equality case. If both RomSecs have the
same base and the same se flag we need to pick one of them. Are you
saying when ra->se =3D=3D ra->sb we should take ra?=20

--=20
Alex Benn=C3=A9e

