Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBC66E6858
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 17:35:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ponM5-0005vc-UL; Tue, 18 Apr 2023 11:34:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ponM3-0005vS-T3
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 11:34:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ponM2-0008U9-5O
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 11:34:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681832088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nEXLdzyHwiUoFcHBVuxy1lO+mLhaOIf3rig/+aSr5GY=;
 b=IDcAOh/ObpixJBaxJB1gR9r4zUATTzh2DnlLwxWw8G196ZNvEF2mdgQCVn6KEWpkftgrqp
 ziNx9IEIjAYvqnvq+n3GIEKK++Hb1mwRDt5iQfDDLwmie3bS/ahrvZGaSf9+/NTJxsiZyj
 p2MF8gYNwGW2F+FC85ce9OoQAWeW2sg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-203-pOOJXHobNF2fFSgPvg4-zQ-1; Tue, 18 Apr 2023 11:34:47 -0400
X-MC-Unique: pOOJXHobNF2fFSgPvg4-zQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 az39-20020a05600c602700b003f172e1d5bbso3058830wmb.9
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 08:34:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681832085; x=1684424085;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nEXLdzyHwiUoFcHBVuxy1lO+mLhaOIf3rig/+aSr5GY=;
 b=SFlkf82P6Bq07ie8V72cRiNw50aY6JID0T+gCfshnaicMGzoRSPv3kB5EyLIJ9mqWd
 4j7Dxfc7PV1mSka/Js1U7PugVdRKyAi6M/Rt+VuierjeNNaGZwBYaCzWU9GvGONjAKAt
 Upp1KQ2QT1Gd+fPJ+NwkmeljnBkMpm0isIEk5+AcEGRt+39db8x6I7PAkpyKxZaPR87/
 AKC1oCLUBoJUg7SuHzBej9wVitEFmSalYGO9KXXvKs9SoDM/FQupLmrR4jXX8RC5BeT1
 jJTzgxMkgaMzfhgD1DmpL5bAlqscVDvMT2pt4Ch/6CrfXkIYGmUQMWHHEbM2esAR8hy7
 jWgA==
X-Gm-Message-State: AAQBX9dZtC6TOkYc0TswaLEb+pXbjbbSp1PLaV71CcT8oIlCAwcUqMa4
 3VK7PTg43DW+gC1p2fbTbqC+mM0d/R4pKR5IliUfeNuI/uhdBpVejCND342pY/HxRR1myJzIFOb
 xnn3KMq3FlKMxm1x/+P/AGDk=
X-Received: by 2002:a1c:750a:0:b0:3f1:70d5:1be8 with SMTP id
 o10-20020a1c750a000000b003f170d51be8mr7506522wmc.15.1681832085514; 
 Tue, 18 Apr 2023 08:34:45 -0700 (PDT)
X-Google-Smtp-Source: AKy350aIjnJH8bXVhdB7sUEWZGmA/dnZ2HUNV4g0yq/UY5J4A0gGDBdA6CkePxxUCU+uwUXgTi8L1w==
X-Received: by 2002:a1c:750a:0:b0:3f1:70d5:1be8 with SMTP id
 o10-20020a1c750a000000b003f170d51be8mr7506508wmc.15.1681832085200; 
 Tue, 18 Apr 2023 08:34:45 -0700 (PDT)
Received: from redhat.com ([2.52.4.37]) by smtp.gmail.com with ESMTPSA id
 p5-20020a05600c358500b003f09fd301ddsm18253933wmq.1.2023.04.18.08.34.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 08:34:44 -0700 (PDT)
Date: Tue, 18 Apr 2023 11:34:41 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Cindy Lu <lulu@redhat.com>,
 Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
 Yajun Wu <yajunw@nvidia.com>, qemu-devel@nongnu.org
Subject: Re: Move vhost-user SET_STATUS 0 after get vring base?
Message-ID: <20230418113320-mutt-send-email-mst@kernel.org>
References: <20230418151811.GA4048149@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230418151811.GA4048149@fedora>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, Apr 18, 2023 at 11:18:11AM -0400, Stefan Hajnoczi wrote:
> Hi,
> Cindy's commit ca71db438bdc ("vhost: implement vhost_dev_start method")
> added SET_STATUS calls to vhost_dev_start() and vhost_dev_stop() for all
> vhost backends.
> 
> Eugenio's commit c3716f260bff ("vdpa: move vhost reset after get vring
> base") deferred the SET_STATUS 0 call in vhost_dev_stop() until after
> GET_VRING_BASE for vDPA only. In that commit Eugenio said, "A patch to
> make vhost_user_dev_start more similar to vdpa is desirable, but it can
> be added on top".
> 
> I agree and think it's a good idea to keep the vhost backends in sync
> where possible.
> 
> vhost-user still has the old behavior where QEMU sends SET_STATUS 0
> before GET_VRING_BASE. Most existing vhost-user backends don't implement
> the SET_STATUS message, so I think no one has tripped over this yet.
> 
> Any thoughts on making vhost-user behave like vDPA here?
> 
> Stefan

Wow. Well  SET_STATUS 0 resets the device so yes, I think doing that
before GET_VRING_BASE will lose a state. Donnu how it does not trip
up people, indeed the only idea is if people ignore SET_STATUS.


-- 
MST


