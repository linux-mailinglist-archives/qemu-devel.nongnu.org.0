Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B44E34A3F16
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 10:14:17 +0100 (CET)
Received: from localhost ([::1]:52362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nESlM-0004J9-RA
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 04:14:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nESgn-00023P-U2
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 04:09:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nESgl-0004V1-OI
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 04:09:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643620171;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MFVFWvvWwUrECWYv2ucYsc2yWyPL1+yqQ87JTmVKQQk=;
 b=BiFmsfj9McbWZIXweEnlX2Qv67Din79/hlisHem3SOBMXonZ4vXU/tLHDMwlYDiScut1bP
 xw5O3dpdBzCJM364IJhk46nCq+XnpGIh5YzDeNYiQkloXjogYh1kt0rkYTZ18110rkkeQF
 FmL+t7DkRAMIcCZn3mnekXhaUdgfgxs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-dzK6r9sdMv-xZhprRxNjCA-1; Mon, 31 Jan 2022 04:09:29 -0500
X-MC-Unique: dzK6r9sdMv-xZhprRxNjCA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1762C83DD2F
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 09:09:29 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4EF9010840C7;
 Mon, 31 Jan 2022 09:09:26 +0000 (UTC)
Date: Mon, 31 Jan 2022 09:09:24 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: otubo@redhat.com
Subject: Re: [PATCH 0/5] seccomp: fix hole in blocking forks
Message-ID: <YfenRCFq//iHpLKI@redhat.com>
References: <20210802130303.3300108-1-berrange@redhat.com>
 <008bee58061405c8f9fe36d8c40a62d360bd4547.camel@redhat.com>
 <YfQO7w9QL+LrE11D@redhat.com>
 <CAGMDDkfCM5bvyTDm02tNnu3Z6cS_0OZWST-FA5qGGJPDBgeprQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGMDDkfCM5bvyTDm02tNnu3Z6cS_0OZWST-FA5qGGJPDBgeprQ@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 31, 2022 at 10:07:43AM +0100, Eduardo Otubo wrote:
> On Fri, Jan 28, 2022 at 4:42 PM Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > Hi Eduardo,
> >
> > You acked this series, but going through my old git branches I
> > just discovered that this never got merged. I guess I was assuming
> > you had queued it for a future PULL when you acked it.
> >
> > I don't mind sending a pull request myself if you've no objections.
> 
> I don't mind at all. Thanks for letting me know! I might have missed it somehow.

Ok, I'll send it, since I have some other unrelated stuff needing sending
too.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


