Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9F53AB119
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 12:14:22 +0200 (CEST)
Received: from localhost ([::1]:49520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltp2T-0005CG-CP
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 06:14:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ltok7-0004ae-8Y
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:55:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ltok4-0006Sq-Mt
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:55:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623923720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pZY//DqunqRiolzaf1QiDJPQU1lwdCAWuyxoTMnwN/I=;
 b=g4tde1NdQtw6w0Cqwo3MwPp0WCF3GjvDBiaEyrfh1x9oX958REwzXGBVC+FcH2+EYsLxxp
 ajDMvPLGwCkQjGJh/j/RJzch9YvBm263JFHU/rbLkTOJ130BlpFCrOk7gS3EzcJ7VCTGQ7
 mUWDVOEgAC+4M26xgQ/GHoszS9OrLX0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-RPgspt9DO1uxXEm9DaULYA-1; Thu, 17 Jun 2021 05:55:17 -0400
X-MC-Unique: RPgspt9DO1uxXEm9DaULYA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DAEE391274;
 Thu, 17 Jun 2021 09:55:16 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A506661094;
 Thu, 17 Jun 2021 09:55:04 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2F5B018000B2; Thu, 17 Jun 2021 11:55:03 +0200 (CEST)
Date: Thu, 17 Jun 2021 11:55:03 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2] hw/audio/sb16: Avoid assertion by restricting I/O
 sampling rate range
Message-ID: <20210617095503.nnsom4yxv7d6rl2g@sirius.home.kraxel.org>
References: <20210616104349.2398060-1-f4bug@amsat.org>
 <CAAKa2j=au0tnqPg8iPB7e3SHNZVL+RO9xb7=u6aszUWRiSC0Ew@mail.gmail.com>
 <a7b8eb63-dae8-1086-49db-efae43660dd2@amsat.org>
MIME-Version: 1.0
In-Reply-To: <a7b8eb63-dae8-1086-49db-efae43660dd2@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Qiang Liu <cyruscyliu@gmail.com>, qemu-devel@nongnu.org,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 16, 2021 at 02:47:35PM +0200, Philippe Mathieu-Daudé wrote:
> On 6/16/21 1:58 PM, Qiang Liu wrote:
> > Thx. I learned a lot about contributing to QEMU from this discussion!
> 
> I think this was a misunderstanding with Gerd, the maintainer.

Indeed.

> Maintainers use some tools to ease their patch-by-email workflow.
> As a tester/reviewer you simply reply to a patch with a "Reviewed-by"
> or "Tested-by" tag (with your name and email) and the tools will
> collect your tags. Then the maintainer take the patches with the
> tags amended. So a v2 shouldn't be necessary normally.

Correct (I'm using https://pypi.org/project/b4/ btw).

I didn't follow the mail thread that closely and had the false
impression this discussion was about other tags (b4 wouldn't
create Fixes: tags for you ...).

Sorry for the confusion.

take care,
  Gerd


