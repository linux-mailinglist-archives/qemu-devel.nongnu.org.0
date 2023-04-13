Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1BC6E0746
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 08:58:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmquF-00046T-Sf; Thu, 13 Apr 2023 02:58:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pmqu3-00046D-BB
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 02:57:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pmqu1-0003bt-Ov
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 02:57:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681369073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R1aEfiXYt/hILdnAE1yl64SZlsi/fPuujh2bRpq6ZlM=;
 b=dgmc3e5lu2G5eLic73tdvrj8xIDqsiLKMK7wupeJlwcZuUCsvDHYVZEP8DL9ZCD4ZO2oEP
 Qb5yfq3E8ypzl+yjYVFOzD8FBXqunVSAPp1/wwQfQFtyDtLR7TEJFV0d6GxcSUuHa36NBd
 gnh6nFYFKiM88QMEDBJhTSYXUPpEeTI=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-S-VY7us1OsSSAqN0q5v7-Q-1; Thu, 13 Apr 2023 02:57:49 -0400
X-MC-Unique: S-VY7us1OsSSAqN0q5v7-Q-1
Received: by mail-oa1-f69.google.com with SMTP id
 586e51a60fabf-18654d56a1eso2201049fac.4
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 23:57:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681369069; x=1683961069;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R1aEfiXYt/hILdnAE1yl64SZlsi/fPuujh2bRpq6ZlM=;
 b=RGPhTnOnQIasymVmudSH4oHdlGv1VaIxPEOtkZYEgtZFXifz6iFxI9LSp9p6XGKArg
 i/ZBZJ+RTX6kPaD5Uou4noQm2/zLgySa5iyMnpOGGp7JAxjIILvVRouu+1l/2J227wII
 l0U5D37ut90vX/EO17Yqhhojjqi0qsuTjLjJFWCI8/74XjlxcW+lA7MrJz9t5kgt29vu
 f8wkJ1Zw8lbybsxNIoNKdwvbJlOpPGSVQqM4253hCQKGhllMHDC1Udaqgt5KIO0O66aP
 AH4z9msfgucNaFKYC1WxLBl4Mf5GB54zCHIvrbqXAZ1m1RESQQr99+1EAvT3XnEFAZxu
 9SpQ==
X-Gm-Message-State: AAQBX9d3K46+C4yKqwZ62u1q3TdHFb/tNxbMDgByFKWgd3IjtwwfQFN1
 Z+GDlLDGHHskgGOdaEQnjfx0O4rDSiFAsjHiFAKN3doWwO4qY07wTjwfp6FclUH5Ka47UVwZCWT
 qAcArztIcuXmfrLC6z1Edn9xTuBZnbXE=
X-Received: by 2002:a05:6830:18da:b0:6a1:4c0e:1268 with SMTP id
 v26-20020a05683018da00b006a14c0e1268mr270914ote.2.1681369068806; 
 Wed, 12 Apr 2023 23:57:48 -0700 (PDT)
X-Google-Smtp-Source: AKy350b5x8MoGYXYirXfevhg1TbVBa9el1dOn9HGeSlNKtfDwu3BPeHR5hHWFrVu1SJ1ibOWbaaxqOdUWkIW6xhumj4=
X-Received: by 2002:a05:6830:18da:b0:6a1:4c0e:1268 with SMTP id
 v26-20020a05683018da00b006a14c0e1268mr270906ote.2.1681369068596; Wed, 12 Apr
 2023 23:57:48 -0700 (PDT)
MIME-Version: 1.0
References: <1680624004-154390-1-git-send-email-steven.sistare@oracle.com>
 <9da71dfa-52b7-5b65-3160-6f236440add4@linaro.org>
 <4be85e27-0990-7ba9-60a1-45d53d63004e@oracle.com>
 <268c8128-d1cf-3103-b990-e92a2e69465f@redhat.com>
 <91cc68cc-e1a6-28f8-fcbb-9a6ddf132fb8@oracle.com>
