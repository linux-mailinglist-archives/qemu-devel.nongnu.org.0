Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DAD4BA45B
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 16:28:46 +0100 (CET)
Received: from localhost ([::1]:59940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKii5-0007lv-6d
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 10:28:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nKi3G-0006hu-Je
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 09:46:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nKi3D-0003OG-K8
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 09:46:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645109188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jumN3q4ZWPNYNdBpgoxJQ+LPKlLRFZTiOhpMdeIKoxg=;
 b=OvE1OCpJaJg+3IoNOhhPEe5hlO+Q+PyZB3eCt5nnG8jDm+DN7E7FPppWvtlwqoe+u02w+I
 bdI3ksGiqafn8NrCEggMvoyJjZ3w2aukj6xMm8+0Hqq50LtoO3hmnJQs6fakM49kAxF8Xl
 ckqE9aTh5YhJbWPBtKupgzTCjj1X2Ms=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-xi4I1YPdNNOThPNj6cWT5w-1; Thu, 17 Feb 2022 09:46:25 -0500
X-MC-Unique: xi4I1YPdNNOThPNj6cWT5w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 608B9814249;
 Thu, 17 Feb 2022 14:46:24 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.229])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A20B7B9DE;
 Thu, 17 Feb 2022 14:46:23 +0000 (UTC)
Date: Thu, 17 Feb 2022 08:46:21 -0600
From: Eric Blake <eblake@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2] nbd/server: Allow MULTI_CONN for shared writable
 exports
Message-ID: <20220217144621.tbfn7paab3x3dvov@redhat.com>
References: <20220215171838.2651387-1-eblake@redhat.com>
 <87bkz77wob.fsf@pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87bkz77wob.fsf@pond.sub.org>
User-Agent: NeoMutt/20211029-322-5436a9
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, rjones@redhat.com, Hanna Reitz <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 16, 2022 at 02:44:52PM +0100, Markus Armbruster wrote:
> >
> > +##
> > +# @NbdExportMultiConn:
> > +#
> > +# Possible settings for advertising NBD multiple client support.
> > +#
> > +# @off: Do not advertise multiple clients.
> > +#
> > +# @on: Allow multiple clients (for writable clients, this is only safe
> > +#      if the underlying BDS is cache-consistent, such as when backed
> > +#      by the raw file driver); ignored if the NBD server was set up
> > +#      with max-connections of 1.
> > +#
> > +# @auto: Behaves like @off if the export is writable, and @on if the
> > +#        export is read-only.
> > +#
> > +# Since: 7.0
> > +##
> > +{ 'enum': 'NbdExportMultiConn',
> > +  'data': ['off', 'on', 'auto'] }
> 
> Have you considered using OnOffAuto from common.json?

Sounds good to me.

> 
> Duplicating it as NbdExportMultiConn lets you document the values right
> in the enum.  If you reuse it, you have to document them where the enum
> is used, i.e. ...
> 
> > +
> >  ##
> >  # @BlockExportOptionsNbd:
> >  #
> > @@ -95,11 +119,15 @@
> >  #                    the metadata context name "qemu:allocation-depth" to
> >  #                    inspect allocation details. (since 5.2)
> >  #
> > +# @multi-conn: Controls whether multiple client support is advertised, if the
> > +#              server's max-connections is not 1. (default auto, since 7.0)
> > +#
> 
> ... here.

Yep, that's a good change to make for v3.  I'll do it.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


