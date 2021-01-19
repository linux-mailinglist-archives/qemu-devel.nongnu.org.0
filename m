Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6353D2FB423
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 09:36:04 +0100 (CET)
Received: from localhost ([::1]:53068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1mUd-0007eJ-Gu
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 03:36:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1l1mTb-00075I-UL
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 03:34:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1l1mTW-0002GT-K1
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 03:34:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611045292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=exmrZ/6vymYFyD9ipg+t6sb8kPfC89qM4+qnKpuaTAg=;
 b=eNML51s4pnfQCUKPG9ZGV5rNs9DESx6vr/thPfTJDGiDifuTKhhWOAJQjU8yNQatn6k0g/
 OZTeEfBMyU9wIfL9J258tasSFMMHUF/abMtCaX6Sr/MKuySL6t1PBl2buhFnOTkCaRDus5
 E/aQ5Hq9hV1M8t8D/qoEZ4O57Eoh3W8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-HzeH01mdPoiYhDERGSwrmA-1; Tue, 19 Jan 2021 03:34:51 -0500
X-MC-Unique: HzeH01mdPoiYhDERGSwrmA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32AEB1842142;
 Tue, 19 Jan 2021 08:34:48 +0000 (UTC)
Received: from gondolin (ovpn-113-246.ams2.redhat.com [10.36.113.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7BC6D6A8F9;
 Tue, 19 Jan 2021 08:34:27 +0000 (UTC)
Date: Tue, 19 Jan 2021 09:34:24 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: [for-6.0 v5 11/13] spapr: PEF: prevent migration
Message-ID: <20210119093424.165cfebb.cohuck@redhat.com>
In-Reply-To: <2f358741-a9a5-a5d6-715c-c3dba85fbb17@de.ibm.com>
References: <20201218124111.4957eb50.cohuck@redhat.com>
 <20210104071550.GA22585@ram-ibm-com.ibm.com>
 <20210104134629.49997b53.pasic@linux.ibm.com>
 <20210104184026.GD4102@ram-ibm-com.ibm.com>
 <20210105115614.7daaadd6.pasic@linux.ibm.com>
 <20210105204125.GE4102@ram-ibm-com.ibm.com>
 <20210111175914.13adfa2e.cohuck@redhat.com>
 <20210113124226.GH2938@work-vm>
 <20210114112517.GE1643043@redhat.com>
 <20210114235125.GO435587@yekko.fritz.box>
 <20210118173912.GF9899@work-vm>
 <2f358741-a9a5-a5d6-715c-c3dba85fbb17@de.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: pair@us.ibm.com, Boris Fiuczynski <fiuczy@linux.ibm.com>,
 brijesh.singh@amd.com, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>, Ram Pai <linuxram@us.ibm.com>,
 qemu-devel@nongnu.org, frankja@linux.ibm.com, "Michael S.
 Tsirkin" <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Viktor Mihajlovski <mihajlov@linux.ibm.com>, thuth@redhat.com,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, rth@twiddle.net,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 19 Jan 2021 09:28:22 +0100
Christian Borntraeger <borntraeger@de.ibm.com> wrote:

> On 18.01.21 18:39, Dr. David Alan Gilbert wrote:
> > * David Gibson (david@gibson.dropbear.id.au) wrote: =20
> >> On Thu, Jan 14, 2021 at 11:25:17AM +0000, Daniel P. Berrang=C3=A9 wrot=
e: =20
> >>> On Wed, Jan 13, 2021 at 12:42:26PM +0000, Dr. David Alan Gilbert wrot=
e: =20
> >>>> * Cornelia Huck (cohuck@redhat.com) wrote: =20
> >>>>> On Tue, 5 Jan 2021 12:41:25 -0800
> >>>>> Ram Pai <linuxram@us.ibm.com> wrote:
> >>>>> =20
> >>>>>> On Tue, Jan 05, 2021 at 11:56:14AM +0100, Halil Pasic wrote: =20
> >>>>>>> On Mon, 4 Jan 2021 10:40:26 -0800
> >>>>>>> Ram Pai <linuxram@us.ibm.com> wrote: =20
> >>>>> =20
> >>>>>>>> The main difference between my proposal and the other proposal i=
s...
> >>>>>>>>
> >>>>>>>>   In my proposal the guest makes the compatibility decision and =
acts
> >>>>>>>>   accordingly.  In the other proposal QEMU makes the compatibili=
ty
> >>>>>>>>   decision and acts accordingly. I argue that QEMU cannot make a=
 good
> >>>>>>>>   compatibility decision, because it wont know in advance, if th=
e guest
> >>>>>>>>   will or will-not switch-to-secure.
> >>>>>>>>    =20
> >>>>>>>
> >>>>>>> You have a point there when you say that QEMU does not know in ad=
vance,
> >>>>>>> if the guest will or will-not switch-to-secure. I made that argum=
ent
> >>>>>>> regarding VIRTIO_F_ACCESS_PLATFORM (iommu_platform) myself. My id=
ea
> >>>>>>> was to flip that property on demand when the conversion occurs. D=
avid
> >>>>>>> explained to me that this is not possible for ppc, and that havin=
g the
> >>>>>>> "securable-guest-memory" property (or whatever the name will be)
> >>>>>>> specified is a strong indication, that the VM is intended to be u=
sed as
> >>>>>>> a secure VM (thus it is OK to hurt the case where the guest does =
not
> >>>>>>> try to transition). That argument applies here as well.   =20
> >>>>>>
> >>>>>> As suggested by Cornelia Huck, what if QEMU disabled the
> >>>>>> "securable-guest-memory" property if 'must-support-migrate' is ena=
bled?
> >>>>>> Offcourse; this has to be done with a big fat warning stating
> >>>>>> "secure-guest-memory" feature is disabled on the machine.
> >>>>>> Doing so, will continue to support guest that do not try to transi=
tion.
> >>>>>> Guest that try to transition will fail and terminate themselves. =
=20
> >>>>>
> >>>>> Just to recap the s390x situation:
> >>>>>
> >>>>> - We currently offer a cpu feature that indicates secure execution =
to
> >>>>>   be available to the guest if the host supports it.
> >>>>> - When we introduce the secure object, we still need to support
> >>>>>   previous configurations and continue to offer the cpu feature, ev=
en
> >>>>>   if the secure object is not specified.
> >>>>> - As migration is currently not supported for secured guests, we ad=
d a
> >>>>>   blocker once the guest actually transitions. That means that
> >>>>>   transition fails if --only-migratable was specified on the command
> >>>>>   line. (Guests not transitioning will obviously not notice anythin=
g.)
> >>>>> - With the secure object, we will already fail starting QEMU if
> >>>>>   --only-migratable was specified.
> >>>>>
> >>>>> My suggestion is now that we don't even offer the cpu feature if
> >>>>> --only-migratable has been specified. For a guest that does not wan=
t to
> >>>>> transition to secure mode, nothing changes; a guest that wants to
> >>>>> transition to secure mode will notice that the feature is not avail=
able
> >>>>> and fail appropriately (or ultimately, when the ultravisor call fai=
ls).
> >>>>> We'd still fail starting QEMU for the secure object + --only-migrat=
able
> >>>>> combination.
> >>>>>
> >>>>> Does that make sense? =20
> >>>>
> >>>> It's a little unusual; I don't think we have any other cases where
> >>>> --only-migratable changes the behaviour; I think it normally only st=
ops
> >>>> you doing something that would have made it unmigratable or causes
> >>>> an operation that would make it unmigratable to fail. =20
> >>>
> >>> I agree,  --only-migratable is supposed to be a *behavioural* toggle
> >>> for QEMU. It must /not/ have any impact on the guest ABI.
> >>>
> >>> A management application needs to be able to add/remove --only-migrat=
able
> >>> at will without changing the exposing guest ABI. =20
> >>
> >> At the qemu level, it sounds like the right thing to do is to fail
> >> outright if all of the below are true:
> >>  1. --only-migratable is specified
> >>  2. -cpu host is specified
> >>  3. unpack isn't explicitly disabled
> >>  4. the host CPU actually does have the unpack facility
> >>
> >> That can be changed if & when migration support is added for PV. =20
> >=20
> > That sounds right to me. =20
>=20
> as startup will fail anyway if the guest cpu model enables unpack, but th=
e host
> cpu does not support it this can be simplified to forbid startup in qemu =
if
> --only-migratable is combined with unpack being active in the guest cpu m=
odel.
>=20
> This is actually independent from this patch set.

Yep, I think we should just go ahead and fix this.

>  maybe just
> something like
>=20
> diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
> index 35179f9dc7ba..3b85ff4e31b2 100644
> --- a/target/s390x/cpu_models.c
> +++ b/target/s390x/cpu_models.c
> @@ -26,6 +26,7 @@
>  #include "qapi/qmp/qdict.h"
>  #ifndef CONFIG_USER_ONLY
>  #include "sysemu/arch_init.h"
> +#include "sysemu/sysemu.h"
>  #include "hw/pci/pci.h"
>  #endif
>  #include "qapi/qapi-commands-machine-target.h"
> @@ -878,6 +879,11 @@ static void check_compatibility(const S390CPUModel *=
max_model,
>          return;
>      }
> =20
> +    if (only_migratable && test_bit(S390_FEAT_UNPACK, model->features)) {
> +        error_setg(errp, "The unpack facility is not compatible with "
> +                  "the --only-migratable option");
> +    }
> +
>      /* detect the missing features to properly report them */
>      bitmap_andnot(missing, model->features, max_model->features, S390_FE=
AT_MAX);
>      if (bitmap_empty(missing, S390_FEAT_MAX)) {
>=20
>=20

Want to send this as a proper patch?


