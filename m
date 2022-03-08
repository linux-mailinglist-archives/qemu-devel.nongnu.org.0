Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF304D19FA
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 15:06:00 +0100 (CET)
Received: from localhost ([::1]:37260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRaTP-00035m-2V
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 09:05:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1nRaHK-0007Vq-Of; Tue, 08 Mar 2022 08:53:30 -0500
Received: from [2607:f8b0:4864:20::829] (port=39437
 helo=mail-qt1-x829.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1nRaHJ-00053p-1O; Tue, 08 Mar 2022 08:53:30 -0500
Received: by mail-qt1-x829.google.com with SMTP id u29so611302qtc.6;
 Tue, 08 Mar 2022 05:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=YQrUVaqHJM9HWSAZ1hemk/z4wOBte6SO+9I0vIiF5tw=;
 b=o7FudXFshCVYt8GFlJF6lJq7KE/QXSc9igtFIFEU2uCmEx8ca9PfAr1Ls/y+2+cCfG
 YPxesYU65EObEUTsJaOG99L8RzBvHWePZwpdEO3FIdj2jfLdzYw2rBIkypaPDEcVYrhF
 D8QK+412OWwPWY2TWVp1WkjtdvF3Z9YDyBRo8sWuDeWNz2LuSlcC94xw82J8jPBL3nhE
 Jfg0Qt0TlZh9TbM557S8W1dWLP5GT7AU9921jTUZ+U88ShhH7/g9kOHPEg4bZmiIrG6b
 ++e/vhUTHl/qSkY6F1eTR4ERLKZ8DmaEGxF6xFu1BSRY+qw5VzOl38suvOePuPwoRpZq
 jbfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=YQrUVaqHJM9HWSAZ1hemk/z4wOBte6SO+9I0vIiF5tw=;
 b=8RkdKtxmg47vFlhLCV4AJ1RW+Yeh/hQz+A49w58UMOvmjgQ5phDN14hrzseoSCTzOT
 6mf4KyAgcExjRG08c39JJMVVydilSSusRXwNb0tGof4vZht4ADejRQYRjbU+czfuB5XJ
 DS47dHza95lFNo5FT9CdoZSjk2bw1GZ3qtscRL2gP4o6cw9EyeIlcJkXttqrjfwNWXfz
 KpzwcA6GU17c26SIiig01+PiVEyO2SPCeTCnmxlsyrP5R6sJGMnOUFJrE4AS50r4pHRP
 tANErf1GOk4ZKOm+vuZwO+oGrvhOP5zU1xryCGs4Rn76mRHTs8Lsz+4i7B8VOD2q79uh
 jVzw==
X-Gm-Message-State: AOAM532+oAIduSsb9Br9wl7QhDnRqa8dCjOEfQOKf7on9G4d0N6J8Vr5
 s1UtmpfKShYnAcGx9cJtFJh0fONBJA==
X-Google-Smtp-Source: ABdhPJwawliD+7b/2fhMYLwin6HMa1SZJRikyVjIuEYEMEfJa7+u5VLVlBecBQvHYcVDx4SZmX0BPA==
X-Received: by 2002:ac8:5f91:0:b0:2de:2c33:53a0 with SMTP id
 j17-20020ac85f91000000b002de2c3353a0mr13535812qta.86.1646747607209; 
 Tue, 08 Mar 2022 05:53:27 -0800 (PST)
Received: from serve.minyard.net ([47.184.144.75])
 by smtp.gmail.com with ESMTPSA id
 x12-20020a05620a14ac00b0060deaee7a21sm7618790qkj.51.2022.03.08.05.53.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 05:53:26 -0800 (PST)
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:c14:fa13:8678:3728])
 by serve.minyard.net (Postfix) with ESMTPSA id 0EB0D1800BC;
 Tue,  8 Mar 2022 13:53:26 +0000 (UTC)
Date: Tue, 8 Mar 2022 07:53:24 -0600
From: Corey Minyard <minyard@acm.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v3 0/9] This patch series contains updates to PMBus in
 QEMU along with some PMBus device models for Renesas regulators. I have also
 added myself to MAINTAINERS as this code is in use daily, where I am
 responsible for it.
Message-ID: <20220308135324.GU3457@minyard.net>
References: <20220302015053.1984165-1-titusr@google.com>
 <20220304214354.GL3457@minyard.net>
 <CAMvPwGpzO3VyCqGJY28QVQoo9AwYxxrvP3RqPS6JTgpTk8ojtw@mail.gmail.com>
 <1af23dba-8f7a-8d93-706d-6e16067cdce2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1af23dba-8f7a-8d93-706d-6e16067cdce2@gmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::829
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=tcminyard@gmail.com; helo=mail-qt1-x829.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Reply-To: minyard@acm.org
Cc: peter.maydell@linaro.org, Titus Rwantare <titusr@google.com>,
 venture@google.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 wuhaotsh@google.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 07, 2022 at 01:00:02AM +0100, Philippe Mathieu-Daudé wrote:
> On 5/3/22 00:42, Titus Rwantare wrote:
> > On Fri, 4 Mar 2022 at 13:43, Corey Minyard <minyard@acm.org> wrote:
> > > 
> > > On Tue, Mar 01, 2022 at 05:50:44PM -0800, Titus Rwantare wrote:
> > > > v2:
> > > >    - split PMBus commit with updates into individual fixes
> > > >    - renamed isl_pmbus[.ch] adding _vr for voltage regulators
> > > > 
> > > > v3:
> > > >    - split uint refactor commit and removed commit renaming files
> > > >    - rename rolled into preceding commits
> > > >    - update commit description for uint refactoring change
> > > 
> > > This all looks good to me:
> > > 
> > > Acked-by: Corey Minyard <cminyard@mvista.com>
> > > 
> > > Do you have a plan for getting this in to qemu?  Like through the ARM
> > > tree?  I could take it into an I2C tree, but there's really not much
> > > activity or work there.
> > > 
> > > -corey
> > 
> > In general PMBus is more specific to i2c than ARM, but I'm not sure of
> > the QEMU implications.
> 
> Titus, could you address my comments?
> 
> Corey, if you are busy, I can take care of this series.

It's not a "too busy" sort of thing, the i2c tree doesn't get much
traffic.  I can take it, but it's not much different than just pulling
it directly.

So it's probably best if you take it.

Thanks,

-corey

> 
> Regards,
> 
> Phil.
> 

