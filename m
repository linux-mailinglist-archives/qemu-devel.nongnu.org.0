Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D1F4024D7
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 10:02:38 +0200 (CEST)
Received: from localhost ([::1]:47372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNW3x-0006t6-7q
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 04:02:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNW1t-00063R-J2
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 04:00:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNW1j-0002JO-Rl
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 04:00:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631001617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yYS8txbXLScDwg0o/LPaChElNcvrmksE7BqL3ujuU8s=;
 b=GehIXVAQID+Rz8/sossLWwoecicsmYMGoCotnwxkvPrmbRCxvBB/OkM+XS6+ga+TNkFmMx
 Q9npU+iwPk2VV+7oUnRv7hDfsYgc9iLpFbgL5ik4+A57bQtGCBHgBL9O+8K+nMLW7Hq8Mc
 opAlg+ns5E4dy9iSyeXRJiduEvOxV4g=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-9CK9pvjpMeqpQe-V2pXiCA-1; Tue, 07 Sep 2021 04:00:16 -0400
X-MC-Unique: 9CK9pvjpMeqpQe-V2pXiCA-1
Received: by mail-wr1-f70.google.com with SMTP id
 q14-20020a5d574e000000b00157b0978ddeso1838850wrw.5
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 01:00:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yYS8txbXLScDwg0o/LPaChElNcvrmksE7BqL3ujuU8s=;
 b=otXiQ1n/dFu7nRsIt43afdaOeVIUq0Q3jdaR/RlXVpkuAMqOt4Bqr5ZvP0ZDD7qQU9
 I24jZ9UHAfprmMYXGBMaArewMEf1QZld5yO6Sjm6r/595aGSk9dSDQp1vBO4Nq6D6GdS
 9qlzdA0pB3WCbmajsk3E4nhEM9JxnJEgdrIfMhKoPqp5iY5ggQdJOxe+zJtZIUvW7KP3
 s98IF9LMR8vi7NHhyiYPxXOoblBdfMvDY0G2DqrFdJQprQ/Py78XWopAvN7EfjROmtpy
 U5AtERp3i+p9Xaoa6e6MILHQ8gpSKmbPJq8nQICmCyu8XqgVA1+GsAI1/pXQVpETwexY
 4RVQ==
X-Gm-Message-State: AOAM5321FCSaG6NTOX8C4UQiJ06f3Lpncl5KlZF5FfCA7KMFhC57WVXR
 xETQXOT8eGu3bi3PU8GNekBClqkrd570BYKkdcOWcJoLnHFQpzAcONIBN0PHpWnkbIHl2kyXMKb
 jTN8lpZ8zM5H/XrY=
X-Received: by 2002:a05:600c:1d29:: with SMTP id
 l41mr2507365wms.177.1631001615585; 
 Tue, 07 Sep 2021 01:00:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzoRMxM8owmded1v46KByBECkWdw/FcIU4VAuMf5Lwem1CuET2hR2Fy9MxgmJ+YvNgThxdxWg==
X-Received: by 2002:a05:600c:1d29:: with SMTP id
 l41mr2507340wms.177.1631001615367; 
 Tue, 07 Sep 2021 01:00:15 -0700 (PDT)
Received: from thuth.remote.csb (pd9e8396c.dip0.t-ipconnect.de.
 [217.232.57.108])
 by smtp.gmail.com with ESMTPSA id c3sm10355246wrd.34.2021.09.07.01.00.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 01:00:14 -0700 (PDT)
Subject: Re: [PATCH v2 5/5] s390x: topology: implementating Store Topology
 System Information
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
References: <1626975764-22131-1-git-send-email-pmorel@linux.ibm.com>
 <1626975764-22131-6-git-send-email-pmorel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <cd353458-d70e-b020-4195-2f8f9f9c6741@redhat.com>
Date: Tue, 7 Sep 2021 10:00:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <1626975764-22131-6-git-send-email-pmorel@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: david@redhat.com, cohuck@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, borntraeger@de.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/07/2021 19.42, Pierre Morel wrote:
> The handling of STSI is enhenced with the interception of the

s/enhenced/enhanced/

> function code 15 for storing CPU topology.
> 
> Using the objects built during the pluging of CPU, we build the
> SYSIB 15_1_x structures.
> 
> With this patch the maximum MNEST level is 2, this is also
> the only level allowed and only SYSIB 15_1_2 will be built.
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
>   target/s390x/kvm/kvm.c | 101 +++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 101 insertions(+)
> 
> diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
> index 9a0c13d4ac..0194756e6a 100644
> --- a/target/s390x/kvm/kvm.c
> +++ b/target/s390x/kvm/kvm.c
> @@ -52,6 +52,7 @@
>   #include "hw/s390x/s390-virtio-ccw.h"
>   #include "hw/s390x/s390-virtio-hcall.h"
>   #include "hw/s390x/pv.h"
> +#include "hw/s390x/cpu-topology.h"
>   
>   #ifndef DEBUG_KVM
>   #define DEBUG_KVM  0
> @@ -1907,6 +1908,102 @@ static void insert_stsi_3_2_2(S390CPU *cpu, __u64 addr, uint8_t ar)
>       }
>   }
>   
> +static int stsi_15_container(void *p, int nl, int id)
> +{
> +    SysIBTl_container *tle = (SysIBTl_container *)p;
> +
> +    tle->nl = nl;
> +    tle->id = id;
> +
> +    return sizeof(*tle);
> +}
> +
> +static int stsi_15_cpus(void *p, S390TopologyCores *cd)
> +{
> +    SysIBTl_cpu *tle = (SysIBTl_cpu *)p;
> +
> +    tle->nl = 0;
> +    tle->dedicated = cd->dedicated;
> +    tle->polarity = cd->polarity;
> +    tle->type = cd->cputype;
> +    tle->origin = cd->origin;
> +    tle->mask = cd->mask;
> +
> +    return sizeof(*tle);
> +}
> +
> +static int set_socket(const MachineState *ms, void *p,
> +                      S390TopologySocket *socket)
> +{
> +    BusChild *kid;
> +    int l, len = 0;
> +
> +    len += stsi_15_container(p, 1, socket->socket_id);
> +    p += len;
> +
> +    QTAILQ_FOREACH_REVERSE(kid, &socket->bus->children, sibling) {
> +        l = stsi_15_cpus(p, S390_TOPOLOGY_CORES(kid->child));
> +        p += l;
> +        len += l;
> +    }
> +    return len;
> +}
> +
> +static void insert_stsi_15_1_2(const MachineState *ms, void *p)
> +{
> +    S390TopologyBook *book;
> +    SysIB_151x *sysib;
> +    BusChild *kid;
> +    int level = 2;
> +    int len, l;
> +
> +    sysib = (SysIB_151x *)p;
> +    sysib->mnest = level;
> +    sysib->mag[TOPOLOGY_NR_MAG2] = ms->smp.sockets;
> +    sysib->mag[TOPOLOGY_NR_MAG1] = ms->smp.cores;
> +
> +    book = s390_get_topology();
> +    len = sizeof(SysIB_151x);
> +    p += len;
> +
> +    QTAILQ_FOREACH_REVERSE(kid, &book->bus->children, sibling) {
> +        l = set_socket(ms, p, S390_TOPOLOGY_SOCKET(kid->child));
> +        p += l;
> +        len += l;
> +    }
> +
> +    sysib->length = len;
> +}
> +
> +static void insert_stsi_15_1_x(S390CPU *cpu, int sel2, __u64 addr, uint8_t ar)
> +{
> +    const MachineState *machine = MACHINE(qdev_get_machine());
> +    void *p;
> +    int ret, cc;
> +
> +    /*
> +     * Until the SCLP STSI Facility reporting the MNEST value is used,
> +     * a sel2 value of 2 is the only value allowed in STSI 15.1.x.
> +     */
> +    if (sel2 != 2) {
> +        setcc(cpu, 3);
> +        return;
> +    }
> +
> +    p = g_malloc0(4096);

Use TARGET_PAGE_SIZE instead of magic value 4096?

> +   insert_stsi_15_1_2(machine, p);

Wrong indentation (3 instead of 4 spaces).

> +    if (s390_is_pv()) {
> +        ret = s390_cpu_pv_mem_write(cpu, 0, p, 4096);
> +    } else {
> +        ret = s390_cpu_virt_mem_write(cpu, addr, ar, p, 4096);

TARGET_PAGE_SIZE?

> +    }
> +    cc = ret ? 3 : 0;
> +    setcc(cpu, cc);
> +    g_free(p);
> +}
> +
>   static int handle_stsi(S390CPU *cpu)
>   {
>       CPUState *cs = CPU(cpu);
> @@ -1920,6 +2017,10 @@ static int handle_stsi(S390CPU *cpu)
>           /* Only sysib 3.2.2 needs post-handling for now. */
>           insert_stsi_3_2_2(cpu, run->s390_stsi.addr, run->s390_stsi.ar);
>           return 0;
> +    case 15:
> +        insert_stsi_15_1_x(cpu, run->s390_stsi.sel2, run->s390_stsi.addr,
> +                           run->s390_stsi.ar);
> +        return 0;
>       default:
>           return 0;
>       }
> 

  Thomas


