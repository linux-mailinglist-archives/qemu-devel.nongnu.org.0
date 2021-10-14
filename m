Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF32E42E3E4
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 23:58:17 +0200 (CEST)
Received: from localhost ([::1]:34290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb8jw-0007YH-G2
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 17:58:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1mb8iO-0006CQ-AJ
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 17:56:40 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:34313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1mb8iL-0005Ga-JN
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 17:56:39 -0400
Received: by mail-pf1-x42f.google.com with SMTP id g14so6683330pfm.1
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 14:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=sLZqglsgKiSMNQOgx3mPq9GjZL2B7OCAbIOyyFUJMY0=;
 b=g0f9LbS7GkcCQG7Mie08oXsRGvYNv/aZhqphOBhyWheOytKf1ayPpxJFT6pKPf1H8u
 bQ9Ndi0tx+2sHa2OdbafdXYKMgwgG3sgtDTdTCy8mqkc4gwIvdO+tnd5N5r2WUmu5Rqm
 vTEtbyAnlXiSoU4HPmWRY7aNQ8lnYIvaeZMNnIt8L8g5u0EMpOahIzD0Nki3f6lPxwFB
 4NgJFuM3zraoR82GsThhCWOudgt0zxPBcBp4dhHnxPFb3CgQaJNJ+OdUuuN3Jjkz+TX6
 XIalHa+nZ8T7zwVCYnG/yFW8sxO98BgL3dk+HgR822vpgir3cIE4K5OvbmkZ7p9tGLhG
 orOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sLZqglsgKiSMNQOgx3mPq9GjZL2B7OCAbIOyyFUJMY0=;
 b=zY0/laNzBjdQC28iJHCzXwoQr70+4qknvISJIOHVs/+7zR0lJ/EpC1lusPTch2qVxh
 4WhzoDHeDYSop6TPmWZG/kM9iYeC3iJwa6mh5ZY4bJORgx2qYoidgMhzf6ZcRnwjD/QD
 Nmkh0/SMYQk3ZEEj415QOfjvipfrYnbJ3BWeiPRh5A7aPf5D/w+PAT43/EHlp6o57Hg4
 kbxJxpqKCpD7n9BgfvOMyPS4aqQWcLKL+M+DR0rDSE4iLVAY9aqCf35aZRO43fXRXcoE
 rjxqagiZx/8MHQadLGN1EUgbrYhHWzcYCcjB2GBkQZswu15gv20NynE0cKp2O3ljZbXo
 XdbA==
X-Gm-Message-State: AOAM533ieMMNkkmbgnpIq0+zGzyMjUPauEo4eOhSKi5mdQbNr25vjEfJ
 lxt0OTkdLbtX1lz30TxkP6c=
X-Google-Smtp-Source: ABdhPJy3D0c45ERBHTqshQ96nMtt4rknzHs7PYfHogrNEW0SdwKi3qL11LGIxy98m5lIaVCO2cnFgA==
X-Received: by 2002:a63:e413:: with SMTP id a19mr6188660pgi.408.1634248595362; 
 Thu, 14 Oct 2021 14:56:35 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id x13sm3064179pge.37.2021.10.14.14.56.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 14:56:34 -0700 (PDT)
Date: Fri, 15 Oct 2021 06:56:32 +0900
From: Stafford Horne <shorne@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] Fix %#08 misuses
Message-ID: <YWinkMLdThNN81Uo@antec>
References: <20211014185245.69803-1-dgilbert@redhat.com>
 <db332dc2-0e17-5b16-dbbf-377b9d03cffc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db332dc2-0e17-5b16-dbbf-377b9d03cffc@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=shorne@gmail.com; helo=mail-pf1-x42f.google.com
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
 "Dr. David Alan Gilbert \(git\)" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 alistair.francis@wdc.com, eblake@redhat.com, atar4qemu@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 14, 2021 at 12:33:06PM -0700, Richard Henderson wrote:
> On 10/14/21 11:52 AM, Dr. David Alan Gilbert (git) wrote:
> > Although I'm tempted to think that perhaps we should just
> > prefer '0x%08' which seems clearer.
> 
> That's what I think we should prefer.

I agree, it's always more clear to me too.

-Stafford

