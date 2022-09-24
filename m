Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8245E86F9
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 03:22:04 +0200 (CEST)
Received: from localhost ([::1]:50938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obtrn-0002lQ-1Z
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 21:22:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1obtps-0001A9-1Z; Fri, 23 Sep 2022 21:20:04 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:43708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1obtpq-0003xI-4K; Fri, 23 Sep 2022 21:20:03 -0400
Received: by mail-qk1-x732.google.com with SMTP id o7so1138229qkj.10;
 Fri, 23 Sep 2022 18:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=uf0eFiJURcD/dkvKGLBCma7KAT+Cw8m/gGurmrJkQLg=;
 b=jkfc8vDR/sS+L/SJUFLX6IqOJ66pKv7QIizXpn9/aQ/TxtS/uzP2OEtgd+ZkA4YEA4
 YTzuM1/Ck10pNOHHZjMGDBpSwVib1+gJPOi+Z23s4KgJrU5ac92kSi9EzbwENNmJXJQk
 Y3Gz5NRVyxkyBg1ayAM55jRp9t2A2uzFC6zhbRszsz9kFUjIcTHhuBFmfJTEilHKWkOg
 mruCl3uNHxL9xnSKMKzzwrDQIGndsutCMObIq9+wlXwZe034g/xXX0V1lDa2duQhCL8i
 GLDlYd/StDbgRjv0T92loBbv4Z3YZOBbG7kMnVLUj6VL9oGBekaF/kOyC8hKDMMfdKmM
 jTHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=uf0eFiJURcD/dkvKGLBCma7KAT+Cw8m/gGurmrJkQLg=;
 b=wzqN0UPbkMmc9wtv4QZErK8HOKwJ6mXKmN6EnWUDld5u5/eZyU0Gdku8uPxDa9wc+G
 njDBUxGWb/QLrWoQiMMn3Z1YiuAE/LKQdhgB3+YyWYGfAxIEyV1bQc3HkqYkDsDD68DK
 lssgyx11A2d1ZGiV1kO9OYy4fOoKDwBOLnG6iBOxMJ791shnYxhQ8ZwSCo6D0oyeiIpe
 y9zX7iXwZdgmDW0yz+VSA+e8+ngA/ityR6Iv8P/tY6L9fHS8qdUwczLs9vjQtCOHgtMi
 pwi0a/s65K8FNdhUug5izFP/K8f+xxe3dCJhP0Nh+n1sMtV2aqeALL7cQZabuT2z48QK
 ziEQ==
X-Gm-Message-State: ACrzQf24byPOSHlSBV95oA8b9mTQtQX/ptwtU+kxjn+K5vWIlrVTTnU1
 XMqQIhxVnxWlwLUDAaZu3rxnkdPTbpmtf9oH1q8=
X-Google-Smtp-Source: AMsMyM6AtCt5YkkcW6RQ0Thqavae82zJJdR1rzVGEgeDUB6otNhHRF02w87FPuYCBh3X5fP5FG/CIlFZNJ3ZtU94hf8=
X-Received: by 2002:ae9:dd42:0:b0:6cc:ead5:14b4 with SMTP id
 r63-20020ae9dd42000000b006ccead514b4mr7540649qkf.94.1663982400826; Fri, 23
 Sep 2022 18:20:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220908132817.1831008-1-bmeng.cn@gmail.com>
 <20220908132817.1831008-6-bmeng.cn@gmail.com>
 <f3447651-dadb-c0ed-f1f8-4ad80b551acf@amsat.org>
 <DM4PR11MB53589BB8CFF45CE67683E762914F9@DM4PR11MB5358.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB53589BB8CFF45CE67683E762914F9@DM4PR11MB5358.namprd11.prod.outlook.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 24 Sep 2022 09:19:50 +0800
Message-ID: <CAEUhbmWv3F-5rPnE37XbmdSyfuKAXb7JOwywqVPnzA7dq361Og@mail.gmail.com>
Subject: Re: [PATCH 5/7] block/nfs: Fix 32-bit Windows build
To: "Meng, Bin" <Bin.Meng@windriver.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
 Peter Lieven <pl@kamp.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x732.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On Wed, Sep 21, 2022 at 8:10 PM Meng, Bin <Bin.Meng@windriver.com> wrote:
>
> -----Original Message-----
> From: Philippe Mathieu-Daud=C3=A9 <philippe.mathieu.daude@gmail.com> On B=
ehalf Of Philippe Mathieu-Daud=C3=A9
> Sent: Sunday, September 18, 2022 5:32 AM
> To: Bin Meng <bmeng.cn@gmail.com>; qemu-devel@nongnu.org
> Cc: Meng, Bin <Bin.Meng@windriver.com>; Hanna Reitz <hreitz@redhat.com>; =
Kevin Wolf <kwolf@redhat.com>; Peter Lieven <pl@kamp.de>; qemu-block@nongnu=
.org
> Subject: Re: [PATCH 5/7] block/nfs: Fix 32-bit Windows build
>
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> On 8/9/22 15:28, Bin Meng wrote:
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > libnfs.h declares nfs_fstat() as the following for win32:
> >
> >    int nfs_fstat(struct nfs_context *nfs, struct nfsfh *nfsfh,
> >                  struct __stat64 *st);
> >
> > The 'st' parameter should be of type 'struct __stat64'. The codes
> > happen to build successfully for 64-bit Windows, but it does not build
> > for 32-bit Windows.
> >
> > Fixes: 6542aa9c75bc ("block: add native support for NFS")
> > Fixes: 18a8056e0bc7 ("block/nfs: cache allocated filesize for
> > read-only files")
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
> >
> >   block/nfs.c | 8 ++++++++
> >   1 file changed, 8 insertions(+)
> >
> > diff --git a/block/nfs.c b/block/nfs.c index 444c40b458..d5d67937dd
> > 100644
> > --- a/block/nfs.c
> > +++ b/block/nfs.c
> > @@ -418,7 +418,11 @@ static int64_t nfs_client_open(NFSClient *client, =
BlockdevOptionsNfs *opts,
> >                                  int flags, int open_flags, Error **err=
p)
> >   {
> >       int64_t ret =3D -EINVAL;
> > +#ifdef _WIN32
> > +    struct __stat64 st;
> > +#else
> >       struct stat st;
> > +#endif
> >       char *file =3D NULL, *strp =3D NULL;
> >
> >       qemu_mutex_init(&client->mutex); @@ -781,7 +785,11 @@ static int
> > nfs_reopen_prepare(BDRVReopenState *state,
> >                                 BlockReopenQueue *queue, Error **errp)
> >   {
> >       NFSClient *client =3D state->bs->opaque;
> > +#ifdef _WIN32
> > +    struct __stat64 st;
> > +#else
> >       struct stat st;
> > +#endif
> >       int ret =3D 0;
> >
> >       if (state->flags & BDRV_O_RDWR && bdrv_is_read_only(state->bs))
> > {
>
> What about the field in struct NFSRPC?
>
> NFSRPC::struct stat is used in nfs_get_allocated_file_size_cb() and nfs_g=
et_allocated_file_size() that are not built on win32, so there is no proble=
m.
>

Any further comments?

Regards,
Bin

