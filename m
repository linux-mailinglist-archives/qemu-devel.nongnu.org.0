Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC116DEB73
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 07:58:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmTTk-0000dD-Q3; Wed, 12 Apr 2023 01:57:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pmTTV-0000cv-IO
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 01:56:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pmTTS-0002tN-V9
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 01:56:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681279013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h0alckr7K0RbE3QI1xwF9qAHVAHS+bQH1ImM0gTvsN4=;
 b=iyduotmG4RRDVuP5gPxPgm8VwANrNnB72sd9JVDLZ1X0hUeLGkbbBR5ZQIojb/CH8MLbln
 hqZsvP5d+9AF/ok6CWUeqGJIxK5vKxP4+2SmLchsqWBZE4K9MVqR9UWv0uVJid49iCSKfX
 oPKi71SsT6ofsDbeVlhP4Fw48EYGWls=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-jZlG04KSN1ScjUAOVGPQsg-1; Wed, 12 Apr 2023 01:56:51 -0400
X-MC-Unique: jZlG04KSN1ScjUAOVGPQsg-1
Received: by mail-ot1-f72.google.com with SMTP id
 t25-20020a05683014d900b0069f851af0aaso2715272otq.22
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 22:56:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681279011; x=1683871011;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h0alckr7K0RbE3QI1xwF9qAHVAHS+bQH1ImM0gTvsN4=;
 b=G0jNhiXIa53oLtcBcVZsxc8HHzMuBp0Y/1nIRvSybGYjsifz6RvCuBjajhWtWzbvep
 HIDm/908f0JdHkam19oLl8gWz6kbBs1OEa3+ip1HmqwE7OWckcDjOe+AsaU125uI6JIT
 sThQMbBkL0uk09NBFhd969/X8+cZ8p8MlcOP4rKDPYlQLPI7PJoDokOoNaQFF6PMXKCP
 aZv+REZ2IbLmYp+bo0k4YNBjAtomtU+dW+AlPxMGXdx/+Yq4WjF0UK+7YGv5wIHcE4t2
 RK1y1QByUWpNAZGn22hoYylpZiDAM9fdzSEtvChLG/1xz9YCmOApi+r/DU23IiCo+RCA
 /2CA==
X-Gm-Message-State: AAQBX9fEhKNbbg/o5gle5zzM4VJuJ4TeCGbtrv6/xJ5f4YMSPUM5riOn
 8y8igxFRj/sfX0HyMl448vtnkwyV0yu1RZyq62B17VUyknGBxoAPp03KMUDbyt4LaquB23NZbGX
 XJG7qxjh0bOgxza7TQ3pHmBmdxMyc+HA=
X-Received: by 2002:a54:470b:0:b0:38b:ef9a:b54d with SMTP id
 k11-20020a54470b000000b0038bef9ab54dmr281311oik.9.1681279011040; 
 Tue, 11 Apr 2023 22:56:51 -0700 (PDT)
X-Google-Smtp-Source: AKy350bYK2L0EXF+AiRs/5Vi0ChdBt88iMiBbAJvxm0+j4ddBzr4WHNSUm+ENxu5GGZIjKOmzeLF6D4YW1oGXJN3WjQ=
X-Received: by 2002:a54:470b:0:b0:38b:ef9a:b54d with SMTP id
 k11-20020a54470b000000b0038bef9ab54dmr281296oik.9.1681279010771; Tue, 11 Apr
 2023 22:56:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAJaqyWdV6pKP0SVZciMiu_HN86aJriZh0HBiwHNkO7+yErXnBA@mail.gmail.com>
 <CAJaqyWceWu5EpwAZjEAe5EkJ=SQ4bVYXohCjgqpkFtKiSb+OHQ@mail.gmail.com>
In-Reply-To: <CAJaqyWceWu5EpwAZjEAe5EkJ=SQ4bVYXohCjgqpkFtKiSb+OHQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 12 Apr 2023 13:56:39 +0800
Message-ID: <CACGkMEu0PYQ=dS=VcfOCX32153emzB9R++8K3HGXnyt2x8BDpQ@mail.gmail.com>
Subject: Re: Reducing vdpa migration downtime because of memory pin / maps
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>, 
 Si-Wei Liu <si-wei.liu@oracle.com>, Longpeng <longpeng2@huawei.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Eli Cohen <elic@nvidia.com>, 
 Parav Pandit <parav@nvidia.com>, Juan Quintela <quintela@redhat.com>, 
 David Gilbert <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

On Tue, Apr 11, 2023 at 8:34=E2=80=AFPM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Wed, Apr 5, 2023 at 1:37=E2=80=AFPM Eugenio Perez Martin <eperezma@red=
hat.com> wrote:
> >
> > Hi!
> >
> > As mentioned in the last upstream virtio-networking meeting, one of
> > the factors that adds more downtime to migration is the handling of
> > the guest memory (pin, map, etc). At this moment this handling is
> > bound to the virtio life cycle (DRIVER_OK, RESET). In that sense, the
> > destination device waits until all the guest memory / state is
> > migrated to start pinning all the memory.
> >
> > The proposal is to bind it to the char device life cycle (open vs
> > close), so all the guest memory can be pinned for all the guest / qemu
> > lifecycle.
> >
> > This has two main problems:
> > * At this moment the reset semantics forces the vdpa device to unmap
> > all the memory. So this change needs a vhost vdpa feature flag.
> > * This may increase the initialization time. Maybe we can delay it if
> > qemu is not the destination of a LM. Anyway I think this should be
> > done as an optimization on top.
> >
>
> Expanding on this we could reduce the pinning even more now that vring
> supports VA [1] with the emulated CVQ.

Note that VA for hardware means the device needs to support page fault
through either PRI or vendor specific interface.

>
> Something like:
> - Add VHOST_VRING_GROUP_CAN_USE_VA ioctl to check if a given VQ group
> capability. Passthrough devices with emulated CVQ would return false
> for the dataplane and true for the control vq group.
> - If that is true, qemu does not need to map and translate addresses
> for CVQ but to directly provide VA for buffers. This avoids pinning,
> translations, etc in this case.

For CVQ yes, but we only avoid the pinning for CVQ not others.

Thanks

>
> Thanks!
>
> [1] https://lore.kernel.org/virtualization/20230404131326.44403-2-sgarzar=
e@redhat.com/
>


