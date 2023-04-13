Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5246E11E6
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 18:13:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmzYc-00068L-PV; Thu, 13 Apr 2023 12:12:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pmzYL-00067g-TW
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 12:12:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pmzY6-00029B-1h
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 12:12:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681402309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cw8NF4LEzBHO/SFL0E8Jne5OnA1+7UWYtNnmH6efKsw=;
 b=E5vAGLQeGEOVmlfkrU1E813UcBf4B05UMPmtdkFapIyXimj96/azcnttYQEn8DxUwzIdQi
 GdoStpewloc1ZOASII0yuM7iStSHKmAD+NlvZyhDm//u4oi81JCJ8kPeg4sHyrQJ1ZTBdS
 Zd4mKALm4sf/WRdDFQ2V/H42zdhZcC4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-mkle6n62NT60QfD8zLtDHw-1; Thu, 13 Apr 2023 12:11:47 -0400
X-MC-Unique: mkle6n62NT60QfD8zLtDHw-1
Received: by mail-wm1-f69.google.com with SMTP id
 hg16-20020a05600c539000b003f09d1918aaso2991403wmb.4
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 09:11:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681402306; x=1683994306;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Cw8NF4LEzBHO/SFL0E8Jne5OnA1+7UWYtNnmH6efKsw=;
 b=OaXV76t3DMYScWh/8R3UdDbGQPuCgHH0mzbNMETgfep8nOZF0JTeWL7Z7jTb2sO4xh
 z6OeA2L7LWfCAiwCvVgiJwuzG2Ynf53Eztiz2NTkblv3X38ZHrPayKAssuQ6eDvCS9Tl
 3FfF98tqpvfAjccwE6UIT1P6274vuy5pdIHYQuALcFoZvskZMKq7osPDDMsmg2MFHKYR
 twOUMPPH0cd7TCXDIlpGgRHgjf11rAyRbLD9D+9GYf247xA27oqDztHxeS8r275qet5V
 3DoBOQobtrWTTI9EJNWLMpqQpGBoAzK8aE6572TeUThQOoUIMPoA3HneGjlx5j7HdOo5
 f1XQ==
X-Gm-Message-State: AAQBX9dnL9fVbqU3efnWhqZFjtTs/fnv49EGuCkHcVRHMwPf/6i8SLw4
 1lOPdZKIaHXc2ZH0shyrjzCcQxjQv++E7nTTPtRqIvlcE15XfEUpyzXFzJF8wnZWWYzNx34skfx
 WwwYtiYduZ82Km7o=
X-Received: by 2002:a7b:ca56:0:b0:3ee:6cdf:c357 with SMTP id
 m22-20020a7bca56000000b003ee6cdfc357mr2165646wml.20.1681402306411; 
 Thu, 13 Apr 2023 09:11:46 -0700 (PDT)
X-Google-Smtp-Source: AKy350ab1QBvr/x6MYiEmJcHoFPKHfne5H0YSpO0yzn8P1h/gB5d8eb7nCVZgZNBj7h9D7u3CvaAKA==
X-Received: by 2002:a7b:ca56:0:b0:3ee:6cdf:c357 with SMTP id
 m22-20020a7bca56000000b003ee6cdfc357mr2165626wml.20.1681402306073; 
 Thu, 13 Apr 2023 09:11:46 -0700 (PDT)
Received: from redhat.com ([2a06:c701:742d:fd00:c847:221d:9254:f7ce])
 by smtp.gmail.com with ESMTPSA id
 f16-20020a05600c4e9000b003f0a6a1f969sm2402501wmq.46.2023.04.13.09.11.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 09:11:45 -0700 (PDT)
Date: Thu, 13 Apr 2023 12:11:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Hanna Czenczek <hreitz@redhat.com>
Cc: qemu-devel@nongnu.org, virtio-fs@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>,
 German Maglione <gmaglione@redhat.com>,
 Anton Kuchin <antonkuchin@yandex-team.ru>,
 Juan Quintela <quintela@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH 0/4] vhost-user-fs: Internal migration
