Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C5E5219AD
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 15:47:34 +0200 (CEST)
Received: from localhost ([::1]:43148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noQD7-0007VB-86
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 09:47:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1noQ99-00035U-RY
 for qemu-devel@nongnu.org; Tue, 10 May 2022 09:43:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1noQ92-0004KU-RW
 for qemu-devel@nongnu.org; Tue, 10 May 2022 09:43:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652190199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WikjpbabRKay4g07ydRIx2E4zN1WvdANglrvhEWvFe0=;
 b=Gg2zf6CJrERRbLtOlazBKkfjDd4ZVX6QOQWDgx1sCS/XRuYdW5jwyefAmydoVu9l1ryy22
 9MyWNZ8mgdCCa8vYUz8aw3XEiPL8g1k13wy/q6calq2ISq75tkJMAEb6CxAe6S9Z84wAb0
 0cX7M2XihnHRDXu0uB/r8Px218t4nR0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-402-nTHVXnDoNoGrZ0GIxm5oYA-1; Tue, 10 May 2022 09:43:16 -0400
X-MC-Unique: nTHVXnDoNoGrZ0GIxm5oYA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D2CF86B8AC;
 Tue, 10 May 2022 13:43:15 +0000 (UTC)
Received: from localhost (dhcp-192-194.str.redhat.com [10.33.192.194])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 25E7AC15E71;
 Tue, 10 May 2022 13:43:14 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Janis Schoetterl-Glausch <scgl@linux.ibm.com>, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Halil Pasic
 <pasic@linux.ibm.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>, Thomas Huth
 <thuth@redhat.com>, qemu-devel@nongnu.org, Matthew Rosato
 <mjrosato@linux.ibm.com>, Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH 0/2] s390x: kvm: Honor storage keys during emulation
In-Reply-To: <b55e6882-50d5-5e6b-602e-85a984b9961f@linux.ibm.com>
Organization: Red Hat GmbH
References: <20220506153956.2217601-1-scgl@linux.ibm.com>
 <87o8073zae.fsf@redhat.com>
 <b55e6882-50d5-5e6b-602e-85a984b9961f@linux.ibm.com>
User-Agent: Notmuch/0.34 (https://notmuchmail.org)
Date: Tue, 10 May 2022 15:43:12 +0200
Message-ID: <87tu9x1p1r.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 10 2022, Janis Schoetterl-Glausch <scgl@linux.ibm.com> wrote:

> On 5/9/22 10:06, Cornelia Huck wrote:
>> On Fri, May 06 2022, Janis Schoetterl-Glausch <scgl@linux.ibm.com> wrote:
>> 
>>> Make use of the storage key support of the MEMOP ioctl, if available,
>>> in order to support storage key checking during emulation.
>>>
>>> I did not update all the headers, since that broke the build,
>>> not sure what the best way of dealing with that is.
>> 
>> Yeah, the vfio change is expected to break the build; the fix should be
>> easy (simple rename), and the code affected is deprecated anyway (there
>> hasn't been any upstream implementation that actually exposed the
>> interfaces). I think we should do that in a single commit to preserve
>> bisectability; I have not seen any patches posted yet to actually use
>> the new vfio migration interface, so a simple compile fixup should be
>> all that is needed.
>
> So basically this patch (pasted below)
> https://lore.kernel.org/qemu-devel/20220404181726.60291-3-mjrosato@linux.ibm.com/
> squashed with the updated headers.

Yes. We should probably queue that seperately, just to disarm that trap
for everyone; unless there's already a vfio update in flight? (Sorry, I've
lost track a bit.)

