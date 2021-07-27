Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA9F3D745C
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 13:29:22 +0200 (CEST)
Received: from localhost ([::1]:42690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8LGz-0003aE-If
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 07:29:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1m8LG3-0002uY-Db
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 07:28:23 -0400
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36]:45630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1m8LG1-00071T-Mo
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 07:28:23 -0400
Received: by mail-oo1-xc36.google.com with SMTP id
 s21-20020a4ae5550000b02902667598672bso2995230oot.12
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 04:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=gvAclqr6IVogEKIBs1tfR8U3aqTBhmg96ioRHafCBlw=;
 b=vgZYmkjRJV/3fhjRP756u1cMdfTp0CoQaqukKeJz1rlcXLjKSqu1dtqMzlNbJ0pAv2
 vAuOI4O/nlBH8Y0M3vsYaW/8Wf3cqrwpqedtATiF1SnlBs6KcR/fMvm04+vRxT75jWfL
 h2MYcCVC1T3/N2QT0mAr97D/pS97XdD9GHx5GwLiCarmcy9JQuQmSo+Wxup3orzb9J88
 2wmujtGlg1/hbGdR2wD2Fr744DK1Z+CQ7nmPiypXnur3oKq8h3rzsxAJWy3mPLPd3dxN
 +uFMikjPqcx9ezP/1e2H9QPiaWrxAgzaEt3XcFqLPT2RWPR3UCNSwS/ZUjb/sD2Do14Q
 u62w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to;
 bh=gvAclqr6IVogEKIBs1tfR8U3aqTBhmg96ioRHafCBlw=;
 b=bWqdPrSbVn9suz+Cdjxen2F6/In/Ms2kvXaypMXqqa5bBxrU6uI8Q5XoFqFdY0TcjM
 L+c8OF45y/OStQpteU1NrZpCkmKSGydYCHx+aTLdgDgDWP7So0V/8xQ+mFSvbpTDxEvT
 gF1fj8BpmibXMHu0I1E2O1Y0Hzx5pK5NEH1/z059kW6xs7VEv8YuuTTWBGPBEZ1ShUcu
 GbTx1eVK8w4JJBkGXEI8W1OOfZkeRenahLkQHG902aUCvYrgfoIRnhprXRtJq/39HCj2
 CCLmaZpQvhBGR2fcxP4ybARhfpHVY5XD61PvRr9Qgm8RPE9qfShl1oS1faOlMGKA8d/P
 5AnQ==
X-Gm-Message-State: AOAM532vU+3a3XA8vDwU5+Ns/HuN/nLaI6nZH0nvOjK5mej+mkMj9Qge
 jgQI6Xm9dZcwLavPE/JBvQ==
X-Google-Smtp-Source: ABdhPJwRnZQGXsC43OvOOQmsTgLdxY2xyuXmNxUNedZrpMdipqhB2z26zcVIqHeqQmAjnt4EHd6mMA==
X-Received: by 2002:a4a:7651:: with SMTP id w17mr13279539ooe.38.1627385299495; 
 Tue, 27 Jul 2021 04:28:19 -0700 (PDT)
Received: from serve.minyard.net ([47.184.156.158])
 by smtp.gmail.com with ESMTPSA id d7sm423850oon.18.2021.07.27.04.28.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 04:28:18 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:b0e5:c1ad:46f6:254a])
 by serve.minyard.net (Postfix) with ESMTPSA id 99B201800D4;
 Tue, 27 Jul 2021 11:28:17 +0000 (UTC)
Date: Tue, 27 Jul 2021 06:28:16 -0500
From: Corey Minyard <minyard@acm.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: QEMU question: upstreaming I2C device with unpublished datasheet
Message-ID: <20210727112816.GU3406@minyard.net>
References: <CAMiADQ8S9XSgH_zEGTw2bQpoPh4BqKByEaAUA5TTL2rLwYV=gA@mail.gmail.com>
 <CAFEAcA8DqSSg3i5L+Rj6m+9X3BWzr===FdufFJgR49tvq6dq=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8DqSSg3i5L+Rj6m+9X3BWzr===FdufFJgR49tvq6dq=A@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::c36;
 envelope-from=tcminyard@gmail.com; helo=mail-oo1-xc36.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: minyard@acm.org
Cc: Hao Wu <wuhaotsh@google.com>, Patrick Venture <venture@google.com>,
 Shengtan Mao <stmao@google.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Chris Rauer <crauer@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 27, 2021 at 10:23:26AM +0100, Peter Maydell wrote:
> On Wed, 21 Jul 2021 at 22:06, Shengtan Mao <stmao@google.com> wrote:
> >
> > Hi everyone,
> > we are hoping to upstream a MAX I2C device to QEMU. The device's datasheet is not public, and we are contacting the Maxim company to get their permission. If Maxim is okay with upstreaming the device with an unpublished datasheet, will this still be an issue with QEMU?
> 
> It's not inherently a blocker, but the difficulty is code review.
> Without knowing how the device should behave, it's hard to tell
> whether the model is doing the right thing. Ideally Maxim should
> just publish their datasheet, so if you/your company has any
> leverage with them you should push them to do that :-)
> 
> That said, we do have other device models in the tree which
> don't have public datasheets, and as long as the device is not
> too complicated we should be OK as long as you can also submit
> enough test cases that we could refactor the device in future
> without worrying too much that we're breaking it because we don't
> know how it's supposed to behave.

Thanks Peter.

I will add that you need to be sure you have the legal right to publish
the software.  If you have a non-public datasheet, that probably means
you had to sign NDA or something like that to see it.  That may limit
what you can do.

-corey

