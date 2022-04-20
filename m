Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C58F550836E
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 10:30:41 +0200 (CEST)
Received: from localhost ([::1]:45558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh5jU-00089B-S9
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 04:30:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nh5QW-00034L-3j
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 04:11:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nh5QS-0001or-8N
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 04:11:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650442258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MA2zQRj/r3wPeovHLYGTHdA8vP8955zCmXeuVF59fYY=;
 b=JnPRA+uPRmnn1jX3R1O5mfqmt7MblAUWuEsjnsV0f4Gqgpz46AGOQpNOLLboeG6CKgGpAi
 sy8r9IZpx2jrqLoCqnEqmbCBTharYDV2/xiIuntZS0E4ZItAbchoYTBFm6eu+1oRRMbdxn
 vkT27IfbUDAWJvW2N/ejzqQ7kZMX/mw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-7FaHlW-6Nge1bmQdfpf2oA-1; Wed, 20 Apr 2022 04:10:57 -0400
X-MC-Unique: 7FaHlW-6Nge1bmQdfpf2oA-1
Received: by mail-ej1-f69.google.com with SMTP id
 qk32-20020a1709077fa000b006eff51cd918so545470ejc.19
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 01:10:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MA2zQRj/r3wPeovHLYGTHdA8vP8955zCmXeuVF59fYY=;
 b=YyiFt0jDl9OM8v3tjZ3OPIM7DZhtQ60LoVSEqizHVMnha2SdZ1uqm0qdD6N5aZxiSY
 1FPdt2bc1r89aeBPlzbAGtc1+lspvTTm11YoZGq7mZBkKAYpQW6hl4VFTXwU9EBL93f/
 UL1fuz9B6ClterKccVrrh5W/uo7J+zXtkOign8RIwTRGQI3rbnPt/q4CiuTOEId5ElY5
 7nGpm9V/RpIo9wx/7tA7gFDg9MtvsE1GZ8Cgd/N7081j7HPVQFTxx8jwWR/eW9IKuiMl
 r7B9hX1rXdTfCMRr6eYLGtEBWQAnrLqy8T/n8HS6+Q2lp9rX9t/OTPg8mCtcOmBdwJZA
 nH6w==
X-Gm-Message-State: AOAM531LASk6EFYhuFqvRc3NImO/2GlrSj+Vm1bI+kNw/4rD2blc2t2i
 3kpX1v3OssKFTR1LdiLnOSodekipzBXmCELSqto5QTDHVM5w8qGEZqGPLq8Z0YNnW4m9Nejh2PJ
 lgClIlCjNlpEXPEw=
X-Received: by 2002:a17:906:58d2:b0:6da:b635:fbf3 with SMTP id
 e18-20020a17090658d200b006dab635fbf3mr16546637ejs.40.1650442255848; 
 Wed, 20 Apr 2022 01:10:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwizR89XtUJFAsffeGrWbKp2n25HFAcFOI567q5iyp74Xw0h9LvCM6EkIeb+Yrtlz5L2G8m6g==
X-Received: by 2002:a17:906:58d2:b0:6da:b635:fbf3 with SMTP id
 e18-20020a17090658d200b006dab635fbf3mr16546603ejs.40.1650442255418; 
 Wed, 20 Apr 2022 01:10:55 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 a23-20020a170906369700b006e8973a14dbsm6528451ejc.79.2022.04.20.01.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 01:10:54 -0700 (PDT)
Date: Wed, 20 Apr 2022 10:10:53 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v5 4/4] hw/acpi/aml-build: Use existing CPU topology to
 build PPTT table
Message-ID: <20220420101053.17faee64@redhat.com>
In-Reply-To: <8f76fa31-7ec8-faf9-da7f-0f740722a8a1@redhat.com>
References: <20220403145953.10522-1-gshan@redhat.com>
 <20220403145953.10522-5-gshan@redhat.com>
 <20220413155232.0a1f4d88@redhat.com>
 <dec9ab46-746d-9810-0784-2cddefab67ae@redhat.com>
 <20220419105432.11ad0f90@redhat.com>
 <8f76fa31-7ec8-faf9-da7f-0f740722a8a1@redhat.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, zhenyzha@redhat.com, wangyanan55@huawei.com,
 qemu-arm@nongnu.org, shan.gavin@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 20 Apr 2022 13:19:34 +0800
Gavin Shan <gshan@redhat.com> wrote:

