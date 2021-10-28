Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E0F43D9D9
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 05:27:12 +0200 (CEST)
Received: from localhost ([::1]:42996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfw4M-0005o9-13
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 23:27:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mfvtK-00048J-Qx
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 23:15:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mfvtG-0007bV-Dt
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 23:15:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635390940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gU5z/g0Boc/En2XWGeNld1/S3ufnTdUOtknaASLSRx8=;
 b=bPvDE/BCOY113hYq2/D9+AJ8evzUbO7ouK+NHb+NiNAFxd7BBVD1lqLJoTdwtRh2Nwqhll
 ChsvzKBMNy84VukXBroupV59owQi86BNyRklZX63t0uFY52Yk3lNeyr9Ij1jZ9JM4B0eWh
 R4me8VrDn/pHmAhGWbFoDjvoqNqM+Uw=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-BuzNsfhnMB-2M5VChOfXRg-1; Wed, 27 Oct 2021 23:15:35 -0400
X-MC-Unique: BuzNsfhnMB-2M5VChOfXRg-1
Received: by mail-lj1-f198.google.com with SMTP id
 y18-20020a2e7d12000000b00212b22bc3a4so99622ljc.2
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 20:15:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gU5z/g0Boc/En2XWGeNld1/S3ufnTdUOtknaASLSRx8=;
 b=EyzjdUaD7dHTsp52TFSZ6U0kWpvMftonQ2mNe2tBxTdR+yPsc7ZEk+0NebCz52NsmE
 66ogTpKRRd+eD5pU4SRKS1MrPlu0u5/EOgVGllePn103CZgF0Vg9KX+jLFp/qa5Gv6hh
 7BAqGxZYBQ+E8qMAgMz2TmUpLMaqQYl+dlcc8fsYPxel2y8kdBLKiDqa9K3JJEEbmCAi
 Y7UcJCj1bLVzCqRsSvvKIad2YO0L0niTpPjN+EH/SnrhzmKB38oWjR8Qru4mV0i99uzG
 kRc7VPALHr5E+5+Hz3FA7kFTaz6RfjnwM8/aGi7Iqh2tcrAr+R2YJVqf55AJCGCyOBrl
 No9Q==
X-Gm-Message-State: AOAM531tDS3N+vBwVIKm8uVe9V5OGqiekuodurCIpsy0NZ8+0szA0Rpv
 sReqN3BghLPZobcsep0tjy9xYX33qNqXydc3UpGVnJHsI28MTmRFbMbgXiHJnrdxFbkD01WfaG/
 jahUO9YDPoIIdesucQde4MwUH1VqogQQ=
X-Received: by 2002:ac2:4e68:: with SMTP id y8mr1637901lfs.348.1635390933716; 
 Wed, 27 Oct 2021 20:15:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwogKS9fAvfhrLuQJZM6atP33XmhE4TTGwkHCcfSqlgEWQhPVRHsLDdah3pprVuEGp3ffts5H0KNOoYI5/x8T8=
X-Received: by 2002:ac2:4e68:: with SMTP id y8mr1637876lfs.348.1635390933415; 
 Wed, 27 Oct 2021 20:15:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210818180951.132044-1-andrew@daynix.com>
 <CABcq3pHWydBROkHHngqO6n8D3ELdbv0eEuGynBpdfHi7tqHxcA@mail.gmail.com>
 <CACGkMEv5=gd07Qtf8N0bY66d4ZtLNytzei=yHfC_=D_X_43oyQ@mail.gmail.com>
 <CABcq3pHekALcR_vh9nayoyxANBh87Q53vs89eAj9unZQUXBnDA@mail.gmail.com>
 <CACGkMEtCd1A4tTnj_LNHX0zY3ADdopM2AvFchuj15=1v8sKKzg@mail.gmail.com>
 <CABcq3pHPcV2YH7KTZ4k-Xz4Do9HmMUw7jgycgbQawosvYwy6JQ@mail.gmail.com>
In-Reply-To: <CABcq3pHPcV2YH7KTZ4k-Xz4Do9HmMUw7jgycgbQawosvYwy6JQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 28 Oct 2021 11:15:22 +0800
Message-ID: <CACGkMEvYORAkLRUeTS7cfNqbBJPoUptNUa7rLbE-jE=WaOcS7g@mail.gmail.com>
Subject: Re: [PATCH] e1000e: Added ICR clearing by corresponding IMS bit.
To: Andrew Melnichenko <andrew@daynix.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Alexander Duyck <alexander.duyck@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 27, 2021 at 6:57 PM Andrew Melnichenko <andrew@daynix.com> wrote:
>
> Hi,
> Let's make things clear.
> At first, I've decided to fix the issue in the linux e1000e driver.
> (https://lists.osuosl.org/pipermail/intel-wired-lan/Week-of-Mon-20200413/019497.html)
> Original driver developers suggest to fix the issue on qemu and assures that driver works correctly on real hw.
> I've added fix according to the note 13.3.28 of the 8257X manual
> (https://www.intel.com/content/dam/www/public/us/en/documents/manuals/pcie-gbe-controllers-open-source-manual.pdf)
> I've reference to 8257X spec which is an apparently a bit different to 82574l-gbe-controller-datasheet.pdf

Yes, and 82475l is the referenced model when developing e1000e
emulation code I think.

Thanks

>
>
> On Thu, Oct 21, 2021 at 5:16 AM Jason Wang <jasowang@redhat.com> wrote:
>>
>> Hi Andrew:
>>
>> On Thu, Oct 21, 2021 at 6:27 AM Andrew Melnichenko <andrew@daynix.com> wrote:
>> >
>> > Hi,
>> > I've used this manual(https://www.intel.com/content/dam/www/public/us/en/documents/manuals/pcie-gbe-controllers-open-source-manual.pdf)
>> > It was provided by Intel when I've tried to research that bug.
>> > Although it's a bit newer manual - the article is 13.3.28.
>>
>> Note that it's not the model that e1000e tries to implement (82574L).
>> The device ID in qemu is 0x10D3 which is not listed in the above link
>> "4.7.7 Mandatory PCI Configuration Registers".
>>
>> Thanks
>>
>> >
>> >
>> > On Tue, Oct 19, 2021 at 10:56 AM Jason Wang <jasowang@redhat.com> wrote:
>> >>
>> >> On Thu, Oct 14, 2021 at 4:34 PM Andrew Melnichenko <andrew@daynix.com> wrote:
>> >> >
>> >> > Ping
>> >> >
>> >> > On Wed, Aug 18, 2021 at 9:10 PM Andrew Melnychenko <andrew@daynix.com> wrote:
>> >> >>
>> >> >> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1707441
>> >> >>
>> >> >> The issue is in LSC clearing. So, after "link up"(during initialization),
>> >> >> the next LSC event is masked and can't be processed.
>> >> >> Technically, the event should be 'cleared' during ICR read.
>> >> >> On Windows guest, everything works well, mostly because of
>> >> >> different interrupt routines(ICR clears during register write).
>> >> >> So, added ICR clearing during reading, according to the note by
>> >> >> section 13.3.27 of the 8257X developers manual.
>> >> >>
>> >> >> Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
>> >> >> ---
>> >> >>  hw/net/e1000e_core.c | 10 ++++++++++
>> >> >>  hw/net/trace-events  |  1 +
>> >> >>  2 files changed, 11 insertions(+)
>> >> >>
>> >> >> diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
>> >> >> index b75f2ab8fc..288897a975 100644
>> >> >> --- a/hw/net/e1000e_core.c
>> >> >> +++ b/hw/net/e1000e_core.c
>> >> >> @@ -2617,6 +2617,16 @@ e1000e_mac_icr_read(E1000ECore *core, int index)
>> >> >>          e1000e_clear_ims_bits(core, core->mac[IAM]);
>> >> >>      }
>> >> >>
>> >> >> +    /*
>> >> >> +     * PCIe* GbE Controllers Open Source Software Developer's Manual
>> >> >> +     * 13.3.27 Interrupt Cause Read Register
>> >>
>> >> Per link in the beginning of this file it should be 82574l I guess?
>> >>
>> >> If yes, I'm using revision 3.4 and it's 13.3.27 is not about ICR.
>> >>
>> >> What it said are:
>> >>
>> >> "
>> >> In MSI-X mode the bits in this register can be configured to
>> >> auto-clear when the MSI-X interrupt message is sent, in order to
>> >> minimize driver overhead, and when using MSI-X interrupt signaling. In
>> >> systems that do not support MSI-X, reading the ICR register clears
>> >> it's bits or writing 1b's clears the corresponding bits in this
>> >> register.
>> >> "
>> >>
>> >>
>> >> >> +     */
>> >> >> +    if ((core->mac[ICR] & E1000_ICR_ASSERTED) &&
>> >> >> +        (core->mac[ICR] & core->mac[IMS])) {
>> >> >> +        trace_e1000e_irq_icr_clear_icr_bit_ims(core->mac[ICR], core->mac[IMS]);
>> >> >> +        core->mac[ICR] = 0;
>> >> >> +    }
>> >>
>> >> Thanks
>> >>
>> >> >> +
>> >> >>      trace_e1000e_irq_icr_read_exit(core->mac[ICR]);
>> >> >>      e1000e_update_interrupt_state(core);
>> >> >>      return ret;
>> >> >> diff --git a/hw/net/trace-events b/hw/net/trace-events
>> >> >> index c28b91ee1a..15fd09aa1c 100644
>> >> >> --- a/hw/net/trace-events
>> >> >> +++ b/hw/net/trace-events
>> >> >> @@ -225,6 +225,7 @@ e1000e_irq_icr_read_entry(uint32_t icr) "Starting ICR read. Current ICR: 0x%x"
>> >> >>  e1000e_irq_icr_read_exit(uint32_t icr) "Ending ICR read. Current ICR: 0x%x"
>> >> >>  e1000e_irq_icr_clear_zero_ims(void) "Clearing ICR on read due to zero IMS"
>> >> >>  e1000e_irq_icr_clear_iame(void) "Clearing ICR on read due to IAME"
>> >> >> +e1000e_irq_icr_clear_icr_bit_ims(uint32_t icr, uint32_t ims) "Clearing ICR on read due corresponding IMS bit: 0x%x & 0x%x"
>> >> >>  e1000e_irq_iam_clear_eiame(uint32_t iam, uint32_t cause) "Clearing IMS due to EIAME, IAM: 0x%X, cause: 0x%X"
>> >> >>  e1000e_irq_icr_clear_eiac(uint32_t icr, uint32_t eiac) "Clearing ICR bits due to EIAC, ICR: 0x%X, EIAC: 0x%X"
>> >> >>  e1000e_irq_ims_clear_set_imc(uint32_t val) "Clearing IMS bits due to IMC write 0x%x"
>> >> >> --
>> >> >> 2.31.1
>> >> >>
>> >>
>>


