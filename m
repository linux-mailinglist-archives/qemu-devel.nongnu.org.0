Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB25E4DAF17
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 12:49:07 +0100 (CET)
Received: from localhost ([::1]:40368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUS9K-0007J8-E9
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 07:49:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nUS1G-0004dG-5j
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 07:40:46 -0400
Received: from [2a00:1450:4864:20::62f] (port=42988
 helo=mail-ej1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nUS1A-0001Bz-J9
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 07:40:43 -0400
Received: by mail-ej1-x62f.google.com with SMTP id hw13so3496269ejc.9
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 04:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=E0KbkwufOvZRGGZwC5EkkEzhSPf0cyuxevhvKOUi9lc=;
 b=GtNezQYKsqK9h7buXON4ePK8hDc3Y98WKRR6SA7dsmuglV2GJg4UKitJGptI65baXx
 pwjLtLAQP1c1UWrFDg6VECiCp5mXx1GX5itqERoFIj9DoMvvahHUrPrDxdrbjEkWJPfi
 yBzMtM4EwQWgrZIoQ9vIl281A5JmmhNtP53zlBtTusPuH9RXlrD0O3qcRfGEs4WKLrsg
 6T2whIy+XYa4lp6QafD83gvDS8j1OkRMhwdj3usJlWb70D8Yr0C5dFZ6zZpNSlSuX3o+
 sL1mKm/6y8jsnpWBRzt7U1eqjfy97xGSjE6fUV1mU5R+qs+s8CnDDGkIlxrZQIV8vrwS
 HXLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=E0KbkwufOvZRGGZwC5EkkEzhSPf0cyuxevhvKOUi9lc=;
 b=v4XoRq55JePyS/THHbQUpdxO07zbDR2JfYZlu7m+YnNpXUZrl7n6bpPoBchLxroyqe
 4T15IMHy91uLibItlcKA1avPQ/8v0FHEnya+WWjrzho/aMatuhsLFcEIE5mH5CQcuFaW
 tTDygpUb7SIZVrZidv75a+5xvICAX8IG1a6IcmZVcEqlUPUv3m2mJdl5L4LmEJrMq5BE
 xb4yExf3VQEmnOzIW7aRikqkrzbPpnsQDXplc+L0B/6k/RFJ8HzmDJtRy1NrnLPYqeYR
 he0DaHs2cwVlqEKU00Dv81txbsdTT/fE5ApCrRUTOWK/PfPQKRRKnOwNk0J8oNmdTizc
 n1Kg==
X-Gm-Message-State: AOAM531KC4JW6BrMxrXeC97vPZ+e7PAvBSZD149TnFUGmrovp+P5K4YA
 Hm7vu767r0McPeNU66McX5Qq8g==
X-Google-Smtp-Source: ABdhPJxHn5FlRttKqhBGBcql8Luc7ezmNFuHLLW443gHX+gDwL/e/G0zyutP3ZOpVLuN41mJIlMRYg==
X-Received: by 2002:a17:906:3cf1:b0:6cf:86c6:8a12 with SMTP id
 d17-20020a1709063cf100b006cf86c68a12mr26136680ejh.202.1647430815024; 
 Wed, 16 Mar 2022 04:40:15 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 g13-20020a1709065d0d00b006df7dfa2a51sm579674ejt.132.2022.03.16.04.40.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 04:40:13 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9EC321FFB7;
 Wed, 16 Mar 2022 11:40:12 +0000 (GMT)
References: <20220315204306.2797684-1-peter.maydell@linaro.org>
 <20220315204306.2797684-2-peter.maydell@linaro.org>
User-agent: mu4e 1.7.10; emacs 28.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 1/2] target/arm: Log M-profile vector table accesses
Date: Wed, 16 Mar 2022 11:40:05 +0000
In-reply-to: <20220315204306.2797684-2-peter.maydell@linaro.org>
Message-ID: <871qz23z37.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> Currently the CPU_LOG_INT logging misses some useful information
> about loads from the vector table.  Add logging where we load vector
> table entries.  This is particularly helpful for cases where the user
> has accidentally not put a vector table in their image at all, which
> can result in confusing guest crashes at startup.
>
> Here's an example of the new logging for a case where
> the vector table contains garbage:
>
> Loaded reset SP 0x0 PC 0x0 from vector table
> Loaded reset SP 0xd008f8df PC 0xf000bf00 from vector table
> Taking exception 3 [Prefetch Abort] on CPU 0
> ...with CFSR.IACCVIOL
> ...BusFault with BFSR.STKERR
> ...taking pending nonsecure exception 3
> ...loading from element 3 of non-secure vector table at 0xc
> ...loaded new PC 0x20000558
> ----------------
> IN:
> 0x20000558:  08000079  stmdaeq  r0, {r0, r3, r4, r5, r6}
>
> (The double reset logging is the result of our long-standing
> "CPUs all get reset twice" weirdness; it looks a bit ugly
> but it'll go away if we ever fix that :-))
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

