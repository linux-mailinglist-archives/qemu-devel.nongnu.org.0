Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A69410FD4
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 09:06:06 +0200 (CEST)
Received: from localhost ([::1]:55458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSDNN-0004av-OQ
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 03:06:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mSDLc-0003Fo-KR
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 03:04:16 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:43528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mSDLb-00074m-8v
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 03:04:16 -0400
Received: by mail-pg1-x52b.google.com with SMTP id r2so16361448pgl.10
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 00:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=3oZRP8+uBY3kDlzy2yje/yvYjNkR8rAxVFJ+kTiQ2pc=;
 b=0xU0wWBo33tTa5ODgFQtz1+dLTcrodE/lUHhBe4wMBaop2pPM735INxfGp5+tYXhKF
 fnxl12Iz3iyfqkJmv+rm92lAP5TgCjzfwC3m16bCd6jAGsraNt9gmgPkRNtpJMhwm4Ms
 WNrMykfODmwKCnf2P9dmp95WVmWPQ6kLo+01rtWxyu2J4ztY3W3ulJKnDfhrjaZyWx27
 9c0E+WDljL/Xd0fB/3qEXDOVf2LJZgH1e6z8YvYqq+1cTIqiwTgWdLfYZeRM1GLSstwa
 qDmlumAhWQWR1RHS7EQb11DeQIHffK8PKtI37/EYDZDZv2UPEyqa1Tj3nGcHEt55q78m
 /5nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=3oZRP8+uBY3kDlzy2yje/yvYjNkR8rAxVFJ+kTiQ2pc=;
 b=ps46xdVUOXvGJbH2zBUwih6T9rJoUdapITiMUVUCYHs721qMML4JSsIhWign1bUg8B
 Tl5+ykl8kNx2l3suDLzq1On4Qxc66n50oPuInyzp1T2IwdsQiNPVoMKCx5As9VJYqnKH
 odqjvTm9/+mB+gtCvr4Q8dAJKtwwi8ytPGgIdc+iYBV68AlC4N/UzevOM2eXknCiCdsN
 iSf5lZ+sQd/cgS5b26vrAIyNsnPVUomylbuAhqg1tbjGttXP3eGpN+ZAHpihdk8PeIIN
 AxC6Heg1lFjdzCc9/GBfG1hxU9fwlZIqHd7n3P5eVYWrhdcR5Ce0s55kpOStccLWXArL
 Gttw==
X-Gm-Message-State: AOAM531fMhfefuvowTJ3LxPyDon/583gMfEbPAqqIVyejPrKNG915gdQ
 JmP0j5tGKli+5GJRQcBeaCiz0g==
X-Google-Smtp-Source: ABdhPJyEtk7KlAEhchdowlNXxud4Aaao3TvCeMSZxlxobHPf43IwiDgnIG20IYv1UryJb1VJiKll1w==
X-Received: by 2002:a63:1f5b:: with SMTP id q27mr22236436pgm.324.1632121453877; 
 Mon, 20 Sep 2021 00:04:13 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.109.20])
 by smtp.googlemail.com with ESMTPSA id h9sm17942164pjg.9.2021.09.20.00.04.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 00:04:13 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Mon, 20 Sep 2021 12:34:08 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [RFC PATCH] tests/acpi/pcihp: add unit tests for hotplug on
 multifunction bridges for q35
In-Reply-To: <20210920080333.1ca6bb3d@redhat.com>
Message-ID: <alpine.DEB.2.22.394.2109201233180.3937404@anisinha-lenovo>
References: <20210806174642.490023-1-ani@anisinha.ca>
 <20210806174642.490023-2-ani@anisinha.ca>
 <20210917153248.6ef88697@redhat.com>
 <alpine.DEB.2.22.394.2109190814020.3818584@anisinha-lenovo>
 <alpine.DEB.2.22.394.2109190822510.3818584@anisinha-lenovo>
 <20210920080333.1ca6bb3d@redhat.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::52b;
 envelope-from=ani@anisinha.ca; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Mon, 20 Sep 2021, Igor Mammedov wrote:


> > > > > diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> > > > > index 51d3a4e239..c92b70e8b8 100644
> > > > > --- a/tests/qtest/bios-tables-test.c
> > > > > +++ b/tests/qtest/bios-tables-test.c
> > > > > @@ -859,6 +859,33 @@ static void test_acpi_q35_tcg_bridge(void)
> > > > >      free_test_data(&data);
> > > > >  }
> > > > >
> > > > > +static void test_acpi_q35_multif_bridge(void)
> > > > > +{
> > > > > +    test_data data = {
> > > > > +        .machine = MACHINE_Q35,
> > > > > +        .variant = ".multi-bridge",
> > > >
> > > > > +        .required_struct_types = base_required_struct_types,
> > > > > +        .required_struct_types_len = ARRAY_SIZE(base_required_struct_types)
> > > > do we care, i.e. why is this here?
> > >
> > > This verifies the smbios struct. It seems most of the other tests uses it.
> > > So I left it in this test also.
> > > Which of the tests should not be testing smbios?
> >
> > Right now smbios is only tested for non-uefi firmware. There are lots
> > of tests that does not use uefi yet exercize the smbios struct tests.
> > For example:
> >
> > test_acpi_piix4_tcg
> > test_acpi_piix4_tcg_bridge
> > test_acpi_piix4_no_root_hotplug
> > test_acpi_piix4_no_bridge_hotplug
> > test_acpi_piix4_no_acpi_pci_hotplug
> > test_acpi_q35_tcg
> > test_acpi_q35_tcg_bridge
> > test_acpi_q35_tcg_mmio64
> > test_acpi_q35_tcg_ipmi
> > test_acpi_piix4_tcg_ipmi
> >
> > Should the smbios struct verification tests be removed from all of them?
>
> I'd leave them alone, and just remove smbios testing from this patch.
>

I have sent a v3. Please ignore v2.


