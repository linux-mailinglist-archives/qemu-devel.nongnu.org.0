Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBC32DB200
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 17:59:07 +0100 (CET)
Received: from localhost ([::1]:47298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpDfB-00078s-AA
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 11:59:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpDd6-0005Vu-Df
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 11:56:52 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:37432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpDd3-0008Ki-AS
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 11:56:51 -0500
Received: by mail-ej1-x62f.google.com with SMTP id ga15so28690219ejb.4
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 08:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7kpKqCEpbuSvclKQbN3Lpw0eEBfI9diNxlmViowhAVs=;
 b=tYwJbx0gQ/bSfD/X1alES2YsixrxpTPpzFI56BFKdjqE0+cBl4MToPmMEi9i57MAar
 x8KMTcgunRsSaGIvCjx+2qs/q02qwPPTMvlVrM1lOtjQze98sc16HwLj7I0C2oBu11Aa
 ZzeJIggOzPsQjv2k9wql5NMFBj5uPh/Hey93k9k8rtXAQheT7wfGfhrpYj+gfUgx8wFf
 m+MYtHIVsqEa1gciHFymve3DXyxOC1ni39Xp060PRGONn1R3vx3ZA5slQiuzCSq4ae5X
 a5kF5l84ae8IvRonKgCZqpSMmck6M3GH19L9g/TRaAveXLJse5SXkZLNgoq/EQsmFe9N
 iRqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7kpKqCEpbuSvclKQbN3Lpw0eEBfI9diNxlmViowhAVs=;
 b=AfXTv1VddwPWVF5zZh2PUc83n9qYjfvohWATya+RGzXU5bSrh930X26Mn20DX3mrJD
 AvubgqYeadkFNoV/Bv6miTQye8YMG5BVYuGhxHO1j6M88eEomtwyQhpfNweKkhM1w2tr
 s0/cYCRCEzq9kgn+pt4XjtpK9C4NPswQjWlok1R1NcUZqhDioj3M2CzBf5tPC6g/uW1Y
 Bgh7uaU7zpFp9xBnHGChqOmCcmzDeLOiJrg5OooOlDYDzQ20k62Xx9shVW1RQ9wQUvcp
 m6inXzrh4wpPlDmq/wMqRaLVp+EyLbBHUjUvR8mRiHJXSNeAEwOVyePIhvu3eDmI6R6t
 kg6g==
X-Gm-Message-State: AOAM530/6/LkE+dMT48Ee6s74D+MEN6ExXvKTM3GBQDhHadvms7oYhDR
 BMOnT0/NPu5GBeB9b4SOvabVWo4+z9aUYQ6LLGv4jr/01To=
X-Google-Smtp-Source: ABdhPJzXwFEdIq+5sYzkHFl0cDiuohaMQs57I7yQqZn3s6nY09CIzsVTgJ4xooAwFqTee0R5Lt54n0lD+4yEjODGV7U=
X-Received: by 2002:a17:906:1542:: with SMTP id
 c2mr27074821ejd.382.1608051407494; 
 Tue, 15 Dec 2020 08:56:47 -0800 (PST)
MIME-Version: 1.0
References: <20201214045807.41003-1-david@gibson.dropbear.id.au>
 <20201214045807.41003-7-david@gibson.dropbear.id.au>
In-Reply-To: <20201214045807.41003-7-david@gibson.dropbear.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Dec 2020 16:56:36 +0000
Message-ID: <CAFEAcA8sOMxFJN=t69y=oSruh4a+LMUNWHX60wOEZZ8Cr=64OQ@mail.gmail.com>
Subject: Re: [PULL 06/30] spapr: Do PHB hoplug sanity check at pre-plug
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Dec 2020 at 04:58, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> From: Greg Kurz <groug@kaod.org>
>
> We currently detect that a PHB index is already in use at plug time.
> But this can be decteted at pre-plug in order to error out earlier.
>
> This allows to pass &error_abort to spapr_drc_attach() and to end
> up with a plug handler that doesn't need to report errors anymore.
>
> Signed-off-by: Greg Kurz <groug@kaod.org>
> Message-Id: <20201120234208.683521-8-groug@kaod.org>
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>

Hi; this change seems to have nudged one of Coverity's
heuristics into deciding that spapr_drc_by_id() can return
NULL (because its return value is checked here, I suspect),
so it reports CID 1437757, 1437758, where spapr_add_lmbs()
and spapr_memory_unplug_request() both take the return value
of spapr_drc_by_id() and pass it directly to spapr_drc_index(),
which will crash if it is passed a NULL pointer.

Is it impossible for spapr_drc_by_id() to return NULL in
those functions (ie Coverity false positive) or is there
a missing error check ?

thanks
-- PMM

