Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4973D1051
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 15:58:04 +0200 (CEST)
Received: from localhost ([::1]:49740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Cjb-0005Q8-MU
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 09:58:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1m6Cij-0004h5-33
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 09:57:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1m6Cid-000211-Ic
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 09:57:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626875821;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=nQ4Jlj9NifxDtg7AluUOS8650jpoaAnBt6TTolok7FI=;
 b=UI2oeEgdYPDn7fA76GQOPoQrTjpHxcVzGAxDjjvIFf7SryBi1Zg75dCQw+s8nyf69IgWqF
 j+j/FrKNqzumxnG6zBaKyYsk8q7ILJb2eKLY11p5RUDwuV7jvzZw9G0mWNhsj5I49+qWhJ
 5fR/DXEVFhfKL5CfV+yXo3V6dYF3BDo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-u8gVtGtVPqisiuBzEHDWEg-1; Wed, 21 Jul 2021 09:57:00 -0400
X-MC-Unique: u8gVtGtVPqisiuBzEHDWEg-1
Received: by mail-wr1-f69.google.com with SMTP id
 i12-20020adffc0c0000b0290140ab4d8389so1053837wrr.10
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 06:57:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=nQ4Jlj9NifxDtg7AluUOS8650jpoaAnBt6TTolok7FI=;
 b=howhiGugfvv+ctl5KhAQH0IFjrA6eBS73Xt+6bEG5T1+bLaZ4a2ssP7RtzJCd7nY0/
 Q3mmIykAkXAUBzIJwxiL01W03cHnSLCX7bNNMicwK3oGGdQiyUlEbrZctGfmqwDkBUn/
 nG47Ck8qdoFzZ3VQ4iWg6hfrA2SUWx/2xiPSZz/Ee7V8FopViaUe1JWj3DYwb1868Ylk
 Qejg9zk41nkD6/AE9kU8KyJYY9L7wJuuB3c/XlTVUQw5P1u1j4M5hUYJ+4Yv4MifxVEn
 6JrkDsBGj6FaayYc1ILZGwaJP2sMJSVIxXylbw9CjvViLfPhAuCfxqa2xu0T43LwNQR5
 z+9Q==
X-Gm-Message-State: AOAM532m9pP4o2e0muaM3KOHCBJO6WPPtSF+T55gPS1RQmTZUGdv/Cga
 YBuXQb0Y7mNH2G15gSs/ulDBjOfed0FpRrX07mpO2TSUkR5m9tZNEimx4xz0Z15eVUyZs2E1da7
 L9N3plHbD1BrUHu0=
X-Received: by 2002:adf:f7cf:: with SMTP id a15mr22850309wrq.95.1626875819447; 
 Wed, 21 Jul 2021 06:56:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBlW1Fmas/PdGE2EnhweIuzfGalh1olxNtcT86BngytbZsidibVzU/JLNx0XlvMYk/pd2swA==
X-Received: by 2002:adf:f7cf:: with SMTP id a15mr22850280wrq.95.1626875819187; 
 Wed, 21 Jul 2021 06:56:59 -0700 (PDT)
Received: from localhost (62.83.194.64.dyn.user.ono.com. [62.83.194.64])
 by smtp.gmail.com with ESMTPSA id i10sm14470863wml.31.2021.07.21.06.56.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 06:56:58 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v3] failover: unregister ROM on unplug
In-Reply-To: <20210721093955.225759-1-lvivier@redhat.com> (Laurent Vivier's
 message of "Wed, 21 Jul 2021 11:39:55 +0200")
References: <20210721093955.225759-1-lvivier@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Wed, 21 Jul 2021 15:56:58 +0200
Message-ID: <87o8avepn9.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: quintela@redhat.com
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Jens Freimann <jfreimann@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Laurent Vivier <lvivier@redhat.com> wrote:
> The intend of failover is to allow to migrate a VM with a VFIO
> networking card without disrupting the network operation by switching
> to a virtio-net device during the migration.
>
> This simple change allows to test failover with a simulated device
> like e1000e rather than a vfio device, even if it's useless in real
> life it can help to debug failover.
>
> This is interesting to developers that want to test failover on
> a system with no vfio device. Moreover it simplifies host networking
> configuration as we can use the same bridge for virtio-net and
> the other failover networking device.
>
> Without this change the migration of a system configured with failover
> fails with:
>
>   ...
>   -device virtio-net-pci,id=virtionet0,failover=on,...  \
>   -device e1000,failover_pair_id=virtionet0,... \
>   ...
>
>   (qemu) migrate ...
>
>   Unknown ramblock "0000:00:01.1:00.0/e1000e.rom", cannot accept migration
>   error while loading state for instance 0x0 of device 'ram'
>   load of migration failed: Invalid argument
>
> This happens because QEMU correctly unregisters the interface vmstate but
> not the ROM one. This patch fixes that.
>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>


Reviewed-by: Juan Quintela <quintela@redhat.com>

As this is only for testing.


