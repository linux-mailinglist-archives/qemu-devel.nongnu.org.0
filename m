Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F5C3B2BB9
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 11:43:55 +0200 (CEST)
Received: from localhost ([::1]:43468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwLtp-0007ep-PY
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 05:43:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lwLsk-0006jH-Iv
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 05:42:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lwLsh-0000LC-AT
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 05:42:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624527761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qS2N57MROo7w9B22mX8YbHVQxkUJOwL+bi30X0BtEWI=;
 b=FJVWAr1L7tIzh6TeN/hyq2nSRswDu7hL8RwmgJGYBm2HN2JsiSdSofV+t9cDjeivRMV2rA
 BzDezky8OJzbc7GjsyQFsnDQFmgxWmaBkcv5H85FRj5emserd36vE5E/e5gpn+L9WFHq4n
 K2dHDc2yRgOpgC4qg1EhjNIyPJOvmqs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-QyGY5lirOpaulA3jQbmi4g-1; Thu, 24 Jun 2021 05:42:40 -0400
X-MC-Unique: QyGY5lirOpaulA3jQbmi4g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F15088C5EC0;
 Thu, 24 Jun 2021 09:42:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 208F1E710;
 Thu, 24 Jun 2021 09:42:28 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 08D2E180060E; Thu, 24 Jun 2021 11:42:25 +0200 (CEST)
Date: Thu, 24 Jun 2021 11:42:24 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 04/21] acpi: ged: add control regs
Message-ID: <20210624094224.d6zgfyjgbsz5wp4m@sirius.home.kraxel.org>
References: <20200917135323.18022-1-kraxel@redhat.com>
 <20200917135323.18022-5-kraxel@redhat.com>
 <CAFEAcA_7w2MrTBBafUe6CFDDuAK+vAUP2fdhPG1TzA70sJW+4w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_7w2MrTBBafUe6CFDDuAK+vAUP2fdhPG1TzA70sJW+4w@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > +    switch (addr) {
> > +    case ACPI_GED_REG_SLEEP_CTL:
> > +        slp_typ = (data >> 2) & 0x07;
> > +        slp_en  = (data >> 5) & 0x01;
> > +        if (slp_en && slp_typ == 5) {
> > +            qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
> > +        }
> > +        return;
> > +    case ACPI_GED_REG_SLEEP_STS:
> > +        return;
> > +    case ACPI_GED_REG_RESET:
> > +        if (data == ACPI_GED_RESET_VALUE) {
> > +            qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
> 
> Here we call qemu_system_reset_request(), but we pass it a cause
> value of GUEST_SHUTDOWN. Is this trying to do a reset (in which
> case it should probably be SHUTDOWN_CAUSE_GUEST_RESET) or a shutdown
> (in which case it needs to call qemu_system_shutdown_request()) ?

It is reset (shutdown is a few lines above and the cause was probably
just copy & pasted ...).

take care,
  Gerd


