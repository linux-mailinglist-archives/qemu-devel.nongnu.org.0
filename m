Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2065F685DEC
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 04:28:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN3mK-0003cI-EC; Tue, 31 Jan 2023 22:27:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pN3mH-0003c0-SG
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 22:27:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pN3mG-0007WX-8L
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 22:27:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675222034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=drpkbuZzIc61XU0QkisCouHBntit+86g6aV1xsYVrnA=;
 b=IImVLcE24ctqmC93I/mslJvX2fyF7qCnBU8WyAouf9DDXpcGclzPO3ScMZ2XJun/CnmRFH
 MXcbYVDNJ6mS9N79pvgHFSlPpjg0C7MEXa65SYdpfMUC3e/68dJW9NKk3JTYwU/52wYNEz
 hfFkN0spwSH9EPfQHTff0WwtUt34td4=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-191-FPYll2aPM-SKSHJ0COxkyg-1; Tue, 31 Jan 2023 22:27:13 -0500
X-MC-Unique: FPYll2aPM-SKSHJ0COxkyg-1
Received: by mail-oi1-f198.google.com with SMTP id
 fe12-20020a0568082b0c00b0036eb985c232so7259059oib.21
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 19:27:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=drpkbuZzIc61XU0QkisCouHBntit+86g6aV1xsYVrnA=;
 b=JW6vGMb92DHQmDd+IU6aiEf/xyZx5d8oDUR818l8m6YST3+zSmND2SHLUK305RnYp6
 +WEqUUKgMeAI3dYvhRSSK7mWUK6vlIBcC6EwxSp5gE6PJXVPBmQQ352E6vnX7UOF0Mq/
 QozFBWfTtXHpTMNDhxF70NWppNfQGwn054KJxutlg6DTZ9LPIGpO2gKTIAEHJkiNHtv5
 zzJRgEW8vhwHCs0uDLGXY0a1RbGiyASkkFZCZ6CLjAyEZwOwlg4Zzq5wibslYinwUhaV
 9J3XA2S/pawoidSDpuQ8eXAIr14VID4Ic1g5uy7KCwJsAyf0mTFv+15at4gp6MR1AMEk
 /Zcg==
X-Gm-Message-State: AO0yUKV9hMNZdzzewavYyZwK5eqY92RMXb1P/FT3bLas2vLEp5vJeJAg
 Zr68oQX18Y1/vS+UX1gcARAITKMDec/8UgpBvOwjhOybKenmPjtx+5AR45j4jx9N49z1pykmsuu
 pmu3h14bl0aknzBXAspbec8gVKo8XE4A=
X-Received: by 2002:aca:a8c5:0:b0:363:a978:6d41 with SMTP id
 r188-20020acaa8c5000000b00363a9786d41mr71674oie.280.1675222032693; 
 Tue, 31 Jan 2023 19:27:12 -0800 (PST)
X-Google-Smtp-Source: AK7set/XZUqKad3LBaLVdeUxufSTJUDNoNq81hzRvPX+reSzNNFCa8icpwqkEjXrO+ECNRKUm0InOs9TVIdJRiFx3YY=
X-Received: by 2002:aca:a8c5:0:b0:363:a978:6d41 with SMTP id
 r188-20020acaa8c5000000b00363a9786d41mr71665oie.280.1675222032439; Tue, 31
 Jan 2023 19:27:12 -0800 (PST)
MIME-Version: 1.0
References: <CAJaqyWcU5i=caPbbALnV-GcnWH1bu-KVRj54XauDpUZaEfn4Wg@mail.gmail.com>
In-Reply-To: <CAJaqyWcU5i=caPbbALnV-GcnWH1bu-KVRj54XauDpUZaEfn4Wg@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 1 Feb 2023 11:27:01 +0800
Message-ID: <CACGkMEs2wkkWmrNUuxfUVEsdGAkgxFxCLqCb5H-cH+dvVf-ijA@mail.gmail.com>
Subject: Re: Emulating device configuration / max_virtqueue_pairs in
 vhost-vdpa and vhost-user
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Maxime Coquelin <maxime.coquelin@redhat.com>,
 Michael Tsirkin <mst@redhat.com>, 
 Cindy Lu <lulu@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
 qemu-level <qemu-devel@nongnu.org>, Laurent Vivier <lvivier@redhat.com>, 
 Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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

On Wed, Feb 1, 2023 at 3:10 AM Eugenio Perez Martin <eperezma@redhat.com> wrote:
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

Note that it really depends on the model we used. SVQ works well for
trap and emulation (without new API to be invented). But if save and
load API is invented, SVQ is not a must.

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

It requires device specific knowledge, it might work for networking
devices but not others (or need new codes).

Thanks

>
> Thoughts?
>
> Thanks!
>


