Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7424A686C21
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 17:52:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNGK5-00069W-Kj; Wed, 01 Feb 2023 11:51:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNGK2-00068w-H9
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 11:50:58 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNGK0-0007h5-Ee
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 11:50:58 -0500
Received: by mail-pj1-x102d.google.com with SMTP id j5so17860727pjn.5
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 08:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+WfEqgjgwdqTNrtXOKmMGHQkAquEfO0ghoxnpd+L9VM=;
 b=uKr9Q8ZXjMZb44FXiORPlWgHCzYTIgtHyXLDqHI30FVN0UOCM7xHCupPK92dpCIpKW
 xlQtzeMnRBtSdd0p5H9rAxgii0R/UsrLzbCcztR8fQnehEEvdevYxIGI5ZnsRkROHwWk
 m5ur6MN+hz0YYSSbjP/OPrt8KbOgJKpBBggG5MAi73LgJLDCgwC9W8H+gk3nvg2dBpaG
 jbf1+FimMZoFUlPvfU8jA3GvbMal4b4wtyx4FRpdrDsZ6/gdvHHWgHtAg9qt6iIsXMJ1
 c3AN+aUzwPX09B84JQFarwFid7mUkSqODO/iUFoAcfIYFEVOaAkKuV99GoNR64OV33cl
 qE3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+WfEqgjgwdqTNrtXOKmMGHQkAquEfO0ghoxnpd+L9VM=;
 b=cwhdS88loAQz8ZWZdqhE6GCti7MgTzwfDz/3HW7y8FHN6pPyQ8ZWLNcGJ8jqM4BTrj
 WlFk9AEjxr+Ng+uRMOkgYxvUGH0JhEa2w2TCUWc5tAOrKQCtU8xVcy3e+LUxQVlpCujS
 UFKcB7StqJJSRFHhgEpZtwzgHyW+IHQkhete94bf8S0uKMrnX5eVs5ka11BF8AObgXAn
 PrkINWmvepZYhkpDneH2K/GGTCd25AbiKFkhm2X7u5FnhKs6NJgY3lj1sK+1xNIek3sr
 iB0L0Cone0qny9Sk76G+fW2pYXTCdqa3IBV0WHKTjyWKfYqG9ZyNlrodrEuZIj7kWh1J
 xgwQ==
X-Gm-Message-State: AO0yUKVHsXlxQPOQp23Y0WUOLPegPD7MmZEeWO49HYCqwXzINANEOAeT
 lflV+flU8X0CHMmbuZQrKlfy68semCnZalkbNO97PA==
X-Google-Smtp-Source: AK7set9Vm+0ROj1uzDAwo873aRT7ypB5rszyWP+5ysPPsPKphakj0jWbxk8RzaFLzq+bjnv/SyMx9xsJB8hoASQkag8=
X-Received: by 2002:a17:90a:1f43:b0:22c:baa:c2d5 with SMTP id
 y3-20020a17090a1f4300b0022c0baac2d5mr585923pjy.53.1675270254906; Wed, 01 Feb
 2023 08:50:54 -0800 (PST)
MIME-Version: 1.0
References: <da39abab9785aea2a2e7652ed6403b6268aeb31f.camel@linux.ibm.com>
 <CAHmME9ouTTk1ONXm276CwunOpy=MAW1Q79x25kcQv=YJTZ88dQ@mail.gmail.com>
 <2b8fc552e1dc3a14de404eeaff0819ec8da7de54.camel@linux.ibm.com>
In-Reply-To: <2b8fc552e1dc3a14de404eeaff0819ec8da7de54.camel@linux.ibm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 1 Feb 2023 16:50:43 +0000
Message-ID: <CAFEAcA8Qem0QWz5R79Djt-n8mPBf4o+Q1dJ41O4oyTU19XZ5Hw@mail.gmail.com>
Subject: Re: [PATCH] x86: fix q35 kernel measurements broken due to rng seeding
To: jejb@linux.ibm.com
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 Gerd Hoffmann <kraxel@redhat.com>, DOV MURIK <Dov.Murik1@il.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102d.google.com
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

On Wed, 1 Feb 2023 at 15:25, James Bottomley <jejb@linux.ibm.com> wrote:
>
> On Wed, 2023-02-01 at 10:10 -0500, Jason A. Donenfeld wrote:
> > This is already fixed via the patch that MST just sent in his pull.
> > So wait a few days for that to be merged and it'll be all set.
> >
> > No need for this patch here. Do not merge.
>
> If it's not a secret, would it be too much trouble to point to the
> branch so we can actually test it?  It does seem that the biggest
> problem this issue shows is that there wasn't wide enough configuration
> testing done on the prior commits before they were merged.

In general you shouldn't expect commits to be visible in
a git branch before they get merged -- the QEMU process
is not exactly identical to the kernel one.

For a particular patch on the mailing list, you can get a git branch
with it applied by looking for the patch in https://patchew.org/QEMU/
if that's more convenient than just applying it by hand.

We also don't tend to want patches hanging around for testing
before they get merged[*] -- we figure that "in upstream git"
is the place that actually gets tested in practice; almost
nobody will be working with or testing anything else.

[*] The fix Jason refers to here that's in MST's pullreq
unfortunately hasn't made it upstream as quickly as I
would like, due to a combination of things including us
having to pause CI for a week when we ran out of minutes.

thanks
-- PMM