In-Reply-To: <91cc68cc-e1a6-28f8-fcbb-9a6ddf132fb8@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 13 Apr 2023 14:57:37 +0800
Message-ID: <CACGkMEvj+c=gjdivGe6J2vSi4p1ve+7ZxLweaqNp=K2mPxxfDQ@mail.gmail.com>
Subject: Re: [PATCH] tap: fix net_init_tap() return code
To: Steven Sistare <steven.sistare@oracle.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Tue, Apr 11, 2023 at 9:10=E2=80=AFPM Steven Sistare
<steven.sistare@oracle.com> wrote:
>
> On 4/11/2023 2:32 AM, Jason Wang wrote:
> > =E5=9C=A8 2023/4/5 23:38, Steven Sistare =E5=86=99=E9=81=93:
> >> On 4/4/2023 6:00 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> >>> On 4/4/23 18:00, Steve Sistare wrote:
> >>>> When net_init_tap() succeeds for a multi-queue device, it returns a
> >>>> non-zero ret=3D1 code to its caller, because of this code where ret =
becomes
> >>> Indeed g_unix_set_fd_nonblocking() returns TRUE on success.
> >>>
> >>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> >>>
> >>>> 1 when g_unix_set_fd_nonblocking succeeds.  Luckily, the only curren=
t call
> >>>> site checks for negative, rather than non-zero.
> >>>>
> >>>>       ret =3D g_unix_set_fd_nonblocking(fd, true, NULL);
> >>>>       if (!ret) {
> >>>>           ...
> >>>>           goto free_fail;
> >>>>
> >>>> Also, if g_unix_set_fd_nonblocking fails (though unlikely), ret=3D0 =
is returned,
> >>>> and the caller will use a broken interface.
> >>> We should return -1 from free_fail, not trying to propagate 'ret':
> >> Thanks for the review.  I will add your "return -1" changes if Jason a=
grees.
> >
> > Note that the "free_fail" label is kind of ambiguous. It is used even i=
f we succeed if I was not wrong.
>
> Yes, good catch.  We must return 0 from free_fail on success.
> I could delete all uses of ret, test errp in free_fail, and return either=
 -1 or 0.
> Or, you could accept my initial small patch.
>
> What do you prefer?

I've queued your patch for 8.1.

Thanks

>
> - Steve
>
> >>> -- >8 --
> >>> diff --git a/net/tap.c b/net/tap.c
> >>> index 1bf085d422..e59238bda0 100644
> >>> --- a/net/tap.c
> >>> +++ b/net/tap.c
> >>> @@ -821,3 +821,2 @@ int net_init_tap(const Netdev *netdev, const char=
 *name,
> >>>       char ifname[128];
> >>> -    int ret =3D 0;
> >>>
> >>> @@ -896,3 +895,2 @@ int net_init_tap(const Netdev *netdev, const char=
 *name,
> >>>                              "the number of vhostfds passed");
> >>> -                ret =3D -1;
> >>>                   goto free_fail;
> >>> @@ -904,3 +902,2 @@ int net_init_tap(const Netdev *netdev, const char=
 *name,
> >>>               if (fd =3D=3D -1) {
> >>> -                ret =3D -1;
> >>>                   goto free_fail;
> >>> @@ -908,4 +905,3 @@ int net_init_tap(const Netdev *netdev, const char=
 *name,
> >>>
> >>> -            ret =3D g_unix_set_fd_nonblocking(fd, true, NULL);
> >>> -            if (!ret) {
> >>> +            if (!g_unix_set_fd_nonblocking(fd, true, NULL)) {
> >>>                   error_setg_errno(errp, errno, "%s: Can't use file d=
escriptor %d",
> >>> @@ -918,3 +914,2 @@ int net_init_tap(const Netdev *netdev, const char=
 *name,
> >>>                   if (vnet_hdr < 0) {
> >>> -                    ret =3D -1;
> >>>                       goto free_fail;
> >>> @@ -924,3 +919,2 @@ int net_init_tap(const Netdev *netdev, const char=
 *name,
> >>>                              "vnet_hdr not consistent across given ta=
p fds");
> >>> -                ret =3D -1;
> >>>                   goto free_fail;
> >>> @@ -934,3 +928,2 @@ int net_init_tap(const Netdev *netdev, const char=
 *name,
> >>>                   error_propagate(errp, err);
> >>> -                ret =3D -1;
> >>>                   goto free_fail;
> >>> @@ -948,3 +941,3 @@ free_fail:
> >>>           g_free(vhost_fds);
> >>> -        return ret;
> >>> +        return -1;
> >>>       } else if (tap->helper) {
> >>> ---
> >>>
> >>>> Fixes: a8208626ba89.. ("net: replace qemu_set_nonblock()")
> >>>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> >>>> ---
> >>>>    net/tap.c | 4 ++--
> >>>>    1 file changed, 2 insertions(+), 2 deletions(-)
> >


