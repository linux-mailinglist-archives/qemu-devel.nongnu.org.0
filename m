Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE93C414215
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 08:42:41 +0200 (CEST)
Received: from localhost ([::1]:53752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSvxo-0000aB-Bt
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 02:42:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mSvvY-0007g8-K2
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 02:40:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mSvvV-0004GE-4o
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 02:40:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632292814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fc13At5eeK826rkYpPVmYQA2jtvoWvxXiXOavbtbNnc=;
 b=apfWImzOh28zwZzB5Ebk7NwEPpEk7IffhbIJ4s5/eCLFRCqmY5DK+Fv/Agw6z7vt4xz/sy
 a6ZpRIeIAiYbgQGkBu3ZgCZAiHpwTwt+P9ARpEDmmtxkJ5Of3htGlETCxupyAR5BCb/4qb
 AH+90BPD8/tweWt7EEfhQFIdtPsJ4iI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-gkBpHDkDOzqnGA16GQU17Q-1; Wed, 22 Sep 2021 02:40:13 -0400
X-MC-Unique: gkBpHDkDOzqnGA16GQU17Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 r9-20020a5d4989000000b0015d0fbb8823so1134828wrq.18
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 23:40:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=fc13At5eeK826rkYpPVmYQA2jtvoWvxXiXOavbtbNnc=;
 b=WcwYboI+vXGV+sP99GDBk5Krb97uTEgH3Jl4vxbQ/BS5M2V8KAFoTxWH44zxKm4Gz4
 q1PKkqlOhA0q4tBe14EcPYZy2/7NKiMGrYYwmQy1Wwu4wy4G8sXIyEtq9jyTL/jW3FI8
 fbhLyP2q2eBpSl07TnUu9esGIOWcloPMFDKx/B2vtFx6yBuxjY9y9f26ygg0b1RtF5eo
 G6q4tHhvz92sn6H4MgVhPXN8miuVVvpOfKa79zOjNkXEMql8cKdef/IGcH+KfZf4Agfz
 qIacsCbmD7r6IiFRKvrEtVPBVW3kjUvOp2aD0U5j5cwL9DPhUVMblHSuFeUpDyVINaK4
 VgDg==
X-Gm-Message-State: AOAM530zgzOiykDvrxLUrke/7hxochBAb4qg4MVGuIoLfdkAmsMGJ6q1
 YUmD1FPhJqx0PRJmaDfqLDtufJLuT8GKfbFkD80hwX1Elb4CunXu0rDiQM1R47si8SC6Y3H13Aj
 lmAHXFj7XG51+Sww=
X-Received: by 2002:a1c:35c7:: with SMTP id c190mr61081wma.57.1632292812215;
 Tue, 21 Sep 2021 23:40:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1AM4F8r1ra5j1fhIHh/g5HXZpaHyhgCjPbShVtO6uc6CKwQeNYq9XNhCCcxTlVDJBYr9hog==
X-Received: by 2002:a1c:35c7:: with SMTP id c190mr61061wma.57.1632292811945;
 Tue, 21 Sep 2021 23:40:11 -0700 (PDT)
Received: from redhat.com ([2.55.11.56])
 by smtp.gmail.com with ESMTPSA id s10sm1185833wrg.42.2021.09.21.23.40.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 23:40:11 -0700 (PDT)
Date: Wed, 22 Sep 2021 02:40:07 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH] nvdimm: release the correct device list
Message-ID: <20210922023959-mutt-send-email-mst@kernel.org>
References: <20210624110415.187164-1-lizhijian@cn.fujitsu.com>
 <20210629160534.208b56ad@redhat.com>
 <224e4f45-14c7-4eec-f553-6fa25b4ffb6b@cn.fujitsu.com>
 <3ed73782-0ab2-d178-23e6-0ba19c70cb6f@fujitsu.com>
 <e3257270-2ba3-e890-4506-7b1a14b5bc1a@fujitsu.com>
 <20210917145933.460c7c82@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210917145933.460c7c82@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.475,
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
Cc: "xiaoguangrong.eric@gmail.com" <xiaoguangrong.eric@gmail.com>,
 "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 17, 2021 at 02:59:33PM +0200, Igor Mammedov wrote:
