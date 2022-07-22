Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC8E57E164
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 14:24:45 +0200 (CEST)
Received: from localhost ([::1]:40986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oErhz-0003yD-RM
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 08:24:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oErey-0001Ac-H6
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 08:21:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oErev-0001Ap-4t
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 08:21:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658492491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7OPhQuZ5PSNKIwoZwesdXIDajSYl2Vyd6Tc0rRKVLGI=;
 b=ZDfOPbjc2e+Xl1sV5P+VqbdUDT+tN3Ve9ttJy9iisbQ74a5Q1Ug5jwNSgoNSs8gvKneR6n
 ZnhdhaXUoOrBntjkx9sUKrUYpLnnOr66r9z9ljwj7O+LNiTptjqe85IYkCsPwLI13WInVY
 6Jw5F+lcniA6kRukjbmphAF3YmARBEc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-19ei278LNR2LQPudUP4fag-1; Fri, 22 Jul 2022 08:21:28 -0400
X-MC-Unique: 19ei278LNR2LQPudUP4fag-1
Received: by mail-wm1-f70.google.com with SMTP id
 i133-20020a1c3b8b000000b003a2fe4c345cso769843wma.0
 for <qemu-devel@nongnu.org>; Fri, 22 Jul 2022 05:21:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7OPhQuZ5PSNKIwoZwesdXIDajSYl2Vyd6Tc0rRKVLGI=;
 b=l51W8nIboP8NHUIl+PYUVG69F2+9l9KbEbxEYGCFkwwUw5Tl0air5pfmuLJqsmv7x8
 Z8a+Br1YCKxGPvq8/vLI5ZVThRHlfA5LzhDYQVYH8fBShwUMrobRHt10oFnocxSU6nTP
 t6E24qNHqK6+TeYQZPiXOs7bWlcnxZQTPyfYY7jmlKISNdZNC0/q0okUIpxLk66eCutD
 qMBzIsV3AqcsiRAJ/XkzgGEl6Mq/D+RE3AmjEC3Ru1PPfZTAHWY3ROL5RVV74IJzVaYI
 mrD8HSjoaPiGPEC63bkHAGe4Ejc1P4TydWmifFVa7RqBze+mk2Q+Ow90UxHjT+GtTBK4
 WHtQ==
X-Gm-Message-State: AJIora/8UXzCrO1kCphQeTb8M/vJNjrgUyRbPaTetF1jYYuO0Hha4crJ
 NV1Oheu+bo4u5I+zSstGaO5vqbrWXnqTgSfqzq6xk/h9C4tAMaE2uLrTowr/TGA6rA9Fyy3BCXR
 tkis/QDW23tc0xw8=
X-Received: by 2002:a05:6000:186a:b0:21d:ae19:b737 with SMTP id
 d10-20020a056000186a00b0021dae19b737mr164098wri.317.1658492487458; 
 Fri, 22 Jul 2022 05:21:27 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t6RHw30a6ADW8QCrhCQtMKBkRBKux+PRPopUqxa5kzvfwO9y6OXpKl+EXQChXbnabU6HEeuw==
X-Received: by 2002:a05:6000:186a:b0:21d:ae19:b737 with SMTP id
 d10-20020a056000186a00b0021dae19b737mr164078wri.317.1658492487188; 
 Fri, 22 Jul 2022 05:21:27 -0700 (PDT)
Received: from redhat.com ([2a06:c701:73fa:9a00:13b7:6cb8:308:44ea])
 by smtp.gmail.com with ESMTPSA id
 v11-20020adfe4cb000000b0021e6b62fde2sm228106wrm.59.2022.07.22.05.21.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jul 2022 05:21:26 -0700 (PDT)
Date: Fri, 22 Jul 2022 08:21:23 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cindy Lu <lulu@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Jason Wang <jasowang@redhat.com>, virtio-fs@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH v13 00/10] vhost-vdpa: add support for configure interrupt
Message-ID: <20220722082054-mutt-send-email-mst@kernel.org>
References: <20220720131204.591104-1-lulu@redhat.com>
 <CACLfguXo3=h0PsHh+oehVcTjRNSqwOCiG9-VM_o7HjUdZBtxcA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACLfguXo3=h0PsHh+oehVcTjRNSqwOCiG9-VM_o7HjUdZBtxcA@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 22, 2022 at 03:46:52PM +0800, Cindy Lu wrote:
> Hi Micheal.
> Would you help review these patches, not sure if this is ok to merge?
> Thanks
> Cindy

Pls note threading is broken in the patchset. Care to repost?

-- 
MST


