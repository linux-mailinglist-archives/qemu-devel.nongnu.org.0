Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F7568BD5E
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 13:57:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP12r-0004a6-1j; Mon, 06 Feb 2023 07:56:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pP12k-0004ZO-NE
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 07:56:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pP12g-0004xN-QY
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 07:56:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675688177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lMFwhSlzcUaH+PxWk3cpoFuTyUeO4LxfnKLnjaDnMr8=;
 b=bqSNLt8FRSuCcN2x3V/b240+/nIQxz/eJWRUB0PfjVscnflLqnp27dExT1WUe7ggZLWAIl
 7nyhO5TZWrXGdOloBT9NtVa/HrjvavfQN6ghLwTEGVYO4kmhiuxUUpuflIus52wBkVqNb1
 EMjBW9iec+44knoZXQ5bh2atf2YdVm8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-370-whb8BwzJO86XI-LdLlkV5Q-1; Mon, 06 Feb 2023 07:56:14 -0500
X-MC-Unique: whb8BwzJO86XI-LdLlkV5Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F6913823A00;
 Mon,  6 Feb 2023 12:56:13 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F382492B21;
 Mon,  6 Feb 2023 12:56:13 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5CD421800850; Mon,  6 Feb 2023 13:56:10 +0100 (CET)
Date: Mon, 6 Feb 2023 13:56:10 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Andrea Bolognani <abologna@redhat.com>,
 Sunil V L <sunilvl@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: Re: [PATCH 02/10] hw/riscv/virt: Add a switch to enable/disable ACPI
Message-ID: <20230206125610.nmo2bbbd5kosihav@sirius.home.kraxel.org>
References: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
 <20230202045223.2594627-3-sunilvl@ventanamicro.com>
 <CABJz62PFGT1H-AArbfTkpiX24mHU=q3wk7h-bpduZhJyy7tTLw@mail.gmail.com>
 <fe3b5794-be2a-eec7-9d4e-9a13eab48378@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fe3b5794-be2a-eec7-9d4e-9a13eab48378@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Feb 06, 2023 at 12:18:06PM +0100, Philippe Mathieu-Daudé wrote:
> On 6/2/23 11:54, Andrea Bolognani wrote:
> > On Thu, Feb 02, 2023 at 10:22:15AM +0530, Sunil V L wrote:
> > > +    object_class_property_add(oc, "acpi", "OnOffAuto",
> > > +                              virt_get_acpi, virt_set_acpi,
> > > +                              NULL, NULL);
> > > +    object_class_property_set_description(oc, "acpi",
> > > +                                          "Enable ACPI");
> > 
> > The way this works on other architectures (x86_64, aarch64) is that
> > you get ACPI by default and can use -no-acpi to disable it if
> > desired. Can we have the same on RISC-V, for consistency?
> 
> -no-acpi rather seems a x86-specific hack for the ISA PC machine, and
> has a high maintenance cost / burden.

Under the hood it is actually a OnOffAuto machine property and -no-acpi
is just a shortcut to set that.

> Actually, what is the value added by '-no-acpi'?

On arm(64) the linux kernel can use either device trees or ACPI to find
the hardware.  Historical reasons mostly, when the platform started
there was no ACPI support.  Also the edk2 firmware uses Device Trees
for hardware discovery, likewise for historical reasons.

When ACPI is available for a platform right from the start I see little
reason to offer an option to turn it off though ...

take care,
  Gerd


