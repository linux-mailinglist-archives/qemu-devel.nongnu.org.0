Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3400332B7C2
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 13:16:11 +0100 (CET)
Received: from localhost ([::1]:36870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHQQE-0006TJ-8t
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 07:16:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lHQNa-0004kB-7f
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 07:13:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lHQNX-0004wT-2S
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 07:13:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614773600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6wNSDQSRbRhwYO1Yjsa+zant8X/ImztjFC85yIRuAvk=;
 b=eOxW9rhX70lew/ZE2xekwYm22a5jVin/Ics7Mny92Hoi58DK6yWxd8k4HVtLI33FExCmbz
 IDLOX2WNr4X+q88liaVIePpW718lc0m8kQT/JcEnDS0yzF9VnTyKc+MQl/BTp4vo/Ak2rD
 1xzvASHdjInzIEDz1zMuw9YnfYFWWhc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-nI_bjK_hOEinVFru0-D69w-1; Wed, 03 Mar 2021 07:13:18 -0500
X-MC-Unique: nI_bjK_hOEinVFru0-D69w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5131F107ACE3;
 Wed,  3 Mar 2021 12:13:17 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-154.ams2.redhat.com
 [10.36.112.154])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 15D6619C48;
 Wed,  3 Mar 2021 12:13:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 035A2180086F; Wed,  3 Mar 2021 13:13:15 +0100 (CET)
Date: Wed, 3 Mar 2021 13:13:14 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH 5/7] ui/vnc: clipboard support
Message-ID: <20210303121314.2ql3yj6ju4i3wvmx@sirius.home.kraxel.org>
References: <20210219131349.3993192-1-kraxel@redhat.com>
 <20210219131349.3993192-6-kraxel@redhat.com>
 <CAJ+F1CLLgnKcr-jRG=2sVnNGjsGjovm+e0bbeTTwHU=CRg1w+Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CLLgnKcr-jRG=2sVnNGjsGjovm+e0bbeTTwHU=CRg1w+Q@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

> > +        case Z_BUF_ERROR:
> > +            out_len <<= 1;
> > +            if (out_len > (1 << 20)) {
> >
> 
> 1Mb isn't that much, is it? Well, since it handles only text for now it's
> probably enough. Would it make sense to make this a #define for clarity ?

Yep.  While talking about sizes:  How does vdagent handles large
clipboard chunks?  There is ...

#define VD_AGENT_MAX_DATA_SIZE 2048

... but I suspect clipboard content isn't limited to that ...

thanks,
  Gerd


