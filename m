Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1219D472F7D
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 15:38:42 +0100 (CET)
Received: from localhost ([::1]:46096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwmTQ-0003r9-KF
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 09:38:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mwmRG-00034u-B6
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 09:36:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mwmRC-0006se-Ma
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 09:36:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639406171;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=nmZGq1bdl7rNZaOEEPZwFvIJp9DA8Qjcg5toX5N8wDM=;
 b=KB9Tb55pfyCAokJCBS7BH0rBgUPok69h2BL4V2jpNRaSM5BTQlW4rKfZNZrV8XYl2bdBfc
 s0aNpNLo4Y+EOP17hMbs2sXRZ2YAjpEqCjFBM79JoUyCcUa9Wg5LH3plXiehSazFMFnPnA
 CK+QMyvQ/7wFK9hNHIYDk727QxkCIQ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-312-NNHZj-nyPXypqoBz3i0_jA-1; Mon, 13 Dec 2021 09:36:07 -0500
X-MC-Unique: NNHZj-nyPXypqoBz3i0_jA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20F86345C2;
 Mon, 13 Dec 2021 14:36:06 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F06DB4D73A;
 Mon, 13 Dec 2021 14:36:04 +0000 (UTC)
Date: Mon, 13 Dec 2021 14:36:01 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Simon Burge <simonb@netbsd.org>
Subject: Re: [PATCH] MIPS - fix cycle counter timing calculations
Message-ID: <YbdaUepfXrWbyHHe@redhat.com>
References: <81f4fd87-a177-420b-d69d-45faa0eddb48@amsat.org>
 <20211213135405.B6EC11FA5@thoreau.thistledown.com.au>
MIME-Version: 1.0
In-Reply-To: <20211213135405.B6EC11FA5@thoreau.thistledown.com.au>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.713,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 14, 2021 at 12:54:05AM +1100, Simon Burge wrote:
> Hi Phil,
> 
> =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= wrote:
> 
> > Oops, missing your Signed-off-by tag, see:
> > https://www.qemu.org/docs/master/devel/submitting-a-patch.html#patch-emails-must-includ
> e-a-signed-off-by-line
> >
> > Do you mind re-sending with your S-o-b? Meanwhile, patch dropped.
> 
> Hopefully I've configured "git format-patch" and "git send-email"
> correctly and sent a better patch to the mailing list.  I'll make
> sure to include the maintainers in future patches.

Your v2 looks ok to me.

FWIW, if you'll be sending more patches in future, it is worth giving
'git-publish' a try. It is a higher level tool around send-email and
format-patch, that makes it much harder to make mistakes. It pretty
much just 'does the right thing' without you needing to worry, including
CC'ing the people listed in MAINTAINERS for the patch diff you have.

Regards,
Daniel

[1] https://github.com/stefanha/git-publish
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


