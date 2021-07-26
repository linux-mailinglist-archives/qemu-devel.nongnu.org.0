Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7871A3D5860
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 13:15:34 +0200 (CEST)
Received: from localhost ([::1]:58838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7ya5-0000s8-Hz
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 07:15:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m7ySw-0005Ph-9K
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 07:08:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m7ySu-0006Uu-EZ
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 07:08:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627297687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dzL7xIWanqEqD98asOt7J33mzWZc18IUNL/SCxuvJCk=;
 b=izkNrJfQFokTsAurfgH8TSDQM7MIgJ7PCnaGnQT7C92CL44V7W5OcHirbEq4Xn9QmZye4x
 lAfa0oeslaSjcmYY3lW36eUMFfXvRI43Vyomo0+9ssujHvA8HEWT2scvhtFvQSnNJ2ddx4
 y7QyGfNnzHMpwd6uhNRfy1g6+DMw8xw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-YajuQFaVPyOXLoMo1JY_Pg-1; Mon, 26 Jul 2021 07:08:04 -0400
X-MC-Unique: YajuQFaVPyOXLoMo1JY_Pg-1
Received: by mail-wr1-f69.google.com with SMTP id
 l12-20020a5d6d8c0000b029011a3b249b10so4577414wrs.3
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 04:08:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dzL7xIWanqEqD98asOt7J33mzWZc18IUNL/SCxuvJCk=;
 b=uVj0mS5b2+l872ng/BSb7cw5xCRUe5Vo4Z9pcLDM/F+k+7EUEZrLveK3VwauWwhros
 T6ugF3MZtSpF/6VIZacKVeF3KjyaXS9oBI41VRVUcAiQfNLoVCSOVRxvDggNvVh9aYhU
 AE7VSjZLA89qGoCxNqWba5ArJ5wuXDZwRSLdE2zNyM3TbnzVatPpoaZT9pdwXD/lEbNQ
 zUBim9xjpmLDbAf6nymYeXDCEElQsupA7Vtepzd0QtYy5eex26AwtkeFKJMvVY+Af8XU
 0gCbIVUVM3U0Y3rtRxzmeKraEOvkHgbZBffs4yJMpYEehwuo8uSk5Rit/qMwZTLyHIll
 4t6g==
X-Gm-Message-State: AOAM533qodo7k0QhePmmYQ/M9O3iGvF9LLm8VJOwXX9yUBByJuDixAC4
 DMPi2pItIHK567AR5jzPIDRyhnW+NGJvo+ZSVEo8xOoqeiXEiseJw443gPVyiaxDLw8zun90i65
 k5hcn1Zli8NzYS0E=
X-Received: by 2002:adf:fac7:: with SMTP id a7mr18379859wrs.384.1627297683574; 
 Mon, 26 Jul 2021 04:08:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJ+QJcqe26QSuzzpWuiasAbqp6DfSer7QD9QXTmZ/uh4M5guM9iCjJIFkdB7dfTcBadNzVEA==
X-Received: by 2002:adf:fac7:: with SMTP id a7mr18379837wrs.384.1627297683403; 
 Mon, 26 Jul 2021 04:08:03 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id s6sm49814483wrt.45.2021.07.26.04.08.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 04:08:03 -0700 (PDT)
Date: Mon, 26 Jul 2021 13:08:01 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v5 07/10] ACPI ERST: trace support
Message-ID: <20210726130801.73ba7899@redhat.com>
In-Reply-To: <00e755de-0435-9eab-e447-e199f40e328c@oracle.com>
References: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
 <1625080041-29010-8-git-send-email-eric.devolder@oracle.com>
 <20210720151509.7fd47f31@redhat.com>
 <00e755de-0435-9eab-e447-e199f40e328c@oracle.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: ehabkost@redhat.com, mst@redhat.com, konrad.wilk@oracle.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 21 Jul 2021 11:14:37 -0500
Eric DeVolder <eric.devolder@oracle.com> wrote:

> On 7/20/21 8:15 AM, Igor Mammedov wrote:
> > On Wed, 30 Jun 2021 15:07:18 -0400
> > Eric DeVolder <eric.devolder@oracle.com> wrote:
> >   
> >> Provide the definitions needed to support tracing in ACPI ERST.  
> > trace points should be introduced in patches that use them for the first time,
> > as it stands now series breaks bisection.  
> 
> Are you asking to move this patch before the patch that introduces erst.c (which
> uses these trace points)?
> Or are you asking to include this patch with the patch that introduces erst.c?

I'd squash it into patch that introduces corresponding functions.

> Also, you requested I separate the building of ERST table from the implemenation
> of the erst device as separate patches. Doesn't that also break bisection?

it should be possible to compile series patch by patch and not break 'make check'
after each patch.

ACPI table is not part of device, it's separate part that describes to OSPM
how to work with device. So if code split correctly between patches
it shouldn't break bisection.

> 
> >   
> >>
> >> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> >> ---
> >>   hw/acpi/trace-events | 14 ++++++++++++++
> >>   1 file changed, 14 insertions(+)
> >>
> >> diff --git a/hw/acpi/trace-events b/hw/acpi/trace-events
> >> index dcc1438..a5c2755 100644
> >> --- a/hw/acpi/trace-events
> >> +++ b/hw/acpi/trace-events
> >> @@ -55,3 +55,17 @@ piix4_gpe_writeb(uint64_t addr, unsigned width, uint64_t val) "addr: 0x%" PRIx64
> >>   # tco.c
> >>   tco_timer_reload(int ticks, int msec) "ticks=%d (%d ms)"
> >>   tco_timer_expired(int timeouts_no, bool strap, bool no_reboot) "timeouts_no=%d no_reboot=%d/%d"
> >> +
> >> +# erst.c
> >> +acpi_erst_reg_write(uint64_t addr, uint64_t val, unsigned size) "addr: 0x%04" PRIx64 " <== 0x%016" PRIx64 " (size: %u)"
> >> +acpi_erst_reg_read(uint64_t addr, uint64_t val, unsigned size) " addr: 0x%04" PRIx64 " ==> 0x%016" PRIx64 " (size: %u)"
> >> +acpi_erst_mem_write(uint64_t addr, uint64_t val, unsigned size) "addr: 0x%06" PRIx64 " <== 0x%016" PRIx64 " (size: %u)"
> >> +acpi_erst_mem_read(uint64_t addr, uint64_t val, unsigned size) " addr: 0x%06" PRIx64 " ==> 0x%016" PRIx64 " (size: %u)"
> >> +acpi_erst_pci_bar_0(uint64_t addr) "BAR0: 0x%016" PRIx64
> >> +acpi_erst_pci_bar_1(uint64_t addr) "BAR1: 0x%016" PRIx64
> >> +acpi_erst_realizefn_in(void)
> >> +acpi_erst_realizefn_out(unsigned size) "total nvram size %u bytes"
> >> +acpi_erst_reset_in(unsigned record_count) "record_count %u"
> >> +acpi_erst_reset_out(unsigned record_count) "record_count %u"
> >> +acpi_erst_class_init_in(void)
> >> +acpi_erst_class_init_out(void)  
> >   
> 


