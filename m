Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7632121EDAD
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jul 2020 12:11:42 +0200 (CEST)
Received: from localhost ([::1]:33036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jvHuX-0002yD-Hm
	for lists+qemu-devel@lfdr.de; Tue, 14 Jul 2020 06:11:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1jvHtl-0002Sh-41
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 06:10:53 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:30537
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1jvHtj-0006dS-8f
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 06:10:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594721449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oMDnVWEpTUzLV31I1XZ5YZskdzORPUPuwkc4Xmkiu3E=;
 b=iWdApFyHw64WqMGxaStaW9abm6jLyVEGUdKUIVd0hMvDdq5x4wb2ICS9eRKVKdXzgo4U4i
 ZdeMudWa0h3ABhOL98C5BF160irBMsGdXrsyP08nQ5vJpjm3TJXBlLYt2sH60GbmnpsQ/I
 I46viEJytgMfZehTAgvmh2ynWYX4QzI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-Zn6IUHCmOcyNiPY6oXjGrQ-1; Tue, 14 Jul 2020 06:10:48 -0400
X-MC-Unique: Zn6IUHCmOcyNiPY6oXjGrQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4C648027EE;
 Tue, 14 Jul 2020 10:10:46 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-114-110.ams2.redhat.com
 [10.36.114.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0428B2DE68;
 Tue, 14 Jul 2020 10:10:45 +0000 (UTC)
Subject: Re: [RFC 0/3] x86: fix cpu hotplug with secure boot
From: Laszlo Ersek <lersek@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20200710161704.309824-1-imammedo@redhat.com>
 <b0a2e023-9669-027e-7234-2e9ca53b8a1f@redhat.com>
Message-ID: <ac0d7032-108e-1f82-f6cb-b2f3fecd3cf8@redhat.com>
Date: Tue, 14 Jul 2020 12:10:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Firefox/52.0 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <b0a2e023-9669-027e-7234-2e9ca53b8a1f@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=lersek@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/13 21:44:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: boris.ostrovsky@oracle.com, liran.alon@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/14/20 11:58, Laszlo Ersek wrote:
> On 07/10/20 18:17, Igor Mammedov wrote:
>> CPU hotplug with Secure Boot was not really supported and firmware wasn't aware
>> of hotplugged CPUs (which might lead to guest crashes). During 4.2 we introduced
>> locked SMI handler RAM arrea to make sure that guest OS wasn't able to inject
>> its own SMI handler and OVMF added initial CPU hotplug support.
>>
>> This series is QEMU part of that support [1] which lets QMVF tell QEMU that
>> CPU hotplug with SMI broadcast enabled is supported so that QEMU would be able
>> to prevent hotplug in case it's not supported and trigger SMI on hotplug when
>> it's necessary. 
>>
>> 1) CPU hotplug negotiation part was introduced later so it might not be
>> in upstream OVMF yet or I might have missed the patch on edk2-devel
>> (Laszlo will point out to it/post formal patch)
> 
> I'll post it later, after testing it with this patch series.

(For the time being I had only attached it to
<https://bugzilla.redhat.com/show_bug.cgi?id=1849177#c1>.)

> 
> Thanks!
> Laszlo
> 
>>
>> Igor Mammedov (3):
>>   x86: lpc9: let firmware negotiate CPU hotplug SMI feature
>>   x86: cphp: prevent guest crash on CPU hotplug when broadcast SMI is in
>>     use
>>   x68: acpi: trigger SMI before scanning for hotplugged CPUs
>>
>>  include/hw/acpi/cpu.h  |  1 +
>>  include/hw/i386/ich9.h |  1 +
>>  hw/acpi/cpu.c          |  6 ++++++
>>  hw/acpi/ich9.c         | 12 +++++++++++-
>>  hw/i386/acpi-build.c   | 33 ++++++++++++++++++++++++++++++++-
>>  hw/i386/pc.c           | 15 ++++++++++++++-
>>  hw/isa/lpc_ich9.c      | 10 ++++++++++
>>  7 files changed, 75 insertions(+), 3 deletions(-)
>>
> 


