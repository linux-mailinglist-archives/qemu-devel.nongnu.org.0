Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A46549DCB2
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 09:43:24 +0100 (CET)
Received: from localhost ([::1]:53938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD0NH-0003Bo-5a
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 03:43:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nCznh-0002VZ-Gm
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 03:06:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nCznf-0002Fs-86
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 03:06:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643270793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=504wFKnHwwkFfPMgKXlwh2pWyCBgbL4WyM0tygoZNNQ=;
 b=PgzeprEjsSeRWLdXveGH87perQH+nmsPrCV3JHaLbuhJ0nUcVIlK9x/Xs73BN0iGlhbt7Y
 VGrG+Y74Syt5pGmsCfc7b3nCofZeiloyKbeKxamgo1yfm1HDD05C3/p5yhDBJL3OG03sx4
 eLZwG3epkhg1ItZPjMSo7tW1aeHWzO8=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-356-Wfxe1fdwOHGje9ypLHgZxw-1; Thu, 27 Jan 2022 03:06:26 -0500
X-MC-Unique: Wfxe1fdwOHGje9ypLHgZxw-1
Received: by mail-pf1-f197.google.com with SMTP id
 68-20020a621547000000b004c74bbd2819so1201972pfv.18
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 00:06:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=504wFKnHwwkFfPMgKXlwh2pWyCBgbL4WyM0tygoZNNQ=;
 b=hH25qVCZunO3EIUfYJVjd6j5cY5MIuH+l9/mvw0enXVcBwasvcCdUtfAH6VkbmXf0s
 dwEMZwFrrSMOeZsJGDxhM35HLKMrRNstYgNj/l4Gx7V6QwrTJf/ptLPZCc0Aygc+XHiQ
 FmSoIXAgOM5o4XuBmCpHeBHTJAp4byLDPPGf4wdsXYfGATNeasFjsz9KMHWKQSTOmMJj
 4Yq46TG7iMMSNwTFWdMjwKE2UtiKQRW/cWwFZeFsoJAvf4XPc2uoLA6Q0jM5opIILHHf
 th61KibJrFdoskJPLbPbdys5iQbQQv+/p/AkUgqDdoP4Ux/oP//BgmoXv7g8z7ne035P
 13Dw==
X-Gm-Message-State: AOAM533RFLmYdDyygOQn7bf6qx//3O572XbS0XVZi3LInNoiOzIJxrkR
 hglTn8Qb8lsKGtU1D1umJk/ZPhSssYe3VDmmajwxSK/YurC5Z1GLwWOkvGYz5uldbIhf/V25RU9
 tErp9d7BGAxtcqC8=
X-Received: by 2002:a17:90b:4c11:: with SMTP id
 na17mr12923666pjb.208.1643270785784; 
 Thu, 27 Jan 2022 00:06:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyLKfGJjeS4YswQ/QKDZOAXPs/PKdHTyVn17lLFQab1SuE9NkeWoTsMumy/vbjTkOUgHRMDEg==
X-Received: by 2002:a17:90b:4c11:: with SMTP id
 na17mr12923639pjb.208.1643270785491; 
 Thu, 27 Jan 2022 00:06:25 -0800 (PST)
Received: from xz-m1.local ([111.197.238.41])
 by smtp.gmail.com with ESMTPSA id f15sm4385357pfn.19.2022.01.27.00.06.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 00:06:25 -0800 (PST)
Date: Thu, 27 Jan 2022 16:06:19 +0800
From: Peter Xu <peterx@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Subject: Re: [PATCH 21/31] util: Add iova_tree_alloc
Message-ID: <YfJSezhQv1kXa1x8@xz-m1.local>
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-22-eperezma@redhat.com>
 <Ye4r7tKFhP9VaT5/@xz-m1.local>
 <CAJaqyWf--wbNZz5ZzbpixD9op_fO5fV01kbYXzG097c_NkqYrw@mail.gmail.com>
 <Ye6IhLCe6NDKO6+E@xz-m1.local>
 <CAJaqyWcdpTr2X4VuAN2NLmpviCjDoAaY269+VQGZ7-F6myOhSw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJaqyWcdpTr2X4VuAN2NLmpviCjDoAaY269+VQGZ7-F6myOhSw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-level <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eric Blake <eblake@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 25, 2022 at 10:40:01AM +0100, Eugenio Perez Martin wrote:
> So I think that the first step to remove complexity from the old one
> is to remove iova_begin and iova_end.
> 
> As Jason points out, removing iova_end is easier. It has the drawback
> of having to traverse all the list beyond iova_end, but a well formed
> iova tree should contain none. If the guest can manipulate it, it's
> only hurting itself adding nodes to it.
> 
> It's possible to extract the check for hole_right (or this in Jason's
> proposal) as a special case too.
> 
> But removing the iova_begin parameter is more complicated. We cannot
> know if it's a valid hole without knowing iova_begin, and we cannot
> resume traversing. Could we assume iova_begin will always be 0? I
> think not, the vdpa device can return anything through syscall.

Frankly I don't know what's the syscall you're talking about, but after a 2nd
thought and after I went back and re-read your previous version more carefully
(the one without the list) I think it seems working to me in general.  I should
have tried harder when reviewing the first time!

I mean this one:

https://lore.kernel.org/qemu-devel/20211029183525.1776416-24-eperezma@redhat.com/

Though this time I have some comments on the details.

Personally I like that one (probably with some amendment upon the old version)
more than the current list-based approach.  But I'd like to know your thoughts
too (including Jason).  I'll further comment in that thread soon.

Thanks,

-- 
Peter Xu


