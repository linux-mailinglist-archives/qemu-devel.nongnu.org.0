Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9293461D8
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 15:50:03 +0100 (CET)
Received: from localhost ([::1]:54790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOiM6-0005NK-67
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 10:50:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOiL5-0004Ek-07
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 10:48:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOiL2-0001Rs-H1
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 10:48:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616510934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/eJg7ivoSmsiW+CNRGn1/uMYrk2MZRNPewpFQnAxxNQ=;
 b=ZGsIiBEAJ8LBi7V7YQLjyDd9rPO3wkjCEyfNflyyI4ThEXloc8GbSlHzrhyg82nm5OqwNU
 N1IHaRi/32fjn6h5hPBnQQLOQTmcpcLpZ87fCripV6qu4tgkNMKbqgEfK7ALF8sB83DepW
 DM1ZLi2FayRaFiCKuKmT6gblO9/Id3g=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-ZH3dvak_OSGaSB-_PdZkbQ-1; Tue, 23 Mar 2021 10:48:51 -0400
X-MC-Unique: ZH3dvak_OSGaSB-_PdZkbQ-1
Received: by mail-wr1-f71.google.com with SMTP id s10so1223264wre.0
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 07:48:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=/eJg7ivoSmsiW+CNRGn1/uMYrk2MZRNPewpFQnAxxNQ=;
 b=TIlRUMqBMz87+pphf34948ArNoVYkE+zfc+LG4DaMR5aMO/jwrM1VsWlyonrdsPkgD
 4G51hLtmHw8RmlFWiCzrKwC8hZtQfX6GgNQ2YY1P3yzMcQCFU8irrU+sWMn3uPa7WgCD
 zXzTYZmlkBy0QrnuWsYJ/jlVZYuqBDMmwriGO7c8p9eTBXuPizvRDDTeaH+899XA1YIN
 I8fjIPjevP7m5expsel+eE/I4MsQzS35454vH9pE8XbaXaLwXl90C/5XbmdZN2ywkwMS
 af0dmKpDPsGrf4sa0HxQK0CiOxEsk2uWMy22bwpOBc9g0LQC3Y7qhRSDbaaxnVYl1atX
 ORxw==
X-Gm-Message-State: AOAM53001KG/A7pIZ5ztVpZ36uARO/S8FyS5vCSjkRip/Owemazn1bSd
 Hz+bPYHEH7u1gzA59Gh8SQxEuiVw/q4YrVzUe1XD172T1q0neH4Y97+eCZOyXEjjeuT7K9mtRsX
 TPdA8Ottvjks8LFE=
X-Received: by 2002:adf:ea8d:: with SMTP id s13mr4391649wrm.32.1616510930701; 
 Tue, 23 Mar 2021 07:48:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAGBLnieVpqM/QDY2iLNypPDOfNVmUQ5uB35kQ7EARzMDdN8PuJmnopmQwtaL9qBLF9HNAGQ==
X-Received: by 2002:adf:ea8d:: with SMTP id s13mr4391634wrm.32.1616510930483; 
 Tue, 23 Mar 2021 07:48:50 -0700 (PDT)
Received: from redhat.com ([2a10:800e:f0d3:0:b69b:9fb8:3947:5636])
 by smtp.gmail.com with ESMTPSA id q15sm23398711wrx.56.2021.03.23.07.48.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 07:48:46 -0700 (PDT)
Date: Tue, 23 Mar 2021 10:48:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Vitaly Cheptsov <cheptsov@ispras.ru>
Subject: Re: [PATCH] i386/acpi: restore device paths for pre-5.1 vms
Message-ID: <20210323104542-mutt-send-email-mst@kernel.org>
References: <20210301195919.9333-1-cheptsov@ispras.ru>
 <20210322114116-mutt-send-email-mst@kernel.org>
 <B813DBC6-B989-4630-B2DE-8F5825484E78@ispras.ru>
MIME-Version: 1.0
In-Reply-To: <B813DBC6-B989-4630-B2DE-8F5825484E78@ispras.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
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
Cc: Thomas Lamprecht <t.lamprecht@proxmox.com>, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The issue is with people who installed a VM using 5.1 qemu,
migrated to 5.2, booted there and set a config on a device
e.g. IP on a NIC.
They now have a 5.1 machine type but changing uid back
like we do will break these VMs.

Unlikley to be common but let's at least create a way for these people
to used these VMs.


On Mon, Mar 22, 2021 at 06:49:09PM +0300, Vitaly Cheptsov wrote:
> Hi Michael,
> 
> That makes little sense in my opinion, these people can simply upgrade the VM version, which apparently looks the right way to do it in my opinion.
> 
> Best regards,
> Vitaly
> 
> > 22 марта 2021 г., в 18:43, Michael S. Tsirkin <mst@redhat.com> написал(а):
> > 
> > On Mon, Mar 01, 2021 at 10:59:18PM +0300, Vitaly Cheptsov wrote:
> >> After fixing the _UID value for the primary PCI root bridge in
> >> af1b80ae it was discovered that this change updates Windows
> >> configuration in an incompatible way causing network configuration
> >> failure unless DHCP is used. More details provided on the list:
> >> 
> >> https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg08484.html
> >> 
> >> This change reverts the _UID update from 1 to 0 for q35 and i440fx
> >> VMs before version 5.2 to maintain the original behaviour when
> >> upgrading.
> >> 
> >> Cc: qemu-stable@nongnu.org
> >> Cc: qemu-devel@nongnu.org
> >> Reported-by: Thomas Lamprecht <t.lamprecht@proxmox.com>
> >> Suggested-by: Michael S. Tsirkin <mst@redhat.com>
> >> Signed-off-by: Vitaly Cheptsov <cheptsov@ispras.ru>
> >> ---
> >> hw/i386/acpi-build.c | 4 ++--
> >> hw/i386/pc_piix.c    | 2 ++
> >> hw/i386/pc_q35.c     | 2 ++
> >> include/hw/i386/pc.h | 1 +
> >> 4 files changed, 7 insertions(+), 2 deletions(-)
> >> 
> >> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> >> index 31a5f6f4a5..442b4629a9 100644
> >> --- a/hw/i386/acpi-build.c
> >> +++ b/hw/i386/acpi-build.c
> >> @@ -1277,7 +1277,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> >>         dev = aml_device("PCI0");
> >>         aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
> >>         aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
> >> -        aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> >> +        aml_append(dev, aml_name_decl("_UID", aml_int(pcmc->pci_root_uid)));
> >>         aml_append(sb_scope, dev);
> >>         aml_append(dsdt, sb_scope);
> >> 
> >> @@ -1296,7 +1296,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> >>         aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
> >>         aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
> >>         aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
> >> -        aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> >> +        aml_append(dev, aml_name_decl("_UID", aml_int(pcmc->pci_root_uid)));
> >>         aml_append(dev, build_q35_osc_method());
> >>         aml_append(sb_scope, dev);
> >>         if (mcfg_valid) {
> >> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> >> index 2904b40163..46cc951073 100644
> >> --- a/hw/i386/pc_piix.c
> >> +++ b/hw/i386/pc_piix.c
> >> @@ -405,6 +405,7 @@ static void pc_i440fx_machine_options(MachineClass *m)
> >> {
> >>     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
> >>     pcmc->default_nic_model = "e1000";
> >> +    pcmc->pci_root_uid = 0;
> >> 
> >>     m->family = "pc_piix";
> >>     m->desc = "Standard PC (i440FX + PIIX, 1996)";
> >> @@ -448,6 +449,7 @@ static void pc_i440fx_5_1_machine_options(MachineClass *m)
> >>     compat_props_add(m->compat_props, hw_compat_5_1, hw_compat_5_1_len);
> >>     compat_props_add(m->compat_props, pc_compat_5_1, pc_compat_5_1_len);
> >>     pcmc->kvmclock_create_always = false;
> >> +    pcmc->pci_root_uid = 1;
> >> }
> >> 
> >> DEFINE_I440FX_MACHINE(v5_1, "pc-i440fx-5.1", NULL,
> >> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> >> index 0a212443aa..53450190f5 100644
> >> --- a/hw/i386/pc_q35.c
> >> +++ b/hw/i386/pc_q35.c
> >> @@ -329,6 +329,7 @@ static void pc_q35_machine_options(MachineClass *m)
> >> {
> >>     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
> >>     pcmc->default_nic_model = "e1000e";
> >> +    pcmc->pci_root_uid = 0;
> >> 
> >>     m->family = "pc_q35";
> >>     m->desc = "Standard PC (Q35 + ICH9, 2009)";
> >> @@ -375,6 +376,7 @@ static void pc_q35_5_1_machine_options(MachineClass *m)
> >>     compat_props_add(m->compat_props, hw_compat_5_1, hw_compat_5_1_len);
> >>     compat_props_add(m->compat_props, pc_compat_5_1, pc_compat_5_1_len);
> >>     pcmc->kvmclock_create_always = false;
> >> +    pcmc->pci_root_uid = 1;
> >> }
> >> 
> >> DEFINE_Q35_MACHINE(v5_1, "pc-q35-5.1", NULL,
> >> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> >> index c9d194a5e7..d4c3d73c11 100644
> >> --- a/include/hw/i386/pc.h
> >> +++ b/include/hw/i386/pc.h
> >> @@ -105,6 +105,7 @@ struct PCMachineClass {
> >>     int legacy_acpi_table_size;
> >>     unsigned acpi_data_size;
> >>     bool do_not_add_smb_acpi;
> >> +    int pci_root_uid;
> >> 
> >>     /* SMBIOS compat: */
> >>     bool smbios_defaults;
> > 
> > So this upstream, but I think we should also have a property
> > that allows people to have VMs installed with the old
> > machine type booted with a new machine type.
> > 
> > E.g.  "compat-pci-root-uid".
> > 
> > Vitaly could you take a look?
> > 
> > 
> >> --
> >> 2.24.3 (Apple Git-128)
> > 
> 



