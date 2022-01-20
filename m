Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A99495508
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 20:43:33 +0100 (CET)
Received: from localhost ([::1]:52816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAdLF-0007ov-VJ
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 14:43:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <godmar@gmail.com>)
 id 1nAYTb-0003XS-PV; Thu, 20 Jan 2022 09:31:53 -0500
Received: from mail-lf1-f47.google.com ([209.85.167.47]:46869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <godmar@gmail.com>)
 id 1nAYTZ-00045U-JJ; Thu, 20 Jan 2022 09:31:47 -0500
Received: by mail-lf1-f47.google.com with SMTP id d3so22250729lfv.13;
 Thu, 20 Jan 2022 06:31:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bxMFGLiH1C/LYg4/0n9O1F0GhFyjbpUYP3Iu3Wqmj94=;
 b=ztgqYeNF0get2u/xhAtRpNj0SZkdNG5pY8oVPsnrjPURNCOI5847+7Pj6VGQpJo/Rh
 JbstqrqL2lq5APt2aG+I+31bh2bvcMdkQJ1rRLZ0C2apSgdj9qVasfiJ59iTfMGgyzwB
 TLxyDlXR/o9CURobF2DqmiwSbm3BKdoMkXbEWGDZwHAzNUnyFNxFX86AVY9cO3Zg6zcm
 NIwQ967LtHP2Oh19kBTrVpN8lH3Ppslcla9GQ2H3TX9Rn0vU24pbFVuMkDN2YFtmco65
 yTQE+ohapYsyB7hrnbmBAA9wDnRBh501Y6CKtob7nQmLhyl2TDwBjsm7vOJDgzmJPggJ
 0HAA==
X-Gm-Message-State: AOAM5331yZPYEbYepOOJpV+6PMgsjKYmx4gJzC6Hq9LR+J/nqIqrLSXt
 mZV93Pvxl4Cgb9u7TNhHtnZVFQSbWInfBAtv63Y=
X-Google-Smtp-Source: ABdhPJyeOfzi603m1n074Noo9CQceGsKck0QIBFvu4yX9n/LsKQHCjUWiSLWkJe8XTpDSboXNXP1tNLcR5/6XVYdKhw=
X-Received: by 2002:a05:6512:21d1:: with SMTP id
 d17mr21666482lft.452.1642689102651; 
 Thu, 20 Jan 2022 06:31:42 -0800 (PST)
MIME-Version: 1.0
References: <CAB4+JY+3N5qvC3p_e2DWWa=-QUtW+wH5ZdEJFPKTdSD5TVPXMA@mail.gmail.com>
 <CAFEAcA9tGnEOOhSbCJv2=JoU5C3cFB08mdaLRERgzPdatKQB=g@mail.gmail.com>
 <alpine.DEB.2.22.394.2201201305580.844042@anisinha-lenovo>
 <alpine.OSX.2.20.2201201527140.38065@athabasca.local>
 <alpine.OSX.2.20.2201201536020.38065@athabasca.local>
 <YelKgywMaiHXCR4n@redhat.com>
In-Reply-To: <YelKgywMaiHXCR4n@redhat.com>
From: Godmar Back <gback@cs.vt.edu>
Date: Thu, 20 Jan 2022 09:31:31 -0500
Message-ID: <CAB4+JYKpsVhJhHs_Xv0Y5SArWtjngiACUuFqy1jsj5DaRgq44Q@mail.gmail.com>
Subject: Re: MP tables do not report multiple CPUs in Qemu 6.2.0 on x86 when
 given -smp cpus=n flag
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.167.47; envelope-from=godmar@gmail.com;
 helo=mail-lf1-f47.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 20 Jan 2022 10:11:39 -0500
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 qemu-discuss@nongnu.org, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thank you for the replies. I will note that I suspected SeaBIOS as
well. However, testing 6.2.0 with SeaBIOS 14 (which is the version
that shipped with 6.1.1) did not change the behavior, so I concluded
it was a change in Qemu, despite the fact that SeaBIOS is setting up
the tables.

I was about to write a note that this information is hard to find, but
I feel I need to apologize. When I go to the user manual [1] it
explains the change in behavior:

"Historically preference was given to the coarsest topology parameters
when computing missing values (ie sockets preferred over cores, which
were preferred over threads), however, this behaviour is considered
liable to change. Prior to 6.2 the preference was sockets over cores
over threads. Since 6.2 the preference is cores over sockets over
threads.

For example, the following option defines a machine board with 2
sockets of 1 core before 6.2 and 1 socket of 2 cores after 6.2:

-smp 2"

I should have checked first.

[1] https://www.qemu.org/docs/master/system/invocation.html

