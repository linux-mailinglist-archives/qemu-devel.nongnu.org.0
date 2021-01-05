Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CF12EAA19
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 12:41:39 +0100 (CET)
Received: from localhost ([::1]:48812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwkiY-0000m1-4D
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 06:41:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kwkh0-0000F2-IP
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 06:40:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kwkgx-0006D9-5M
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 06:40:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609846797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cb4j/9e3f7JdaDCBVjPDA+n05RXSnferayaJmfWz6Jc=;
 b=PxzjQFy38boqsGP8pggl6RTyVP/YLRnk++3iV/0qHYV0/RzhuNeTWqYlWMgA8F+5DDzKUM
 wIgbcpkoDpmZEdLou/an6yf9LcP14nYRvGsRczy6awwtXtnCIqDx7SJpw3oK5guAnen/8B
 nOV0FkyxCiZ9rRulR054jevvIIigACM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-pfOqxaOCPty9bwqFCKe6jQ-1; Tue, 05 Jan 2021 06:39:55 -0500
X-MC-Unique: pfOqxaOCPty9bwqFCKe6jQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 71381107ACE4;
 Tue,  5 Jan 2021 11:39:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-209.ams2.redhat.com
 [10.36.114.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2504560BE5;
 Tue,  5 Jan 2021 11:39:53 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 730CC1800099; Tue,  5 Jan 2021 12:39:52 +0100 (CET)
Date: Tue, 5 Jan 2021 12:39:52 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Qemu-devel] [PULL 1/1] ui/vnc: fix vmware VGA incompatiblities
Message-ID: <20210105113952.cjnz2n7z27uihfzy@sirius.home.kraxel.org>
References: <1395127548-32670-1-git-send-email-kraxel@redhat.com>
 <1395127548-32670-2-git-send-email-kraxel@redhat.com>
 <CAFEAcA--LaTy3P+o8DJXzaLj72RGdZQ1rVr1nzw+WpBObEU3gg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA--LaTy3P+o8DJXzaLj72RGdZQ1rVr1nzw+WpBObEU3gg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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
Cc: Peter Lieven <pl@kamp.de>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > -#define SVGA_MAX_WIDTH                  2360
> > +#define SVGA_MAX_WIDTH                  ROUND_UP(2360, VNC_DIRTY_PIXELS_PER_BIT)

> Here we pull in the VNC header in order to get the definition
> of the VNC_DIRTY_PIXELS_PER_BIT constant, but I don't understand
> why. The hw/display code should be agnostic of whatever the
> UI display front-end is. Why does vmware_vga.c need to care
> but not any other device?

Yep, doesn't make sense.

> I can't find anything in the vmware VGA device docs (though they
> are pretty meagre) suggesting that there's a requirement for
> the surface to be a multiple of 16, so I think that the VNC code
> needs to be able to cope. (This should be no different from any other
> display device model setting a non-multiple-of-16 width.)

We had problems with that in the past but it should be fixed now.  vnc
wants a multiple of 16 still.  IIRC you'll get a small black bar filling
the room to the next multiple of 16 in case the display surface doesn't
match.

> So my feeling is that this vmware_vga.c portion of this commit
> should be reverted,

Agree.

Maybe even deprecate the whole device?  Not sure how useful it is these
days as it has seen pretty much no development in the last decade.  The
linux kernel modesetting driver complains about missing device features
and refuses to touch the device ...

take care,
  Gerd


