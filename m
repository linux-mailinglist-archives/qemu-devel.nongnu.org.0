Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 348456DDAF2
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 14:35:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmDCk-0007mS-MM; Tue, 11 Apr 2023 08:34:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pmDCg-0007m6-M7
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 08:34:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pmDCe-0000ik-6J
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 08:34:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681216464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3TQ4nRFKjQg7Lh17e6Q2C/FubzpRC2OFMsDknYGmNU0=;
 b=cqsqsdVspt34pXl+ODuctlcdE1FTg4fZXUSRSorLAi82jR9WWOYrrtKtOOAbiHA+i4CQRU
 ynDyrPAZZJbyi9ld9ErrLJdUeKfj/96wcsGlIQiiwxRjpf+bdC+xmRu02U0sZdp3iYCvGf
 UXn2W6cSnFTJOqPpNODB20m6MlLt1Io=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-494-01EU1CqONtaSWGyNlLeCeA-1; Tue, 11 Apr 2023 08:34:23 -0400
X-MC-Unique: 01EU1CqONtaSWGyNlLeCeA-1
Received: by mail-yb1-f200.google.com with SMTP id
 j6-20020a255506000000b00b8ef3da4acfso5817251ybb.8
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 05:34:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681216463;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3TQ4nRFKjQg7Lh17e6Q2C/FubzpRC2OFMsDknYGmNU0=;
 b=fYGiyUb2SbSXB564g2z/h8RPeFWZRYKXiF9F9JUGeKub/4S4GZoQj02S0LZOLxrmUW
 gQ/DtVobdeG2B/YTmqtJ054OOGThXsdHRlq9lYK/I+/ho8rC8qTgFBO28sRskgPlAfdn
 mf19RYJGDZz3YABMGXW+Wj7vlpl3sfewnSqVBEpxuYB/YBTqalKZ4Hrjp9by2304XBDg
 M0ByB2tkT3ghhpPxB0A32Pu5QrYziPru5LznfyYLISPJ2yRqdU3xnVbkOJNbUpxQyNKG
 tPdCJe2VsG2U+F0GrJ8T5M52cl4MyiriR8y6U4+h9RjlX6TrRmGOxj7YXPqII7ewxtkf
 txEg==
X-Gm-Message-State: AAQBX9dmp7mrPRsj0oQFnZ1mkMwvlEPusPPTbbo+GycoyFdJhFtLwJbQ
 ds1gjVVWr3o3z9HAiJICMvx15lWErz2JqjGa+vFZiZKXCw7F6llACWsKqhDAAAea2Ayk1zKisOB
 Ix85Y986Kb3WbZgRAaww9mPjYO28gG/PgqvnwYHhszw==
X-Received: by 2002:a25:7495:0:b0:b8b:f1ac:9c6e with SMTP id
 p143-20020a257495000000b00b8bf1ac9c6emr6851147ybc.2.1681216463111; 
 Tue, 11 Apr 2023 05:34:23 -0700 (PDT)
X-Google-Smtp-Source: AKy350b1xaPwQ6+nPkW8P/OojZa8VCgOXS1OMMM3EdcJjUB+1aFsM8kWHkNKGGxdSwHI5vSrPgjxov7IUqInnRpmpD4=
X-Received: by 2002:a25:7495:0:b0:b8b:f1ac:9c6e with SMTP id
 p143-20020a257495000000b00b8bf1ac9c6emr6851130ybc.2.1681216462799; Tue, 11
 Apr 2023 05:34:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAJaqyWdV6pKP0SVZciMiu_HN86aJriZh0HBiwHNkO7+yErXnBA@mail.gmail.com>
In-Reply-To: <CAJaqyWdV6pKP0SVZciMiu_HN86aJriZh0HBiwHNkO7+yErXnBA@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 11 Apr 2023 14:33:46 +0200
Message-ID: <CAJaqyWceWu5EpwAZjEAe5EkJ=SQ4bVYXohCjgqpkFtKiSb+OHQ@mail.gmail.com>
Subject: Re: Reducing vdpa migration downtime because of memory pin / maps
To: qemu-level <qemu-devel@nongnu.org>
Cc: Jason Wang <jasowang@redhat.com>, Michael Tsirkin <mst@redhat.com>, 
 Si-Wei Liu <si-wei.liu@oracle.com>, Longpeng <longpeng2@huawei.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Eli Cohen <elic@nvidia.com>, 
 Parav Pandit <parav@nvidia.com>, Juan Quintela <quintela@redhat.com>, 
 David Gilbert <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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

On Wed, Apr 5, 2023 at 1:37=E2=80=AFPM Eugenio Perez Martin <eperezma@redha=
t.com> wrote:
>
> Hi!
>
> As mentioned in the last upstream virtio-networking meeting, one of
> the factors that adds more downtime to migration is the handling of
> the guest memory (pin, map, etc). At this moment this handling is
> bound to the virtio life cycle (DRIVER_OK, RESET). In that sense, the
> destination device waits until all the guest memory / state is
> migrated to start pinning all the memory.
>
> The proposal is to bind it to the char device life cycle (open vs
> close), so all the guest memory can be pinned for all the guest / qemu
> lifecycle.
>
> This has two main problems:
> * At this moment the reset semantics forces the vdpa device to unmap
> all the memory. So this change needs a vhost vdpa feature flag.
> * This may increase the initialization time. Maybe we can delay it if
> qemu is not the destination of a LM. Anyway I think this should be
> done as an optimization on top.
>

Expanding on this we could reduce the pinning even more now that vring
supports VA [1] with the emulated CVQ.

Something like:
- Add VHOST_VRING_GROUP_CAN_USE_VA ioctl to check if a given VQ group
capability. Passthrough devices with emulated CVQ would return false
for the dataplane and true for the control vq group.
- If that is true, qemu does not need to map and translate addresses
for CVQ but to directly provide VA for buffers. This avoids pinning,
translations, etc in this case.

Thanks!

[1] https://lore.kernel.org/virtualization/20230404131326.44403-2-sgarzare@=
redhat.com/


