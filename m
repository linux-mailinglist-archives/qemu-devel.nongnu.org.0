Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDE730945A
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jan 2021 11:22:18 +0100 (CET)
Received: from localhost ([::1]:49652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5nOT-000829-En
	for lists+qemu-devel@lfdr.de; Sat, 30 Jan 2021 05:22:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l5nNC-0007XE-7t; Sat, 30 Jan 2021 05:20:58 -0500
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:36451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l5nNA-0003K2-FZ; Sat, 30 Jan 2021 05:20:57 -0500
Received: by mail-yb1-xb36.google.com with SMTP id c3so1142778ybi.3;
 Sat, 30 Jan 2021 02:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=99pWrdnAGBSVlE24tc2Z3Sd9L4W5Bt89BifejWOFq1U=;
 b=VZhMdVfjZyAB+VP8qTxgkTsP/NC6xdmWdfW7eBaMZDfULfwPgFUGWvrELEkQE0ttfB
 0K2+ETEr+6uY41TF7XNC1NBrvHW6wJDeOy+xBvx+oorAlqXHLJHhJ5nXzKDW1AetDjrP
 ZGp5aBHLYE91gSrop29HY4bl7KQ3DVDTughz5XYFuqUB9A/H9JOUVVreZwmlUyzlV90J
 sCfkd+e0xEqzQIcZ5dktd87JDG1KN8l0DFSxUfhEtOk4qTfseJYtmcsnfOkqxn3NwpS/
 bEUhjYrYpkmX/R2BTw0ujAm63P7xG012CUWolwt/ECWv6228bCVJAzoEvfYbcZZ/LS2m
 jCZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=99pWrdnAGBSVlE24tc2Z3Sd9L4W5Bt89BifejWOFq1U=;
 b=k8zgGTe9jMWcM6chI9evbLuu+2BoVUcE6EjeJ2V8OU5So4MxbnRih9jiBC4hYB9YHL
 EI5j+nGGgI5q428F3b3rslGZamXGClbi8G44MnP2D24srgrNGbErZ/H724p0zeeUiFFA
 G105coIqFwNqFyVsBU61sc2r6TbqjkWuQlEjHa4yEJ99nfajc5d/vI3iWK+6uyuWiqYa
 VX7eIgr+kwOW9EWdcCnepgpnboQ7yjZ/xDcwB9csNbUDUSITbC+nR92MvzpMY0VD4yUF
 qyT6CTqIFjwgHjpaY3Rst3i8XNJ7Qo0l2JzrKYschBoFxoaZidlW74eDQHvoreNdtu1g
 oAuA==
X-Gm-Message-State: AOAM533gdvLhs7I4uO5dukwzAKNUYchsa0+HGEcByXvdB6gxD1sj+0or
 fjLGxOoFiZex6yIkXDaGqiUnvmmixentheNT/Ak=
X-Google-Smtp-Source: ABdhPJxb+vdsPdJgOUZ6hl0pyAaEOIGWR9i5tD+dsAv/QptpFNn1BBkPd022+ybTYuWEAdUInRHbExm1ptOUl/Ac0KY=
X-Received: by 2002:a25:2041:: with SMTP id g62mr12393716ybg.152.1612002054793; 
 Sat, 30 Jan 2021 02:20:54 -0800 (PST)
MIME-Version: 1.0
References: <20210129085124.21525-1-bmeng.cn@gmail.com>
 <9336f3ec-b500-052b-a8f8-e1b8ec2905b6@amsat.org>
In-Reply-To: <9336f3ec-b500-052b-a8f8-e1b8ec2905b6@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 30 Jan 2021 18:20:44 +0800
Message-ID: <CAEUhbmWE5i_n1gC+UPdJPC9EsyTXkuPjoH78phSyoizwbf1P3w@mail.gmail.com>
Subject: Re: [PATCH] hw/sd: sd: Bypass the RCA check for CMD13 in SPI mode
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

On Fri, Jan 29, 2021 at 10:11 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> Hi Bin,
>
> On 1/29/21 9:51 AM, Bin Meng wrote:
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > Unlike SD mode, when SD card is working in SPI mode, the argument
> > of CMD13 is stuff bits. Hence we should bypass the RCA check.
>
> Is this for detecting events by polling? From spec v8:
>
>   5.7.5 Event Indication Method
>   5.7.5.1 FX_EVENT (Bit06 of Card Status)
>
>     An event indication method is introduced from Version 4.20.
>     Card may use Bit06 of R1 (R1b) response of any SD command
>     to indicate event generation.
>
>   F.2 Concept of Event Detection Method
>   F.2.2 Host Implementation to use Event Detection Method
>

I think you looked at the wrong place. See spec v8

chapter 7.3.1.3 Detailed Command Description

"The card shall ignore stuff bits and reserved bits in an argument"

and Table 7-3 Commands and Arguments

CMD13 Argument [31:0] stuff bits

Regards,
Bin

