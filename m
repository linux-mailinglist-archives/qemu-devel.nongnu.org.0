Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1687D32D3C3
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 14:01:31 +0100 (CET)
Received: from localhost ([::1]:40790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHnbe-0007uf-1O
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 08:01:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lHnSs-0007SH-Fy
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 07:52:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lHnSq-00055F-Nb
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 07:52:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614862343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7hsyPqUhzWa6X/qGV8xPYcj2jK9m/TcdRiOcwT80TnY=;
 b=bjrXQGEMXpelNy9KhlEwOE6d1XI0TI01zlZHKgNv+ryVOtRgng78Asrj6TLE5KBUGw8qgt
 63OZ9OFHv6pbKaF1LLXmhsa1gPFvXfp1VBAFVzC1PCpOcXIj5Hz/mcapQ5okk0C7NeTpsc
 ExvxFJfQf2ZPjfIRHqV4mH5NDQjQssQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-601-EIiODm87N02S51YRRRDU7w-1; Thu, 04 Mar 2021 07:52:21 -0500
X-MC-Unique: EIiODm87N02S51YRRRDU7w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9D336409C;
 Thu,  4 Mar 2021 12:52:20 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-115-129.ams2.redhat.com
 [10.36.115.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 72D3B5C8A8;
 Thu,  4 Mar 2021 12:52:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D39C81800863; Thu,  4 Mar 2021 11:07:46 +0100 (CET)
Date: Thu, 4 Mar 2021 11:07:46 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH 5/7] ui/vnc: clipboard support
Message-ID: <20210304100746.ppirbh5hhw7eqm5b@sirius.home.kraxel.org>
References: <20210219131349.3993192-1-kraxel@redhat.com>
 <20210219131349.3993192-6-kraxel@redhat.com>
 <CAJ+F1CLLgnKcr-jRG=2sVnNGjsGjovm+e0bbeTTwHU=CRg1w+Q@mail.gmail.com>
 <20210303121314.2ql3yj6ju4i3wvmx@sirius.home.kraxel.org>
 <CAJ+F1CJxSfEa2Y2WDdOS-x3RmiM490GotgpwETweaH1h+MPt+A@mail.gmail.com>
 <20210304085811.q2mdy5ok6tlqhdky@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20210304085811.q2mdy5ok6tlqhdky@sirius.home.kraxel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > I don't see the
> > agent doing the same (I might be missing something).
> 
> Hmm, ok.  Guess I should better be prepared to receive messages larger
> than VD_AGENT_MAX_DATA_SIZE ...

Confirmed.  Cut+paste large text blocks in the guest -> hangs qemu
vdagent implementation, because the message doesn't fit into the
fixed-site (VD_AGENT_MAX_DATA_SIZE) message buffer.

So I need so switch to dynamic allocation when reworking the code for
proper size checks.

The other way around hangs too, seems the guest agent is not prepared
to receive large messages and expects them in chunks ...

take care,
  Gerd


