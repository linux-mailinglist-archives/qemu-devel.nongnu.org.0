Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9E6625A83
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 13:33:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otTDw-0001wx-W7; Fri, 11 Nov 2022 07:33:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otTDu-0001rM-AT
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 07:33:30 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otTDs-0005Gg-53
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 07:33:29 -0500
Received: by mail-wr1-x42b.google.com with SMTP id z14so6296275wrn.7
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 04:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yjGpxZfEiOa5JoPrsdDQO+zXasfryVL3gpO1/RFVn8g=;
 b=EZZ/5dH8LAdf4MWEyaXQqSV6lemUHKsarvZr7qJxTiti6y0CMVdUjw+T0q4XfqCn5M
 DNSIkcZR6VDku1Bi+FXWmA8P3bjxJuZNK7W9qq9zNLXvuiJR03g8iG144ROyo3jjOEo6
 OYxVRc3C2JtnTkLmEQxjgulzH9srcL2Wh8cxIKf0nLxsP6gdE5z4nrsc14E+lBAOgiB4
 yLb4/cBQTtwap2Hy/ckRMpabxnnlqgBdd7hb4iaPoHoN9eyC872zKLRtV7x0J75FGuNm
 FQwnbphY5lBERi3pFpMndewg4B7KN2/wHWWJ1ZGOLrtEqDSUKXhThOv8h+FmzxwVk2G+
 5BEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=yjGpxZfEiOa5JoPrsdDQO+zXasfryVL3gpO1/RFVn8g=;
 b=7QWcnqTBXtGOa23G27ZfZ8y24YIsyzBJ70IQyKwsPqsBQb1LM6cHyekOVb0OsOfiOJ
 RAg+zO3+0tsPtdOTvq96G4lWszS+emLdIxgBvBJqrP28ACJQKpXvE0Kx8Kjcw5a+32Tm
 VHrbNkDq/JiuCw+rwsWjx2XEm9L1zAR334hUMDObVNgKxvKeT9p6pPwHCqKaCyQPrKVA
 urHhO7kuZL/0L1rVCJSvT4rv/n9+CSjMvTQ35b/yX9NKZHBK767O0oqGSMJFb37kHUP7
 qSZ2SnzWBkWfofMIFs7T/SW3Rx/nkDTibXgCPPRAB+rcA5KFyXZ1RAk/GyzE9AsaxhT/
 XjYQ==
X-Gm-Message-State: ANoB5pnA3tV9VPLB266QWtTQhRGG0F/cfHc8HrptYwCsZIEyVshdmfF5
 4opQQ9xEWGpld7J01+PZySIRMw==
X-Google-Smtp-Source: AA0mqf7reoeC1aF91AuXD7RK8eRIj6oCKA31+u8BUe+1LBFe6h63SKEl8iz6LEaFeqsADmGs2nYGfw==
X-Received: by 2002:adf:e58b:0:b0:22e:2f06:80f3 with SMTP id
 l11-20020adfe58b000000b0022e2f0680f3mr1154481wrm.79.1668170005954; 
 Fri, 11 Nov 2022 04:33:25 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a05600c4f4600b003c6cd82596esm9305055wmq.43.2022.11.11.04.33.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 04:33:25 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BF0B31FFB7;
 Fri, 11 Nov 2022 12:33:24 +0000 (GMT)
References: <874jv6enct.fsf@linaro.org> <87zgcyd70g.fsf@linaro.org>
 <Y21+VFqKpF6LGz2C@x1n>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Xu <peterx@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu-daude@linaro.org>, Peter
 Maydell <peter.maydell@linaro.org>
Subject: Re: should ioapic_service really be modelling cpu writes?
Date: Fri, 11 Nov 2022 12:26:21 +0000
In-reply-to: <Y21+VFqKpF6LGz2C@x1n>
Message-ID: <87r0y9d623.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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


Peter Xu <peterx@redhat.com> writes:

> Hi, Alex,
>
> On Thu, Nov 10, 2022 at 05:55:51PM +0000, Alex Benn=C3=A9e wrote:
>>=20
>> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>>=20
>> > Hi,
>> >
>> > I've been trying to remove current_cpu hacks from our hw/ emulation and
>> > replace them with an explicit cpu_index derived from MemTxAttrs. So far
>> > this has been going mostly ok but I've run into problems on x86 due to
>> > the way the apic/ioapic are modelled. It comes down to the function
>> > ioapic_service() which eventually does:
>> >
>> >    /* No matter whether IR is enabled, we translate
>> >     * the IOAPIC message into a MSI one, and its
>> >     * address space will decide whether we need a
>> >     * translation. */
>> >    stl_le_phys(ioapic_as, info.addr, info.data);
>> >
>> > Which essentially calls the memory API to simulate a memory write.
>> > However to generate a properly formed MemTxAttrs we need to know what
>> > CPU we are running on. In the case of ioapic_service() we may well be =
in
>> > the main thread either for an expiring timer:
>> >
>> >  hpet_timer->qemu_set_irq->ioapic_set_irq
>> >
>> > or for reset handling:
>> >
>> >  pc_machine_reset->hpet_reset->qemu_set_irq->ioapic_set_irq
>> >
>> > neither of which can get a associated CPU. I assume if the actual writ=
es
>> > are triggered we never actually actioned stuff because we had:
>> >
>> >   DeviceState *cpu_get_current_apic(void)
>> >   {
>> >       if (current_cpu) {
>> >           X86CPU *cpu =3D X86_CPU(current_cpu);
>> >           return cpu->apic_state;
>> >       } else {
>> >           return NULL;
>> >       }
>> >   }
>> >
>> > which basically causes the updates to be dropped on the floor.
>
> I think it shouldn't?  Normally the irq will be in MSI format (IOAPIC will
> translate to an MSI in QEMU, per ioapic_entry_parse()).
>
> I had a feeling that it'll just go the shortcut here (MSI always starts
> with 0xfeeXXXXX so definitely bigger than 0xfff):
>
>     if (addr > 0xfff || !index) {
>         /* MSI and MMIO APIC are at the same memory location,
>          * but actually not on the global bus: MSI is on PCI bus
>          * APIC is connected directly to the CPU.
>          * Mapping them on the global bus happens to work because
>          * MSI registers are reserved in APIC MMIO and vice versa. */
>         MSIMessage msi =3D { .address =3D addr, .data =3D val };
>         apic_send_msi(&msi);
>         return;
>     }
>
> apic_send_msi() doesn't need a cpu context.

