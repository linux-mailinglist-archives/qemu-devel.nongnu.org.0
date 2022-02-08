Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BA64AD54B
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 11:09:28 +0100 (CET)
Received: from localhost ([::1]:48940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHNR9-0000LL-75
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 05:09:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nHLdr-0001Mq-WF
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 03:14:29 -0500
Received: from [2a00:1450:4864:20::62a] (port=45971
 helo=mail-ej1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nHLdm-0000rd-Qx
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 03:14:24 -0500
Received: by mail-ej1-x62a.google.com with SMTP id s21so21632459ejx.12
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 00:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r9Og+ZcNQCUxvX8HTxORgtExmMizSd5UB6xcH76Lk2Q=;
 b=AQEEiWT5WLU4m+AsH8bXT1gfCuWCpG7wfCF29PMUTfnoQ+2eXJMpXc5sHbr0BG6PFI
 Hft0iGJTaoy7LbIMmfmbDczug9Sjxx38hznWV6fTQdx0mE015IouI8vthnhn9BzOkT3K
 0H3LbO9snrzKXc0m8WK7yXnZ2xbzwa21tMMjwG99S7jh31t9Eu8QF5TYe05bqqkcHSWs
 3hliP2gsqA9rj1+lBIHDKp7GnGX2aTivil0YjtR46EMsoJ46zN+3BPz7842zbXR525l0
 ip6VPRPX9ZBOVo6yc89f9C8S/wpiM6os+AYQJ75uoOCIWmdfwoVxl/YVjdK7tYQgIVla
 YoLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r9Og+ZcNQCUxvX8HTxORgtExmMizSd5UB6xcH76Lk2Q=;
 b=G47Gi4f1dPBsVI4SYYsB/jzzZ1vnvlxaEkGCt9spL0lbmGHQX0u0QUkmYY1V3Z0QfI
 5M2bqtnxWOWGbuj7qtgbu7R05To0aIkv9NQPcwKNAD9lTEPurRCUv5ldrmSdVRFLd0LG
 Oh8ZXXZZZeEU7b5NteEd9bpPmFxKYjSUW6EvqzTxkGQ5bfvnFUSl9sRfQozknIz2ebCR
 quY3XYIbISfa8opyoQ/dEicTmyQIZyNbMu2lj4cuBVIfkbq2XopUXPM5mlADjL3Ll1wg
 6v/DWGCt0ScNUJrlsfV6Wgu1u+SAyFA+w81xQ3LQ6MaNhsMyqIpMZCuk21MZSLZev0Y5
 MW0g==
X-Gm-Message-State: AOAM532nkXUB71aAj9irTqEusitfb4d1FWPXh3cknaZcqRiQ05nCQb3H
 w31OLT+oSQJ+MvnOqAeNXAnRtECiyRhN829UMfok
X-Google-Smtp-Source: ABdhPJyvQ67Ms5AJyugp9Mgg2xHl4El5NZASxJHTtfg9toXEh8bkbYxt9H7WEZd7dCokotwQ8c6CshGkxVJHMf5alps=
X-Received: by 2002:a17:907:c23:: with SMTP id
 ga35mr2808803ejc.536.1644308061034; 
 Tue, 08 Feb 2022 00:14:21 -0800 (PST)
MIME-Version: 1.0
References: <20220125131800.91-1-xieyongji@bytedance.com>
 <20220125131800.91-6-xieyongji@bytedance.com>
 <YgEvInUC/upRN3py@stefanha-x1.localdomain>
 <CACycT3sMFpt92xtJ2xwRtLVfx3ZS-3jo0SPhfe4tZjOfb_j9Fw@mail.gmail.com>
 <YgIk4H8tEI6pK9o2@stefanha-x1.localdomain>
In-Reply-To: <YgIk4H8tEI6pK9o2@stefanha-x1.localdomain>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Tue, 8 Feb 2022 16:14:10 +0800
Message-ID: <CACycT3vzVx2NedNXhDBUYdcyWPX=92iBhjKXMO8wP3do67Oaeg@mail.gmail.com>
Subject: Re: [PATCH 5/5] libvduse: Add support for reconnecting
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=xieyongji@bytedance.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, mreitz@redhat.com, mlureau@redhat.com,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 8, 2022 at 4:09 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> On Tue, Feb 08, 2022 at 03:35:27PM +0800, Yongji Xie wrote:
> > On Mon, Feb 7, 2022 at 10:39 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > >
> > > On Tue, Jan 25, 2022 at 09:18:00PM +0800, Xie Yongji wrote:
> > > > +static void *vduse_log_get(const char *dir, const char *name, size_t size)
> > > > +{
> > > > +    void *ptr = MAP_FAILED;
> > > > +    char *path;
> > > > +    int fd;
> > > > +
> > > > +    path = (char *)malloc(strlen(dir) + strlen(name) +
> > > > +                          strlen("/vduse-log-") + 1);
> > > > +    if (!path) {
> > > > +        return ptr;
> > > > +    }
> > > > +    sprintf(path, "%s/vduse-log-%s", dir, name);
> > >
> > > Please use g_strdup_printf() and g_autofree in QEMU code. In libvduse
> > > code it's okay to use malloc(3), but regular QEMU code should use glib.
> > >
> >
> > But this code resides in libvduse currently.
>
> Oops, I thought we were in block/export/vduse-blk.c. Then it's fine to
> use malloc(3).
>
> > > > +static int vduse_queue_check_inflights(VduseVirtq *vq)
> > > > +{
> > > > +    int i = 0;
> > > > +    VduseDev *dev = vq->dev;
> > > > +
> > > > +    vq->used_idx = vq->vring.used->idx;
> > >
> > > Is this reading struct vring_used->idx without le16toh()?
> > >
> > > > +    vq->resubmit_num = 0;
> > > > +    vq->resubmit_list = NULL;
> > > > +    vq->counter = 0;
> > > > +
> > > > +    if (unlikely(vq->log->inflight.used_idx != vq->used_idx)) {
> > > > +        vq->log->inflight.desc[vq->log->inflight.last_batch_head].inflight = 0;
> > >
> > > I suggest validating vq->log->inflight fields before using them.
> > > last_batch_head must be less than the virtqueue size. Although the log
> > > file is somewhat trusted, there may still be ways to corrupt it or
> > > confuse the new process that loads it.
> > >
> >
> > I can validate the last_batch_head field. But it's hard to validate
> > the inflight field, so we might still meet some issues if the file is
> > corrupted.
>
> It's okay if the log tells us to resubmit virtqueue buffers that have
> garbage vring descriptors because the vring code needs to handle garbage
> descriptors anyway.
>
> But we cannot load dest[untrusted_input] or do anything else that could
> crash, corrupt memory, etc.
>

Makes sense to me.

Thanks,
Yongji

