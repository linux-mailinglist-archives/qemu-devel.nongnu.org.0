Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A2A6EEC56
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 04:25:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prUop-0000uD-Sh; Tue, 25 Apr 2023 22:23:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1prUon-0000th-2f
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 22:23:41 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1prUok-0000ke-UG
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 22:23:40 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-63d2ba63dddso5220713b3a.2
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 19:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1682475812; x=1685067812;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dY6YFGS5YhBPz119emz84807goMWNpCefgDK41V5Ayw=;
 b=erZ8A7biMxxqB/SHMsCaaHRCTf4sgfmB01IUdLmTOqn3XjaYP8AjgSREJDbT1NsNES
 /bBrBS6cxiRpFRyZUvGFLmr143lJiB2sBSk1Fb2cjgYzqdDA9XKitxFo8Vy+WOD1Gz+U
 YCIg/104TE6Wk/PcJYYXX0pc3D0UHcYMt6LTsdfJGSlgIvqqqHp6rpYXCQCHll/dhoWH
 tZx2JzETNasVfnw4wjoJV0520uuCwBCJalEII7Icjv3uRBPf9Nc/wHCFl56Nl4nOe6CL
 +JoxEMGVgBC0NjcSHXE0+CB+Qog3Yb3HVG/POtvzwL93Z2za9ShPng35vggP6wWuKkGZ
 /seA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682475812; x=1685067812;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dY6YFGS5YhBPz119emz84807goMWNpCefgDK41V5Ayw=;
 b=lbsTRy+z1d3SfVfXOKYAUtxD2FrFkrSNavhlqee1OsSUhjjjM/VfgXmU6isINOXj7K
 kLYi28RU4j5I3mDaj4CVxin8vM06q4pm/GxAzOdxJ92u8sYMuTYkQeNO/cMYhGRI6oM3
 EkyoGl0wX0XwgW6vdx+nK61RFOyUhhxDulcuJNgJgupfqU8BPZP7ylmRrAhwbd0OevEA
 q8X4yQprrNRvm/E7AD+PV2+WvgrKU5crZPVVslYRJW/7A6hneApS2HT106sI8eHGiUcl
 6CGdVPvXpnCp3O0hHNnOeZjDW2FZJRq3MrOMuRovRdp3YHmDV2ghip4vM5+Ii6xj5xk2
 onGw==
X-Gm-Message-State: AAQBX9eM7I6tvLgNZ6Zm8zf0JQowyAkg6uC6P57xhj3hvxgoVR/zpLF8
 BCuoiArVAndo1CMj5BWCShEsrPq2GY4/dojxNMz4
X-Google-Smtp-Source: AKy350bUdc4Aelq2+pyhyCkb7VYlUy7PjweYo0DP7me+Y3/2hO8ewi4s6aXdU11wFO/OMLnfiF/4gpBlv6/Ezxkkk4I=
X-Received: by 2002:a17:90b:4acc:b0:24b:8b39:cd7f with SMTP id
 mh12-20020a17090b4acc00b0024b8b39cd7fmr13173940pjb.41.1682475811679; Tue, 25
 Apr 2023 19:23:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230420113732.336620-1-stefanha@redhat.com>
 <20230420113732.336620-14-stefanha@redhat.com>
 <CACycT3suSR+nYhe4z2zuocYsBBVSDBCE+614zT0jfDZCBRveaA@mail.gmail.com>
 <20230425164241.GC725672@fedora>
In-Reply-To: <20230425164241.GC725672@fedora>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Wed, 26 Apr 2023 10:23:14 +0800
Message-ID: <CACycT3s+jJ7=6+bsvedoBvmUm9U6pVoJgVKMO882gkQJr5Yj4A@mail.gmail.com>
Subject: Re: [PATCH v3 13/20] block/export: rewrite vduse-blk drain code
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu devel list <qemu-devel@nongnu.org>, Peter Lieven <pl@kamp.de>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Juan Quintela <quintela@redhat.com>, qemu-block@nongnu.org, 
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>, 
 David Woodhouse <dwmw2@infradead.org>, Stefan Weil <sw@weilnetz.de>,
 Fam Zheng <fam@euphon.net>, 
 Julia Suvorova <jusual@redhat.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 xen-devel@lists.xenproject.org, Hanna Reitz <hreitz@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, eesposit@redhat.com,
 Kevin Wolf <kwolf@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, 
 Paul Durrant <paul@xen.org>, Aarushi Mehta <mehta.aaru20@gmail.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, 
 "Richard W.M. Jones" <rjones@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>, 
 Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=xieyongji@bytedance.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, Apr 26, 2023 at 12:43=E2=80=AFAM Stefan Hajnoczi <stefanha@redhat.c=
