Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A5C364A2D
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 20:57:06 +0200 (CEST)
Received: from localhost ([::1]:55634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYZ4y-0003KZ-Dz
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 14:57:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lYZ3H-0002oR-EV
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 14:55:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lYZ3B-0008Tm-1R
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 14:55:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618858511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oQ7d+J8O+n7pLae7yl3aIDKyOTFRgk34Imj35lCGNrs=;
 b=Q6AR0dr4vaf+ZJnCWyv4Zq8SbcqhEUi4kmlGjFoQtH2We+AU7XKVqYEZleaNpH0LBn23FZ
 LJ4L6rocRZG4Sh2xpl1+H04IAwnwohk/kKr0ENEXFeI8dtVH6p8b4PPFzMIq93CSwBd+DZ
 FbXmwqzNabOjCijyVcUGyQTqwdQB77k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-qba0Txb4NBylNnokjBpzyw-1; Mon, 19 Apr 2021 14:55:09 -0400
X-MC-Unique: qba0Txb4NBylNnokjBpzyw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC6FA107ACC7;
 Mon, 19 Apr 2021 18:55:08 +0000 (UTC)
Received: from horse.redhat.com (ovpn-116-35.rdu2.redhat.com [10.10.116.35])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4E9502B18E;
 Mon, 19 Apr 2021 18:55:03 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 9D0CD22054F; Mon, 19 Apr 2021 14:55:02 -0400 (EDT)
Date: Mon, 19 Apr 2021 14:55:02 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [Virtio-fs] [PATCH 1/2] virtiofsd: Allow use "-o xattrmap"
 without "-o xattr"
Message-ID: <20210419185502.GD1472665@redhat.com>
References: <20210414201207.3612432-1-jose.carlos.venegas.munoz@intel.com>
 <20210414201207.3612432-2-jose.carlos.venegas.munoz@intel.com>
 <20210416130537.2046bd26@bahia.lan>
MIME-Version: 1.0
In-Reply-To: <20210416130537.2046bd26@bahia.lan>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: virtio-fs@redhat.com, Carlos Venegas <jose.carlos.venegas.munoz@intel.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 16, 2021 at 01:05:37PM +0200, Greg Kurz wrote:
> On Wed, 14 Apr 2021 20:12:06 +0000
> Carlos Venegas <jose.carlos.venegas.munoz@intel.com> wrote:
> 
> > When -o xattrmap is used, it will not work unless xattr is enabled.
> > 
> > This patch enables xattr when -o xattrmap is used.
> > 
> > Signed-off-by: Carlos Venegas <jose.carlos.venegas.munoz@intel.com>
> > ---
> >  tools/virtiofsd/passthrough_ll.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> > index ddaf57305c..2337ea5a58 100644
> > --- a/tools/virtiofsd/passthrough_ll.c
> > +++ b/tools/virtiofsd/passthrough_ll.c
> > @@ -3939,6 +3939,7 @@ int main(int argc, char *argv[])
> >      }
> >  
> >      if (lo.xattrmap) {
> > +        lo.xattr = 1;
> >          parse_xattrmap(&lo);
> >      }
> >  
> 
> This seems reasonable. I'm just wondering if we should also
> add an explicit error if the user tries something silly
> like -o xattrmap=MAPPING,no_xattr instead of silently
> ignoring no_xattr...

That's a good point. Will be nice to error out if user provides
conflicting options.

Vivek