Message-ID: <20230413120554-mutt-send-email-mst@kernel.org>
References: <20230411150515.14020-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230411150515.14020-1-hreitz@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Tue, Apr 11, 2023 at 05:05:11PM +0200, Hanna Czenczek wrote:
> RFC:
> https://lists.nongnu.org/archive/html/qemu-devel/2023-03/msg04263.html
> 
> Hi,
> 
> Patch 2 of this series adds new vhost methods (only for vhost-user at
> this point) for transferring the back-end’s internal state to/from qemu
> during migration, so that this state can be stored in the migration
> stream.  (This is what we call “internal migration”, because the state
> is internally available to qemu; this is in contrast to “external
> migration”, which Anton is working on, where the back-end’s state is
> handled by the back-end itself without involving qemu.)
> 
> For this, the state is handled as a binary blob by qemu, and it is
> transferred over a pipe that is established via a new vhost method.
> 
> Patch 3 adds two high-level helper functions to (A) fetch any vhost
> back-end’s internal state and store it in a migration stream (a
> `QEMUFile`), and (B) load such state from a migrations stream and send
> it to a vhost back-end.  These build on the low-level interface
> introduced in patch 2.
> 
> Patch 4 then uses these functions to implement internal migration for
> vhost-user-fs.  Note that this of course depends on support in the
> back-end (virtiofsd), which is not yet ready.
> 
> Finally, patch 1 fixes a bug around migrating vhost-user devices: To
> enable/disable logging[1], the VHOST_F_LOG_ALL feature must be
> set/cleared, via the SET_FEATURES call.  Another, technically unrelated,
> feature exists, VHOST_USER_F_PROTOCOL_FEATURES, which indicates support
> for vhost-user protocol features.  Naturally, qemu wants to keep that
> other feature enabled, so it will set it (when possible) in every
> SET_FEATURES call.  However, a side effect of setting
> VHOST_USER_F_PROTOCOL_FEATURES is that all vrings are disabled.


I didn't get this part.
Two questions:
	Rings can be enabled or disabled by ``VHOST_USER_SET_VRING_ENABLE``.

	If ``VHOST_USER_F_PROTOCOL_FEATURES`` has not been negotiated, the
	ring starts directly in the enabled state.

	If ``VHOST_USER_F_PROTOCOL_FEATURES`` has been negotiated, the ring is
	initialized in a disabled state and is enabled by
	``VHOST_USER_SET_VRING_ENABLE`` with parameter 1.

so VHOST_USER_F_PROTOCOL_FEATURES only controls initial state of rings,
it does not disable rings.



>  This
> causes any enabling (done at the start of migration) or disabling (done
> on the source after a cancelled/failed migration) of logging to make the
> back-end hang.  Without patch 1, therefore, starting a migration will
> have any vhost-user back-end that supports both VHOST_F_LOG_ALL and
> VHOST_USER_F_PROTOCOL_FEATURES immediately hang completely, and unless
> execution is transferred to the destination, it will continue to hang.
> 
> 
> [1] Logging here means logging writes to guest memory pages in a dirty
> bitmap so that these dirty pages are flushed to the destination.  qemu
> cannot monitor the back-end’s writes to guest memory, so the back-end
> has to do so itself, and log its writes in a dirty bitmap shared with
> qemu.
> 
> 
> Changes in v1 compared to the RFC:
> - Patch 1 added
> 
> - Patch 2: Interface is different, now uses a pipe instead of shared
>   memory (as suggested by Stefan); also, this is now a generic
>   vhost-user interface, and not just for vhost-user-fs
> 
> - Patches 3 and 4: Because this is now supposed to be a generic
>   migration method for vhost-user back-ends, most of the migration code
>   has been moved from vhost-user-fs.c to vhost.c so it can be shared
>   between different back-ends.  The vhost-user-fs code is now a rather
>   thin wrapper around the common code.
>   - Note also (as suggested by Anton) that the back-end’s migration
>     state is now in a subsection, and that it is technically optional.
>     “Technically” means that with this series, it is always used (unless
>     the back-end doesn’t support migration, in which case migration is
>     just blocked), but Anton’s series for external migration would make
>     it optional.  (I.e., the subsection would be skipped for external
>     migration, and mandatorily included for internal migration.)
> 
> 
> Hanna Czenczek (4):
>   vhost: Re-enable vrings after setting features
>   vhost-user: Interface for migration state transfer
>   vhost: Add high-level state save/load functions
>   vhost-user-fs: Implement internal migration
> 
>  include/hw/virtio/vhost-backend.h |  24 +++
>  include/hw/virtio/vhost.h         | 124 +++++++++++++++
>  hw/virtio/vhost-user-fs.c         | 101 +++++++++++-
>  hw/virtio/vhost-user.c            | 147 ++++++++++++++++++
>  hw/virtio/vhost.c                 | 246 ++++++++++++++++++++++++++++++
>  5 files changed, 641 insertions(+), 1 deletion(-)
> 
> -- 
> 2.39.1


