Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B1868362F
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 20:11:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMw1w-00074q-3w; Tue, 31 Jan 2023 14:10:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pMw1t-00074b-Pp
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 14:10:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pMw1s-0006kY-2S
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 14:10:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675192250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=jXtWM0f+wSjHTkAo/ebgYK7ml4RWuUqJRFWKuIraKDY=;
 b=KfvXyS8ZhaiX9k3P4jCbQWSfh2M5qVEKKEh2ubmbrjNryqqvAMqpRJMs5JYkp1UN6nWtLx
 2jDHRL1GZXiPg0T8wOd14HGLDJZqyfOhEyCp/dJQ5tML4opNF2QNPheHkH/ULJ0MrmBbbt
 pmNMrwPjdovx1+NBaPAlxTmGJ6qy+tE=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-503-L8RxXTBBOMumvxaS6U9b6Q-1; Tue, 31 Jan 2023 14:10:48 -0500
X-MC-Unique: L8RxXTBBOMumvxaS6U9b6Q-1
Received: by mail-yb1-f198.google.com with SMTP id
 w70-20020a25df49000000b00803e799d7b1so17452144ybg.10
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 11:10:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jXtWM0f+wSjHTkAo/ebgYK7ml4RWuUqJRFWKuIraKDY=;
 b=r8WC0XGVdu9iW3kx3wTAyZupakmO9rJrz3j4puynI9Mu21s9DNrifFvdDFCMhFh+Ny
 /uKLNASZMman8HejJ0miRW9ptuOv7Bn4in/lMPklRBnewd6wcQ8J9x+GI0zvBZBT5786
 MLi3Mm3JJQWhCYe7n97bgEZn4HHAml6nDXSKN+qQ8LFcckZ87g+OUj1VovswbBBCI9HN
 ZOEJzwq9rhEe/S4Hz36kew8yUpBZ+SDU0wygkwmUlGMItOpBfDfKSepBaD3h+e9Nr9qm
 abxhP7jzKdZPPPkRgisG81wiy3fFSEBvvXoa6z4evA603sEFg4vKzR6pYMgDPomoUmcV
 zgUA==
X-Gm-Message-State: AO0yUKXKcSMHlWu8JmG6yun+3XcyzRB7c/ZcjgMGiWC+lOrJMDl32EL7
 kaZ5EkLHT7gEgkcX+icAimeqa8JkoLUTFu5mz5+YNZXnkMqGZ7sGtMxUOr0DMOimix71Wj642mX
 7FpOQXEhkr2lORJ88YMOAMiGwpIe791s=
X-Received: by 2002:a05:690c:994:b0:51b:64c0:3251 with SMTP id
 ce20-20020a05690c099400b0051b64c03251mr641933ywb.266.1675192248335; 
 Tue, 31 Jan 2023 11:10:48 -0800 (PST)
X-Google-Smtp-Source: AK7set8fZWTK92Y3Ug8jFxKNj+u5M4tgEDSemQXGJi3IR+6UNPaQf9ST92GrRAEVrzD+6kefyVGvxKEtz3dArjbQdMo=
X-Received: by 2002:a05:690c:994:b0:51b:64c0:3251 with SMTP id
 ce20-20020a05690c099400b0051b64c03251mr641925ywb.266.1675192248125; Tue, 31
 Jan 2023 11:10:48 -0800 (PST)
MIME-Version: 1.0
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 31 Jan 2023 20:10:12 +0100
Message-ID: <CAJaqyWcU5i=caPbbALnV-GcnWH1bu-KVRj54XauDpUZaEfn4Wg@mail.gmail.com>
Subject: Emulating device configuration / max_virtqueue_pairs in vhost-vdpa
 and vhost-user
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

Hi,

The current approach of offering an emulated CVQ to the guest and map
the commands to vhost-user is not scaling well:
* Some devices already offer it, so the transformation is redundant.
* There is no support for commands with variable length (RSS?)

We can solve both of them by offering it through vhost-user the same
way as vhost-vdpa do. With this approach qemu needs to track the
commands, for similar reasons as vhost-vdpa: qemu needs to track the
device status for live migration. vhost-user should use the same SVQ
code for this, so we avoid duplications.

One of the challenges here is to know what virtqueue to shadow /
isolate. The vhost-user device may not have the same queues as the
device frontend:
* The first depends on the actual vhost-user device, and qemu fetches
it with VHOST_USER_GET_QUEUE_NUM at the moment.
* The qemu device frontend's is set by netdev queues= cmdline parameter in qemu

For the device, the CVQ is the last one it offers, but for the guest
it is the last one offered in config space.

To create a new vhost-user command to decrease that maximum number of
queues may be an option. But we can do it without adding more
commands, remapping the CVQ index at virtqueue setup. I think it
should be doable using (struct vhost_dev).vq_index and maybe a few
adjustments here and there.

Thoughts?

Thanks!


