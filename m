Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A9160619B
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 15:26:51 +0200 (CEST)
Received: from localhost ([::1]:38896 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olVZ5-000488-3K
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 09:26:31 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olVA4-0007Qt-Hs
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 09:00:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1olTUl-0003bB-Qy
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:13:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1olTUh-0006qU-P2
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:13:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666264420;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Icpr9TIKW3pdbwf7eBbyJZbn19syVkSVZM9f8vHXz7E=;
 b=I14MvK6OuDcsSjway2CaxzNr2iWDt/hKxELlwsBCiOVUAljtddoR9BClC63irMJAq456b4
 v7Q6asvtKos4YKeDW/smCv1gUFGWXctIeAzVxM2sTkXDIHQJ9cBUaao7g5pRqvUywl/CuW
 c0mhRHsTcEeHHXCN0AkSpm/jYeADseA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-130-mmHrmiQsOJu_ndMsSvUcIg-1; Thu, 20 Oct 2022 07:13:35 -0400
X-MC-Unique: mmHrmiQsOJu_ndMsSvUcIg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 05DF01017E6D;
 Thu, 20 Oct 2022 11:13:29 +0000 (UTC)
Received: from [10.64.54.70] (vpn2-54-70.bne.redhat.com [10.64.54.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 585F049BB60;
 Thu, 20 Oct 2022 11:13:20 +0000 (UTC)
Subject: Re: [PATCH v5 6/6] hw/arm/virt: Add 'compact-highmem' property
To: Marc Zyngier <maz@kernel.org>
Cc: eric.auger@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 cohuck@redhat.com, zhenyzha@redhat.com, richard.henderson@linaro.org,
 peter.maydell@linaro.org, shan.gavin@gmail.com
References: <20221011231832.149839-1-gshan@redhat.com>
 <20221011231832.149839-7-gshan@redhat.com>
 <9a43b31a-63d7-d312-870d-168df1b41921@redhat.com>
 <6566e453-9b05-7092-f112-ea9e523be8b4@redhat.com>
 <865ygeg77q.wl-maz@kernel.org>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <e21444e9-f7b4-1006-7a2d-ca36afcdfde2@redhat.com>
Date: Thu, 20 Oct 2022 19:13:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <865ygeg77q.wl-maz@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: Gavin Shan <gshan@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Marc,

On 10/20/22 5:44 PM, Marc Zyngier wrote:
> On Thu, 20 Oct 2022 00:57:32 +0100,
> Gavin Shan <gshan@redhat.com> wrote:
>>
>> For Marc's suggestion to add properties so that these high memory
>> regions can be disabled by users. I can add one patch after this one
>> to introduce the following 3 properties. Could you please confirm
>> the property names are good enough? It's nice if Marc can help to
>> confirm before I'm going to work on next revision.
>>
>>      "highmem-ecam":    "on"/"off" on vms->highmem_ecam
>>      "highmem-mmio":    "on"/"off" on vms->highmem_mmio
>>      "highmem-redists": "on"/"off" on vms->highmem_redists
> 
> I think that'd be reasonable, and would give the user some actual
> control over what gets exposed in the highmem region.
> 
> I guess that the annoying thing with these options is that they allow
> the user to request conflicting settings (256 CPUs and
> highmem-redists=off, for example). You'll need to make this fail more
> or less gracefully.
> 

Thanks for the quick confirm. The check is already existing in machvirt_init().
I think what we need is simply to calculate 'virt_max_cpus' with consideration
to 'highmem-redists' property there.

     if (max_cpus > virt_max_cpus) {
         error_report("Number of SMP CPUs requested (%d) exceeds max CPUs "
                      "supported by machine 'mach-virt' (%d)",
                      max_cpus, virt_max_cpus);
         exit(1);
     }

Thanks,
Gavin


