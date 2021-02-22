Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 356B9321E09
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 18:25:07 +0100 (CET)
Received: from localhost ([::1]:37720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEExG-0004s2-97
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 12:25:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fiuczy@linux.ibm.com>)
 id 1lEEt5-0000Sf-86; Mon, 22 Feb 2021 12:20:47 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:4560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fiuczy@linux.ibm.com>)
 id 1lEEt1-0005ZW-1c; Mon, 22 Feb 2021 12:20:46 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11MHD8cS070680; Mon, 22 Feb 2021 12:20:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=MyWW4hQqHWykQjWkx8UJsZ0FKoJUsmh4elilVQcg8/0=;
 b=C1M437S5MzSRSNYB6TJUL2u9P0ZhFyHtDJeaZQwYSeZh/kJ4XHMRAJ/TNvZs6Owofv0G
 23tBxmEO3/JRZRoJ9mHwzzXbOTZsmbe6/jSz0DYXaIF3HYqfrQl1qNZH6xIaRhqDd0Bj
 jp1RruUgdacFKe39jxM+b6Ry0uddxLa1gh3eZUBoSrBJoyvxN4yJGb5Jol/xvdf5DUpw
 hv4sWBaUARysAnFr8UfngrEPteS2x+TvOqef8QII1S6K13JSzhYeiEMDKKAGWZsujUHX
 Yj09NppXYQnJ9Z01ROyhzBH4xFBPdDQHw+A7PvICCZfErMK6+gacHGhJsiioHbkYg4tT 8w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36vgtqrdta-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Feb 2021 12:20:19 -0500
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 11MHDLd3071679;
 Mon, 22 Feb 2021 12:19:55 -0500
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36vgtqrcf4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Feb 2021 12:19:55 -0500
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11MHHhh2032753;
 Mon, 22 Feb 2021 17:19:00 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma01fra.de.ibm.com with ESMTP id 36tt288y63-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Feb 2021 17:19:00 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11MHIwk039977246
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Feb 2021 17:18:58 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E58BA4204B;
 Mon, 22 Feb 2021 17:18:57 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F02D4203F;
 Mon, 22 Feb 2021 17:18:57 +0000 (GMT)
Received: from [10.0.2.15] (unknown [9.145.55.188])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 22 Feb 2021 17:18:57 +0000 (GMT)
Subject: Re: [PATCH v2 1/1] hw/s390x: modularize virtio-gpu-ccw
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-s390x@nongnu.org, qemu-devel@nongnu.org
References: <20210222125548.346166-1-pasic@linux.ibm.com>
From: Boris Fiuczynski <fiuczy@linux.ibm.com>
Message-ID: <d0ffba8c-b032-d3b2-01c8-6455d9acae97@linux.ibm.com>
Date: Mon, 22 Feb 2021 18:18:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210222125548.346166-1-pasic@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-22_03:2021-02-22,
 2021-02-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 malwarescore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1011
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102220153
Received-SPF: pass client-ip=148.163.156.1; envelope-from=fiuczy@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bruce Rogers <brogers@suse.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo, Daniel,
I am in general (s390 unrelated) a bit puzzled about the scenario of 
QEMU being modularized.
Libvirt probes QEMU executables for their capabilities and creates a 
capabilities cache of the probed QEMU binary. There are a few triggers 
that invalidate the cache. One is the QEMU binary changing.
Is there one for QEMU modules being installed or uninstalled?
How is that supposed to work?


