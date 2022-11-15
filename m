Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E295629CB3
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 15:56:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouxLq-0003tn-CA; Tue, 15 Nov 2022 09:55:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ouxLl-0003oy-Qt
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 09:55:47 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ouxLj-0001Jt-RZ
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 09:55:45 -0500
Received: by mail-pl1-x62b.google.com with SMTP id p12so13379369plq.4
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 06:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0Tc0hWjHDhxredBM8aOccg8KPjshZEuLGUjXMiF+OoU=;
 b=o9Evofu6l/o3NFdrgdWPEItFfZbTtbvwc2lKP/ds2QjsOvx8/J+TBZyqfeW2NiUEgP
 dE1bMkxUkkciPllu17gtD5hZfoA1xYWQgeD+pUybmto9bXcsysS21tKfySf9G+VkuNBa
 JCJL5QIDxgxmA1DW9WP7T8EFKyvQMnkug9x6wQmktjfbIUiM/gkAmv24TCDywUsVUWpP
 7OhIFJc2T4qYJ9wx6MiOEwqy8CLSSUZaIpey573AhonazDX/TA/t8XVeJ+GPV54mJsRF
 aYf9r3BTB4zDfP3VtazgPAAsOOHYRiY8Q6BgbaJ4ymdZIHKdH3TEyNfDIbSSR3xVFejx
 uQWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0Tc0hWjHDhxredBM8aOccg8KPjshZEuLGUjXMiF+OoU=;
 b=kVBbJUqBRLhZR0VvcVm6OlnZ3CbS9w/adJsIcN4GnlVJj8dtM6axCkfWtD/8Nc1jNz
 ThlgbHb9ELXg95+EWX7h09DH/MgiiY6KCF/V/nxQbJ2sj1/HGaLBU3mfSAg27mOW5jLl
 cVIxqgvPii+GAZIo6B7fQs2J7kgW0X6Z9SzuZRgoC7SH2MhJJm4gz9z6kp7i+E0t67R+
 QHi3EPyWhG/JVfXDS0aK+XNd02JTMgLdDLskJIQbX0MHaOuYzFtKJ+Gm60fLIjZE98b9
 TC4Nh0tm8RjmRj7ojbndFDB6YiAt8+OJrAFHK378uTidFn2NildnHY5AKEKNHUuuxUIj
 RO+Q==
X-Gm-Message-State: ANoB5plJ5Oaetq3aw4puhq+KSkNnDqa9dcHDVOI1qxlZn76xvCpVBKqq
 uE0izLyJsk2xUw3iMeWhEHsE5ju/sIXun5+fDd8kXg==
X-Google-Smtp-Source: AA0mqf6iLVcgrTfJIStARlnb7GDalAd96qSfm6/SbvmE2kcCIUo56YL9I0S4Yy0nID0S9QDUQQ+TbwClqT3/P6vlXtw=
X-Received: by 2002:a17:90a:7565:b0:205:edfd:13f7 with SMTP id
 q92-20020a17090a756500b00205edfd13f7mr2681344pjk.19.1668524141073; Tue, 15
 Nov 2022 06:55:41 -0800 (PST)
MIME-Version: 1.0
References: <20221115142141.2073761-1-clg@kaod.org>
 <CAFEAcA9OiNsX4-O60zKXL8WoEJbOH2TQr3LwDFJH4SOS8EPTMg@mail.gmail.com>
 <566a0720-f732-cb27-a98f-367e1981a02f@kaod.org>
In-Reply-To: <566a0720-f732-cb27-a98f-367e1981a02f@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Nov 2022 14:55:29 +0000
Message-ID: <CAFEAcA8AoQKGNEYwmw5SiDykRR+XWEvH0og_at-HTAiTZo=jag@mail.gmail.com>
Subject: Re: [PATCH] m25p80: Warn the user when the backend file is too small
 for the device
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Alistair Francis <alistair@alistair23.me>,
 Francisco Iglesias <frasse.iglesias@gmail.com>, 
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Peter Delevoryas <peter@pjd.dev>, qemu-block@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62b.google.com
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

On Tue, 15 Nov 2022 at 14:51, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 11/15/22 15:34, Peter Maydell wrote:
> > On Tue, 15 Nov 2022 at 14:22, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> >>
> >> Currently, when a block backend is attached to a m25p80 device and the
> >> associated file size does not match the flash model, QEMU complains
> >> with the error message "failed to read the initial flash content".
> >> This is confusing for the user.
> >
> > The commit message says we get an unhelpful error if the
> > file size "does not match"...
> >
> >> Improve the reported error with a new message regarding the file size.
> >>
> >> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> >> ---
> >>   hw/block/m25p80.c | 8 ++++++++
> >>   1 file changed, 8 insertions(+)
> >>
> >> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> >> index 02adc87527..e0515e2a1e 100644
> >> --- a/hw/block/m25p80.c
> >> +++ b/hw/block/m25p80.c
> >> @@ -1606,6 +1606,14 @@ static void m25p80_realize(SSIPeripheral *ss, E=
rror **errp)
> >>       if (s->blk) {
> >>           uint64_t perm =3D BLK_PERM_CONSISTENT_READ |
> >>                           (blk_supports_write_perm(s->blk) ? BLK_PERM_=
WRITE : 0);
> >> +
> >> +        if (blk_getlength(s->blk) < s->size) {
> >
> > ...but the code change is only checking for "too small".
> >
> > What happens if the user provides a backing file that is too large ?
>
> That's ok because the blk_pread() call following, which loads in RAM
> the initial data, won't fail.
>
> It might be better to enforce a strict check on the size to avoid
> further confusion ? and change the error message to be clear.

Can we use blk_check_size_and_read_all() here rather than
a manual "check size, and then pread" ? That will take care
of the error message for you and make this device behave
the same way as other flash devices which use block backends.

thanks
-- PMM

