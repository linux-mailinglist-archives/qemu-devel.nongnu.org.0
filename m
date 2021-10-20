Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49AB3434822
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 11:45:04 +0200 (CEST)
Received: from localhost ([::1]:50570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md89f-0004Aq-EV
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 05:45:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1md889-0002px-58
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 05:43:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1md887-00052G-Ck
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 05:43:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634723006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4k8d1+mjpfJUYfGZYvH8c1jIn6nMlCdqRyQUyaYZ1Xk=;
 b=iK3nR5mxsMrB9lIMm8C8/QjJczA+m/luD8R/WDet/wyV9attS6t/4UWOCo+WfT+EUi7ZPX
 5CVvbohXfKJL8EhRQhVRhsNzTNubb9FbEu3TeZdPGAWS15VfUqYOcC4TJGVw3/Lc4XPVR9
 xV8el33K79nIJf/pdh+OXEBA0JsMhhk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-AQYBLjz5NCOYhAKhTORL-Q-1; Wed, 20 Oct 2021 05:43:25 -0400
X-MC-Unique: AQYBLjz5NCOYhAKhTORL-Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 k20-20020a7bc414000000b0030dcd454771so2826432wmi.8
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 02:43:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4k8d1+mjpfJUYfGZYvH8c1jIn6nMlCdqRyQUyaYZ1Xk=;
 b=ayyfGz0IfXOaaRTMDsv4/tKgwN4o12gvEHZwHgO04aRu5cSW66WvCh9xb8WsNHK4J6
 WUCetP49h8DASGNVWbdMW6P9TmvWSrsHNGvK6Hka+PLsRDU2yz3FE+LH8yBke8xJ289S
 bQAdN7JtKmUu551/LyMUaT9X+Dh0n/D0o1ng3+6Ackdn1fleW0iUKReVc0ve1Fnbs9+K
 kvcrdsarMRDnb0cfcifR3nYbEZtnCw96cxMhDTSw6eXMBV3/8kZCsqGWFxPdAbtezR7W
 ePIDlvKbBUVmpfzpz0cL4Lx0408pmqmK0GCNmu3F+77i83QZWhCe5Wp+HC7KkiiXG3pV
 bZhg==
X-Gm-Message-State: AOAM530VGzUdl3vTwAmDLQJWLGud4dJ4sCvHyh6QFyk8WnwzwG0ne49t
 WyZ+DYn8PC787NJRJCE1rsQA2hyWQUZLxyHZ85H0d+vJ/aCkMHOGpzsTEpl1oMa34cHitw+ZRUw
 HQddd+40Jdr93OpA=
X-Received: by 2002:a1c:7ed7:: with SMTP id z206mr12079643wmc.69.1634723004417; 
 Wed, 20 Oct 2021 02:43:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPPNUZu8v8an5rWlwi1VttM9gHDsYHzbcL3Og2YhT0Z/i4ouLTVaZ44a00RN/E7CMuL/SigA==
X-Received: by 2002:a1c:7ed7:: with SMTP id z206mr12079611wmc.69.1634723004106; 
 Wed, 20 Oct 2021 02:43:24 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id l5sm1545465wru.24.2021.10.20.02.43.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 02:43:23 -0700 (PDT)
Date: Wed, 20 Oct 2021 11:43:22 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 04/15] tests: acpi: q35: test for x2APIC entries in SRAT
Message-ID: <20211020114322.1c1c36e4@redhat.com>
In-Reply-To: <8b2dbf60-0e52-1a06-ff70-b6b253413aad@redhat.com>
References: <20210902113551.461632-1-imammedo@redhat.com>
 <20210902113551.461632-5-imammedo@redhat.com>
 <20211018173052-mutt-send-email-mst@kernel.org>
 <20211019114825.1464da19@redhat.com>
 <20211019061656-mutt-send-email-mst@kernel.org>
 <20211019133624.5cd5ae3d@redhat.com>
 <20211019074422-mutt-send-email-mst@kernel.org>
 <20211020101607.5181e69d@redhat.com>
 <20211020041734-mutt-send-email-mst@kernel.org>
 <20211020105348.7ef7cdd5@redhat.com>
 <8b2dbf60-0e52-1a06-ff70-b6b253413aad@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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
Cc: lvivier@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 20 Oct 2021 10:58:55 +0200
Thomas Huth <thuth@redhat.com> wrote:

