Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6833F49FFF6
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 19:12:09 +0100 (CET)
Received: from localhost ([::1]:60042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDVjE-0004tP-6j
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 13:12:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDVgI-0002PF-D7
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 13:09:06 -0500
Received: from [2a00:1450:4864:20::42b] (port=36376
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDVgG-0005gb-OC
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 13:09:06 -0500
Received: by mail-wr1-x42b.google.com with SMTP id u15so12428115wrt.3
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 10:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BxQzLT/nyU9R41goMbuXcf4fxG5qZ3hAivyHlE3TD4o=;
 b=hVqvsm+6bDFiuy8EqNzswwoBQTisxvHpPhw+arWJUyWbBZYqLVt8bJN/5HiV/0kmKU
 sH+dOScBwoQyk+EgsQHDduIi9ZD0+yy3SDcYOpr0NrOcmgCJZh14fH+gPwyKSrJcHcUK
 43X0bz13r9WRedkhBg7LUSHM7067Yw3qnH6ggmLDJZnPtbav906izCZS8FxIzQsZaCcM
 0tBAEgyB10nRHqDX2ysSwVTmU/UhUnsWmlAhalDKENxkhMWYStWK971gnB/I+Lj7PRZq
 61erF+uVyP/dGlO5T6ZbaV1vqdfdo/uI7/EU4kUIXNEnT55tfvejubkvrgrmoQLRfgQt
 +zbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BxQzLT/nyU9R41goMbuXcf4fxG5qZ3hAivyHlE3TD4o=;
 b=Tg+8aIHbbMhOWXrwfK1RDBHwX3x86QhC7gDzHwaoPHD6PvZv1FuI1MXxd4PLU0rW3J
 d92tSqlBO6EZXk+fti1Ti38mfwDzdKRL5TQ/DIhHPGh+rczVnG78HeZ9iiHXWsQnmZI9
 eSYzk2honP1gEIAKbqAb3ha2BZEa34lUTEEZO6MafO/U1m55gmB//U/8+37aPixlj6Qe
 n9/SmP/BNZhzJW8xlsZBSJ+RNJ9J4bky728ba4MEW1oF3/64YxNvR7N5caJg3gIckbjS
 pVrhA96vC6CdHpqtnHvVoThgGLE2iMbngHrYtHm+Yzi8iINIorfV8aiYQzutAHJMdYps
 WdZg==
X-Gm-Message-State: AOAM5310GIWC+JD1VEnPYuEwhRsxwy16BVI5qH3nAZPDhB51jRwHYyd2
 zLr70KO8VHTurVpy5P8tXWJ0bQFlGigMXh4Tm9vnBA==
X-Google-Smtp-Source: ABdhPJyvNuvn7fBdrix1vDJps41yrhpjLVa9X9qyqLDHgSnuaUrf2HT1x8bFx2Gm4j135/UNXuJ2lEuXNq5EB/kxZ4g=
X-Received: by 2002:a5d:5343:: with SMTP id t3mr8231295wrv.521.1643393342012; 
 Fri, 28 Jan 2022 10:09:02 -0800 (PST)
MIME-Version: 1.0
References: <20220128165535.2550899-1-peter.maydell@linaro.org>
 <YfQs2qIew5UR6MCk@redhat.com>
In-Reply-To: <YfQs2qIew5UR6MCk@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 28 Jan 2022 18:08:50 +0000
Message-ID: <CAFEAcA9W34DGAho3CS62j0a4-PJvrBYyDXQN-ZnQzWW6wTc5eQ@mail.gmail.com>
Subject: Re: [PATCH] block/curl.c: Check error return from curl_easy_setopt()
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 28 Jan 2022 at 17:50, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Fri, Jan 28, 2022 at 04:55:35PM +0000, Peter Maydell wrote:
> > Coverity points out that we aren't checking the return value
> > from curl_easy_setopt() for any of the calls to it we make
> > in block/curl.c.
> >
> > Fixes: Coverity CID 1459336, 1459482, 1460331
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> > Big fat disclaimer: tested only with 'make check', which I suspect
> > may not be exercising this block backend. Hints on how to test
> > more thoroughly are welcome.
>
> yeah afaik, qemu-iotests don't have support for this. As a very
> basic smoke test do
> [command lines snipped]

Thanks; yes, those both work.

-- PMM

