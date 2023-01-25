Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 639A667B677
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 16:59:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKiAc-0003P9-AQ; Wed, 25 Jan 2023 10:58:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pKiAW-0003Ot-AU
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 10:58:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pKiAU-0007I3-0w
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 10:58:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674662312;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5aKHz2vd/OVjgEIISCkHcDLZyMV4zX8GXufgYEZIz6g=;
 b=jR0HPb60Gc4ALt47nB1JvoXiFRJ8+bfXDqxyZ02Gtv97D/aio29/F5TXLiaqFp70BJuv2P
 MbrmcEyfFbazjmwGmU5mYznjnFIFYApUcaJoiOItLGG1DOWubKAmQx/kX0QTdnf974Hr+1
 0GrucbTWSBp2jZHsmJ99iBFcU2xch6k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-490-yzFz8mUcOMGis3WDqyo4vg-1; Wed, 25 Jan 2023 10:58:29 -0500
X-MC-Unique: yzFz8mUcOMGis3WDqyo4vg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 13BC6101A52E;
 Wed, 25 Jan 2023 15:58:29 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 156D0C15BA0;
 Wed, 25 Jan 2023 15:58:27 +0000 (UTC)
Date: Wed, 25 Jan 2023 15:58:25 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Emilio Cota <cota@braap.org>, qemu-devel@nongnu.org,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH 2/2] tcg: use QTree instead of GTree
Message-ID: <Y9FRoUI3I5LfQsjW@redhat.com>
References: <20230111035536.309885-1-cota@braap.org>
 <20230111035536.309885-3-cota@braap.org>
 <Y76s1VNBUYwlpIGo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y76s1VNBUYwlpIGo@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Jan 11, 2023 at 12:34:29PM +0000, Daniel P. Berrangé wrote:
> On Tue, Jan 10, 2023 at 10:55:36PM -0500, Emilio Cota wrote:
> > qemu-user can hang in a multi-threaded fork. One common
> > reason is that when creating a TB, between fork and exec
> > we manipulate a GTree whose memory allocator (GSlice) is
> > not fork-safe.
> 
> BTW, I just checked latest glib status
> 
>   https://gitlab.gnome.org/GNOME/glib/-/issues/1079
> 
> it appears they're pretty close to deciding to delete the
> GSlice impl and always use system malloc.

They have now merged the code to delete the GSlice custom allocator.

So glib >= 2.76.0 should not exhibit a hang

> So if we do take this patch series it'll hopefully be a time
> limited thing to carry. 

So the question is whether the issue is critical enough that we want
to carry a workaround for a while, vs telling users to upgrade to
newer glib  (once 2.76 actually gets released)


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


