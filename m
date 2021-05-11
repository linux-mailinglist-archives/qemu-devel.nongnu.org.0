Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBE137A41D
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 11:56:51 +0200 (CEST)
Received: from localhost ([::1]:50420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgP8E-0007hT-IZ
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 05:56:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lgP6Q-0006OM-O0
 for qemu-devel@nongnu.org; Tue, 11 May 2021 05:54:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lgP6P-0007xg-3C
 for qemu-devel@nongnu.org; Tue, 11 May 2021 05:54:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620726896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mpjo8ivPUL4cS967Cg9mccaTNLTUikVdVVLPRY+JUYs=;
 b=bgvPNH6Ih/dsX6ndDbF9kdDBRFhEQyzdFRkmjEDcsG9I5Ksd9XeQnipqMLbkb4Vhswn9Fz
 pAGeQB/sO4r4q4/cstu02RwxwfXFqMITDIB4Il3TQNvw6Q1SExIzW02Zez7FiEGRAt3GNC
 CPWZAbs9aDKjTMFue6H0csas74tWr0Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-Dex1nSaJMkKvEoBFl1nlZw-1; Tue, 11 May 2021 05:54:51 -0400
X-MC-Unique: Dex1nSaJMkKvEoBFl1nlZw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84F449126F;
 Tue, 11 May 2021 09:54:50 +0000 (UTC)
Received: from work-vm (ovpn-113-51.ams2.redhat.com [10.36.113.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 845C16267D;
 Tue, 11 May 2021 09:54:49 +0000 (UTC)
Date: Tue, 11 May 2021 10:54:47 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH v1] tests/migration: introduce multifd into guestperf
Message-ID: <YJpUZ7KYBzby2XUZ@work-vm>
References: <cover.1616171924.git.huangy81@chinatelecom.cn>
 <cfeeb04d17ad932c42a9871294058b77429ad1b7.1616171924.git.huangy81@chinatelecom.cn>
 <YIvA3bfScp8yQwjB@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YIvA3bfScp8yQwjB@redhat.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: huangy81@chinatelecom.cn, qemu-devel <qemu-devel@nongnu.org>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> On Sat, Mar 20, 2021 at 01:04:56AM +0800, huangy81@chinatelecom.cn wrote:
> > From: Hyman <huangy81@chinatelecom.cn>
> > 
> > Guestperf tool does not cover the multifd-enabled migration
> > currently, it is worth supporting so that developers can
> > analysis the migration performance with all kinds of
> > migration.
> > 
> > To request that multifd is enabled, with 4 channels:
> > $ ./tests/migration/guestperf.py \
> >     --multifd --multifd-channels 4 --output output.json
> > 
> > To run the entire standardized set of multifd-enabled
> > comparisons, with unix migration:
> > $ ./tests/migration/guestperf-batch.py \
> >     --dst-host localhost --transport unix \
> >     --filter compr-multifd* --output outputdir
> > 
> > Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> > ---
> >  tests/migration/guestperf/comparison.py | 14 ++++++++++++++
> >  tests/migration/guestperf/engine.py     | 16 ++++++++++++++++
> >  tests/migration/guestperf/scenario.py   | 12 ++++++++++--
> >  tests/migration/guestperf/shell.py      | 10 +++++++++-
> >  4 files changed, 49 insertions(+), 3 deletions(-)
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> 
> I'll queue it, sorry for the delay in responding to this.

I've just picked this up in my migration queue

> 
> 
> Regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


