Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 810E23D559F
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 10:29:58 +0200 (CEST)
Received: from localhost ([::1]:36746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7vzp-0002u1-KN
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 04:29:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m7vz0-0002E8-Pq
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 04:29:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m7vyx-0004MY-4m
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 04:29:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627288142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W9kmOokahWKjjVJJ7MaTDyZRepKr3q06SKBmmnAUkig=;
 b=C7MTCwrpiPzqsLwk2ZVnorM2m8D2S88gDNH4NX702D6u9U5DHqCTl4Y6cuxZNelsug3/k0
 4I5tZA8oRKPbBifb3w+oAmQSkT1hUX6MnPmaiEqD6+qlIDNNdasRPvb2YXO5g/iC06AAaG
 ZkTMQF+WEbJUKWRFQXQ/thaPCNpDi+w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-XjaCffjeOoiEJvQHUcRAKQ-1; Mon, 26 Jul 2021 04:29:00 -0400
X-MC-Unique: XjaCffjeOoiEJvQHUcRAKQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06E538010F4;
 Mon, 26 Jul 2021 08:29:00 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-106.ams2.redhat.com
 [10.36.114.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B1B6D5DAA5;
 Mon, 26 Jul 2021 08:28:59 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0F68D18003A4; Mon, 26 Jul 2021 10:28:58 +0200 (CEST)
Date: Mon, 26 Jul 2021 10:28:58 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Volker =?utf-8?Q?R=C3=BCmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH v2 0/1] ui/gtk: prevent QEMU lock up
Message-ID: <20210726082858.gyfwksemesr7kg75@sirius.home.kraxel.org>
References: <d06fa203-5a89-b454-8b01-8711aaafeea2@t-online.de>
MIME-Version: 1.0
In-Reply-To: <d06fa203-5a89-b454-8b01-8711aaafeea2@t-online.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Zack Marvel <zpmarvel@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> Since commit 8eb13bbbac ("ui/gtk: vte: fix sending multiple
> characeters") it's very easy to lock up QEMU with the GTK ui.
> If you configure a guest with a serial device and the guest
> doesn't listen on this device, QEMU will lock up after
> entering two characters in the serial console.
> 
> v2:
> Gerd suggested to use the chr_accept_input() callback function
> instead of a write retry timer and to drop patch 2/2.

Very nice and easy to read patch now.

Queued up for 6.1.

thanks,
  Gerd


