Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAE5333C90
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 13:23:34 +0100 (CET)
Received: from localhost ([::1]:34918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJxsD-0002fg-8G
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 07:23:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lJxrG-0002Ck-Cq
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 07:22:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lJxrC-0001rh-NZ
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 07:22:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615378949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W24bHHjW9uSJqkqBjvATrs03Pr+4tB8ik9fB0uAwqNg=;
 b=FLmKTQrJcXVlsYBj8COqYugKjv5ifuo9mGZvvSWcVW9Wr/bPcA50hFZpIYJf5Nh0nj54JP
 BbxWjKMCj4NPSYND7ls/x3RZjSj677lZu/k2KQZg6UUp3y+uiXcFtgbljswkQXJ29LIICT
 fgrjNYdCur7ngeJCIV5OT6tSQxaylIs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-rXnf9IrCO9yoOOdzBcy9VQ-1; Wed, 10 Mar 2021 07:22:27 -0500
X-MC-Unique: rXnf9IrCO9yoOOdzBcy9VQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3FB1CA40C0;
 Wed, 10 Mar 2021 12:22:26 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E6C4D5D9DE;
 Wed, 10 Mar 2021 12:22:25 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B16C518000AC; Wed, 10 Mar 2021 13:22:23 +0100 (CET)
Date: Wed, 10 Mar 2021 13:22:23 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH 2/2] ui/cocoa: Do not rely on the first argument
Message-ID: <20210310122223.fq3zae5y42kmpl66@sirius.home.kraxel.org>
References: <20210309122226.23117-1-akihiko.odaki@gmail.com>
 <20210309122226.23117-2-akihiko.odaki@gmail.com>
 <30b88283-8d6b-502b-9032-33c81e26d97@eik.bme.hu>
 <CAMVc7JWO0o9NUwPaE6wBMG+u7zHocWDPxr-6o3OcS5Zm0oT+HA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMVc7JWO0o9NUwPaE6wBMG+u7zHocWDPxr-6o3OcS5Zm0oT+HA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > > +    if (bundle) {
> >
> > Does this break about window if the executable is not in a bundle (like
> > when run from the command line after compiling)? Shouldn't you only put
> > the qemu_name in this if and have some default name if bundle is not
> > available (or fall back to argv[0] in that case?
> >
> > Regards,
> > BALATON Zoltan
> >
> 
> No, it just doesn't show the application name. Everything else is fine.

Having a fallback would still be nice, even if it is just the fixed
string "qemu".  Starting a fresh build without installing it first is
common while developing.

take care,
  Gerd


