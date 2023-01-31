Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C61FF683632
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 20:12:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMw2r-0007nY-84; Tue, 31 Jan 2023 14:11:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pMw2o-0007n9-FF
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 14:11:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pMw2m-0006yE-Sr
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 14:11:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675192308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SS1NQkKkUE/UDHR1ozbcHM/ePSPiBADsm+YMLWHO6SY=;
 b=SuIvSmWHgqAinpsD+xQC5v1xFCm5BF8Sxy4hSUJNi6EbsbAyzk0zrcB98J7aYGb76HgnuI
 0om5M6nuxrg8/PhYzjIapjBT3riEqvyUr+kZ1GJ3tTwx7IcGEXGO5JGKHF30IkcLjaGKDf
 sgmOqqUluaUKMlmvGY2lNuoYI49/Ni8=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-633-AQL-BQa9OXWg1QnqWfwyeA-1; Tue, 31 Jan 2023 14:11:43 -0500
X-MC-Unique: AQL-BQa9OXWg1QnqWfwyeA-1
Received: by mail-yb1-f197.google.com with SMTP id
 h14-20020a258a8e000000b00827819f87e5so5323864ybl.0
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 11:11:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SS1NQkKkUE/UDHR1ozbcHM/ePSPiBADsm+YMLWHO6SY=;
 b=Y4fWcjTxDxvKEdK0cS1wTMPTq7ep7CfbmK0gqyELd+qSugJCFXMD03veioCZd5079o
 QlOnG5D+/VvS/uwWQiEspatcO5JtJjjK0gZB38V/2RS2HX0qcncBTgdTXBae3W780Ug7
 qazsAXNN3AnT9OL0pGMMrVKuk6wKsFQgMb+zg83Qw1T7RAgtObW2mHU9noj+M9cbiboy
 clJ1bVWv/+WGcIh8rVBcr2GMLV6iTUlUKDimTOnU7GyiP0EgQje4hxUn1nyGcK2eyjTx
 pOpL2GboStWne6zJNvxg6A15/qNrKLcvUZErIMFjMYeFMU6MncW0IinP0t56rxy24/+t
 kEWA==
X-Gm-Message-State: AO0yUKW5VWXxxtUzgf2os7kjRADTtf8+pS3/vHHHtdFmQcYjeyilwI4V
 UQi/KLVxXXIL/ADONIp/w9mq0ytp7p5/B6B1GTp7TLIhv8EYKVlg251cOEriVhsLIzwEMlMeD28
 tQFgD/LorJL7WK+RnkMoYZdEwMpUuLuw=
X-Received: by 2002:a25:d28b:0:b0:6fb:5983:d192 with SMTP id
 j133-20020a25d28b000000b006fb5983d192mr13165ybg.163.1675192302757; 
 Tue, 31 Jan 2023 11:11:42 -0800 (PST)
X-Google-Smtp-Source: AK7set8XxWw1404Fwkwnk8zbWMxex66lXFzp3tXMcfGmrB7pCWe9fOVd1+Y4a6LaS9b/GQWL7r9+fCt+sgqjghOoGik=
X-Received: by 2002:a25:d28b:0:b0:6fb:5983:d192 with SMTP id
 j133-20020a25d28b000000b006fb5983d192mr13157ybg.163.1675192302542; Tue, 31
 Jan 2023 11:11:42 -0800 (PST)
MIME-Version: 1.0
References: <CAJaqyWcU5i=caPbbALnV-GcnWH1bu-KVRj54XauDpUZaEfn4Wg@mail.gmail.com>
In-Reply-To: <CAJaqyWcU5i=caPbbALnV-GcnWH1bu-KVRj54XauDpUZaEfn4Wg@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 31 Jan 2023 20:11:06 +0100
Message-ID: <CAJaqyWfZX2sgoOq+Poa2tQTc2VTRneaUvzozOdDS+7SoMUdNkg@mail.gmail.com>
Subject: Re: Emulating device configuration / max_virtqueue_pairs in
 vhost-vdpa and vhost-user
To: Maxime Coquelin <maxime.coquelin@redhat.com>,
 Jason Wang <jasowang@redhat.com>, 
 Michael Tsirkin <mst@redhat.com>, Cindy Lu <lulu@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, qemu-level <qemu-devel@nongnu.org>, 
 Laurent Vivier <lvivier@redhat.com>, Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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

On Tue, Jan 31, 2023 at 8:10 PM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> Hi,
>
> The current approach of offering an emulated CVQ to the guest and map
> the commands to vhost-user is not scaling well:
> * Some devices already offer it, so the transformation is redundant.
> * There is no support for commands with variable length (RSS?)
>
> We can solve both of them by offering it through vhost-user the same
> way as vhost-vdpa do. With this approach qemu needs to track the
> commands, for similar reasons as vhost-vdpa: qemu needs to track the
> device status for live migration. vhost-user should use the same SVQ
> code for this, so we avoid duplications.
>
> One of the challenges here is to know what virtqueue to shadow /
> isolate. The vhost-user device may not have the same queues as the
> device frontend:
> * The first depends on the actual vhost-user device, and qemu fetches
> it with VHOST_USER_GET_QUEUE_NUM at the moment.
> * The qemu device frontend's is set by netdev queues= cmdline parameter in qemu
>
> For the device, the CVQ is the last one it offers, but for the guest
> it is the last one offered in config space.
>
> To create a new vhost-user command to decrease that maximum number of
> queues may be an option. But we can do it without adding more
> commands, remapping the CVQ index at virtqueue setup. I think it
> should be doable using (struct vhost_dev).vq_index and maybe a few
> adjustments here and there.
>
> Thoughts?
>
> Thanks!


(Starting a separated thread to vhost-vdpa related use case)

This could also work for vhost-vdpa if we ever decide to honor netdev
queues argument. It is totally ignored now, as opposed to the rest of
backends:
* vhost-kernel, whose tap device has the requested number of queues.
* vhost-user, that errors with ("you are asking more queues than
supported") if the vhost-user parent device has less queues than
requested (by vhost-user msg VHOST_USER_GET_QUEUE_NUM).

One of the reasons for this is that device configuration space is
totally passthrough, with the values for mtu, rss conditions, etc.
This is not ideal, as qemu cannot check src and destination
equivalence and they can change under the feets of the guest in the
event of a migration. External tools are needed for this, duplicating
part of the effort.

Start intercepting config space accesses and offering an emulated one
to the guest with this kind of adjustments is beneficial, as it makes
vhost-vdpa more similar to the rest of backends, making the surprise
on a change way lower.

Thoughts?

Thanks!