> On 20/10/2021 10.53, Igor Mammedov wrote:
> > On Wed, 20 Oct 2021 04:18:07 -0400
> > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >   
> >> On Wed, Oct 20, 2021 at 10:16:07AM +0200, Igor Mammedov wrote:  
> >>> On Tue, 19 Oct 2021 07:44:38 -0400
> >>> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >>>      
> >>>> On Tue, Oct 19, 2021 at 01:36:24PM +0200, Igor Mammedov wrote:  
> >>>>> On Tue, 19 Oct 2021 06:23:40 -0400
> >>>>> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >>>>>        
> >>>>>> On Tue, Oct 19, 2021 at 11:48:25AM +0200, Igor Mammedov wrote:  
> >>>>>>> On Mon, 18 Oct 2021 17:31:33 -0400
> >>>>>>> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >>>>>>>          
> >>>>>>>> On Thu, Sep 02, 2021 at 07:35:40AM -0400, Igor Mammedov wrote:  
> >>>>>>>>> Set -smp 1,maxcpus=288 to test for ACPI code that
> >>>>>>>>> deal with CPUs with large APIC ID (>255).
> >>>>>>>>>
> >>>>>>>>> PS:
> >>>>>>>>> Test requires KVM and in-kernel irqchip support,
> >>>>>>>>> so skip test if KVM is not available.
> >>>>>>>>>
> >>>>>>>>> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> >>>>>>>>> ---
> >>>>>>>>> v3:
> >>>>>>>>>    - add dedicated test instead of abusing 'numamem' one
> >>>>>>>>>    - add 'kvm' prefix to the test name
> >>>>>>>>>        ("Michael S. Tsirkin" <mst@redhat.com>)
> >>>>>>>>> v2:
> >>>>>>>>>    - switch to qtest_has_accel() API
> >>>>>>>>>
> >>>>>>>>> CC: thuth@redhat.com
> >>>>>>>>> CC: lvivier@redhat.com
> >>>>>>>>> ---
> >>>>>>>>>   tests/qtest/bios-tables-test.c | 17 +++++++++++++++++
> >>>>>>>>>   1 file changed, 17 insertions(+)
> >>>>>>>>>
> >>>>>>>>> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> >>>>>>>>> index 51d3a4e239..1f6779da87 100644
> >>>>>>>>> --- a/tests/qtest/bios-tables-test.c
> >>>>>>>>> +++ b/tests/qtest/bios-tables-test.c
> >>>>>>>>> @@ -1033,6 +1033,19 @@ static void test_acpi_q35_tcg_numamem(void)
> >>>>>>>>>       free_test_data(&data);
> >>>>>>>>>   }
> >>>>>>>>>   
> >>>>>>>>> +static void test_acpi_q35_kvm_xapic(void)
> >>>>>>>>> +{
> >>>>>>>>> +    test_data data;
> >>>>>>>>> +
> >>>>>>>>> +    memset(&data, 0, sizeof(data));
> >>>>>>>>> +    data.machine = MACHINE_Q35;
> >>>>>>>>> +    data.variant = ".xapic";
> >>>>>>>>> +    test_acpi_one(" -object memory-backend-ram,id=ram0,size=128M"
> >>>>>>>>> +                  " -numa node -numa node,memdev=ram0"
> >>>>>>>>> +                  " -machine kernel-irqchip=on -smp 1,maxcpus=288", &data);
> >>>>>>>>> +    free_test_data(&data);
> >>>>>>>>> +}
> >>>>>>>>> +
> >>>>>>>>>   static void test_acpi_q35_tcg_nosmm(void)
> >>>>>>>>>   {
> >>>>>>>>>       test_data data;  
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> This causes an annoying message each time I run it:
> >>>>>>>>
> >>>>>>>> qemu-system-x86_64: -accel kvm: warning: Number of hotpluggable cpus requested (288) exceeds the recommended cpus supported by KVM (240)
> >>>>>>>>
> >>>>>>>> what gives?  
> >>>>>>>
> >>>>>>> it depends on kernel, see kvm_recommended_vcpus().
> >>>>>>>
> >>>>>>> We probably should bump it on upstream kernel side
> >>>>>>> (it's much more than that in RHEL8).
> >>>>>>>
> >>>>>>> Is there anything that prevents bumping upstream kernel limits?  
> >>>>>>
> >>>>>> what should we do with the annoying warning though?  
> >>>>>
> >>>>> I'd leave it alone.
> >>>>> What do you suggest?
> >>>>>         
> >>>>
> >>>> reduce the value so a typical system does not trigger it?  
> >>>
> >>> it won't work, test needs as minimum 255 vcpus to trigger X2APIC logic
> >>> and 288 value additionally tests max limits  
> >>
> >> Add a flag to disable the warning while running this specific test?  
> > 
> > if it were qtest accel, it would be trivial but
> > I'm not aware of something similar for tcg/kvm mode.
> > Do you suggest to add to QEMU a CLI option for that?  
> 
> I think you can still use qtest_enabled(), even if -accel kvm has been 
> specified on top?
I don't see how
   accel/qtest/qtest.c:    ac->allowed = &qtest_allowed;
   ...
   accel_init_machine(): *(acc->allowed) = true;

>   Thomas
> 


