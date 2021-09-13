Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 458F840970C
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 17:18:59 +0200 (CEST)
Received: from localhost ([::1]:39284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPnjW-0007rh-Bu
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 11:18:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mPnhY-0005zO-EO
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 11:16:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mPnhW-0002pJ-RU
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 11:16:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631546214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tbeeR2MY40jijzV2qou2AFoXQwggBWhYBtbbXM0WAi0=;
 b=F25PGJGa8+dKhv2mGIRSaFrPpBiP+HjxE1/Oh+R2kcC12gwYaeppY/CNKXG34gqxSIAKHw
 XXy/49L6Oz+DqHgaVw8Pa1pWe8GkTjsl12oFAhjOkv/x89zzM0eQxYy1mOe9ZpjRQs68Jx
 drFazE6tdr4AOXW40FNaTXIMPDr5BJg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-IVRnM6QEMbG9ER3k9G7Cyg-1; Mon, 13 Sep 2021 11:16:49 -0400
X-MC-Unique: IVRnM6QEMbG9ER3k9G7Cyg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 696D2102CC3D;
 Mon, 13 Sep 2021 15:16:32 +0000 (UTC)
Received: from localhost (unknown [10.39.192.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1664A369A;
 Mon, 13 Sep 2021 15:16:31 +0000 (UTC)
Date: Mon, 13 Sep 2021 16:16:31 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH] nbd/server: Suppress Broken pipe errors on abrupt
 disconnection
Message-ID: <20210913151631.GG26415@redhat.com>
References: <20210722104552.2351167-1-rjones@redhat.com>
 <20210722104552.2351167-2-rjones@redhat.com>
 <20210723154930.efupqunf3r3ce37e@redhat.com>
 <YT9pILPJc5azU9nH@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YT9pILPJc5azU9nH@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: vsementsov@virtuozzo.com, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 13, 2021 at 05:07:12PM +0200, Kevin Wolf wrote:
> > >      if (ret < 0) {
> > > -        error_prepend(&local_err, "Failed to send reply: ");
> > > +        if (errno != EPIPE) {
> > > +            error_prepend(&local_err, "Failed to send reply: ");
> > > +        } else {
> > > +            local_err = NULL;
> > 
> > This line should be error_free(local_err) to avoid a memleak.
> 
> Actually, you want both error_free(local_err) and local_err = NULL.

Give me a few mins to test an post a new version that at least
fixes this bug ...

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-df lists disk usage of guests without needing to install any
software inside the virtual machine.  Supports Linux and Windows.
http://people.redhat.com/~rjones/virt-df/


