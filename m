Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6260069D050
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 16:10:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU7nU-0007ll-IH; Mon, 20 Feb 2023 10:09:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pU7nS-0007lV-5M
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 10:09:42 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pU7nQ-0000l6-9x
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 10:09:41 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 p3-20020a05600c358300b003e206711347so1125356wmq.0
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 07:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NvFYgrANl//l7WFmiisVy/kuWwUNX3mT1IiTqD8ctX0=;
 b=WD0yRYndygZ/kmD0TAJ/Mo9nt7921ELlbWbEC2ifMHCn6jGdnTHQJKzyyJgYk6gqu7
 lFaU5qha6VN3burngNbGfb0PKmd9hvo5Ds0gKI8TahEjYoa5u6f/yav2JoUS6HwNYzhb
 eR6IEGaGwN+vwb8IYU1I/YDyaHHlkM7rEf5u3bfLXHvm9g/6EzRddJxFRsNc9Ji2UgaJ
 Iev1Nsc5ZZR1bnqXo0Ovu2CAF4757FgTUKVDia9GkzPmi8xTnfuZ3v4xevEZ9Ve86IKC
 WZB3EZeXNTUgIwucoHFMri/BeTe9ahJ51B7g7f2dUpLAf9p5M1wU/q1YYbviBQNRnmos
 /Zhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=NvFYgrANl//l7WFmiisVy/kuWwUNX3mT1IiTqD8ctX0=;
 b=e5DBb4FggMLzVX7swGTuKvlk81VwxijWQhCHoE5Y1dRw7GMy1L9Xm43TPq3+SkYBb5
 0gLDMyYdtPfwU2JoGy4lUuwo2QmpgbYLtTVXs2aoTEXTt5GtmJDYnWLjVCHcCwkCLZ3X
 tB8U16EQ6SpJMGvGB9cUHccxYRvVFNwzvfeFv6SNb86TPkuWip3dC1mjqFr/APpOUEVj
 WWjMtPNE8sqpWXD+ECeWvFI1zBRm3P1zYEwU3AX/1LzA53pW5Z+T7/+061FDaEl+msjJ
 dicoO+xcDGLU8Yb+Htw55BDnq2Iwx0RmGlwBPO6SYEZSIU3Nv5yMVfuD2S5PfxqsagvL
 HTuw==
X-Gm-Message-State: AO0yUKUgU3a64BEVjRpT2YHgnZku31Cql5w1ITwD3sgdYDe2ewa7sKyj
 MK4pTflWYiDmLltOZTKR5SGz8A==
X-Google-Smtp-Source: AK7set9cQaWV6NuO8zBLkrH9AuCsCnRqWTZylUTQrmFjgd9n1MTSWFctg4zQIjClG52LPb6/kiPNzA==
X-Received: by 2002:a05:600c:994:b0:3df:e1cc:94ff with SMTP id
 w20-20020a05600c099400b003dfe1cc94ffmr1235219wmp.28.1676905777924; 
 Mon, 20 Feb 2023 07:09:37 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 n3-20020a1c7203000000b003dc522dd25esm1893324wmc.30.2023.02.20.07.09.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 07:09:37 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3C5CA1FFB7;
 Mon, 20 Feb 2023 15:09:37 +0000 (GMT)
References: <20230123201431.23118-1-anjo@rev.ng>
 <CAFEAcA_WiWwMVt8GQa8AHW5pO57W0NrHaGYJzoj8UVGyvTxmVQ@mail.gmail.com>
 <Y+pKBVkzivH+Xwvb@redhat.com>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Kevin Wolf <kwolf@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Anton Johansson <anjo@rev.ng>,
 ale@rev.ng, hreitz@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH] block: Handle curl 7.55.0, 7.85.0 version changes
Date: Mon, 20 Feb 2023 15:09:11 +0000
In-reply-to: <Y+pKBVkzivH+Xwvb@redhat.com>
Message-ID: <877cwctlu6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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


Kevin Wolf <kwolf@redhat.com> writes:

> Am 13.02.2023 um 14:28 hat Peter Maydell geschrieben:
>> On Mon, 23 Jan 2023 at 20:15, Anton Johansson via <qemu-devel@nongnu.org=
> wrote:
>> >
>> > * 7.55.0 deprecates CURLINFO_CONTENT_LENGTH_DOWNLOAD in favour of a *_T
>> >   version, which returns curl_off_t instead of a double.
>> > * 7.85.0 deprecates CURLOPT_PROTOCOLS and CURLOPT_REDIR_PROTOCOLS in
>> >   favour of *_STR variants, specifying the desired protocols via a
>> >   string.
>> >
>> > Signed-off-by: Anton Johansson <anjo@rev.ng>
>>=20
>> Block folks -- this patch has been reviewed, are you going to
>> pick it up (with the Resolves: line added) ?
>
> Yes, I'm going through the patches right now that were stuck because the
> previous pull request was blocked by CI.
>
> Thanks, applied to the block branch.

I've also applied to my testing/next (for the same reason) just in case
the block branch doesn't go in soon.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

