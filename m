Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACCC1FC64C
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jun 2020 08:41:26 +0200 (CEST)
Received: from localhost ([::1]:34122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlRlE-0002p0-JW
	for lists+qemu-devel@lfdr.de; Wed, 17 Jun 2020 02:41:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jlRkG-000261-5r
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 02:40:24 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:35580
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jlRkD-0003df-SO
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 02:40:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592376020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IvjgZ7t/qkjC3H0vr3FIquJ81dcL0DX5c0NiB10HSY0=;
 b=a1TMjVocBYz+2dMBwWjyuNSX/RYBbIaFe9/232KCLzHeSetJ80J02XK8hf0K/NjrOe/ZYI
 72Sw/TSod2tMrCvRGZe6Gwdnnwqeub1/BxPOUnNDtZ9O4LWIRd4D4vjS+11sAGriS2GO6N
 TJiW8OV9EdaoE+S2VFFtqVWW8EvgKUE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-TF1hdSkIO4-eutXXmMdOpQ-1; Wed, 17 Jun 2020 02:40:18 -0400
X-MC-Unique: TF1hdSkIO4-eutXXmMdOpQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9AF8C10AB64D;
 Wed, 17 Jun 2020 06:40:16 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-67.ams2.redhat.com
 [10.36.112.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1DB6778F0F;
 Wed, 17 Jun 2020 06:40:16 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DD5A416E16; Wed, 17 Jun 2020 08:40:14 +0200 (CEST)
Date: Wed, 17 Jun 2020 08:40:14 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Guilherme Piccoli <gpiccoli@canonical.com>
Subject: Re: ovmf / PCI passthrough impaired due to very limiting PCI64
 aperture
Message-ID: <20200617064014.3j7no7d7trob2ioc@sirius.home.kraxel.org>
References: <99779e9c-f05f-501b-b4be-ff719f140a88@canonical.com>
 <20200616165043.24y2cp53axk7uggy@sirius.home.kraxel.org>
 <20200616165746.GH2788@work-vm>
 <CAHD1Q_zGu4Q63HjHx3aZKu3wh8NppuP6T4kgnUN3j=-ZDufVZA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHD1Q_zGu4Q63HjHx3aZKu3wh8NppuP6T4kgnUN3j=-ZDufVZA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/17 01:42:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Pedro Principeza <pedro.principeza@canonical.com>, ehabkost@redhat.com,
 Dann Frazier <dann.frazier@canonical.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Christian Ehrhardt <christian.ehrhardt@canonical.com>, qemu-devel@nongnu.org,
 lersek@redhat.com, fw@gpiccoli.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> What if then we have OVMF relying in the physbits *iff*
> "-host-phys-bits" is used

How can the guest know?

Adding "you can trust physbits" bits somewhere (as suggested by Eduardo)
would work for sure, but would depend on a qemu update.

Maybe a "don't trust physbits in case it is 40" heuristic works well
enough in practice.

> Now, regarding the problem "to trust or not" in the guests' physbits,
> I think it's an orthogonal discussion to some extent.

It isn't.  OVMF can't ignore the problem, you risk to break guests if
you do.

take care,
  Gerd


