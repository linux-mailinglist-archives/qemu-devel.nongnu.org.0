Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 120B72F4C20
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 14:20:40 +0100 (CET)
Received: from localhost ([::1]:41326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzg4k-0004Wu-Bh
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 08:20:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kzg1G-0003oK-Oe
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 08:17:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kzg1C-0007c2-03
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 08:17:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610543814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bK15k+xdC4A0Up4JkR6Lu7Rifjs8QZM7pyf/z0RA6aM=;
 b=XtGVBB3OrA6WuVPYAebdELjhPbtRI+Sr4TaS1AA2s59ezFTlzitOwv/ZYd8N/yLec0KYKx
 xQPcKftFbaL1uU4lMzdUUZ4Sgjzjlgz1yj4Nj46OKScn/ixJ6gSUUrIXetGpjWebUT9B3v
 oP6xKyVdI7ejkkOiGltqwVRaezeMGYI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-JYKNl7sSP0ifdoqRF6OHdw-1; Wed, 13 Jan 2021 08:16:53 -0500
X-MC-Unique: JYKNl7sSP0ifdoqRF6OHdw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8DB21005D44;
 Wed, 13 Jan 2021 13:16:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-172.ams2.redhat.com
 [10.36.112.172])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 51E2360BF1;
 Wed, 13 Jan 2021 13:16:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CB1DA11386A7; Wed, 13 Jan 2021 14:16:46 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v3 6/7] qapi: Use QAPI_LIST_APPEND in trivial cases
References: <20201223221102.390740-1-eblake@redhat.com>
 <20201223221102.390740-7-eblake@redhat.com>
Date: Wed, 13 Jan 2021 14:16:46 +0100
In-Reply-To: <20201223221102.390740-7-eblake@redhat.com> (Eric Blake's message
 of "Wed, 23 Dec 2020 16:11:01 -0600")
Message-ID: <87v9c1yo1t.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "open list:Dirty Bitmaps" <qemu-block@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, "open
 list:Trivial patches" <qemu-trivial@nongnu.org>,
 Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric Blake <eblake@redhat.com> writes:

> The easiest spots to use QAPI_LIST_APPEND are where we already have an
> obvious pointer to the tail of a list.  While at it, consistently use
> the variable name 'tail' for that purpose.
>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
[...]
> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
> index 6350caa76530..3f3182007b07 100644
> --- a/hw/acpi/cpu.c
> +++ b/hw/acpi/cpu.c
> @@ -42,16 +42,12 @@ static ACPIOSTInfo *acpi_cpu_device_status(int idx, AcpiCpuStatus *cdev)
>      return info;
>  }
>
> -void acpi_cpu_ospm_status(CPUHotplugState *cpu_st, ACPIOSTInfoList ***list)
> +void acpi_cpu_ospm_status(CPUHotplugState *cpu_st, ACPIOSTInfoList ***tail)
>  {
>      int i;

Sure you want to rename the parameter?  What about:

   void acpi_cpu_ospm_status(CPUHotplugState *cpu_st, ACPIOSTInfoList ***list)
   {
  +    ACPIOSTInfoList ***tail = list;
       int i;

>
>      for (i = 0; i < cpu_st->dev_count; i++) {
> -        ACPIOSTInfoList *elem = g_new0(ACPIOSTInfoList, 1);
> -        elem->value = acpi_cpu_device_status(i, &cpu_st->devs[i]);
> -        elem->next = NULL;
> -        **list = elem;
> -        *list = &elem->next;
> +        QAPI_LIST_APPEND(*tail, acpi_cpu_device_status(i, &cpu_st->devs[i]));
>      }
>  }
>
> diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
> index f2552b2a4624..e4b836bd5e46 100644
> --- a/hw/acpi/memory_hotplug.c
> +++ b/hw/acpi/memory_hotplug.c
> @@ -51,16 +51,13 @@ static ACPIOSTInfo *acpi_memory_device_status(int slot, MemStatus *mdev)
>      return info;
>  }
>
> -void acpi_memory_ospm_status(MemHotplugState *mem_st, ACPIOSTInfoList ***list)
> +void acpi_memory_ospm_status(MemHotplugState *mem_st, ACPIOSTInfoList ***tail)

Likewise.

>  {
>      int i;
>
>      for (i = 0; i < mem_st->dev_count; i++) {
> -        ACPIOSTInfoList *elem = g_new0(ACPIOSTInfoList, 1);
> -        elem->value = acpi_memory_device_status(i, &mem_st->devs[i]);
> -        elem->next = NULL;
> -        **list = elem;
> -        *list = &elem->next;
> +        QAPI_LIST_APPEND(*tail,
> +                         acpi_memory_device_status(i, &mem_st->devs[i]));
>      }
>  }
>
[...]
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 35459a38bb1c..95326285b76d 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -4817,20 +4817,17 @@ static void x86_cpu_filter_features(X86CPU *cpu, bool verbose);
>
>  /* Build a list with the name of all features on a feature word array */
>  static void x86_cpu_list_feature_names(FeatureWordArray features,
> -                                       strList **feat_names)
> +                                       strList **tail)

Likewise.

>  {
>      FeatureWord w;
> -    strList **next = feat_names;
>
>      for (w = 0; w < FEATURE_WORDS; w++) {
>          uint64_t filtered = features[w];
>          int i;
>          for (i = 0; i < 64; i++) {
>              if (filtered & (1ULL << i)) {
> -                strList *new = g_new0(strList, 1);
> -                new->value = g_strdup(x86_cpu_feature_name(w, i));
> -                *next = new;
> -                next = &new->next;
> +                QAPI_LIST_APPEND(tail,
> +                                 g_strdup(x86_cpu_feature_name(w, i)));
>              }
>          }
>      }
> @@ -4851,16 +4848,13 @@ static void x86_cpu_get_unavailable_features(Object *obj, Visitor *v,
>   * running using the current machine and accelerator.
>   */
>  static void x86_cpu_class_check_missing_features(X86CPUClass *xcc,
> -                                                 strList **missing_feats)
> +                                                 strList **tail)

Likewise.

>  {
>      X86CPU *xc;
>      Error *err = NULL;
> -    strList **next = missing_feats;
>
>      if (xcc->host_cpuid_required && !accel_uses_host_cpuid()) {
> -        strList *new = g_new0(strList, 1);
> -        new->value = g_strdup("kvm");
> -        *missing_feats = new;
> +        QAPI_LIST_APPEND(tail, g_strdup("kvm"));
>          return;
>      }
>
> @@ -4872,16 +4866,13 @@ static void x86_cpu_class_check_missing_features(X86CPUClass *xcc,
>           * but in case it does, just report the model as not
>           * runnable at all using the "type" property.
>           */
> -        strList *new = g_new0(strList, 1);
> -        new->value = g_strdup("type");
> -        *next = new;
> -        next = &new->next;
> +        QAPI_LIST_APPEND(tail, g_strdup("type"));
>          error_free(err);
>      }
>
>      x86_cpu_filter_features(xc, false);
>
> -    x86_cpu_list_feature_names(xc->filtered_features, next);
> +    x86_cpu_list_feature_names(xc->filtered_features, tail);
>
>      object_unref(OBJECT(xc));
>  }
[...]

Other than that:
Reviewed-by: Markus Armbruster <armbru@redhat.com>