Ahh so yes maybe my changes where too quick to reject the MMIO. So I've
made the following tweak to ioapic_service():

                /*
                 * No matter whether IR is enabled, we translate
                 * the IOAPIC message into a MSI one, and its
                 * address space will decide whether we need a
                 * translation.
                 *
                 * As it is an access from something other than the
                 * CPU or a PCI device we set its source as machine
                 * specific.
                 */
                {
                    MemTxAttrs attrs =3D MEMTXATTRS_MACHINE(MEMTX_IOAPIC);
                    MemTxResult res;

                    address_space_stl_le(ioapic_as, info.addr, info.data,
                                         attrs, &res);
                    if (res !=3D MEMTX_ERROR) {
                        qemu_log_mask(LOG_GUEST_ERROR,
                                      "%s: couldn't write to %"PRIx32"\n", =
__func__, info.addr);
                    }
                }

and I had already tweaked the pci_msi_trigger so:

  static void pci_msi_trigger(PCIDevice *dev, MSIMessage msg)
  {
      MemTxAttrs attrs =3D {
          .requester_type =3D MTRT_PCI,
          .requester_id =3D pci_requester_id(dev)
      };
      address_space_stl_le(&dev->bus_master_as, msg.address, msg.data,
                           attrs, NULL);
  }

> No expert on that, but per my understanding ioapic isn't really bound to
> any apic, so it doesn't need any cpu context.  As a quick reference of
> that, one can look at Intel SDM Vol 3 Chap 10, figure 10.3 will be a
> generic modern x86_64 system APIC structure.
>
> In hardware there should have a 3-wire apic bus that take care of all the
> messaging, including at least not only ioapic irqs to any cores, or IPIs
> between the cores.  The messages coming from the ioapic should not require
> any apic too as it can come from devices, just like what we do with qemu
> when the device does things like pci_set_irq(), iiuc.
<snip>
>
> AFAICT apic_mem_write() doesn't mean that this cpu will take this IRQ.  T=
he
> target core to respond to the IRQ will be defined in the dest ID field of
> either an MSI message or embeded in the IOAPIC entry being setup by the
> guest driver.  E.g. MSI message format can also be found in SDM Vol 3 chap
> 10.11.1, in QEMU we can refer to "dest" field of apic_send_msi().


So now the start of apic_mem_write checks and validates MSIs first:

  static MemTxResult apic_mem_write(void *opaque, hwaddr addr, uint64_t val,
                                    unsigned int size, MemTxAttrs attrs)
  {
      DeviceState *dev;
      APICCommonState *s;
      int index =3D (addr >> 4) & 0xff;

      if (size < 4) {
          return MEMTX_ERROR;
      }

      /*
       * MSI and MMIO APIC are at the same memory location, but actually
       * not on the global bus: MSI is on PCI bus APIC is connected
       * directly to the CPU.
       *
       * We can check the MemTxAttrs to check they are coming from where
       * we expect. Even though the MSI registers are reserved in APIC
       * MMIO and vice versa they shouldn't respond to CPU writes.
       */
      if (addr > 0xfff || !index) {
          switch (attrs.requester_type) {
          case MTRT_MACHINE:
              /* should be from the directly wired IOPIC */
              if (attrs.requester_id !=3D MEMTX_IOAPIC) {
                  qemu_log_mask(LOG_GUEST_ERROR,
                                "%s: rejecting machine write from something=
 other that IOPIC (%x)",
                                __func__, attrs.requester_id);
                  return MEMTX_ACCESS_ERROR;
              }
              break;
          case MTRT_PCI:
              /* PCI signalled MSI */
              break;
          case MTRT_UNSPECIFIED:
              qemu_log_mask(LOG_GUEST_ERROR,
                            "%s: rejecting unspecified write", __func__);
              return MEMTX_ACCESS_ERROR;
          case MTRT_CPU:
              /* can CPU directly trigger MSIs? */
              break;
          }
          MSIMessage msi =3D { .address =3D addr, .data =3D val };
          apic_send_msi(&msi);
          return MEMTX_OK;
      }

      if (attrs.requester_type !=3D MTRT_CPU) {
          return MEMTX_ACCESS_ERROR;
      }
      dev =3D cpu_get_current_apic(attrs.requester_id);
      s =3D APIC(dev);

      trace_apic_mem_writel(addr, val);

which at least gets things booting properly. Does this seem like a
better modelling of the APIC behaviour?

--=20
Alex Benn=C3=A9e

