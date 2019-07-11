Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DE3646D7
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jul 2019 15:12:37 +0200 (CEST)
Received: from localhost ([::1]:32800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlCOh-0002f9-Qt
	for lists+qemu-devel@lfdr.de; Wed, 10 Jul 2019 09:12:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45429)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1hlCNe-000222-Ra
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 09:11:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hlCNd-0003WY-92
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 09:11:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36428)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>)
 id 1hlCNY-0003LG-SP; Wed, 10 Jul 2019 09:11:25 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1C04830BF4B7;
 Wed, 10 Jul 2019 13:11:22 +0000 (UTC)
Received: from work-vm (ovpn-117-216.ams2.redhat.com [10.36.117.216])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 969468491B;
 Wed, 10 Jul 2019 13:11:20 +0000 (UTC)
Date: Wed, 10 Jul 2019 14:11:18 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190710131118.GC2682@work-vm>
References: <20190709143912.28905-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190709143912.28905-1-peter.maydell@linaro.org>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Wed, 10 Jul 2019 13:11:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH for-4.1] pl031: Correctly migrate state
 when using -rtc clock=host
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Russell King <rmk@armlinux.org.uk>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Maydell (peter.maydell@linaro.org) wrote:
> The PL031 RTC tracks the difference between the guest RTC
> and the host RTC using a tick_offset field. For migration,
> however, we currently always migrate the offset between
> the guest and the vm_clock, even if the RTC clock is not
> the same as the vm_clock; this was an attempt to retain
> migration backwards compatibility.
> 
> Unfortunately this results in the RTC behaving oddly across
> a VM state save and restore -- since the VM clock stands still
> across save-then-restore, regardless of how much real world
> time has elapsed, the guest RTC ends up out of sync with the
> host RTC in the restored VM.
> 
> Fix this by migrating the raw tick_offset. To retain migration
> compatibility as far as possible, we have a new property
> migrate-tick-offset; by default this is 'true' and we will
> migrate the true tick offset in a new subsection; if the
> incoming data has no subsection we fall back to the old
> vm_clock-based offset information, so old->new migration
> compatibility is preserved. For complete new->old migration
> compatibility, the property is set to 'false' for 4.0 and
> earlier machine types (this will only affect 'virt-4.0'
> and below, as none of the other pl031-using machines are
> versioned).
> 
> Reported-by: Russell King <rmk@armlinux.org.uk>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Yes, I think so;



Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
> I think this is correct, and it makes the "rtc clock should
> not stay still across a save/reload" work, but I feel like
> there might be some subtlety I've missed here. Review
> definitely needed...
> 
>  include/hw/timer/pl031.h |  2 +
>  hw/core/machine.c        |  1 +
>  hw/timer/pl031.c         | 92 ++++++++++++++++++++++++++++++++++++++--
>  3 files changed, 91 insertions(+), 4 deletions(-)
> 
> diff --git a/include/hw/timer/pl031.h b/include/hw/timer/pl031.h
> index 8857c24ca5d..8c3f555ee28 100644
> --- a/include/hw/timer/pl031.h
> +++ b/include/hw/timer/pl031.h
> @@ -33,6 +33,8 @@ typedef struct PL031State {
>       */
>      uint32_t tick_offset_vmstate;
>      uint32_t tick_offset;
> +    bool tick_offset_migrated;
> +    bool migrate_tick_offset;
>  
>      uint32_t mr;
>      uint32_t lr;
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 2be19ec0cd5..37a1111da1d 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -34,6 +34,7 @@ GlobalProperty hw_compat_4_0[] = {
>      { "virtio-vga",     "edid", "false" },
>      { "virtio-gpu-pci", "edid", "false" },
>      { "virtio-device", "use-started", "false" },
> +    { "pl031", "migrate-tick-offset", "false" },
>  };
>  const size_t hw_compat_4_0_len = G_N_ELEMENTS(hw_compat_4_0);
>  
> diff --git a/hw/timer/pl031.c b/hw/timer/pl031.c
> index 3378084f4a8..1a7e2ee06b3 100644
> --- a/hw/timer/pl031.c
> +++ b/hw/timer/pl031.c
> @@ -199,29 +199,94 @@ static int pl031_pre_save(void *opaque)
>  {
>      PL031State *s = opaque;
>  
> -    /* tick_offset is base_time - rtc_clock base time.  Instead, we want to
> -     * store the base time relative to the QEMU_CLOCK_VIRTUAL for backwards-compatibility.  */
> +    /*
> +     * The PL031 device model code uses the tick_offset field, which is
> +     * the offset between what the guest RTC should read and what the
> +     * QEMU rtc_clock reads:
> +     *  guest_rtc = rtc_clock + tick_offset
> +     * and so
> +     *  tick_offset = guest_rtc - rtc_clock
> +     *
> +     * We want to migrate this offset, which sounds straightforward.
> +     * Unfortunately older versions of QEMU migrated a conversion of this
> +     * offset into an offset from the vm_clock. (This was in turn an
> +     * attempt to be compatible with even older QEMU versions, but it
> +     * has incorrect behaviour if the rtc_clock is not the same as the
> +     * vm_clock.) So we put the actual tick_offset into a migration
> +     * subsection, and the backwards-compatible time-relative-to-vm_clock
> +     * in the main migration state.
> +     *
> +     * Calculate base time relative to QEMU_CLOCK_VIRTUAL:
> +     */
>      int64_t delta = qemu_clock_get_ns(rtc_clock) - qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>      s->tick_offset_vmstate = s->tick_offset + delta / NANOSECONDS_PER_SECOND;
>  
>      return 0;
>  }
>  
> +static int pl031_pre_load(void *opaque)
> +{
> +    PL031State *s = opaque;
> +
> +    s->tick_offset_migrated = false;
> +    return 0;
> +}
> +
>  static int pl031_post_load(void *opaque, int version_id)
>  {
>      PL031State *s = opaque;
>  
> -    int64_t delta = qemu_clock_get_ns(rtc_clock) - qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> -    s->tick_offset = s->tick_offset_vmstate - delta / NANOSECONDS_PER_SECOND;
> +    /*
> +     * If we got the tick_offset subsection, then we can just use
> +     * the value in that. Otherwise the source is an older QEMU and
> +     * has given us the offset from the vm_clock; convert it back to
> +     * an offset from the rtc_clock. This will cause time to incorrectly
> +     * go backwards compared to the host RTC, but this is unavoidable.
> +     */
> +
> +    if (!s->tick_offset_migrated) {
> +        int64_t delta = qemu_clock_get_ns(rtc_clock) -
> +            qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +        s->tick_offset = s->tick_offset_vmstate -
> +            delta / NANOSECONDS_PER_SECOND;
> +    }
>      pl031_set_alarm(s);
>      return 0;
>  }
>  
> +static int pl031_tick_offset_post_load(void *opaque, int version_id)
> +{
> +    PL031State *s = opaque;
> +
> +    s->tick_offset_migrated = true;
> +    return 0;
> +}
> +
> +static bool pl031_tick_offset_needed(void *opaque)
> +{
> +    PL031State *s = opaque;
> +
> +    return s->migrate_tick_offset;
> +}
> +
> +static const VMStateDescription vmstate_pl031_tick_offset = {
> +    .name = "pl031/tick-offset",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = pl031_tick_offset_needed,
> +    .post_load = pl031_tick_offset_post_load,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT32(tick_offset, PL031State),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  static const VMStateDescription vmstate_pl031 = {
>      .name = "pl031",
>      .version_id = 1,
>      .minimum_version_id = 1,
>      .pre_save = pl031_pre_save,
> +    .pre_load = pl031_pre_load,
>      .post_load = pl031_post_load,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT32(tick_offset_vmstate, PL031State),
> @@ -231,14 +296,33 @@ static const VMStateDescription vmstate_pl031 = {
>          VMSTATE_UINT32(im, PL031State),
>          VMSTATE_UINT32(is, PL031State),
>          VMSTATE_END_OF_LIST()
> +    },
> +    .subsections = (const VMStateDescription*[]) {
> +        &vmstate_pl031_tick_offset,
> +        NULL
>      }
>  };
>  
> +static Property pl031_properties[] = {
> +    /*
> +     * True to correctly migrate the tick offset of the RTC. False to
> +     * obtain backward migration compatibility with older QEMU versions,
> +     * at the expense of the guest RTC going backwards compared with the
> +     * host RTC when the VM is saved/restored if using -rtc host.
> +     * (Even if set to 'true' older QEMU can migrate forward to newer QEMU;
> +     * 'false' also permits newer QEMU to migrate to older QEMU.)
> +     */
> +    DEFINE_PROP_BOOL("migrate-tick-offset",
> +                     PL031State, migrate_tick_offset, true),
> +    DEFINE_PROP_END_OF_LIST()
> +};
> +
>  static void pl031_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
>  
>      dc->vmsd = &vmstate_pl031;
> +    dc->props = pl031_properties;
>  }
>  
>  static const TypeInfo pl031_info = {
> -- 
> 2.20.1
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

