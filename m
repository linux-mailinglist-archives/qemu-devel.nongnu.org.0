Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A8D544E66
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 16:10:24 +0200 (CEST)
Received: from localhost ([::1]:36358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzIrf-0003j0-N3
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 10:10:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nzGrq-0005SJ-01
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 08:02:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nzGrm-0003VO-TW
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 08:02:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654776141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KvQTvntB7sQwEjW9N35sI+wAlKg3Uf86xvIHaIVGPP0=;
 b=Rkez+9VBq7ynPxI6WJvajdDBmcrDVEsTEC2imec6jNK58RKC4ZTEgw84M13YfEb76Gvkb1
 gVIIHd6qUuV8tRDAKHTnbv0ua+uN/KSwNhxPOybLltlNai/Ss16VNu/602xkX+aPdAXtj9
 2YZNmdkrZoOTVjQwOERGJHPn1uGcJmA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-507-FrWQox30OgKOk83Mxg-NUA-1; Thu, 09 Jun 2022 08:02:16 -0400
X-MC-Unique: FrWQox30OgKOk83Mxg-NUA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 029381C0F690;
 Thu,  9 Jun 2022 12:02:16 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BF44E2166B26;
 Thu,  9 Jun 2022 12:02:15 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7C2601800094; Thu,  9 Jun 2022 14:02:14 +0200 (CEST)
Date: Thu, 9 Jun 2022 14:02:14 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: qemu Developers <qemu-devel@nongnu.org>, xen-devel@lists.xenproject.org,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v3 2/3] ui: Deliver refresh rate via QemuUIInfo
Message-ID: <20220609120214.bay3cl24oays6x6d@sirius.home.kraxel.org>
References: <20220226115516.59830-1-akihiko.odaki@gmail.com>
 <20220226115516.59830-3-akihiko.odaki@gmail.com>
 <20220609102805.qz2xrnd6ms6cigir@sirius.home.kraxel.org>
 <19ae71a4-c988-3c9e-20d6-614098376524@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19ae71a4-c988-3c9e-20d6-614098376524@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
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

On Thu, Jun 09, 2022 at 08:45:41PM +0900, Akihiko Odaki wrote:
> On 2022/06/09 19:28, Gerd Hoffmann wrote:
> > > --- a/include/ui/console.h
> > > +++ b/include/ui/console.h
> > > @@ -139,6 +139,7 @@ typedef struct QemuUIInfo {
> > >       int       yoff;
> > >       uint32_t  width;
> > >       uint32_t  height;
> > > +    uint32_t  refresh_rate;
> > >   } QemuUIInfo;
> > >   /* cursor data format is 32bit RGBA */
> > > @@ -426,7 +427,6 @@ typedef struct GraphicHwOps {
> > >       void (*gfx_update)(void *opaque);
> > >       bool gfx_update_async; /* if true, calls graphic_hw_update_done() */
> > >       void (*text_update)(void *opaque, console_ch_t *text);
> > > -    void (*update_interval)(void *opaque, uint64_t interval);
> > >       void (*ui_info)(void *opaque, uint32_t head, QemuUIInfo *info);
> > >       void (*gl_block)(void *opaque, bool block);
> > >   } GraphicHwOps;
> > 
> > So you are dropping update_interval, which isn't mentioned in the commit
> > message at all.  Also this patch is rather big.  I'd suggest:
> > 
> > (1) add refresh_rate
> > (2) update users one by one
> > (3) finally drop update_interval when no user is left.
> > 
> > thanks,
> >    Gerd
> > 
> 
> I think 1 and 3 should have to be done once since refresh_rate and
> update_interval would interfere with each other otherwise.

Well, between 1 and 3 both old and new API are active.  Shouldn't be
much of a problem because the GraphicHwOps implementations are using
only the one or the other.

take care,
  Gerd


