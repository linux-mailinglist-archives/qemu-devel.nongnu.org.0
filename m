Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6556F77DD
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 23:15:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pugHo-0004va-7f; Thu, 04 May 2023 17:14:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pugHj-0004u3-IL
 for qemu-devel@nongnu.org; Thu, 04 May 2023 17:14:45 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pugHh-0005cy-9v
 for qemu-devel@nongnu.org; Thu, 04 May 2023 17:14:42 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id
 3f1490d57ef6-b9d8b2e1576so1373216276.2
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 14:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683234879; x=1685826879;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=27wGPxASm5D+OJrXzX3KXHSg8htD14xi5K9Gkzx1etg=;
 b=kyHG+qjKZRuvxbYA8KdXuG4oZYiqefaG6Te/H+s9G2VqFBKZndiXgJZdUzLvnKmJCr
 scQIunjh8kXYZQNJDCcLqbxs+Fr6uUprMyFaOfG/lTWbDPShe1ovhIk2hBM+NqeWMkNi
 /ooC+JQXLszql7pTRmGqaJ9DN2Xt33l0rzEj13R/bhOKxoLkGEf05pDstseNoh9nCgGX
 c6k3rIPtXlGY/6qp2ckpHUmsBN5tnOuaPn8aKd4CVN84qFLxpzDVi/8CNGld/SiY2Pwa
 V5MDERvoPVJXHSQCYhDdwJ67j3FRNG5ptZrlKIVau7cOuPzkWb0wH0BYgBt/rSefQ53L
 JA/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683234879; x=1685826879;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=27wGPxASm5D+OJrXzX3KXHSg8htD14xi5K9Gkzx1etg=;
 b=HBcsaf3LdmGpqmxex7Yeei7UgpYUkRUr0S6ndqxDvGrzXTzQEpqsmdr7FvhN5atAwX
 C/Xyh2c4z+JGPiVk5PF+IjBK8EuxcuSM3Hb/AcuLeL2nIINg90QmkwhfLO0SQ1B9GblQ
 x23Wq7qadTh9ybeBqDOMvGsZgQ5me7uc5CPFhT+3hubAvnaELnHXF9enAUKviRfHnptg
 M2wOV2RDc22W2i69wL1Fn9I8LEKD1QbNqeBf32zAdofSWzDVo1i4wjDrYr/n48hxkCIh
 u2h71OL5Gtg5C+3kDzKcztmqLZOkLH3xcOvB1uLiRzJZpmn00BS6tCBC4AUCR2oam8pd
 CfYg==
X-Gm-Message-State: AC+VfDxc7SlA2kmjQ2cZPNxlrCg5FvPgB8fZv6viqGyC2DzP94F3CuZt
 6+YMOTmzN71X3CT744ZJ7eUZAOukjd3RSCvseGY=
X-Google-Smtp-Source: ACHHUZ4Muuq2y8FR4DtUOMOUjfgE30pMo7Hyt0nvrZ47Vr5Ab4VM2WmM57y1tJOH7u3GShkmXlEI7CaDIwuGvohQYW4=
X-Received: by 2002:a25:694b:0:b0:b96:ab2d:368f with SMTP id
 e72-20020a25694b000000b00b96ab2d368fmr967893ybc.39.1683234878936; Thu, 04 May
 2023 14:14:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230411150515.14020-1-hreitz@redhat.com>
 <e8cc4521-50a1-2e38-1fb3-8cfa7b0c967e@redhat.com>
In-Reply-To: <e8cc4521-50a1-2e38-1fb3-8cfa7b0c967e@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 4 May 2023 17:14:27 -0400
Message-ID: <CAJSP0QUFFYWwD5+8+1q41sNErJVNbkfnQ3VtB4z-HZUV8S0=zw@mail.gmail.com>
Subject: Re: [PATCH 0/4] vhost-user-fs: Internal migration
To: Hanna Czenczek <hreitz@redhat.com>
Cc: qemu-devel@nongnu.org, virtio-fs@redhat.com, 
 Stefan Hajnoczi <stefanha@redhat.com>, German Maglione <gmaglione@redhat.com>, 
 Anton Kuchin <antonkuchin@yandex-team.ru>, Juan Quintela <quintela@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, 
 Eugenio Perez Martin <eperezma@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Thu, 4 May 2023 at 13:39, Hanna Czenczek <hreitz@redhat.com> wrote:
>
> On 11.04.23 17:05, Hanna Czenczek wrote:
>
> [...]
>
> > Hanna Czenczek (4):
> >    vhost: Re-enable vrings after setting features
> >    vhost-user: Interface for migration state transfer
> >    vhost: Add high-level state save/load functions
> >    vhost-user-fs: Implement internal migration
>
> I=E2=80=99m trying to write v2, and my intention was to keep the code
> conceptually largely the same, but include in the documentation change
> thoughts and notes on how this interface is to be used in the future,
> when e.g. vDPA =E2=80=9Cextensions=E2=80=9D come over to vhost-user.  My =
plan was to,
> based on that documentation, discuss further.
>
> But now I=E2=80=99m struggling to even write that documentation because i=
t=E2=80=99s not
> clear to me what exactly the result of the discussion was, so I need to
> stop even before that.
>
> So as far as I understand, we need/want SUSPEND/RESUME for two reasons:
> 1. As a signal to the back-end when virt queues are no longer to be
> processed, so that it is clear that it will not do that when asked for
> migration state.
> 2. Stateful devices that support SET_STATUS receive a status of 0 when
> the VM is stopped, which supposedly resets the internal state. While
> suspended, device state is frozen, so as far as I understand, SUSPEND
> before SET_STATUS would have the status change be deferred until RESUME.

