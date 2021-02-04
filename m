Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 915D230F515
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 15:37:00 +0100 (CET)
Received: from localhost ([::1]:40506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7fkh-0001Ij-Lp
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 09:36:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7fhb-00072p-CW
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 09:33:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7fhY-0006Gw-6K
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 09:33:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612449223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5ndk5Yf4S/GC/8aplpnnUzSx26fb13E20aF4VIcl2wE=;
 b=KpjPhpYj0DyPfbQJL+JxNYon9fw7FeF0gy0Kr3/00Q4OS9D3VsrXhCOcD2dtHNpfij/GAo
 ut732ePZj2n8mp8MF2B5/FD1KJPKd1oGuLFgcpHAelvANvPJo8ktl2dUMDNKgGRfqZhJ4k
 jW2FpE4rVt2untyyytSBmRkLAWP7izI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-hRL65DR6OB6fZ-OZpnFXvA-1; Thu, 04 Feb 2021 09:33:36 -0500
X-MC-Unique: hRL65DR6OB6fZ-OZpnFXvA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 012388030B7
 for <qemu-devel@nongnu.org>; Thu,  4 Feb 2021 14:33:36 +0000 (UTC)
Received: from work-vm (ovpn-114-21.ams2.redhat.com [10.36.114.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C0A05C541;
 Thu,  4 Feb 2021 14:33:30 +0000 (UTC)
Date: Thu, 4 Feb 2021 14:33:26 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH] migration/qemu-file: Fix maybe uninitialized on
 qemu_get_buffer_in_place()
Message-ID: <20210204143326.GB24147@work-vm>
References: <20210128130625.569900-1-wainersm@redhat.com>
 <20210128171619.GF2951@work-vm>
MIME-Version: 1.0
In-Reply-To: <20210128171619.GF2951@work-vm>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Dr. David Alan Gilbert (dgilbert@redhat.com) wrote:
> * Wainer dos Santos Moschetta (wainersm@redhat.com) wrote:
> > Fixed error when compiling migration/qemu-file.c with -Werror=maybe-uninitialized
> > as shown here:
> > 
> > ../migration/qemu-file.c: In function 'qemu_get_buffer_in_place':
> > ../migration/qemu-file.c:604:18: error: 'src' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> >   604 |             *buf = src;
> >       |             ~~~~~^~~~~
> > cc1: all warnings being treated as errors
> > 
> > Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> 
> Yes, I think I had a discussion with someone about this recently but
> can't find it; the compiler is technically correct, but the only time
> it's unitialised is the case where it's result doesn't matter.
> 
> Still, to shut the compiler up:
> 
> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Queued

> 
> > ---
> > Passed on CI: https://gitlab.com/wainersm/qemu/-/pipelines/247801576
> > 
> >  migration/qemu-file.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/migration/qemu-file.c b/migration/qemu-file.c
> > index be21518c57..d6e03dbc0e 100644
> > --- a/migration/qemu-file.c
> > +++ b/migration/qemu-file.c
> > @@ -595,7 +595,7 @@ size_t qemu_get_buffer_in_place(QEMUFile *f, uint8_t **buf, size_t size)
> >  {
> >      if (size < IO_BUF_SIZE) {
> >          size_t res;
> > -        uint8_t *src;
> > +        uint8_t *src = NULL;
> >  
> >          res = qemu_peek_buffer(f, &src, size, 0);
> >  
> > -- 
> > 2.28.0
> > 
> -- 
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


