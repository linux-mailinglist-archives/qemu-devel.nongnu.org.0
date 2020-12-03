Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD7E2CD15F
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 09:39:08 +0100 (CET)
Received: from localhost ([::1]:52706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkk8p-0003lx-Ig
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 03:39:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kkk7h-00034o-QT
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 03:37:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kkk7f-0003dN-3p
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 03:37:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606984673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tizUNd6Z+kwPdn2DxeDbydgfrMiP39uIXSCckZBTKcY=;
 b=CeRWJppjIYmKKLRUrtlKPgzuWuPwTN/Yp5oKeMwYUOeVYsuCr46oY/JJyWzNq51PCHv3BK
 z54YYwdVqL8zbbOrljmmNyohSJxS1fjxudli7fF8zQDKFXvlTDkL86YgeJ+edVdU9IWJ87
 bOsKVWTERJnBJZtQm/Fa4Ein6JuC7tc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-bd92QlbnOB-BPytuBrFXYQ-1; Thu, 03 Dec 2020 03:37:51 -0500
X-MC-Unique: bd92QlbnOB-BPytuBrFXYQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D61BA8049C3;
 Thu,  3 Dec 2020 08:37:50 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A0E115D6AC;
 Thu,  3 Dec 2020 08:37:50 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B43B211AB8; Thu,  3 Dec 2020 09:37:49 +0100 (CET)
Date: Thu, 3 Dec 2020 09:37:49 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Doug Evans <dje@google.com>
Subject: Re: [DISCUSSION] How to set properties of non-pluggable devices?
Message-ID: <20201203083749.nuwa44uctjjnkfjg@sirius.home.kraxel.org>
References: <CADPb22T6ML4hzOaa7Y1K8X-2vB6j-7=JJpYdtuDMwv+889fLpg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADPb22T6ML4hzOaa7Y1K8X-2vB6j-7=JJpYdtuDMwv+889fLpg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> Being non-pluggable means I can't use "-device foo,bar=baz" on the command
> line.
> [But I can use "-device foo,help" to list its properties :-)  (if I also
> specify -M bar) ]
> 
> How do people do this?

There is -global.  This sets properties for all instances of a given
device.  If there is only one instance of your built-in device you can
use that to set the properties.  A bit hackish, but works and has been
the only way to do it for a long time.

These days we typically add an alias to the machine type, examples are
pflash{0,1} and pcspk-audiodev for the pc machine type which configure
the builtin flash and pc speaker devices.

take care,
  Gerd