I'm not sure about SUSPEND -> SET_STATUS 0 -> RESUME. I guess the
device would be reset right away and it would either remain suspended
or be resumed as part of reset :).

Unfortunately the concepts of SUSPEND/RESUME and the Device Status
Field are orthogonal and there is no spec that explains how they
interact.

>
> I don=E2=80=99t want to hang myself up on 2 because it doesn=E2=80=99t re=
ally seem
> important to this series, but: Why does a status of 0 reset the internal
> state?  [Note: This is all virtio_reset() seems to do, set the status to
> 0.]  The vhost-user specification only points to the virtio
> specification, which doesn=E2=80=99t say anything to that effect. Instead=
, an
> explicit device reset is mentioned, which would be
> VHOST_USER_RESET_DEVICE, i.e. something completely different. Because
> RESET_DEVICE directly contradicts SUSPEND=E2=80=99s description, I would =
like to
> think that invoking RESET_DEVICE on a SUSPEND-ed device is just invalid.

The vhost-user protocol didn't have the concept of the VIRTIO Device
Status Field until SET_STATUS was added.

In order to participate in the VIRTIO device lifecycle to some extent,
the pre-SET_STATUS vhost-user protocol relied on vhost-user-specific
messages like RESET_DEVICE.

At the VIRTIO level, devices are reset by setting the Device Status
Field to 0. All state is lost and the Device Initialization process
must be followed to make the device operational again.

Existing vhost-user backends don't implement SET_STATUS 0 (it's new).

It's messy and not your fault. I think QEMU should solve this by
treating stateful devices differently from non-stateful devices. That
way existing vhost-user backends continue to work and new stateful
devices can also be supported.

>
> Is it that a status 0 won=E2=80=99t explicitly reset the internal state, =
but
> because it does mean that the driver is unbound, the state should
> implicitly be reset?

I think the fundamental problem is that transports like virtio-pci put
registers back in their initialization state upon reset, so internal
state is lost.

The VIRTIO spec does not go into detail on device state across reset
though, so I don't think much more can be said about the semantics.

> Anyway.  1 seems to be the relevant point for migration.  As far as I
> understand, currently, a vhost-user back-end has no way of knowing when
> to stop processing virt queues.  Basically, rings can only transition
> from stopped to started, but not vice versa.  The vhost-user
> specification has this bit: =E2=80=9COnce the source has finished migrati=
on,
> rings will be stopped by the source. No further update must be done
> before rings are restarted.=E2=80=9D  It just doesn=E2=80=99t say how the=
 front-end lets
> the back-end know that the rings are (to be) stopped.  So this seems
> like a pre-existing problem for stateless migration.  Unless this is
> communicated precisely by setting the device status to 0?

No, my understanding is different. The vhost-user spec says the
backend must "stop [the] ring upon receiving
``VHOST_USER_GET_VRING_BASE``". The "Ring states" section goes into
more detail and adds the concept of enabled/disabled too.

SUSPEND is stronger than GET_VRING_BASE though. GET_VRING_BASE only
applies to a single virtqueue, whereas SUSPEND acts upon the entire
device, including non-virtqueue aspects like Configuration Change
Notifications (VHOST_USER_BACKEND_CONFIG_CHANGE_MSG).

You can approximate SUSPEND today by sending GET_VRING_BASE for all
virtqueues. I think in practice this does fully stop the device even
if the spec doesn't require it.

If we want minimal changes to vhost-user, then we could rely on
GET_VRING_BASE to suspend and SET_VRING_ENABLE to resume. And
SET_STATUS 0 must not be sent so that the device's state is not lost.

However, this approach means this effort needs to be redone when it's
time to add stateful device support to vDPA and the QEMU vhost code
will become more complex. I think it's better to agree on a proper
model that works for both vhost-user and vhost-vdpa now to avoid more
hacks/special cases.

> Naturally, what I want to know most of all is whether you believe I can
> get away without SUSPEND/RESUME for now.  To me, it seems like honestly
> not really, only when turning two blind eyes, because otherwise we can=E2=
=80=99t
> ensure that virtiofsd isn=E2=80=99t still processing pending virt queue r=
equests
> when the state transfer is begun, even when the guest CPUs are already
> stopped.  Of course, virtiofsd could stop queue processing right there
> and then, but=E2=80=A6  That feels like a hack that in the grand scheme o=
f
> things just isn=E2=80=99t necessary when we could =E2=80=9Cjust=E2=80=9D =
introduce
> SUSPEND/RESUME into vhost-user for exactly this.
>
> Beyond the SUSPEND/RESUME question, I understand everything can stay
> as-is for now, as the design doesn=E2=80=99t seem to conflict too badly w=
ith
> possible future extensions for other migration phases or more finely
> grained migration phase control between front-end and back-end.
>
> Did I at least roughly get the gist?

One part we haven't discussed much: I'm not sure how much trouble
you'll face due to the fact that QEMU assumes vhost devices can be
reset across vhost_dev_stop() -> vhost_dev_start(). I don't think we
should keep a copy of the state in-memory just so it can be restored
in vhost_dev_start(). I think it's better to change QEMU's vhost code
to leave stateful devices suspended (but not reset) across
vhost_dev_stop() -> vhost_dev_start(), maybe by introducing
vhost_dev_suspend() and vhost_dev_resume(). Have you thought about
this aspect?

Stefan

