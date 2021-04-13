Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1AD35E748
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 21:50:29 +0200 (CEST)
Received: from localhost ([::1]:33016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWP3M-0003nv-PQ
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 15:50:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lWOwa-0007FA-9w
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 15:43:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lWOwY-0005GX-8T
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 15:43:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618343005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=neM3Nztb+PGaA9RkW279htsiYXyHkU1Mp4dQQhs0vtk=;
 b=VZ1/4nS7w3oZBXJQ9mGIuPjI3rN7QgbeVFJrQIgMA5lP0hbv6zyj0TMZ8P41V3AxzIKAMk
 FxfKT2NtVHZeZg9Z9zOL0JmdRLckbi3i0tP1cpNdaDiMR3ZGHwNv6SfRotcatCKodA4U9a
 MpVKpFgoRAuMsQSfRb7VXd3V2lOELeQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-N7lKZ0QENNW27-uOVVPBJg-1; Tue, 13 Apr 2021 15:43:23 -0400
X-MC-Unique: N7lKZ0QENNW27-uOVVPBJg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 477EB881278;
 Tue, 13 Apr 2021 19:43:22 +0000 (UTC)
Received: from localhost (ovpn-117-179.rdu2.redhat.com [10.10.117.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4F49218A50;
 Tue, 13 Apr 2021 19:43:20 +0000 (UTC)
Date: Tue, 13 Apr 2021 15:43:19 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC PATCH-for-6.1 0/9] hw/clock: Strengthen machine (non-qdev)
 clock propagation
Message-ID: <20210413194319.u3dli2gbvwf6sx5r@habkost.net>
References: <20210409062401.2350436-1-f4bug@amsat.org>
 <20210410131932.i6no5tvvaldyomvp@sekoia-pc.home.lmichel.fr>
 <09a63c3e-aa68-0d2d-b447-db9cd84dab09@amsat.org>
 <CAFEAcA9rqx97D_ZN7MzqqJtz9ajFNK=AAeQu9z65+g35SHD_NA@mail.gmail.com>
 <CAFEAcA-5h5ZjXyX6WbdQ8n=pqNSXTHfrt3fQSQzp6EYJY_zXLg@mail.gmail.com>
 <ab8fcac0-eb15-3f59-1b14-ef6b4cba6e03@amsat.org>
 <CAFEAcA-3o2qdssKezXdQY6f5oYSG8MKandXwsBOi1gXuqW2E6Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-3o2qdssKezXdQY6f5oYSG8MKandXwsBOi1gXuqW2E6Q@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 12, 2021 at 11:44:29AM +0100, Peter Maydell wrote:
> On Mon, 12 Apr 2021 at 11:31, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
> > TIL MachineClass::reset().
> >
> > - hw/hppa/machine.c
> > - hw/i386/pc.c
> >
> >   Used to reset CPUs manually because CPUs aren't sysbus-reset.
> 
> pc_machine_reset() is not resetting the CPUs -- it is
> re-resetting the APIC devices, which looks like it is a
> workaround for a reset-ordering or other problem. I'm not
> sure where the CPUs are being reset...

CPU reset code was moved from pc.c:pc_cpu_reset() to
cpu.c:x86_cpu_machine_reset_cb() in commit 65dee3805259
("target-i386: move cpu_reset and reset callback to cpu.c").
It's not clear to me why.

-- 
Eduardo


