Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 374431ECD11
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jun 2020 12:00:36 +0200 (CEST)
Received: from localhost ([::1]:58430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jgQCI-0004la-Qb
	for lists+qemu-devel@lfdr.de; Wed, 03 Jun 2020 06:00:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jgQBQ-0004Du-Cr
 for qemu-devel@nongnu.org; Wed, 03 Jun 2020 05:59:40 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:57505
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jgQBO-00058A-Qh
 for qemu-devel@nongnu.org; Wed, 03 Jun 2020 05:59:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591178377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y7HqFGk4q+sWGy8klh1Xa/5XHnHoqYEz82VFlHBwH2A=;
 b=CWSWA6fuW536dwvZvt7PBeYMSPK8QX3sco6wBIqCZZ61kEWs6EGlnBvrrvuQRHpOF3S+eX
 zk0C+1dWSbgoBOLIipfFBwDKjP7sjv8OFzuVlqa8Lb/Pj17kD3hk2bn++CGa9JeLTbo5ms
 v3+q7viZqfaxkPkX1e32gSgmM4Y9Ka8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-dCqglwHDMKGG48U9-60jtw-1; Wed, 03 Jun 2020 05:59:35 -0400
X-MC-Unique: dCqglwHDMKGG48U9-60jtw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B83B98018A5;
 Wed,  3 Jun 2020 09:59:34 +0000 (UTC)
Received: from [10.36.113.56] (ovpn-113-56.ams2.redhat.com [10.36.113.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C379260BE1;
 Wed,  3 Jun 2020 09:59:24 +0000 (UTC)
Subject: Re: [Question] Regarding PMU initialization within the QEMU for ARM
 VCPUs
To: Andrew Jones <drjones@redhat.com>, Salil Mehta <salil.mehta@huawei.com>
References: <b2e401cd17fe49d792d09b31bd726e35@huawei.com>
 <20200603093745.dwfb55ny34az7rez@kamzik.brq.redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <fb9cf73c-e94b-b7f9-1d11-dc0353dd3996@redhat.com>
Date: Wed, 3 Jun 2020 11:59:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200603093745.dwfb55ny34az7rez@kamzik.brq.redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/03 01:04:35
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mst@redhat.com" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Drew,

On 6/3/20 11:37 AM, Andrew Jones wrote:
> On Mon, Jun 01, 2020 at 03:04:33PM +0000, Salil Mehta wrote:
>> Hello,
>> I could see below within function fdt_add_pmu_nodes() part of
>> hw/arm/virt.c during virt machine initialization time:
>>
>> Observation:
>> In below function, support of PMU feature is being checked for
>> each vcpu and if the PMU is found part of the features then PMU
>> is initialized with in the host/KVM. But if there is even one
>> vcpu which is found to not support the PMU then loop is exited
>> and PMU is not initialized for the rest of the vcpus as well.
>>
>> Questions:
>> Q1. Not sure what is the logic of the premature exit and not
>>     continuing with further checks and initialization of other
>>     VCPU PMUs?
> 
> KVM requires all VCPUs to have a PMU if one does.

I fail to find where this is enforced? Do you know the place?

 If the ARM ARM
> says it's possible to have PMUs for only some CPUs, then, for TCG,
> the restriction could be relaxed. I expect it will take more than
> just removing the check for things to work though.>
>> Q2. Does it even makes sense to have PMUs initialized for some
>>     vcpus and not for others unless we have heterogeneous system? 
> 
> I don't know, but it doesn't sound like a configuration I'd like
> to see.
> 
>> Q3. Also, there is a per virt machine knob of vcc->no_pmu.
>>     This is something which user could specify at the init time
>>     and perhaps only once but we don't use it for ARM. Perhaps
>>     should have been used even before entering this function
>>     to enable or disable the support as per user config?
> 
> It's purpose is to keep users from doing 'pmu=on' on 2.6 machine
> types. On 2.7 and later machine types if you don't want a PMU
> you should use 'pmu=off'.

extra note:
the cpu pmu property sets the feature at vcpu level. This is what is
retrieved when (!arm_feature(&armcpu->env, ARM_FEATURE_PMU)) gets called.

See the cpu option setter: arm_set_pmu in target/arm/cpu.c

> 
>> Q4. This function  fdt_* looks to be wrongly named. The info
>>     being initialized here shall be used even when ACPI is
>>     being used. Initialization part and FDT info looked
>>     mixed up here if I am right?
> 
> Agreed. The function has the wrong name. mach-virt has many functions that
> mix the initialization and fdt building together, but those functions are
> named something like create_foo(). Patches welcome.
agreed

Thanks

Eric
> 
> Thanks,
> drew
> 
> 


