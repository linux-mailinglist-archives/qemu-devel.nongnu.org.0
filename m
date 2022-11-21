Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFA1632C97
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 20:04:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxC4F-0004gQ-NJ; Mon, 21 Nov 2022 14:02:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>) id 1oxC4E-0004fu-2j
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 14:02:54 -0500
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>) id 1oxC4C-0005lC-BC
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 14:02:53 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 096D3B8136B
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 19:02:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2058C433B5
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 19:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669057367;
 bh=oiMnFT07ejtABzg+0oInY29RWWFoCmBapuxDhsu40Rg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tvenKhwnPlIvrf6UjiX1PPIDPBFlX6yM2mNFLTGYWg2bh8Jy7o+cGjlfpgQdhfy38
 mqpIeNKVKhsVnLqdA6aszdWh8Sq4oF9X8Gz2Oq+2CYhzSTJx+3oozcKGY3ZV/z+8da
 NU3xEJPGO+rJtjca6zrgcx1OnC3TJg6CTmKlqs/wXLwKkmpiVcJFQtV+WGpRNPYWqV
 FW2H1PPrYqZCeUcqHZW7nEe/RHoBBsfomuCz38lcyRigWKlF32K7ITn8USaqx/0OYA
 n24fr0uUKOvWeR69d2KCJkshbw547vsPuOa+LBRppy0+VEoUEBhNf1OdEC/c914pj9
 ry9oIXu3zps6Q==
Received: by mail-lf1-f48.google.com with SMTP id p8so20191616lfu.11
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 11:02:47 -0800 (PST)
X-Gm-Message-State: ANoB5pmxotGuPWli9ZZWSXFep6TGvpd/0cylUEB8B/r+ghBaj9st12IR
 56f5II/U4SxgkY0bPLtYHHXQH2LIDw39Uw7e3V4=
X-Google-Smtp-Source: AA0mqf7r8XOB60m1BC9zGj/qMXAgnsUqr0T0wWzr6Z9+asJJZDFTcnW93sCRRzCZcq+BZJx83g/l+nncquLtUkfG6Rc=
X-Received: by 2002:a05:6512:312c:b0:4b4:11c0:f572 with SMTP id
 p12-20020a056512312c00b004b411c0f572mr713534lfd.583.1669057365704; Mon, 21
 Nov 2022 11:02:45 -0800 (PST)
MIME-Version: 1.0
References: <20221121174326.68520-1-ardb@kernel.org>
 <CAFEAcA_Tz1an8cJO_6kDozMQ1kpqzu60gKq+c4Rj1veFz0REpg@mail.gmail.com>
In-Reply-To: <CAFEAcA_Tz1an8cJO_6kDozMQ1kpqzu60gKq+c4Rj1veFz0REpg@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 21 Nov 2022 20:02:34 +0100
X-Gmail-Original-Message-ID: <CAMj1kXG_AcmtvEKBUCX8eAsSv7xasGc0HAvQDSnu7ByMie5W9Q@mail.gmail.com>
Message-ID: <CAMj1kXG_AcmtvEKBUCX8eAsSv7xasGc0HAvQDSnu7ByMie5W9Q@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Use signed quantity to represent VMSAv8-64
 translation level
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=ardb@kernel.org; helo=ams.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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

On Mon, 21 Nov 2022 at 19:51, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 21 Nov 2022 at 17:43, Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> > The LPA2 extension implements 52-bit virtual addressing for 4k and 16k
> > translation granules, and for the former, this means an additional level
> > of translation is needed. This means we start counting at -1 instead of
> > 0 when doing a walk, and so 'level' is now a signed quantity, and should
> > be typed as such. So turn it from uint32_t into int32_t.
> >
>
> Does this cause any visible wrong behaviour, or is it just
> a cleanup thing ?
>

No, 5 level paging is completely broken because of this, given that
the 'level < 3' tests give the wrong result for (uint32_t)-1

