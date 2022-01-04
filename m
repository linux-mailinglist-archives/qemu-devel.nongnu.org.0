Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83127484816
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 19:52:00 +0100 (CET)
Received: from localhost ([::1]:42884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4oud-0000ny-KV
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 13:51:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n4olP-0004Yx-Rx
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 13:42:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n4olN-0007lc-2m
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 13:42:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641321743;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Aoxo7+79BmOX+qWQv5rAMn3CsT1/42lt6CWxUWPedTs=;
 b=GRixTIxhVm3XEpLkuWkjs5JknzS3NqxrvX+cfIntqmddL9xt61fOwzqqr/hX8I1HuobJgs
 Wg8aLI2bhhujD6awksGzHx1nS8Ssl8MXy5+HX88PtxR/dt5ETfm1aHDQ6FkzY4PXBWPGZ9
 sUvt7cbUdNnyVUNWEbhoHB8JV/mGHpU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-531-ERRMN8SRN7maCe1FprVBAA-1; Tue, 04 Jan 2022 13:42:18 -0500
X-MC-Unique: ERRMN8SRN7maCe1FprVBAA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2CD17190A7A1;
 Tue,  4 Jan 2022 18:42:17 +0000 (UTC)
Received: from redhat.com (unknown [10.22.32.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B49310A4B23;
 Tue,  4 Jan 2022 18:42:16 +0000 (UTC)
Date: Tue, 4 Jan 2022 18:42:13 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Henry Kleynhans <hkleynhans@fb.com>
Subject: Re: [PATCH 2/2] [crypto] Only verify CA certs in chain of trust
Message-ID: <YdSVBbt0gqvoYvpj@redhat.com>
References: <20211222150600.37677-1-henry.kleynhans@gmail.com>
 <20211222150600.37677-2-henry.kleynhans@gmail.com>
 <BY5PR15MB3572B35B9EEFE823B9F1270FB87D9@BY5PR15MB3572.namprd15.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <BY5PR15MB3572B35B9EEFE823B9F1270FB87D9@BY5PR15MB3572.namprd15.prod.outlook.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.37, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Henry Kleynhans <henry.kleynhans@gmail.com>,
 "henry.kleynhans@fb.com" <henry.kleynhans@fb.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 22, 2021 at 03:54:08PM +0000, Henry Kleynhans wrote:
> Hi Daniel,
> 
> This patch tightens the CA verification code to only check the
> issuer chain of the client cert.  I think this will still not
> catch expired/invalid certs if the client and server certs have
> different issuer chains; so maybe this too is not quite the
> correct fix.  Let me know what you think.

Different issuer chains is not going to be very common/typical.
So what you've done in this patch is at least pretty decent for
the common case, so will catch most user's mistakes. Let me have
a think about whether we can do anything better without making
the code too painful


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


