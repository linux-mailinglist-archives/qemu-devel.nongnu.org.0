Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F4D34C374
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 08:01:18 +0200 (CEST)
Received: from localhost ([::1]:56216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQkxh-0001PV-U3
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 02:01:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lQkvt-0000Uw-Dh
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 01:59:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lQkvq-0008Ve-Qy
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 01:59:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616997560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DxnXBJserF3d6NhZmo0k6vUxubcNiFaus1B8RwrUjQc=;
 b=Y1SDcGlr3+GQMqXspGPINIBqjRHeUiW+igj8lKxnzdztwOVR+M1X7uSPyMkoQ2muCffIqr
 tLT2ns2l8cy40LmIQrDq9NXwBcrrcmrPXtdOnOIsGYUiR+ROsld4Ws/rJQiYrKHt+ABaaV
 E/BZ3SMuD7Z3dQSo84JiwtgvixsDg+A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-wnXaklVBN2uiPh4-SnRsLQ-1; Mon, 29 Mar 2021 01:59:18 -0400
X-MC-Unique: wnXaklVBN2uiPh4-SnRsLQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9AAE1107ACCA;
 Mon, 29 Mar 2021 05:59:17 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-102.ams2.redhat.com
 [10.36.112.102])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 48EC25D6A1;
 Mon, 29 Mar 2021 05:59:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A48E218000A0; Mon, 29 Mar 2021 07:59:15 +0200 (CEST)
Date: Mon, 29 Mar 2021 07:59:15 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 1/3] hw/display/bcm2835_fb: Resize console on reset
Message-ID: <20210329055915.zvkxo5u6cvk7hycp@sirius.home.kraxel.org>
References: <20210323161443.245636-1-f4bug@amsat.org>
 <20210323161443.245636-2-f4bug@amsat.org>
 <CAFEAcA8hKY2XGUhWoyvB8wb+mqc8nhUJHhM7J2=0EUiMBXsstQ@mail.gmail.com>
 <2953bd3c-bdde-0a51-8938-eb3fa4808213@amsat.org>
MIME-Version: 1.0
In-Reply-To: <2953bd3c-bdde-0a51-8938-eb3fa4808213@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > and realize
> > already calls qemu_console_resize(), so how can adding a
> > call to resize here in reset cause the console surface to
> > be created any earlier than it already is ?
> > 
> > I also don't understand how the GUI timer can call us before
> > the device is realized, given that we only register ourselves
> > via graphics_console_init() in the device realize.

Yes, should not happen.  Also note that graphics_console_init()
creates a surface.

> > Is it possible to get the UI layer to
> > not start calling into graphics devices until after the
> > system has been reset for the first time, for instance?

Can that actually happen?  I don't think it could in the past,
but maybe now with the initialization changes.  We can add a
check to gui_update() ...

take care,
  Gerd


