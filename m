Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F14967E6CF
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 14:34:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLOrG-00014I-9A; Fri, 27 Jan 2023 08:33:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pLOrC-00012f-Qg
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 08:33:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pLOrA-0007h3-RF
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 08:33:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674826407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=977/YYW3nOlNLwRFfeqFBIMl9DZLZIovD8EgjQs7RcU=;
 b=JT6kjVluE28PYgoDLpAhtRXkBLxu/4QK+V04aCNL2n7RBua8e43ADii6YT1TuO5rsIIotN
 5oVVG/hAK4Vphyz2Z1WrzASd4FQ3sgrvHB7F9uGKwW8aP+qPBtYS5d1NIwLkSQ+Y4DHyXB
 IBmF220x6CUUW/n82SpJwV+Mwv3ocrQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-207-95NQv7FgOH6APPmZvt7qAw-1; Fri, 27 Jan 2023 08:33:25 -0500
X-MC-Unique: 95NQv7FgOH6APPmZvt7qAw-1
Received: by mail-ed1-f70.google.com with SMTP id
 s14-20020a056402520e00b0049e0bea1c3fso3564693edd.3
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 05:33:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=977/YYW3nOlNLwRFfeqFBIMl9DZLZIovD8EgjQs7RcU=;
 b=HBeiyd+5+IgPMCmfbi28NGPPOH0DplrnvfARE89iECLl0NY/h6MkoOAoKlABlm+0Vf
 xFScKBe0WUnBphlvtU7b7Ue+rm6WXDVgn3+2Ob/ENTcEhmylSxCb6Lp6W9LCOI8JedUe
 Zt2bonSYqTEqWQgL3LfnKvqZWJW9AqtkAo8+vggdRXpnuJeh0NnPBon+VRCDf97VOd3q
 rTqGDEErCKyoXFw072w5tsRqngpYXfV3pB7a325QKoegKCNHA5X9objDmhbNCVLuQPHB
 3Rw8MSwiB4CjSksR1EgKEQX0k0Y0IlZdAsdakq3bSDBJpmx1/B9F7Ylbjl3kfT4d8h27
 IX/g==
X-Gm-Message-State: AFqh2kpTqad5Pq5nsiXsRGNej9BESeQprmSIJhn3cGeJGiJJCF/QhFMI
 ASQTLgqwqpVjzKZ1KEk+HRop7CtH9va143rpALPlKCgBKrDnzXis0FPzU1G20+S41cCvKN6qspF
 dlQYj+LR5fKW/OUM=
X-Received: by 2002:a05:6402:28ca:b0:499:c294:77af with SMTP id
 ef10-20020a05640228ca00b00499c29477afmr42707284edb.12.1674826403821; 
 Fri, 27 Jan 2023 05:33:23 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvC3yIXWEzXQrMVxkzfwtcB94EeD+87E18dNcW+zkNOrjvA8ucqka3aI/Vqzm1rRiY6UYUEbw==
X-Received: by 2002:a05:6402:28ca:b0:499:c294:77af with SMTP id
 ef10-20020a05640228ca00b00499c29477afmr42707264edb.12.1674826403570; 
 Fri, 27 Jan 2023 05:33:23 -0800 (PST)
Received: from redhat.com ([2.52.137.69]) by smtp.gmail.com with ESMTPSA id
 ca18-20020aa7cd72000000b00495f4535a33sm2332804edb.74.2023.01.27.05.33.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 05:33:22 -0800 (PST)
Date: Fri, 27 Jan 2023 08:33:19 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Raphael Norwitz <raphael.norwitz@nutanix.com>
Cc: Minghao Yuan <yuanmh12@chinatelecom.cn>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 Peter Turschmid <peter.turschm@nutanix.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH 1/1] vhost-user: Skip unnecessary duplicated
 VHOST_USER_ADD/REM_MEM_REG requests
Message-ID: <20230127083027-mutt-send-email-mst@kernel.org>
References: <20230101214557.193768-1-yuanmh12@chinatelecom.cn>
 <1F225433-436A-41D3-AB33-6D5E21858B71@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1F225433-436A-41D3-AB33-6D5E21858B71@nutanix.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Tue, Jan 17, 2023 at 02:56:50PM +0000, Raphael Norwitz wrote:
> I’m confused by this “one time request” path.
> 
> MST - why do we classify SET_MEM_TABLE as a one time request if we send it on every hot-add/hot-remove.
> 
> In particular I’m tripping over the following in vhost_user_write:
> 
>  /*
>  * For non-vring specific requests, like VHOST_USER_SET_MEM_TABLE,
>  * we just need send it once in the first time. For later such
>  * request, we just ignore it.
>  */
> if (vhost_user_one_time_request(msg->hdr.request) && dev->vq_index != 0) {
>     msg->hdr.flags &= ~VHOST_USER_NEED_REPLY_MASK;
>     return 0;
> }