om> wrote:
>
> On Fri, Apr 21, 2023 at 11:36:02AM +0800, Yongji Xie wrote:
> > Hi Stefan,
> >
> > On Thu, Apr 20, 2023 at 7:39=E2=80=AFPM Stefan Hajnoczi <stefanha@redha=
t.com> wrote:
> > >
> > > vduse_blk_detach_ctx() waits for in-flight requests using
> > > AIO_WAIT_WHILE(). This is not allowed according to a comment in
> > > bdrv_set_aio_context_commit():
> > >
> > >   /*
> > >    * Take the old AioContex when detaching it from bs.
> > >    * At this point, new_context lock is already acquired, and we are =
now
> > >    * also taking old_context. This is safe as long as bdrv_detach_aio=
_context
> > >    * does not call AIO_POLL_WHILE().
> > >    */
> > >
> > > Use this opportunity to rewrite the drain code in vduse-blk:
> > >
> > > - Use the BlockExport refcount so that vduse_blk_exp_delete() is only
> > >   called when there are no more requests in flight.
> > >
> > > - Implement .drained_poll() so in-flight request coroutines are stopp=
ed
> > >   by the time .bdrv_detach_aio_context() is called.
> > >
> > > - Remove AIO_WAIT_WHILE() from vduse_blk_detach_ctx() to solve the
> > >   .bdrv_detach_aio_context() constraint violation. It's no longer
> > >   needed due to the previous changes.
> > >
> > > - Always handle the VDUSE file descriptor, even in drained sections. =
The
> > >   VDUSE file descriptor doesn't submit I/O, so it's safe to handle it=
 in
> > >   drained sections. This ensures that the VDUSE kernel code gets a fa=
st
> > >   response.
> > >
> > > - Suspend virtqueue fd handlers in .drained_begin() and resume them i=
n
> > >   .drained_end(). This eliminates the need for the
> > >   aio_set_fd_handler(is_external=3Dtrue) flag, which is being removed=
 from
> > >   QEMU.
> > >
> > > This is a long list but splitting it into individual commits would
> > > probably lead to git bisect failures - the changes are all related.
> > >
> > > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > ---
> > >  block/export/vduse-blk.c | 132 +++++++++++++++++++++++++++----------=
--
> > >  1 file changed, 93 insertions(+), 39 deletions(-)
> > >
> > > diff --git a/block/export/vduse-blk.c b/block/export/vduse-blk.c
> > > index f7ae44e3ce..35dc8fcf45 100644
> > > --- a/block/export/vduse-blk.c
> > > +++ b/block/export/vduse-blk.c
> > > @@ -31,7 +31,8 @@ typedef struct VduseBlkExport {
> > >      VduseDev *dev;
> > >      uint16_t num_queues;
> > >      char *recon_file;
> > > -    unsigned int inflight;
> > > +    unsigned int inflight; /* atomic */
> > > +    bool vqs_started;
> > >  } VduseBlkExport;
> > >
> > >  typedef struct VduseBlkReq {
> > > @@ -41,13 +42,24 @@ typedef struct VduseBlkReq {
> > >
> > >  static void vduse_blk_inflight_inc(VduseBlkExport *vblk_exp)
> > >  {
> > > -    vblk_exp->inflight++;
> > > +    if (qatomic_fetch_inc(&vblk_exp->inflight) =3D=3D 0) {
> >
> > I wonder why we need to use atomic operations here.
>
> The inflight counter is only modified by the vhost-user export thread,
> but it may be read by another thread here:
>

I see. I mean is it enough to just use volatile keywords here, since
the writers would not access the variable concurrently.

>   static bool vduse_blk_drained_poll(void *opaque)
>   {
>       BlockExport *exp =3D opaque;
>       VduseBlkExport *vblk_exp =3D container_of(exp, VduseBlkExport, expo=
rt);
>
>       return qatomic_read(&vblk_exp->inflight) > 0;
>
> BlockDevOps->drained_poll() calls are invoked when BlockDriverStates are
> drained (e.g. blk_drain_all() and related APIs).
>
> > > @@ -355,13 +410,12 @@ static void vduse_blk_exp_delete(BlockExport *e=
xp)
> > >      g_free(vblk_exp->handler.serial);
> > >  }
> > >
> > > +/* Called with exp->ctx acquired */
> > >  static void vduse_blk_exp_request_shutdown(BlockExport *exp)
> > >  {
> > >      VduseBlkExport *vblk_exp =3D container_of(exp, VduseBlkExport, e=
xport);
> > >
> > > -    aio_context_acquire(vblk_exp->export.ctx);
> > > -    vduse_blk_detach_ctx(vblk_exp);
> > > -    aio_context_acquire(vblk_exp->export.ctx);
> > > +    vduse_blk_stop_virtqueues(vblk_exp);
> >
> > Can we add a AIO_WAIT_WHILE() here? Then we don't need to
> > increase/decrease the BlockExport refcount during I/O processing.
>
> I don't think so because vduse_blk_exp_request_shutdown() is not the
> only place where we wait for requests to complete. There would still
> need to be away to wait for requests to finish (without calling
> AIO_WAIT_WHILE()) in vduse_blk_drained_poll().
>

But the BlockExport would not be freed until we call
vduse_blk_exp_request_shutdown(). If we can ensure that there will be
no inflight I/O after we call vduse_blk_exp_request_shutdown(), the
BlockExport can be freed safely without increasing/decreasing the
BlockExport refcount during I/O processing.

Thanks,
Yongji