>
> Subject: [PATCH v5 2/9] vfio: tolerate migration protocol v1 uapi renames
> Date: Mon,  4 Apr 2022 14:17:19 -0400	[thread overview]
> Message-ID: <20220404181726.60291-3-mjrosato@linux.ibm.com> (raw)
> In-Reply-To: <20220404181726.60291-1-mjrosato@linux.ibm.com>
>
> The v1 uapi is deprecated and will be replaced by v2 at some point;
> this patch just tolerates the renaming of uapi fields to reflect
> v1 / deprecated status.
>
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> ---
>  hw/vfio/common.c    |  2 +-
>  hw/vfio/migration.c | 19 +++++++++++--------
>  2 files changed, 12 insertions(+), 9 deletions(-)
>
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 080046e3f5..7b1e12fb69 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -380,7 +380,7 @@ static bool vfio_devices_all_running_and_saving(VFIOContainer *container)
>                  return false;
>              }
>  
> -            if ((migration->device_state & VFIO_DEVICE_STATE_SAVING) &&
> +            if ((migration->device_state & VFIO_DEVICE_STATE_V1_SAVING) &&
>                  (migration->device_state & VFIO_DEVICE_STATE_RUNNING)) {
>                  continue;
>              } else {
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index ff6b45de6b..e109cee551 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -432,7 +432,7 @@ static int vfio_save_setup(QEMUFile *f, void *opaque)
>      }
>  
>      ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_MASK,
> -                                   VFIO_DEVICE_STATE_SAVING);
> +                                   VFIO_DEVICE_STATE_V1_SAVING);
>      if (ret) {
>          error_report("%s: Failed to set state SAVING", vbasedev->name);
>          return ret;
> @@ -532,7 +532,7 @@ static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
>      int ret;
>  
>      ret = vfio_migration_set_state(vbasedev, ~VFIO_DEVICE_STATE_RUNNING,
> -                                   VFIO_DEVICE_STATE_SAVING);
> +                                   VFIO_DEVICE_STATE_V1_SAVING);
>      if (ret) {
>          error_report("%s: Failed to set state STOP and SAVING",
>                       vbasedev->name);
> @@ -569,7 +569,7 @@ static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
>          return ret;
>      }
>  
> -    ret = vfio_migration_set_state(vbasedev, ~VFIO_DEVICE_STATE_SAVING, 0);
> +    ret = vfio_migration_set_state(vbasedev, ~VFIO_DEVICE_STATE_V1_SAVING, 0);
>      if (ret) {
>          error_report("%s: Failed to set state STOPPED", vbasedev->name);
>          return ret;
> @@ -730,7 +730,7 @@ static void vfio_vmstate_change(void *opaque, bool running, RunState state)
>           * start saving data.
>           */
>          if (state == RUN_STATE_SAVE_VM) {
> -            value = VFIO_DEVICE_STATE_SAVING;
> +            value = VFIO_DEVICE_STATE_V1_SAVING;
>          } else {
>              value = 0;
>          }
> @@ -768,8 +768,9 @@ static void vfio_migration_state_notifier(Notifier *notifier, void *data)
>      case MIGRATION_STATUS_FAILED:
>          bytes_transferred = 0;
>          ret = vfio_migration_set_state(vbasedev,
> -                      ~(VFIO_DEVICE_STATE_SAVING | VFIO_DEVICE_STATE_RESUMING),
> -                      VFIO_DEVICE_STATE_RUNNING);
> +                                       ~(VFIO_DEVICE_STATE_V1_SAVING |
> +                                         VFIO_DEVICE_STATE_RESUMING),
> +                                       VFIO_DEVICE_STATE_RUNNING);
>          if (ret) {
>              error_report("%s: Failed to set state RUNNING", vbasedev->name);
>          }
> @@ -864,8 +865,10 @@ int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
>          goto add_blocker;
>      }
>  
> -    ret = vfio_get_dev_region_info(vbasedev, VFIO_REGION_TYPE_MIGRATION,
> -                                   VFIO_REGION_SUBTYPE_MIGRATION, &info);
> +    ret = vfio_get_dev_region_info(vbasedev,
> +                                   VFIO_REGION_TYPE_MIGRATION_DEPRECATED,
> +                                   VFIO_REGION_SUBTYPE_MIGRATION_DEPRECATED,
> +                                   &info);
>      if (ret) {
>          goto add_blocker;
>      }
>> 
>>>
>>> Janis Schoetterl-Glausch (2):
>>>   Pull in MEMOP changes in linux-headers
>>>   target/s390x: kvm: Honor storage keys during emulation
>>>
>>>  linux-headers/linux/kvm.h | 11 +++++++++--
>>>  target/s390x/kvm/kvm.c    |  9 +++++++++
>>>  2 files changed, 18 insertions(+), 2 deletions(-)
>>>
>>>
>>> base-commit: 31abf61c4929a91275fe32f1fafe6e6b3e840b2a
>>> -- 
>>> 2.32.0
>> 


