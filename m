Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D650C69FCF9
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 21:25:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUvfp-0000Su-Su; Wed, 22 Feb 2023 15:25:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pUvfd-0000Qi-BQ
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 15:24:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pUvfZ-0002cd-Qc
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 15:24:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677097493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+ThRR9ZvME1UJFsVA+tDom+uoEmK2FkyktvVEkOXtTk=;
 b=UZAItqdoBnfGSaXbldoFr7qlwElvg40hbuEKL3NOJwtiHCUbMksQpSi+/ZeW+k1Ojz+T5P
 jCmdSuChtouHrCarzmXbuDPN9FND0s2QKUqBtLIpVcPejeCK5j3eUAtqD7nouXOUpr0CeB
 B7vVzfgwuq3GwFvH82b6eIGKS8bLcQg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-354-Xu7GH-QlNhubExWk2qX7_g-1; Wed, 22 Feb 2023 15:24:51 -0500
X-MC-Unique: Xu7GH-QlNhubExWk2qX7_g-1
Received: by mail-wr1-f69.google.com with SMTP id
 c14-20020adffb0e000000b002bfda39265aso2144932wrr.13
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 12:24:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+ThRR9ZvME1UJFsVA+tDom+uoEmK2FkyktvVEkOXtTk=;
 b=k/ZtFc6G9PshMGlGZ0sP1cVXVWFUAdL0lIgA8H3v4SkR+8GUrA5qAu4PmwqPrr3PFA
 gBvOLTknU9/aU8fSKkDdj24ZCgTs8WFTtQJZb+zfdn3etWkvCN4oa2I+1LtXRwkmnpMw
 UKr30QYQ0XjA9NPxgm981TT4jRn5YOKsORvk5SnHxBnBJtSJkuCVf9jltiDu2L65Y/33
 CPDr35eWhRZSNIHKC/adZSihi5E8Kj2qFbMUc+EkyFflVAmW1IFguZRXix65NIu6PlU1
 Jx71F7jT22H9EH9dpI8yvhQ84CZuS0J16qP5zHPm3sOQ47TgBAkowBud/fGva4S1AVd8
 8qfg==
X-Gm-Message-State: AO0yUKWV0IGFNhuNrtRaTXIyFADi8Hb7Gln8NuZgfBtLVRK8hmwkfypm
 8r2dIavqwfDcoY9MRGAFu3DaPyvDlW+/R8FbdRs7rWeYkJUbDUniUuMPtS9hp2JbEOZJSwKq0Q8
 u9x5OJmUEPRvVZbKPcrAH
X-Received: by 2002:a05:600c:16c5:b0:3dc:37d0:e9df with SMTP id
 l5-20020a05600c16c500b003dc37d0e9dfmr1885107wmn.14.1677097489950; 
 Wed, 22 Feb 2023 12:24:49 -0800 (PST)
X-Google-Smtp-Source: AK7set87/ouQZkQgYQmjpUh0hD8ezXB9tR/mdUReJu+xA7XG0mIcJ6pXah+0w57h6Tjj4QuA7nBrhw==
X-Received: by 2002:a05:600c:16c5:b0:3dc:37d0:e9df with SMTP id
 l5-20020a05600c16c500b003dc37d0e9dfmr1885094wmn.14.1677097489556; 
 Wed, 22 Feb 2023 12:24:49 -0800 (PST)
Received: from redhat.com ([2.52.2.78]) by smtp.gmail.com with ESMTPSA id
 w18-20020a05600c475200b003e220998b6bsm10486554wmo.17.2023.02.22.12.24.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 12:24:48 -0800 (PST)
Date: Wed, 22 Feb 2023 15:24:44 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Thomas Huth <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Ani Sinha <ani@anisinha.ca>,
 Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v4 3/9] hw/i386/pc_q35: Reuse machine parameter
Message-ID: <20230222152331-mutt-send-email-mst@kernel.org>
References: <20230213162004.2797-1-shentey@gmail.com>
 <20230213162004.2797-4-shentey@gmail.com>
 <9f80bb33-40e7-fc57-1515-c3764f57da46@linaro.org>
 <CAG4p6K6JSkv3VqwUc3CYhfq0EbR7feKLBquduP_p4143DnaGig@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG4p6K6JSkv3VqwUc3CYhfq0EbR7feKLBquduP_p4143DnaGig@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Feb 22, 2023 at 06:52:02PM +0100, Bernhard Beschow wrote:
> Am 22. Februar 2023 11:03:38 UTC schrieb "Philippe Mathieu-Daudé"
> <philmd@linaro.org>:
> >On 13/2/23 17:19, Bernhard Beschow wrote:
> >> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> >> Reviewed-by: Thomas Huth <thuth@redhat.com>
> >> ---
> >>   hw/i386/pc_q35.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> >> index 66cd718b70..dee2b38474 100644
> >> --- a/hw/i386/pc_q35.c
> >> +++ b/hw/i386/pc_q35.c
> >> @@ -218,7 +218,7 @@ static void pc_q35_init(MachineState *machine)
> >>       pc_memory_init(pcms, get_system_memory(), rom_memory, &ram_memory,
> >>                      pci_hole64_size);
> >>   -    object_property_add_child(qdev_get_machine(), "q35", OBJECT(q35_host));
> >> +    object_property_add_child(OBJECT(machine), "q35", OBJECT(q35_host));
> >>       object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_RAM_MEM,
> >>                                OBJECT(ram_memory), NULL);
> >>       object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_PCI_MEM,
> >
> >Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> >
> >Long term we should duplicate/extract Q35MachineState from
> >PCMachineState and add a Q35PCIHost field, then use object_initialize_child; removing this object_property_add_child()
> >call.
> 
> The Q35 and PC machines duplicate a lot of code indeed. So I was
> thinking more along the lines of consolidating with pc_piix ;)

The reason is that we are trying to limit changes to pc_piix and
focus development on Q35.

> The
> idea would be to get a peek preview into a configuration-driven future
> where the PCI host bridges (Q35 or I440FX) are dynamically
> instantiated based on configuration data. They would also be
> configured through their QOM interfaces only.
> 
> I've submitted a series where the Q35 host bridge gets a QOM cleanup
> [1] and I've got a series locally resolving i440fx_init(). Both series
> combined bring these two device models close together regarding their
> QOM interface. I've not submitted the i440fx series yet since it is
> blocked by this series.
> 
> One further step for pc_q35 and pc_piix consolidation would be to
> factor ICH9 PCI devices (not functions!) into self-contained models,
> like is underway with PIIX(3). I've started with ICH9 cleanup already
> [2] and I'm waiting for the PIIX consolidation to land in order to be
> able to make more progress here.
> 
> Note that pc_q35 and pc_piix consolidation is just an idea for now
> which could also turn out to be a bad one. If the two machines just
> ended up sharing more code that could IMO be considered a success as
> well.
> 
> Best regards,
> Bernhard
> 
> [1] https://patchew.org/QEMU/20230214131441.101760-1-shentey@gmail.com/
> [2] https://patchew.org/QEMU/20230213173033.98762-1-shentey@gmail.com/


