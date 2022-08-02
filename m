Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8323587CE3
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 15:12:54 +0200 (CEST)
Received: from localhost ([::1]:38614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIrhc-0004LN-Bm
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 09:12:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oIrf0-0001zs-J7
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 09:10:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oIrex-00073m-Cg
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 09:10:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659445805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YhZtIgUyaiXv9bi4AZmiWjodQ77c+dgh88Ul/MHjT2M=;
 b=gqhAztds3ph4Egm8rev/6Q9Ku8kBG7AQ4k8XoEwTlhKjVgcyZ2wY2SoOvv3TvhUWXh1n1B
 ofApDKrBWA+cw/zO0QNARZ6/VWwk8MKtjGPX1Y1CGwqZjW+9eoN8IciJE9YNjMHjUlH3/z
 2NHiI15OpnAUJi579eWi37MyexRcrdw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-DhZVsIs_Oe6q79-yWAPYIg-1; Tue, 02 Aug 2022 09:10:04 -0400
X-MC-Unique: DhZVsIs_Oe6q79-yWAPYIg-1
Received: by mail-ej1-f69.google.com with SMTP id
 hs16-20020a1709073e9000b0072b73a28465so4188377ejc.17
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 06:10:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=YhZtIgUyaiXv9bi4AZmiWjodQ77c+dgh88Ul/MHjT2M=;
 b=YhMgPoxLQBHGqYp+cpEerFRYU6gGENMRHXFudD4B3jPxdfUoEQLaMkhUm6TbUOyCR4
 pTmwh7lLR8QxtgrvfVJheGr5WUXSjcJFeh+NsKlkiejDUfZKcdQ1HPyk8HvIuWIjiFVd
 376lN6pqOqobhNaZ45vraiHBKilCeUdazC68gUvmbjOPgBRtv5LaX4X2fJyatUwXTBQc
 7PZOC7J9/ZNhGW5aiJ0mFHDS64m+h1ssqs3aYpgghPAhlfDw+/cYIq9vAohS8/MNkRM+
 s6q02BN7PLjz3U6sKpPF3sZNZXa0gM7CM/Et2UevpQ1qb65yhwGEwHSdBN06jA7STP8F
 lbBQ==
X-Gm-Message-State: AJIora8v/qDAVqa62nsbF1OHy6lDikpmVA3WVGd8RYPgyxB+d1Pg3VYp
 P0FJAtpxLDyE7Cajx0ahn+DAIqn9dwbT4YYD2dHFLdUHOXNrQGzwXy1ZT65CMhJn7TVh/ZCfFyl
 nfODj2oZLAiEsjv0=
X-Received: by 2002:a17:907:2889:b0:72b:50c8:c703 with SMTP id
 em9-20020a170907288900b0072b50c8c703mr15568317ejc.694.1659445803579; 
 Tue, 02 Aug 2022 06:10:03 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v4fstQGB9xXQRD06A+SC97QR/cfqyuU7ATkDf4f26/Iizbx4u5fXgWrKY/Fv94qt3bVM2HCA==
X-Received: by 2002:a17:907:2889:b0:72b:50c8:c703 with SMTP id
 em9-20020a170907288900b0072b50c8c703mr15568295ejc.694.1659445803356; 
 Tue, 02 Aug 2022 06:10:03 -0700 (PDT)
Received: from redhat.com ([2.52.130.0]) by smtp.gmail.com with ESMTPSA id
 r18-20020a17090609d200b0072abb95c9f4sm6224694eje.193.2022.08.02.06.10.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 06:10:02 -0700 (PDT)
Date: Tue, 2 Aug 2022 09:09:57 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-trivial@nongnu.org, Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 2/2] vdpa: Merge all net_init_vhost_vdpa error goto
Message-ID: <20220802090938-mutt-send-email-mst@kernel.org>
References: <20220802112447.249436-1-eperezma@redhat.com>
 <20220802112447.249436-3-eperezma@redhat.com>
 <72375be5-36d8-155c-9df8-da76c1d820c0@redhat.com>
 <20220802085655-mutt-send-email-mst@kernel.org>
 <ef5bcff0-a297-2173-40ce-6b8070ea9b3c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ef5bcff0-a297-2173-40ce-6b8070ea9b3c@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Tue, Aug 02, 2022 at 02:58:36PM +0200, Laurent Vivier wrote:
> On 02/08/2022 14:57, Michael S. Tsirkin wrote:
> > On Tue, Aug 02, 2022 at 02:10:43PM +0200, Laurent Vivier wrote:
> > > On 02/08/2022 13:24, Eugenio Pérez wrote:
> > > > Few steps allocate new resources, and all of the allocated can be
> > > > checked to avoid trying to free an invalid one.
> > > > 
> > > > Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> > 
> > 
> > qemu-trivial too I guess then?
> 
> For 7.1 or later?
> 
> Thanks,
> Laurent

I don't really care. Since you are merging this you get to decide.

> > 
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > 
> > > > ---
> > > >    net/vhost-vdpa.c | 6 ++----
> > > >    1 file changed, 2 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > > index 303447a68e..ac1810723c 100644
> > > > --- a/net/vhost-vdpa.c
> > > > +++ b/net/vhost-vdpa.c
> > > > @@ -588,8 +588,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
> > > >        queue_pairs = vhost_vdpa_get_max_queue_pairs(vdpa_device_fd, features,
> > > >                                                     &has_cvq, errp);
> > > >        if (queue_pairs < 0) {
> > > > -        qemu_close(vdpa_device_fd);
> > > > -        return queue_pairs;
> > > > +        goto err;
> > > >        }
> > > >        if (opts->x_svq) {
> > > > @@ -604,7 +603,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
> > > >            if (invalid_dev_features) {
> > > >                error_setg(errp, "vdpa svq does not work with features 0x%" PRIx64,
> > > >                           invalid_dev_features);
> > > > -            goto err_svq;
> > > > +            goto err;
> > > >            }
> > > >            vhost_vdpa_get_iova_range(vdpa_device_fd, &iova_range);
> > > > @@ -640,7 +639,6 @@ err:
> > > >            }
> > > >        }
> > > > -err_svq:
> > > >        qemu_close(vdpa_device_fd);
> > > >        return -1;
> > > 
> > > Reviewed-by: Laurent Vivier <lvivier@redhat.com>
> > 


