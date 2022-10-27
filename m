Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7D160F6A9
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 14:01:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo1Xq-0005rr-Mv; Thu, 27 Oct 2022 07:59:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oo1XR-0005kk-K0
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 07:59:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oo1XP-0008Hg-Kg
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 07:59:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666871946;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MhSH0voz7iGgCKPzIIFNMR0lSvRFny6RBvpA512b9Pw=;
 b=em+MqLpjQ6QhW9nBwnFRl/V7SdvOmjVJr0bmP9DeuxjkmSowcTFB1QYHDacFu6tRhqAQIE
 0C/j/EqYfnECUpTBggbJukm71qhdi3l8rkBcjtllc6UOlSunnfNKkATa+fmnhO5u+Ai8WZ
 7gVBRn/D0/IryLxCr9ByoKS5t7jdBP8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-84-9dFDbAzQOOKXONCjBH6xxg-1; Thu, 27 Oct 2022 07:59:04 -0400
X-MC-Unique: 9dFDbAzQOOKXONCjBH6xxg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 389D23826A4F
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 11:59:04 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8AD402024CB7;
 Thu, 27 Oct 2022 11:59:03 +0000 (UTC)
Date: Thu, 27 Oct 2022 12:59:00 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH 06/11] crypto: check that LUKS PBKDF2 iterations count is
 non-zero
Message-ID: <Y1pyhJ5CoqDdJPxx@redhat.com>
References: <20220906084147.1423045-1-berrange@redhat.com>
 <20220906084147.1423045-7-berrange@redhat.com>
 <20220906092635.GM7484@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220906092635.GM7484@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Sep 06, 2022 at 10:26:35AM +0100, Richard W.M. Jones wrote:
> On Tue, Sep 06, 2022 at 09:41:42AM +0100, Daniel P. Berrangé wrote:
> > Both the master key and key slot passphrases are run through the PBKDF2
> > algorithm. The iterations count is expected to be generally very large
> > (many 10's or 100's of 1000s). It is hard to define a low level cutoff,
> > but we can certainly say that iterations count should be non-zero. A
> > zero count likely indicates an initialization mistake so reject it.
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  crypto/block-luks.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> > 
> > diff --git a/crypto/block-luks.c b/crypto/block-luks.c
> > index e6ee8506b2..254490c256 100644
> > --- a/crypto/block-luks.c
> > +++ b/crypto/block-luks.c
> > @@ -579,6 +579,11 @@ qcrypto_block_luks_check_header(const QCryptoBlockLUKS *luks, Error **errp)
> >          return -1;
> >      }
> >  
> > +    if (luks->header.master_key_iterations == 0) {
> > +        error_setg(errp, "LUKS key iteration count is zero");
> > +        return -1;
> > +    }
> > +
> >      /* Check all keyslots for corruption  */
> >      for (i = 0 ; i < QCRYPTO_BLOCK_LUKS_NUM_KEY_SLOTS ; i++) {
> >  
> > @@ -602,6 +607,12 @@ qcrypto_block_luks_check_header(const QCryptoBlockLUKS *luks, Error **errp)
> >              return -1;
> >          }
> >  
> > +        if (slot1->active == QCRYPTO_BLOCK_LUKS_KEY_SLOT_ENABLED &&
> > +            slot1->iterations == 0) {
> > +            error_setg(errp, "Keyslot %zu iteration count is zero", i);
> > +            return -1;
> > +        }
> > +
> >          if (start1 < DIV_ROUND_UP(QCRYPTO_BLOCK_LUKS_KEY_SLOT_OFFSET,
> >                                    QCRYPTO_BLOCK_LUKS_SECTOR_SIZE)) {
> >              error_setg(errp,
> 
> Equivalent checks were missing in nbdkit - I've added them.
> 
> I wonder if there's a problem that a very large number here would
> cause long delays opening the device.  In general it's not very clear
> to me if the aim is to prevent malicious LUKS input, or if we're just
> trying to sanity check the device hasn't been corrupted or improperly
> prepared.  The test above is the latter, I think.

Yes, we're checking for corruption.

A large value of iterations will indeed make it slow to open
the device, but that is entirely the point of the iterations
parameter. It must be picked to be large enough to intentionally
make opening slow, in order to prevent brute force checking
many passwords. It is hard to claim that any specific value
is "too large", because the volume might have been created on
a machine whose CPU is way faster than the current machine,
and thus chose big iterations.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