> On Mon, 13 Sep 2021 06:40:01 +0000
> "lizhijian@fujitsu.com" <lizhijian@fujitsu.com> wrote:
> 
> > ping again
> 
> Michael,
> 
> can you include this in your next pull req, please?

ok

> > 
> > 
> > 
> > On 30/08/2021 09:04, Li Zhijian wrote:
> > > ping
> > >
> > >
> > > On 03/08/2021 12:00, Li, Zhijian wrote:  
> > >> ping
> > >>
> > >> Any body could help to review/queue this patch ?
> > >>
> > >>
> > >>
> > >> On 2021/6/29 22:05, Igor Mammedov wrote:  
> > >>> On Thu, 24 Jun 2021 19:04:15 +0800
> > >>> Li Zhijian <lizhijian@cn.fujitsu.com> wrote:
> > >>>  
> > >>>> Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>  
> > >>> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> > >>>  
> > >>>> ---
> > >>>>   hw/acpi/nvdimm.c | 12 ++++++------
> > >>>>   1 file changed, 6 insertions(+), 6 deletions(-)
> > >>>>
> > >>>> diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
> > >>>> index e3d5fe19392..ff317263e85 100644
> > >>>> --- a/hw/acpi/nvdimm.c
> > >>>> +++ b/hw/acpi/nvdimm.c
> > >>>> @@ -355,10 +355,10 @@ nvdimm_build_structure_caps(GArray *structures, uint32_t capabilities)
> > >>>>     static GArray *nvdimm_build_device_structure(NVDIMMState *state)
> > >>>>   {
> > >>>> -    GSList *device_list = nvdimm_get_device_list();
> > >>>> +    GSList *device_list, *list = nvdimm_get_device_list();
> > >>>>       GArray *structures = g_array_new(false, true /* clear */, 1);
> > >>>>   -    for (; device_list; device_list = device_list->next) {
> > >>>> +    for (device_list = list; device_list; device_list = device_list->next) {
> > >>>>           DeviceState *dev = device_list->data;
> > >>>>             /* build System Physical Address Range Structure. */
> > >>>> @@ -373,7 +373,7 @@ static GArray *nvdimm_build_device_structure(NVDIMMState *state)
> > >>>>           /* build NVDIMM Control Region Structure. */
> > >>>>           nvdimm_build_structure_dcr(structures, dev);
> > >>>>       }
> > >>>> -    g_slist_free(device_list);
> > >>>> +    g_slist_free(list);
> > >>>>         if (state->persistence) {
> > >>>>           nvdimm_build_structure_caps(structures, state->persistence);
> > >>>> @@ -1339,9 +1339,9 @@ static void nvdimm_build_ssdt(GArray *table_offsets, GArray *table_data,
> > >>>>     void nvdimm_build_srat(GArray *table_data)
> > >>>>   {
> > >>>> -    GSList *device_list = nvdimm_get_device_list();
> > >>>> +    GSList *device_list, *list = nvdimm_get_device_list();
> > >>>>   -    for (; device_list; device_list = device_list->next) {
> > >>>> +    for (device_list = list; device_list; device_list = device_list->next) {
> > >>>>           AcpiSratMemoryAffinity *numamem = NULL;
> > >>>>           DeviceState *dev = device_list->data;
> > >>>>           Object *obj = OBJECT(dev);
> > >>>> @@ -1356,7 +1356,7 @@ void nvdimm_build_srat(GArray *table_data)
> > >>>>           build_srat_memory(numamem, addr, size, node,
> > >>>>                             MEM_AFFINITY_ENABLED | MEM_AFFINITY_NON_VOLATILE);
> > >>>>       }
> > >>>> -    g_slist_free(device_list);
> > >>>> +    g_slist_free(list);
> > >>>>   }
> > >>>>     void nvdimm_build_acpi(GArray *table_offsets, GArray *table_data,  
> > >>>
> > >>>  
> > >>
> > >>
> > >>  
> > >  


