Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF2E42BA17
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 10:23:09 +0200 (CEST)
Received: from localhost ([::1]:60430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maZXY-00032y-98
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 04:23:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1maZVQ-0000vm-3H
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 04:20:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1maZVO-0003jb-Ar
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 04:20:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634113252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gJUo7PhZKtdZsb+P7dthTg3rUg31nVECON0BiMHFKQA=;
 b=Rjh8ikdKqzsBJjKeHXMuiEFWr7ss0ZBpWRpRaVGCDGK7qVzOdgMvklG/ZOc6w70e2vXX3l
 DoT7pO6ADoMkLaMd2dVRInKrcUm09iiNQkWojxl5MeeGur/xz/DOi3DD7/5u5Tzmq/ba7i
 kBE8EceqtYnvgBUa1UBQmRX7Ps0bsaU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-F7nRWW9xOcWMpUJ-N1TK9w-1; Wed, 13 Oct 2021 04:20:50 -0400
X-MC-Unique: F7nRWW9xOcWMpUJ-N1TK9w-1
Received: by mail-wr1-f70.google.com with SMTP id
 j19-20020adfb313000000b00160a9de13b3so1335263wrd.8
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 01:20:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gJUo7PhZKtdZsb+P7dthTg3rUg31nVECON0BiMHFKQA=;
 b=Zex1GglO1xPCPz3rAkyE0s2i3sqPzbyW+sqC0C6i2Ujbvg2ezFB+6049vTf6KFVtVO
 +jUNZwW8fYciMY6sDT8vsYVPeS8J3qjDrVugjgcnqtRT1RH1Ad42DJ4axPCYPmUOnDF9
 sqapYECPDNPIPYKEjxKVkSJM6B7AMDSxCg0LZ9SDEwckab2yFW6+uCCTubyJznhqZ8Sl
 n6D8h5SHyCUBx82afMitbzDLbDFFKrh2oEYWp3CVKLF4Td6OInH8FrJvIIVF0Uwq1X3z
 ozYf2LasgZqYy3rB8lwsZCXEhc8LcwIg3j8GSkFX91XqKMIZeWD2rW6fGa9yOyVfNve0
 rqig==
X-Gm-Message-State: AOAM532wOYyZNI4z34t29IhpkCRlVjwM3npWNAfQdzk1XZS/fcCBs/C4
 INrHTjKNnh3yuEcpUi2YtIK/uY2euLSgl6S8jQNtkuB2sj+j8lHoatpUzcaRLdJVnIt445ShO/J
 obDUpLtUy8+ST8mo=
X-Received: by 2002:a1c:f008:: with SMTP id a8mr11399222wmb.140.1634113249827; 
 Wed, 13 Oct 2021 01:20:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxLOmHe9Vhcw58k9oes9iVP31kyqxIJewdVpeQJQkGz4oiVvkCN2vwCrA75y1xT3NXcrDgYA==
X-Received: by 2002:a1c:f008:: with SMTP id a8mr11399194wmb.140.1634113249576; 
 Wed, 13 Oct 2021 01:20:49 -0700 (PDT)
Received: from thuth.remote.csb (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id t18sm12989042wrm.81.2021.10.13.01.20.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 01:20:48 -0700 (PDT)
Subject: Re: [PATCH v3 4/4] s390x: topology: implementating Store Topology
 System Information
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
References: <1631800254-25762-1-git-send-email-pmorel@linux.ibm.com>
 <1631800254-25762-5-git-send-email-pmorel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <e20bcaec-e76e-d12a-3a94-f4f0170b203a@redhat.com>
Date: Wed, 13 Oct 2021 10:20:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1631800254-25762-5-git-send-email-pmorel@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: david@redhat.com, cohuck@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, borntraeger@de.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/09/2021 15.50, Pierre Morel wrote:
> The handling of STSI is enhanced with the interception of the
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
> index dd036961fe..0a5f2aced2 100644
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
> @@ -1908,6 +1909,102 @@ static void insert_stsi_3_2_2(S390CPU *cpu, __u64 addr, uint8_t ar)
>       }
>   }

Could you maybe put the new code in a separate file under target/s390x/ 
(maybe target/s390x/topology.c ?), in case we ever want to implement this 
for TCG, too?

> +static int stsi_15_cpus(void *p, S390TopologyCores *cd)
> +{
> +    SysIBTl_cpu *tle = (SysIBTl_cpu *)p;
> +
> +    tle->nl = 0;
> +    tle->dedicated = cd->dedicated;
> +    tle->polarity = cd->polarity;
> +    tle->type = cd->cputype;
> +    tle->origin = cd->origin;

If we want to use this for TCG, too, one day:

    tle->origin = be16_to_cpu(cd->origin);

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

For TCG awareness:

     sysib->length = be16_to_cpu(len);

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
> +    p = g_malloc0(TARGET_PAGE_SIZE);
> +
> +    insert_stsi_15_1_2(machine, p);
> +
> +    if (s390_is_pv()) {
> +        ret = s390_cpu_pv_mem_write(cpu, 0, p, TARGET_PAGE_SIZE);
> +    } else {
> +        ret = s390_cpu_virt_mem_write(cpu, addr, ar, p, TARGET_PAGE_SIZE);
> +    }
> +    cc = ret ? 3 : 0;
> +    setcc(cpu, cc);
> +    g_free(p);
> +}
> +
>   static int handle_stsi(S390CPU *cpu)
>   {
>       CPUState *cs = CPU(cpu);
> @@ -1921,6 +2018,10 @@ static int handle_stsi(S390CPU *cpu)
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


