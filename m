Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFA15FED2C
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 13:25:27 +0200 (CEST)
Received: from localhost ([::1]:44594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojIod-0005AY-OW
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 07:25:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu-daude@fungible.com>)
 id 1ojIhd-00019V-Ez
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 07:18:11 -0400
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b]:33678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu-daude@fungible.com>)
 id 1ojIhb-00086m-9W
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 07:18:08 -0400
Received: by mail-vs1-xe2b.google.com with SMTP id k6so4575383vsp.0
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 04:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fungible.com; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/VM/+0R18Ve2NejTOG1RV8zwY9lH14hqf7J0eTRaJqc=;
 b=VUKL79jUtiTBKWWqCPhLXShJQqPL/a5eKFKodjrTvpweNHmwcvakAorC/IWpjG9T8T
 lhHhuZGmIdBsXwchV9NQQFxY4bUEc84vl9gl0EnL20orVBCG4Ww/WPhGVyg0X10gdu8n
 6lbX6wpkTPG/x1b4NPt1UPVM61cMxqHxYtIsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/VM/+0R18Ve2NejTOG1RV8zwY9lH14hqf7J0eTRaJqc=;
 b=Jkfx7lsT7MrXOqR1zWnVM5XbAz+Xsnm7cwz0RMMt+Z4sVCSqnC3CmyWtaBYRhLmQ1Y
 T3CUxlErcP4o822YYJKg2yfS2jslhOjxgnv22ZlXkN3LOf5qA2pwsnLEUxHENIVtekz6
 CeLbu3f+BXpPRkWEQqj0hQ+bM6/oVDJyjCEVZMhHTJrNoFi4NMRb9X9vG6fbI/1E8n4u
 vpWaBLzUZ2h6nTK4wAgPmp3b1YtGXM4Ifda7XQpgAhgyHP0AZmQxoJaEaiEVCyp7aJZ7
 Z1Z57wfzg/aGFYPvwYv/6+c5hCWtIbIeFJAg+quvTtdFGewgriqrBIpwV75fMtqkY0cj
 ZoUg==
X-Gm-Message-State: ACrzQf3lDFZndGCp0OV6wje2tCd25ty3f0G/eM57x3FLlCjeEd/t5T7A
 678TZ5s6dooU3iwReTLJ4rY0xWgD+loNL5u111u6Eg==
X-Google-Smtp-Source: AMsMyM7CMeg/xwC0md7e4vEKsCy2OG6nWZ0fvyZuMHjF2eZytTh4efTeEf9cRmVxAJwn/IFAN785RJ3iouyn0tURLB8=
X-Received: by 2002:a67:6e47:0:b0:3a7:646f:e9bc with SMTP id
 j68-20020a676e47000000b003a7646fe9bcmr2317736vsc.42.1665746285368; Fri, 14
 Oct 2022 04:18:05 -0700 (PDT)
MIME-Version: 1.0
References: <20221013145246.4922-1-philmd@fungible.com>
 <423f0bd9-8c43-46fb-04a5-292e8385b69a@linaro.org>
In-Reply-To: <423f0bd9-8c43-46fb-04a5-292e8385b69a@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@fungible.com>
Date: Fri, 14 Oct 2022 13:17:54 +0200
Message-ID: <CANsZoG9JZd+JQNNMDkCAg-LoJcYsSOTmeWon1ZN6P8Ew0OBp2g@mail.gmail.com>
Subject: Re: [PATCH] disas/mips: Fix branch displacement for BEQZC and BNEZC
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
 David Daney <david.daney@fungible.com>, 
 Marcin Nowakowski <marcin.nowakowski@fungible.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2b;
 envelope-from=philippe.mathieu-daude@fungible.com;
 helo=mail-vs1-xe2b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 13, 2022 at 9:26 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 10/14/22 07:52, Philippe Mathieu-Daud=C3=A9 wrote:
> > +                /* Sign extend the displacement with 21 bits.  */
> > +                delta =3D l & 0x1FFFFF;
> > +                if (delta & 0x100000) {
> > +                    delta |=3D ~0x1FFFFF;
> > +                }

Note this follows the style of this file, ...

> delta =3D sextract32(l, 0, 21);

... but I agree using sextract() makes it easier to review. I'll respin.

