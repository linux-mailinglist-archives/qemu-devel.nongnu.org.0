Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3FC652994
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 00:05:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7leR-0008HK-DV; Tue, 20 Dec 2022 18:03:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7leL-0008GM-CP
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 18:03:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7leJ-0007Rp-5V
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 18:03:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671577429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3rNEDhRZ/WWTvhIj7H0GtwP4+UmIJNE2FyI+qpyzx7k=;
 b=MJufPkS1BM/cD1HPigXWPQjQ6FNXt7Ux0W46+84A86T29Mx8S61h9LvH2tMOnoacMtsK1v
 4spV6x/29vnOPxEeQM2GYcEyZmrDNgPepE/wBJ/oxv8CG70gRtcXBVc3cu+6EKEnQINQKu
 GVDzIeQqjGbSVpguFA+SORQ+AHkQz0o=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-576-Bihk_uetNzS5o-KVdZlSIg-1; Tue, 20 Dec 2022 18:03:48 -0500
X-MC-Unique: Bihk_uetNzS5o-KVdZlSIg-1
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-411c31a2c20so157699647b3.12
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 15:03:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3rNEDhRZ/WWTvhIj7H0GtwP4+UmIJNE2FyI+qpyzx7k=;
 b=FGwPCIGd9GH0njEGZp6pLi6RmAWTSe9K5KCJDAxUvPi/ukVeJcrx50v4+/6KzuFrIi
 2hRwppwD4RM94asR5aWqrDWWv6Cm7eyy9g27g77NPqIPTizulYcOEFOCz08RUZ4iMUgR
 /PSIkmD/Lg6E5JdGTTBHdLMGek7kXN5CefWpSVmF87Gl6hSeLw2ITLFjrkOwc631kefx
 t73NnD7zq12PvfWqR/RqaoJdufc/hbv0nIgncCWguv+57bSz8BTOuo/I+4uT3W28Y/PL
 LZlZ1s5iEkeIcnmf7k0sqEhrx7Ca1GUBldD8aDq+AZcKPC/9/VMU0ErAWilqC7it7nEE
 Jpcg==
X-Gm-Message-State: ANoB5pmB9ZCNAQW8OnXc2zNZICaU9oZcrQxRsGEhZdpEbWUEbZPcJX2x
 Y6Bi9LAUoM0IBWaBDkEae227W98eLrNQsGaer9L2Ah3i1iI0wZFQRUT07K6m7AZg2MhLfBtsaFU
 grkEvCj+MTBa27Bg=
X-Received: by 2002:a05:7500:2489:b0:ea:577b:cdc9 with SMTP id
 ba9-20020a057500248900b000ea577bcdc9mr4830994gab.38.1671577427869; 
 Tue, 20 Dec 2022 15:03:47 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7YO1wTmnL1F5uxfY095qVdtXrRC9Kn7U7chnmt/dA2OwCTFKerHllWMEbbUpimi/ysThsytg==
X-Received: by 2002:a05:7500:2489:b0:ea:577b:cdc9 with SMTP id
 ba9-20020a057500248900b000ea577bcdc9mr4830977gab.38.1671577427435; 
 Tue, 20 Dec 2022 15:03:47 -0800 (PST)
Received: from redhat.com ([37.19.199.117]) by smtp.gmail.com with ESMTPSA id
 a3-20020a05620a438300b006bbf85cad0fsm9526224qkp.20.2022.12.20.15.03.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 15:03:47 -0800 (PST)
Date: Tue, 20 Dec 2022 18:03:40 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>, Ani Sinha <ani@anisinha.ca>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 00/32] Consolidate PIIX south bridges
Message-ID: <20221220180304-mutt-send-email-mst@kernel.org>
References: <20221204190553.3274-1-shentey@gmail.com>
 <20221220094738-mutt-send-email-mst@kernel.org>
 <d5e1af45-9ff9-6b01-9650-bf5b960abee7@linaro.org>
 <7030BFB2-DD96-4900-991C-DC962875D4D4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7030BFB2-DD96-4900-991C-DC962875D4D4@gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Tue, Dec 20, 2022 at 10:35:23PM +0000, Bernhard Beschow wrote:
> 
> 
> Am 20. Dezember 2022 15:08:57 UTC schrieb "Philippe Mathieu-Daudé" <philmd@linaro.org>:
> >On 20/12/22 15:48, Michael S. Tsirkin wrote:
> >> On Sun, Dec 04, 2022 at 08:05:21PM +0100, Bernhard Beschow wrote:
> >>> This series consolidates the implementations of the PIIX3 and PIIX4 south
> >>> bridges and is an extended version of [1]. The motivation is to share as much
> >>> code as possible and to bring both device models to feature parity such that
> >>> perhaps PIIX4 can become a drop-in-replacement for PIIX3 in the pc machine. This
> >>> could resolve the "Frankenstein" PIIX4-PM problem in PIIX3 discussed on this
> >>> list before.
> >>> 
> >>> The series is structured as follows: First, PIIX3 is changed to instantiate
> >>> internal devices itself, like PIIX4 does already. Second, PIIX3 gets prepared
> >>> for the merge with PIIX4 which includes some fixes, cleanups, and renamings.
> >>> Third, the same is done for PIIX4. In step four the implementations are merged.
> >>> Since some consolidations could be done easier with merged implementations, the
> >>> consolidation continues in step five which concludes the series.
> >>> 
> >>> One particular challenge in this series was that the PIC of PIIX3 used to be
> >>> instantiated outside of the south bridge while some sub functions require a PIC
> >>> with populated qemu_irqs. This has been solved by introducing a proxy PIC which
> >>> furthermore allows PIIX3 to be agnostic towards the virtualization technology
> >>> used (KVM, TCG, Xen). Due to consolidation PIIX4 gained the proxy PIC as well.
> >>> 
> >>> Another challenge was dealing with optional devices where Peter already gave
> >>> advice in [1] which this series implements.
> >>> 
> >>> A challenge still remains with consolidating PCI interrupt handling. There are
> >>> still board-specific piix3_pci_slot_get_pirq() and piix4_pci_slot_get_pirq()
> >>> which are implemented in isa/piix.c. Any advice how to resolve these would be
> >>> highly appreaciated. See [2] for details.
> >>> 
> >>> Last but not least there might be some opportunity to consolidate VM state
> >>> handling, probably by reusing the one from PIIX3. Since I'm not very familiar
> >>> with the requirements I didn't touch it so far.
> >>> 
> >>> Testing done:
> >>> * make check
> >>> * make check-avocado
> >>> * Boot live CD:
> >>>    * `qemu-system-x86_64 -M pc -m 2G -accel kvm -cpu host -cdrom manjaro-kde-21.3.2-220704-linux515.iso`
> >>>    * `qemu-system-x86_64 -M q35 -m 2G -accel kvm -cpu host -cdrom manjaro-kde-21.3.2-220704-linux515.iso`
> >>> * 'qemu-system-mips64el -M malta -kernel vmlinux-3.2.0-4-5kc-malta -hda debian_wheezy_mipsel_standard.qcow2 -append "root=/dev/sda1 console=ttyS0"`
> >>> 
> >>> v3:
> >>> - Introduce one TYPE_ICH9_USB_UHCI(fn) rather than several TYPE_ICH9_USB_UHCIx (Philippe)
> >>> - Make proxy PIC generic (Philippe)
> >>> - Track Malta's PIIX dependencies through KConfig
> >>> - Rebase onto Philippe's 'hw/isa/piix4: Remove MIPS Malta specific bits' series [3]
> >>> - Also rebase onto latest master to resolve merge conflicts. This required copying
> >>>    Philippe's series as first three patches - please ignore.
> >> 
> >> So IIUC, you are waiting for Philippe to respin his series then
> >> you can include it all in v4, right?
> >Correct. And mine is waiting for few more R-b tags. If you can Ack
> >this series, no need for v4 and I can pick it via mips-next once the
> >rest is ready (before Xmas I hope).
> 
> Nice!
> 
> Shall we integrate [1] 'Decouple INTx-to-LNKx routing from south bridges' via mips-next rather than x86 as well? This would 1/ make the consolidation more complete and 2/ simplify the process since these series conflict with one another.


OK I'll drop it from my tree.

> I could rebase [1] onto this series (perhaps simpler to review) or the other way around (less code movement). Please let me know what you'd prefer.
> 
> [1] https://lists.nongnu.org/archive/html/qemu-devel/2022-11/msg03310.html
> 
> >
> >Regards.
> >
> >Phil.