> Hi Igor,
> 
> On 4/19/22 4:54 PM, Igor Mammedov wrote:
> > On Thu, 14 Apr 2022 08:33:29 +0800
> > Gavin Shan <gshan@redhat.com> wrote:  
> >> On 4/13/22 9:52 PM, Igor Mammedov wrote:  
> >>> On Sun,  3 Apr 2022 22:59:53 +0800
> >>> Gavin Shan <gshan@redhat.com> wrote:
> >>>      
> >>>> When the PPTT table is built, the CPU topology is re-calculated, but
> >>>> it's unecessary because the CPU topology has been populated in
> >>>> virt_possible_cpu_arch_ids() on arm/virt machine.
> >>>>
> >>>> This reworks build_pptt() to avoid by reusing the existing one in
> >>>> ms->possible_cpus. Currently, the only user of build_pptt() is
> >>>> arm/virt machine.
> >>>>
> >>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
> >>>> ---
> >>>>    hw/acpi/aml-build.c | 100 +++++++++++++++++---------------------------
> >>>>    1 file changed, 38 insertions(+), 62 deletions(-)
> >>>>
> >>>> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> >>>> index 4086879ebf..4b0f9df3e3 100644
> >>>> --- a/hw/acpi/aml-build.c
> >>>> +++ b/hw/acpi/aml-build.c
> >>>> @@ -2002,86 +2002,62 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
> >>>>                    const char *oem_id, const char *oem_table_id)
> >>>>    {
> >>>>        MachineClass *mc = MACHINE_GET_CLASS(ms);
> >>>> -    GQueue *list = g_queue_new();
> >>>> -    guint pptt_start = table_data->len;
> >>>> -    guint parent_offset;
> >>>> -    guint length, i;
> >>>> -    int uid = 0;
> >>>> -    int socket;
> >>>> +    CPUArchIdList *cpus = ms->possible_cpus;
> >>>> +    int64_t socket_id = -1, cluster_id = -1, core_id = -1;
> >>>> +    uint32_t socket_offset, cluster_offset, core_offset;
> >>>> +    uint32_t pptt_start = table_data->len;
> >>>> +    int n;
> >>>>        AcpiTable table = { .sig = "PPTT", .rev = 2,
> >>>>                            .oem_id = oem_id, .oem_table_id = oem_table_id };
> >>>>    
> >>>>        acpi_table_begin(&table, table_data);
> >>>>    
> >>>> -    for (socket = 0; socket < ms->smp.sockets; socket++) {
> >>>> -        g_queue_push_tail(list,
> >>>> -            GUINT_TO_POINTER(table_data->len - pptt_start));
> >>>> -        build_processor_hierarchy_node(
> >>>> -            table_data,
> >>>> -            /*
> >>>> -             * Physical package - represents the boundary
> >>>> -             * of a physical package
> >>>> -             */
> >>>> -            (1 << 0),
> >>>> -            0, socket, NULL, 0);
> >>>> -    }
> >>>> +    for (n = 0; n < cpus->len; n++) {  
> >>>      
> >>>> +        if (cpus->cpus[n].props.socket_id != socket_id) {
> >>>> +            socket_id = cpus->cpus[n].props.socket_id;  
> >>>
> >>> this relies on cpus->cpus[n].props.*_id being sorted form top to down levels
> >>> I'd add here and for other container_id an assert() that checks for that
> >>> specific ID goes in only one direction, to be able to detect when rule is broken.
> >>>
> >>> otherwise on may end up with duplicate containers silently.
> >>>      
> >>
> >> Exactly. cpus->cpus[n].props.*_id is sorted as you said in virt_possible_cpu_arch_ids().
> >> The only user of build_pptt() is arm/virt machine. So it's fine. However, I think I
> >> may need add comments for this in v6.
> >>
> >>       /*
> >>        * This works with the assumption that cpus[n].props.*_id has been
> >>        * sorted from top to down levels in mc->possible_cpu_arch_ids().
> >>        * Otherwise, the unexpected and duplicate containers will be created.
> >>        */
> >>
> >> The implementation in v3 looks complicated, but comprehensive. The one
> >> in this revision (v6) looks simple, but the we're losing flexibility :)  
> > 
> > 
> > comment is not enough, as it will break silently that's why I suggested
> > sprinkling asserts() here.
> >   
> 
> I don't think it breaks anything. Duplicated PPTT entries are allowed in
> linux at least. The IDs in the duplicated PPTT entries should be same.
> Otherwise, the exposed CPU topology is really broken.

Spec doesn't say anything about allowing duplicate entries so I'd rather
avoid that (if you find a such provision in spec then put a reference
in this commit message to end discussion on duplicates).


> 
> I don't think it's harmful to add the check and assert, so I will introduce
> a helper function like below in v7. Sadly that v6 was posted before I received
> your confirm. Igor, could you please the changes, to be included into v7,
> looks good to you? The complete patch is also attached :)
> 
> +static bool pptt_entry_exists(MachineState *ms, int n, bool check_socket_id,
> +                              bool check_cluster_id, bool check_core_id)
> +{
> +    CPUArchId *cpus = ms->possible_cpus->cpus;
> +    CpuInstanceProperties *t = &cpus[n].props;
> +    CpuInstanceProperties *s;
> +    bool match;
> +    int i;
> +
> +    for (i = 0; i < n; i++) {

Wouldn't it make whole thing O(n^2) in worst case?

I suggest put asserts directly into build_pptt() and considering that
it relies on ids being sorted, do something like this:
   assert(foo_id_val > previous_id)
which will ensure that id doesn't jump back unexpectedly


> +        match = true;
> +        s = &cpus[i].props;
> +
> +        if (check_socket_id && s->socket_id != t->socket_id) {
> +            match = false;
> +        }
> +
> +        if (match && check_cluster_id && s->cluster_id != t->cluster_id) {
> +            match = false;
> +        }
> +
> +        if (match && check_core_id && s->core_id != t->core_id) {
> +            match = false;
> +        }
> +
> +        if (match) {
> +            return true;
> +        }
> +    }
> +
> +    return false;
> +}
> 
> The following assert() will be applied in build_pptt():
> 
> assert(!pptt_entry_exists(ms, n, true, false, false));           /* socket  */
> assert(!pptt_entry_exists(ms, n, true, true, false));            /* cluster */
> assert(!pptt_entry_exists(ms, n, true,
>             mc->smp_props.clusters_supported, true));             /* core    */
> 
> Thanks,
> Gavin
> 


