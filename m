Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5968066D0A7
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 22:03:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHWcb-0007DL-W2; Mon, 16 Jan 2023 16:02:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pHWcF-00078X-2w
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 16:02:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pHWcD-0000jz-5l
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 16:02:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673902919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YzE/bfshJvqsYkig9WmdM2lJKbsr+GfBud2xFv3W7j0=;
 b=KQLsKAMX13EiBoHe/sEKHfxRRcO/ygJYP0+5PYOVP83D+Qo6Ezy/0sXUOFZbRYPwvu7I21
 EIl8V/dnB9O7saXQmgW2UlJeFkSFw2aImlmqJ2ZlxueO1IlbO51Yr3Xk+uBjsP/XtJvsJo
 d7lJT9l9sO1SPpu/tn55hu+6GHjkmco=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-64-TGDFP7fkNYij2dGhqhFYoQ-1; Mon, 16 Jan 2023 16:01:58 -0500
X-MC-Unique: TGDFP7fkNYij2dGhqhFYoQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 c7-20020a1c3507000000b003d355c13ba8so15524589wma.6
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 13:01:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YzE/bfshJvqsYkig9WmdM2lJKbsr+GfBud2xFv3W7j0=;
 b=SJPonXUP3wSMnthzcByTvO0bS3+km5vPZHJDl/3UiOkgN+pu9ktKtp3XgOX6D9o+bP
 4nzQzgABA5bQImb3HqUvN6jWRRlAAzL5R+ZHZ8h9igry7Yww9dtrDx9iVTErFsKuz73a
 hmo0PdYHpmEMfFp5q+EgwEO82FUqWkpxz5ZTyMaQ6IfgR5XLWCPnNHZD8aPJR8yuGiB4
 XWa93CM6CcUX3gPK1WOUvY4dh8ksVA3aEpyZcDOtLfm+aUsGRVQUPqXhB7ie2kQ+gGkn
 xqFl6ICFG9kq098jbk/2nc2ubt3MCn1vROtuJzRD0pupcKX7O5+55J3yhZdrUf3dFgWG
 GzZg==
X-Gm-Message-State: AFqh2kpKLhnveliwXL2z6aEw6wQQI1cbV2pNUHh+qrHLTyQjuFBlXERY
 x/BdRpGmNw4Vx+HPtgJxAVjKYRaXqApYBiqQE5W4sI1lfnWjmuiXTvuCY+sG/8uqVJbaXLjVLvn
 2R2JFm3PD5RtZK08=
X-Received: by 2002:a05:600c:1695:b0:3da:f651:8ccc with SMTP id
 k21-20020a05600c169500b003daf6518cccmr793177wmn.4.1673902917372; 
 Mon, 16 Jan 2023 13:01:57 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvVu8wnOgGzW48KfDt4Q+qHniWaGzGGzDweh8bhpxmrEcOO++9TpoyBSx+EfuqVCk0BMCwyFw==
X-Received: by 2002:a05:600c:1695:b0:3da:f651:8ccc with SMTP id
 k21-20020a05600c169500b003daf6518cccmr793167wmn.4.1673902917194; 
 Mon, 16 Jan 2023 13:01:57 -0800 (PST)
Received: from redhat.com ([2.52.132.216]) by smtp.gmail.com with ESMTPSA id
 iv14-20020a05600c548e00b003b47b80cec3sm45296837wmb.42.2023.01.16.13.01.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 13:01:56 -0800 (PST)
Date: Mon, 16 Jan 2023 16:01:52 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Cindy Lu <lulu@redhat.com>,
 Si-Wei Liu <si-wei.liu@oracle.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Parav Pandit <parav@mellanox.com>
Subject: Re: [RFC PATCH for 8.0 10/13] virtio-net: Migrate vhost inflight
 descriptors
Message-ID: <20230116155949-mutt-send-email-mst@kernel.org>
References: <20221205170436.2977336-1-eperezma@redhat.com>
 <20221205170436.2977336-11-eperezma@redhat.com>
 <CACGkMEtcQztTdRbX3xyFvNYSRsu58tRppoyTUh94vXwSGLPH=A@mail.gmail.com>
 <CAJaqyWf34J7g+3eQ498JS+VC07j+3rF+m-yeWhE5RcP1MDu2pw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJaqyWf34J7g+3eQ498JS+VC07j+3rF+m-yeWhE5RcP1MDu2pw@mail.gmail.com>
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

On Wed, Dec 07, 2022 at 09:56:20AM +0100, Eugenio Perez Martin wrote:
> > A dumb question, any reason we need bother with virtio-net? It looks
> > to me it's not a must and would complicate migration compatibility.
> >
> > I guess virtio-blk is the better place.
> >
> 
> I'm fine to start with -blk, but if -net devices are processing
> buffers out of order we have chances of losing descriptors too.
> 
> We can wait for more feedback to prioritize correctly this though.
> 
> Thanks!

Traditionally vhost serialized everything when dropping the VQ.
Would be interesting to hear from hardware vendors on whether
it's hard or easy to do in hardware.
But I suspect all devices will want the capability eventually
because why not, if we have the code let's just do it everywhere.

-- 
MST


