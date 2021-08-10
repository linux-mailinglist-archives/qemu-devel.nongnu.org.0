Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 345AB3E566A
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 11:10:36 +0200 (CEST)
Received: from localhost ([::1]:52022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDNmM-0002qd-L6
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 05:10:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mDNk0-0000jg-5Q
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 05:08:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mDNjx-0007Xa-LW
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 05:08:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628586483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ux2WsEKqflFeBAt33bVQxfml6AqlOlEgolA8hx8mgl4=;
 b=FamRRPtSx4hC8JDwkAjD8MyzhheNpjJ2q0VOmB4v5WBbG5ZfrX+ttF5PExmmvBmHLX9chC
 4Q/FotQFfh5PzMTXbR8r6rA9AfNDuxmKrG2diLE1cFQTO9kYMKWRy303XpPcL4Bvy67gFb
 2IqJkJQeKo/fUg8KM2tbxZvEGBxPuA0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-aFrzSB1bN8ujRWSV1ymx9g-1; Tue, 10 Aug 2021 05:08:02 -0400
X-MC-Unique: aFrzSB1bN8ujRWSV1ymx9g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8C3787D542;
 Tue, 10 Aug 2021 09:08:01 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 59D805D6A8;
 Tue, 10 Aug 2021 09:08:01 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CFD9618003AA; Tue, 10 Aug 2021 11:07:59 +0200 (CEST)
Date: Tue, 10 Aug 2021 11:07:59 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-6.1? 0/3] ps2: Fix issue #501 and #502
Message-ID: <20210810090759.f2f7jmwimvokxwct@sirius.home.kraxel.org>
References: <4d1c8467-d976-2c0f-ba54-c767df7b8fe7@t-online.de>
 <df850743-8e86-dc7b-1006-d63b86b7ee36@redhat.com>
MIME-Version: 1.0
In-Reply-To: <df850743-8e86-dc7b-1006-d63b86b7ee36@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Volker =?utf-8?Q?R=C3=BCmelin?= <vr_qemu@t-online.de>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > This patch series improves the PS/2 keyboard emulation.
> > 
> > There's a workaround for issue #501 and #502 so I don't think
> > this is rc3 material. But that decision is up to the maintainers.

Phew.  I'm a little nervous on adding it that late, so yes, I'd tend to
consider it 6.2 material too.

> Meanwhile, what about reverting ff6e1624b3 for 6.1?

Not going to fly due to patch dependencies, we would have to revert all
the ps2 fixes, which IMHO is likewise a bad idea for -rc3 ...

take care,
  Gerd


