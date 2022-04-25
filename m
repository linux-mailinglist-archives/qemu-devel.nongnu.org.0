Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9143A50E2B5
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 16:09:55 +0200 (CEST)
Received: from localhost ([::1]:44294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nizPW-00072u-KI
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 10:09:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nizO1-00044y-PZ
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 10:08:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nizNz-0001ve-Ug
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 10:08:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650895699;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xno2021meW7LEWiXQuf+nffEFdg6lMv/SmWcXi9TiWw=;
 b=QjWJHqRTKO8u23Ck7t4oP7rTjPTe/otBFwfhCFsHobnqemG7OxxwL//BGJNXySfPmcTd6X
 smX77TF9o2d+bbpTlwg2AyvuBlMoBxUWKGyrhBOlxaIyUiPPd8OAFRo+8lcA88DsfjFxsU
 63xrA5CeWNXL4nFhmjFGjE3Cfm9Qjao=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-507-bS99B7hLMmKo9ZJHsllMEQ-1; Mon, 25 Apr 2022 10:08:17 -0400
X-MC-Unique: bS99B7hLMmKo9ZJHsllMEQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D2FB21C05AF4;
 Mon, 25 Apr 2022 14:08:16 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 63394200BCD8;
 Mon, 25 Apr 2022 14:07:01 +0000 (UTC)
Date: Mon, 25 Apr 2022 15:06:58 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Martin Kletzander <mkletzan@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, libvir-list@redhat.com,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Darren Kenny <darren.kenny@oracle.com>, Thomas Huth <huth@tuxfamily.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 03/18] hw/audio: Simplify hda audio init
Message-ID: <YmarAktcIEw2BOjn@redhat.com>
References: <cover.1650874791.git.mkletzan@redhat.com>
 <cd1df4ad2a6fae969c4a02a77955c4a8c0d430b6.1650874791.git.mkletzan@redhat.com>
 <Ymajh0MgNfAWlWwC@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Ymajh0MgNfAWlWwC@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 25, 2022 at 02:35:03PM +0100, Daniel P. Berrangé wrote:
> On Mon, Apr 25, 2022 at 10:21:46AM +0200, Martin Kletzander wrote:
> > No return values are used anywhere, so switch the functions to be void
> > and add support for error reporting using errp for use in next patches.
> 
> Making it 'void' makes sense, but I'm not sure we need the Error **errp
> addition, given my comment on patch #13.

Nevermind, I revised my comment on that patch, so

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

> 
> > 
> > Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
> > ---
> >  hw/audio/hda-codec.c | 32 ++++++++++++++++++--------------
> >  hw/audio/intel-hda.c |  4 +---
> >  hw/audio/intel-hda.h |  2 +-
> >  3 files changed, 20 insertions(+), 18 deletions(-)
> 
> With regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


