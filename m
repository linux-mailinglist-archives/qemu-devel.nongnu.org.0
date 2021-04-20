Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2E7365C3A
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 17:29:46 +0200 (CEST)
Received: from localhost ([::1]:53988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYsJt-0005Jw-Bg
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 11:29:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYsIp-0004I7-72
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 11:28:40 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:41745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYsIj-0008PK-1q
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 11:28:38 -0400
Received: by mail-ed1-x531.google.com with SMTP id j7so8685873eds.8
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 08:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=t9eB5EErjA81Pvrx+s5yxa7BAhpLT/QN3de0R/J4Pvs=;
 b=hdgnX2u17jXaRaxhg6R/3+eyxCBtfV8RbgrxSZVi79htPOdm4VcMIvWL1g5kDthqq2
 Vlyu1/vWjXubBvv026MlcX2O9k79npFvDqyBxTa25TsanR95TOxveBBnIyYW4XQ42B0a
 37zHF7WGWcjuyEFfOJkOxXD0yylZNMNGfQBg/C4IOTClxSfNabeWyVjWgEWwwAlokFre
 +h33nyfF+BTB83XVHMbgWbmuJ094MAjMmvwuQmzEF9uPDD7AxCMAaOMb9pzmFpuWhBDE
 VXVGuH1FfrPUD9XWuvDMcBuH+JAn/25g2Tco0gUIMmn2Fc2ttdw+E3qCvlJBlbQ8ofJX
 0W6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=t9eB5EErjA81Pvrx+s5yxa7BAhpLT/QN3de0R/J4Pvs=;
 b=iCdA4yvWHxzXkFO7o0A4eq+KG0D2P0NJ0BwajrVBEBd1QksJalMdF6MCbnglyfZUUs
 WXhd8Ni4SHtvhEkKtDMpc2w1MDMoUiOorNhZ5Q27BXUY2W10/i42aKzmMTQmq65+uX2A
 YBK4kowojf9mMW256VPowUEWYHVj33wthI9H+WYfzJUFK7AailGsngnzyMIT+OiKjdlX
 TD8+LSp2saPZ1HYQFvqHvbhpylwa2xbBSzvTMj3F6GNViiZWH/i2WiqZNdPUIvX1ih81
 Aq44D/vZ2PLzeS1oLeFP1q/DBjDiwy4cEuCd8MGfay1Y9dP/6TyAi7C8tiYeXpF/0oS/
 TOJw==
X-Gm-Message-State: AOAM530uGNTwBTggvfAF9Nlq14ExfOn9ILS+i4nZ8jmfNMs4DBwACDvo
 Wg31yPdqOg+lenpDwY1Om2JGzSYrRkvbFem8feTGww==
X-Google-Smtp-Source: ABdhPJxaQ+bgP7dpWJxIVsH54SRQg1s0jbZJioLVTaSd5zI30RQrUgmpVw7D8C69pYVTjIvQ7thsc7YKbkjcg01Sudw=
X-Received: by 2002:a05:6402:51d0:: with SMTP id
 r16mr29590140edd.52.1618932511007; 
 Tue, 20 Apr 2021 08:28:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210420125831.233092-1-marcandre.lureau@redhat.com>
 <8735vl578b.fsf@dusky.pond.sub.org>
In-Reply-To: <8735vl578b.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Apr 2021 16:27:38 +0100
Message-ID: <CAFEAcA8mWB-B73CnPvAFPyuTFZYe7HpMKkWz6LsNkJ1aJ6axUw@mail.gmail.com>
Subject: Re: [PATCH for-6.0?] qga: fix guest-get-disks regression
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 20 Apr 2021 at 16:03, Markus Armbruster <armbru@redhat.com> wrote:
>
> marcandre.lureau@redhat.com writes:
>
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Commit 54aa3de72 ("qapi: Use QAPI_LIST_PREPEND() where possible")
> > inadvertently removed the has_dependencies from the partition disk
> > info, resulting in empty list being returned.
> >
> > Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=3D1950833
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  qga/commands-posix.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> > index 4299ebd96f..75dbaab68e 100644
> > --- a/qga/commands-posix.c
> > +++ b/qga/commands-posix.c
> > @@ -1376,6 +1376,7 @@ static GuestDiskInfoList *get_disk_partitions(
> >          partition =3D g_new0(GuestDiskInfo, 1);
> >          partition->name =3D dev_name;
> >          partition->partition =3D true;
> > +        partition->has_dependencies =3D true;
> >          /* Add parent disk as dependent for easier tracking of hierarc=
hy */
> >          QAPI_LIST_PREPEND(partition->dependencies, g_strdup(disk_dev))=
;
>
> This is a recent regression, and the fix is as safe as they get.  Please
> apply for 6.0.
>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>

Thanks; applied to master for 6.0.

-- PMM

