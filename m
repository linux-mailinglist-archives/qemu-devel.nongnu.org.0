Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 484364ECCC7
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 20:58:18 +0200 (CEST)
Received: from localhost ([::1]:32914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZdWL-00028r-DS
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 14:58:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nZd2o-0002QC-LU
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 14:27:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nZd2n-0005tD-36
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 14:27:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648664863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yWajWJ1atiuoPQQiMDWGDm77MdsR+aGlco/qeOc2150=;
 b=V/gJTJIivPnsfW0uMMNqTwkuTy4U6ZSJGO+SYjhoZdJtP1kKipsdmDwGFx8J0H6w1dORfz
 2U+NDepA5sZmY4TDElS5HZCW67q1XCBXzNI5+agJCi3z6XNcfFxwSN6zDydM+6B0xNsHkp
 KV6/77YvhgQzU0liwR8azGRtIFKvrgs=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-Vrh3ZQveOAeUxbJJdYLMvw-1; Wed, 30 Mar 2022 14:27:42 -0400
X-MC-Unique: Vrh3ZQveOAeUxbJJdYLMvw-1
Received: by mail-qv1-f71.google.com with SMTP id
 33-20020a0c8024000000b0043d17ffb0bdso16657479qva.18
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 11:27:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yWajWJ1atiuoPQQiMDWGDm77MdsR+aGlco/qeOc2150=;
 b=qMmj10mSk3ptlNlLfgZ3MyDyrXhHsaCTVhRzaGKBhiprIXFrckMaEVoHjC35oZJ+wE
 1h0qF2r9niumRKrw7eZns7wGEDoOaoMQ7Rc9pYZ4eymPvUWoi/GElWmuEe7CxkkIQvQ0
 afuliq371/nikczfxIHrqiEXh02mSCEXM33aiVF4jALLXrEyadih8VkDqTz9dOBpAwPk
 JlkiqtQv/IDxvcWBim+ZxKbeZx3dTN4xE4xtxsI0LLoEO/94oTKZEQoCI8QcuiWBh6yk
 kE/4Ne6kRoF5+r6MvnERgq4NYhL4c7Hp5Hxv2SaSftU/uj99bz35ycH28gTsYEzLoB1h
 fpLA==
X-Gm-Message-State: AOAM530qURyWjKjKD3uWMAVzn1Uohk9cKsMvRqMugDeU3/+WK3xVlImi
 C0mPwer8P2zY7d+CWOu+RFI5H68AjldZBEdg9C0k3VfRQ7kCHE3b/RlhUEZG60LsfDFFYyYPgnj
 PVQIsXzKQqxoipMgp7DCIR98xNCKY6wg=
X-Received: by 2002:ac8:59c7:0:b0:2e1:a0d1:fc7b with SMTP id
 f7-20020ac859c7000000b002e1a0d1fc7bmr867879qtf.320.1648664861945; 
 Wed, 30 Mar 2022 11:27:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzA/GW19Z6qww5dXKWHL+PwPxHS4IKVrtfRkDpBqc7tpFtW7uczdcIDC1gEY4TxKt68EzS6/oa5/IvsCgO3I10=
X-Received: by 2002:ac8:59c7:0:b0:2e1:a0d1:fc7b with SMTP id
 f7-20020ac859c7000000b002e1a0d1fc7bmr867785qtf.320.1648664860292; Wed, 30 Mar
 2022 11:27:40 -0700 (PDT)
MIME-Version: 1.0
References: <1648621997-22416-1-git-send-email-si-wei.liu@oracle.com>
 <1648621997-22416-8-git-send-email-si-wei.liu@oracle.com>
 <20220330162406.62cnedwmn4zn6ars@sgarzare-redhat>
 <eaac0521-949d-6f8e-63e0-cebecd9a33b9@oracle.com>
 <20220330173209.2rj43622nfa46s7p@sgarzare-redhat>
In-Reply-To: <20220330173209.2rj43622nfa46s7p@sgarzare-redhat>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 30 Mar 2022 20:27:04 +0200
Message-ID: <CAJaqyWdm5PwZVQX2g+VRVYEkgkzRHfGdEO0fnr_uPFbG0J2i5Q@mail.gmail.com>
Subject: Re: [PATCH 7/7] vhost-vdpa: backend feature should set only once
To: Stefano Garzarella <sgarzare@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Si-Wei Liu <si-wei.liu@oracle.com>, Jason Wang <jasowang@redhat.com>,
 Michael Tsirkin <mst@redhat.com>, qemu-level <qemu-devel@nongnu.org>,
 Eli Cohen <eli@mellanox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 30, 2022 at 7:32 PM Stefano Garzarella <sgarzare@redhat.com> wrote:
>
> On Wed, Mar 30, 2022 at 10:12:42AM -0700, Si-Wei Liu wrote:
> >
> >
> >On 3/30/2022 9:24 AM, Stefano Garzarella wrote:
> >>On Tue, Mar 29, 2022 at 11:33:17PM -0700, Si-Wei Liu wrote:
> >>>The vhost_vdpa_one_time_request() branch in
> >>>vhost_vdpa_set_backend_cap() incorrectly sends down
> >>>iotls on vhost_dev with non-zero index. This may
> >>
> >>Little typo s/iotls/ioctls
> >Thanks! Will correct it in v2.
> >
> >>
> >>>end up with multiple VHOST_SET_BACKEND_FEATURES
> >>>ioctl calls sent down on the vhost-vdpa fd that is
> >>>shared between all these vhost_dev's.
> >>>
> >>>To fix it, send down ioctl only once via the first
> >>>vhost_dev with index 0. Toggle the polarity of the
> >>>vhost_vdpa_one_time_request() test would do the trick.
> >>>
> >>>Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
> >>>---
> >>>hw/virtio/vhost-vdpa.c | 2 +-
> >>>1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>>diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> >>>index c5ed7a3..27ea706 100644
> >>>--- a/hw/virtio/vhost-vdpa.c
> >>>+++ b/hw/virtio/vhost-vdpa.c
> >>>@@ -665,7 +665,7 @@ static int vhost_vdpa_set_backend_cap(struct
> >>>vhost_dev *dev)
> >>>
> >>>    features &= f;
> >>>
> >>>-    if (vhost_vdpa_one_time_request(dev)) {
> >>>+    if (!vhost_vdpa_one_time_request(dev)) {
> >>>        r = vhost_vdpa_call(dev, VHOST_SET_BACKEND_FEATURES, &features);
> >>>        if (r) {
> >>>            return -EFAULT;
> >>>--
> >>>1.8.3.1
> >>>
> >>>
> >>
> >>With that:
> >>
> >>Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
> >>
> >>
> >>
> >>Unrelated to this patch, but the name vhost_vdpa_one_time_request()
> >>is confusing IMHO.
> >Coincidentally I got the same feeling and wanted to rename it to
> >something else, too.
> >
> >>
> >>Not that I'm good with names, but how about we change it to
> >>vhost_vdpa_skip_one_time_request()?
> >How about vhost_vdpa_request_already_applied()? seems to be more
> >readable in the context.
>
> That's fine too, except you can't discern that it's a single request per
> device, so maybe I'd add "dev," but I don't know if it gets too long:
>
> vhost_vdpa_dev_request_already_applied()
>
> And I would also add a comment to the function to explain that we use
> that function for requests that only need to be applied once, regardless
> of the number of queues.
>

In my opinion it should express what it checks: vhost_vdpa_first, or
vhost_vdpa_first_dev, vhost_vdpa_first_queue... and to add a comment
like the one you propose. I think the context of the caller gives
enough information.

I would add that the use is for requests that only need / must be
applied once *and before setting up queues*, *at the beginning of
operation*, or similar, because we do a similar check with
dev->vq_index_end and these are not exchangeable.

Thanks!

> Thanks,
> Stefano
>