It's about the weird way vhost net works - it's actually split
from the frontend. So it's modeled as multiple devices
and vq_index will let you distinguish.
This has advantages and disadvantages.

> With the hot-add case in mind, this comment sounds off. IIUC hot-add works for vhost-user-blk and vhost-user-scsi because dev->vq_index is set to 0 and never changed.
> 
> Ref: https://git.qemu.org/?p=qemu.git;a=blob;f=hw/scsi/vhost-user-scsi.c;h=b7a71a802cdbf7430704f83fc8c6c04c135644b7;hb=HEAD#l121
> 
> Breakpoint 1, vhost_user_set_mem_table (dev=0x.., mem=0x..) at ../hw/virtio/vhost-user.c
> (gdb) where
> #0  vhost_user_set_mem_table (dev=0x..., mem=0x...) at ...hw/virtio/vhost-user.c
> #1  0x… in vhost_commit (listener=0x..) at .../hw/virtio/vhost.c
> #2  0x… in memory_region_transaction_commit () at ...memory.c
> ...
> (gdb) p dev->nvqs 
> $4 = 10
> (gdb) p dev->vq_index
> $3 = 0
> (gdb)
> 
> Looks like this functionality came in here:
> 
> commit b931bfbf042983f311b3b09894d8030b2755a638
> Author: Changchun Ouyang <changchun.ouyang@intel.com>
> Date:   Wed Sep 23 12:20:00 2015 +0800
> 
>     vhost-user: add multiple queue support
>     
>     This patch is initially based a patch from Nikolay Nikolaev.
>     
>     This patch adds vhost-user multiple queue support, by creating a nc
>     and vhost_net pair for each queue.
>     
> ...
>     
>     In older version, it was reported that some messages are sent more times
>     than necessary. Here we came an agreement with Michael that we could
>     categorize vhost user messages to 2 types: non-vring specific messages,
>     which should be sent only once, and vring specific messages, which should
>     be sent per queue.
>     
>     Here I introduced a helper function vhost_user_one_time_request(), which
>     lists following messages as non-vring specific messages:
>     
>             VHOST_USER_SET_OWNER
>             VHOST_USER_RESET_DEVICE
>             VHOST_USER_SET_MEM_TABLE
>             VHOST_USER_GET_QUEUE_NUM
>     
>     For above messages, we simply ignore them when they are not sent the first
>     time.
> 
> With hot-add in mind, should we revisit the non-vring specific messages and possibly clean the code up?

Sure.

> 
> > On Jan 1, 2023, at 11:45 PM, Minghao Yuan <yuanmh12@chinatelecom.cn> wrote:
> > 
> > The VHOST_USER_ADD/REM_MEM_REG requests should be categorized into
> > non-vring specific messages, and should be sent only once.
> > 
> > Signed-off-by: Minghao Yuan <yuanmh12@chinatelecom.cn>
> > ---
> > configure              | 2 +-
> > hw/virtio/vhost-user.c | 2 ++
> > 2 files changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/configure b/configure
> > index 9e407ce2e3..8b4deca342 100755
> 
> This configure change looks irrelevant. Did you mean to send it?
> 
> > --- a/configure
> > +++ b/configure
> > @@ -1147,7 +1147,7 @@ cat > $TMPC << EOF
> > #  endif
> > # endif
> > #elif defined(__GNUC__) && defined(__GNUC_MINOR__)
> > -# if __GNUC__ < 7 || (__GNUC__ == 7 && __GNUC_MINOR__ < 4)
> > +# if __GNUC__ < 7 || (__GNUC__ == 7 && __GNUC_MINOR__ < 3)
> > #  error You need at least GCC v7.4.0 to compile QEMU
> > # endif
> > #else
> > diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> > index d9ce0501b2..3f2a8c3bdd 100644
> > --- a/hw/virtio/vhost-user.c
> > +++ b/hw/virtio/vhost-user.c
> > @@ -459,6 +459,8 @@ static bool vhost_user_one_time_request(VhostUserRequest request)
> >     case VHOST_USER_SET_MEM_TABLE:
> >     case VHOST_USER_GET_QUEUE_NUM:
> >     case VHOST_USER_NET_SET_MTU:
> > +    case VHOST_USER_ADD_MEM_REG:
> > +    case VHOST_USER_REM_MEM_REG:
> >         return true;
> >     default:
> >         return false;
> > -- 
> > 2.27.0
> > 
> > 
> 