On 2/22/21 1:55 PM, Halil Pasic wrote:
> Since the virtio-gpu-ccw device depends on the hw-display-virtio-gpu
> module, which provides the type virtio-gpu-device, packaging the
> hw-display-virtio-gpu module as a separate package that may or may not
> be installed along with the qemu package leads to problems. Namely if
> the hw-display-virtio-gpu is absent, qemu continues to advertise
> virtio-gpu-ccw, but it aborts not only when one attempts using
> virtio-gpu-ccw, but also when libvirtd's capability probing tries
> to instantiate the type to introspect it.
> 
> Let us thus introduce a module named hw-s390x-virtio-gpu-ccw that
> is going to provide the virtio-gpu-ccw device. The hw-s390x prefix
> was chosen because it is not a portable device.
> 
> With virtio-gpu-ccw built as a module, the correct way to package a
> modularized qemu is to require that hw-display-virtio-gpu must be
> installed whenever the module hw-s390x-virtio-gpu-ccw.
> 
> The definition S390_ADAPTER_SUPPRESSIBLE was moved to "cpu.h", per
> suggestion of Thomas Huth. From interface design perspective, IMHO, not
> a good thing as it belongs to the public interface of
> css_register_io_adapters(). We did this because CONFIG_KVM requeires
> NEED_CPU_H and Thomas, and other commenters did not like the
> consequences of that.
> 
> Moving the interrupt related declarations to s390_flic.h was suggested
> by Cornelia Huck.
> 
> Introducing type_register_mayfail() was suggested by Gerd Hoffmann.
> 
> Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> ---
>   hw/s390x/meson.build         |  7 +++++-
>   hw/s390x/virtio-ccw-gpu.c    |  4 ++++
>   include/hw/s390x/css.h       |  7 ------
>   include/hw/s390x/s390_flic.h |  3 +++
>   include/qom/object.h         | 22 +++++++++++++++++++
>   qom/object.c                 | 42 ++++++++++++++++++++++++------------
>   target/s390x/cpu.h           |  9 +++++---
>   util/module.c                |  1 +
>   8 files changed, 70 insertions(+), 25 deletions(-)
> 
> diff --git a/hw/s390x/meson.build b/hw/s390x/meson.build
> index 2a7818d94b..7ac972afcf 100644
> --- a/hw/s390x/meson.build
> +++ b/hw/s390x/meson.build
> @@ -34,7 +34,6 @@ virtio_ss.add(files('virtio-ccw.c'))
>   virtio_ss.add(when: 'CONFIG_VIRTIO_BALLOON', if_true: files('virtio-ccw-balloon.c'))
>   virtio_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-ccw-blk.c'))
>   virtio_ss.add(when: 'CONFIG_VIRTIO_CRYPTO', if_true: files('virtio-ccw-crypto.c'))
> -virtio_ss.add(when: 'CONFIG_VIRTIO_GPU', if_true: files('virtio-ccw-gpu.c'))
>   virtio_ss.add(when: 'CONFIG_VIRTIO_INPUT', if_true: files('virtio-ccw-input.c'))
>   virtio_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('virtio-ccw-net.c'))
>   virtio_ss.add(when: 'CONFIG_VIRTIO_RNG', if_true: files('virtio-ccw-rng.c'))
> @@ -46,3 +45,9 @@ virtio_ss.add(when: 'CONFIG_VHOST_USER_FS', if_true: files('vhost-user-fs-ccw.c'
>   s390x_ss.add_all(when: 'CONFIG_VIRTIO_CCW', if_true: virtio_ss)
>   
>   hw_arch += {'s390x': s390x_ss}
> +
> +hw_s390x_modules = {}
> +virtio_gpu_ccw_ss = ss.source_set()
> +virtio_gpu_ccw_ss.add(when: 'CONFIG_VIRTIO_GPU', if_true: [files('virtio-ccw-gpu.c'), pixman])
> +hw_s390x_modules += {'virtio-gpu-ccw': virtio_gpu_ccw_ss}
> +modules += {'hw-s390x': hw_s390x_modules}
> diff --git a/hw/s390x/virtio-ccw-gpu.c b/hw/s390x/virtio-ccw-gpu.c
> index c301e2586b..5ac9b6b2a6 100644
> --- a/hw/s390x/virtio-ccw-gpu.c
> +++ b/hw/s390x/virtio-ccw-gpu.c
> @@ -62,7 +62,11 @@ static const TypeInfo virtio_ccw_gpu = {
>   
>   static void virtio_ccw_gpu_register(void)
>   {
> +#ifdef CONFIG_MODULES
> +    type_register_static_mayfail(&virtio_ccw_gpu);
> +#else
>       type_register_static(&virtio_ccw_gpu);
> +#endif
>   }
>   
>   type_init(virtio_ccw_gpu_register)
> diff --git a/include/hw/s390x/css.h b/include/hw/s390x/css.h
> index 08c869ab0a..7858666307 100644
> --- a/include/hw/s390x/css.h
> +++ b/include/hw/s390x/css.h
> @@ -12,7 +12,6 @@
>   #ifndef CSS_H
>   #define CSS_H
>   
> -#include "cpu.h"
>   #include "hw/s390x/adapter.h"
>   #include "hw/s390x/s390_flic.h"
>   #include "hw/s390x/ioinst.h"
> @@ -233,12 +232,6 @@ uint32_t css_get_adapter_id(CssIoAdapterType type, uint8_t isc);
>   void css_register_io_adapters(CssIoAdapterType type, bool swap, bool maskable,
>                                 uint8_t flags, Error **errp);
>   
> -#ifndef CONFIG_KVM
> -#define S390_ADAPTER_SUPPRESSIBLE 0x01
> -#else
> -#define S390_ADAPTER_SUPPRESSIBLE KVM_S390_ADAPTER_SUPPRESSIBLE
> -#endif
> -
>   #ifndef CONFIG_USER_ONLY
>   SubchDev *css_find_subch(uint8_t m, uint8_t cssid, uint8_t ssid,
>                            uint16_t schid);
> diff --git a/include/hw/s390x/s390_flic.h b/include/hw/s390x/s390_flic.h
> index e91b15d2d6..3907a13d07 100644
> --- a/include/hw/s390x/s390_flic.h
> +++ b/include/hw/s390x/s390_flic.h
> @@ -134,6 +134,9 @@ void s390_flic_init(void);
>   S390FLICState *s390_get_flic(void);
>   QEMUS390FLICState *s390_get_qemu_flic(S390FLICState *fs);
>   S390FLICStateClass *s390_get_flic_class(S390FLICState *fs);
> +void s390_crw_mchk(void);
> +void s390_io_interrupt(uint16_t subchannel_id, uint16_t subchannel_nr,
> +                       uint32_t io_int_parm, uint32_t io_int_word);
>   bool ais_needed(void *opaque);
>   
>   #endif /* HW_S390_FLIC_H */
> diff --git a/include/qom/object.h b/include/qom/object.h
> index 6721cd312e..3428546d91 100644
> --- a/include/qom/object.h
> +++ b/include/qom/object.h
> @@ -826,6 +826,17 @@ const char *object_get_typename(const Object *obj);
>    */
>   Type type_register_static(const TypeInfo *info);
>   
> +/**
> + * type_register_static_mayfail:
> + * @info: The #TypeInfo of the new type.
> + *
> + * @info and all of the strings it points to should exist for the life time
> + * that the type is registered.
> + *
> + * Returns: the new #Type or NULL if missing a parent type.
> + */
> +Type type_register_static_mayfail(const TypeInfo *info);
> +
>   /**
>    * type_register:
>    * @info: The #TypeInfo of the new type
> @@ -837,6 +848,17 @@ Type type_register_static(const TypeInfo *info);
>    */
>   Type type_register(const TypeInfo *info);
>   
> +/**
> + * type_register_mayfail:
> + * @info: The #TypeInfo of the new type
> + *
> + * Unlike type_register_static(), this call does not require @info or its
> + * string members to continue to exist after the call returns.
> + *
> + * Returns: the new #Type or NULL if missing a parent type.
> + */
> +Type type_register_mayfail(const TypeInfo *info);
> +
>   /**
>    * type_register_static_array:
>    * @infos: The array of the new type #TypeInfo structures.
> diff --git a/qom/object.c b/qom/object.c
> index 491823db4a..ed217cbfb0 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -135,7 +135,7 @@ static TypeImpl *type_new(const TypeInfo *info)
>       return ti;
>   }
>   
> -static TypeImpl *type_register_internal(const TypeInfo *info)
> +static TypeImpl *type_register_internal(const TypeInfo *info, bool mayfail)
>   {
>       TypeImpl *ti;
>       ti = type_new(info);
> @@ -147,7 +147,13 @@ static TypeImpl *type_register_internal(const TypeInfo *info)
>   TypeImpl *type_register(const TypeInfo *info)
>   {
>       assert(info->parent);
> -    return type_register_internal(info);
> +    return type_register_internal(info, false);
> +}
> +
> +TypeImpl *type_register_mayfail(const TypeInfo *info)
> +{
> +    assert(info->parent);
> +    return type_register_internal(info, true);
>   }
>   
>   TypeImpl *type_register_static(const TypeInfo *info)
> @@ -155,6 +161,11 @@ TypeImpl *type_register_static(const TypeInfo *info)
>       return type_register(info);
>   }
>   
> +TypeImpl *type_register_static_mayfail(const TypeInfo *info)
> +{
> +    return type_register_mayfail(info);
> +}
> +
>   void type_register_static_array(const TypeInfo *infos, int nr_infos)
>   {
>       int i;
> @@ -173,13 +184,16 @@ static TypeImpl *type_get_by_name(const char *name)
>       return type_table_lookup(name);
>   }
>   
> -static TypeImpl *type_get_parent(TypeImpl *type)
> +static TypeImpl *type_get_parent(TypeImpl *type, bool mayfail)
>   {
>       if (!type->parent_type && type->parent) {
>           type->parent_type = type_get_by_name(type->parent);
>           if (!type->parent_type) {
>               fprintf(stderr, "Type '%s' is missing its parent '%s'\n",
>                       type->name, type->parent);
> +            if (mayfail) {
> +                return NULL;
> +            }
>               abort();
>           }
>       }
> @@ -199,7 +213,7 @@ static size_t type_class_get_size(TypeImpl *ti)
>       }
>   
>       if (type_has_parent(ti)) {
> -        return type_class_get_size(type_get_parent(ti));
> +        return type_class_get_size(type_get_parent(ti, false));
>       }
>   
>       return sizeof(ObjectClass);
> @@ -212,7 +226,7 @@ static size_t type_object_get_size(TypeImpl *ti)
>       }
>   
>       if (type_has_parent(ti)) {
> -        return type_object_get_size(type_get_parent(ti));
> +        return type_object_get_size(type_get_parent(ti, false));
>       }
>   
>       return 0;
> @@ -236,7 +250,7 @@ static bool type_is_ancestor(TypeImpl *type, TypeImpl *target_type)
>               return true;
>           }
>   
> -        type = type_get_parent(type);
> +        type = type_get_parent(type, false);
>       }
>   
>       return false;
> @@ -307,7 +321,7 @@ static void type_initialize(TypeImpl *ti)
>       }
>       ti->class = g_malloc0(ti->class_size);
>   
> -    parent = type_get_parent(ti);
> +    parent = type_get_parent(ti, false);
>       if (parent) {
>           type_initialize(parent);
>           GSList *e;
> @@ -357,7 +371,7 @@ static void type_initialize(TypeImpl *ti)
>           if (parent->class_base_init) {
>               parent->class_base_init(ti->class, ti->class_data);
>           }
> -        parent = type_get_parent(parent);
> +        parent = type_get_parent(parent, false);
>       }
>   
>       if (ti->class_init) {
> @@ -368,7 +382,7 @@ static void type_initialize(TypeImpl *ti)
>   static void object_init_with_type(Object *obj, TypeImpl *ti)
>   {
>       if (type_has_parent(ti)) {
> -        object_init_with_type(obj, type_get_parent(ti));
> +        object_init_with_type(obj, type_get_parent(ti, false));
>       }
>   
>       if (ti->instance_init) {
> @@ -383,7 +397,7 @@ static void object_post_init_with_type(Object *obj, TypeImpl *ti)
>       }
>   
>       if (type_has_parent(ti)) {
> -        object_post_init_with_type(obj, type_get_parent(ti));
> +        object_post_init_with_type(obj, type_get_parent(ti, false));
>       }
>   }
>   
> @@ -674,7 +688,7 @@ static void object_deinit(Object *obj, TypeImpl *type)
>       }
>   
>       if (type_has_parent(type)) {
> -        object_deinit(obj, type_get_parent(type));
> +        object_deinit(obj, type_get_parent(type, false));
>       }
>   }
>   
> @@ -1040,7 +1054,7 @@ ObjectClass *module_object_class_by_name(const char *typename)
>   
>   ObjectClass *object_class_get_parent(ObjectClass *class)
>   {
> -    TypeImpl *type = type_get_parent(class->type);
> +    TypeImpl *type = type_get_parent(class->type, false);
>   
>       if (!type) {
>           return NULL;
> @@ -2791,8 +2805,8 @@ static void register_types(void)
>           .abstract = true,
>       };
>   
> -    type_interface = type_register_internal(&interface_info);
> -    type_register_internal(&object_info);
> +    type_interface = type_register_internal(&interface_info, false);
> +    type_register_internal(&object_info, false);
>   }
>   
>   type_init(register_types)
> diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
> index 60d434d5ed..b434b905c0 100644
> --- a/target/s390x/cpu.h
> +++ b/target/s390x/cpu.h
> @@ -40,6 +40,12 @@
>   
>   #define S390_MAX_CPUS 248
>   
> +#ifndef CONFIG_KVM
> +#define S390_ADAPTER_SUPPRESSIBLE 0x01
> +#else
> +#define S390_ADAPTER_SUPPRESSIBLE KVM_S390_ADAPTER_SUPPRESSIBLE
> +#endif
> +
>   typedef struct PSW {
>       uint64_t mask;
>       uint64_t addr;
> @@ -806,9 +812,6 @@ int cpu_s390x_signal_handler(int host_signum, void *pinfo, void *puc);
>   
>   
>   /* interrupt.c */
> -void s390_crw_mchk(void);
> -void s390_io_interrupt(uint16_t subchannel_id, uint16_t subchannel_nr,
> -                       uint32_t io_int_parm, uint32_t io_int_word);
>   #define RA_IGNORED                  0
>   void s390_program_interrupt(CPUS390XState *env, uint32_t code, uintptr_t ra);
>   /* service interrupts are floating therefore we must not pass an cpustate */
> diff --git a/util/module.c b/util/module.c
> index c65060c167..cbe89fede6 100644
> --- a/util/module.c
> +++ b/util/module.c
> @@ -304,6 +304,7 @@ static struct {
>       { "virtio-gpu-pci-base",   "hw-", "display-virtio-gpu-pci" },
>       { "virtio-gpu-pci",        "hw-", "display-virtio-gpu-pci" },
>       { "vhost-user-gpu-pci",    "hw-", "display-virtio-gpu-pci" },
> +    { "virtio-gpu-ccw",        "hw-", "s390x-virtio-gpu-ccw"   },
>       { "virtio-vga-base",       "hw-", "display-virtio-vga"    },
>       { "virtio-vga",            "hw-", "display-virtio-vga"    },
>       { "vhost-user-vga",        "hw-", "display-virtio-vga"    },
> 
> base-commit: 1af5629673bb5c1592d993f9fb6119a62845f576
> 


-- 
Mit freundlichen Grüßen/Kind regards
    Boris Fiuczynski

IBM Deutschland Research & Development GmbH
Vorsitzender des Aufsichtsrats: Gregor Pillen
Geschäftsführung: Dirk Wittkopp
Sitz der Gesellschaft: Böblingen
Registergericht: Amtsgericht Stuttgart, HRB 243294

