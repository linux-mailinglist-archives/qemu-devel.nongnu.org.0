Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D282F6311
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 15:26:37 +0100 (CET)
Received: from localhost ([::1]:40838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l03a8-0002ax-BX
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 09:26:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l03YO-0001SE-Mf
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 09:24:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l03YJ-00014H-RR
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 09:24:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610634281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ag4vKmYpZ5/PgysLvQ9xCHsQvaAsvwH5/7Zz1nRgOek=;
 b=GSKdSvYR6zPGPswcqu2ll6qHpeFuyel+nbaIBMGe73AIx7J54e3GzqD26Ps0/arDIXFTUr
 WWhQD552QBtji59zcvRpppLE0thxxHdwxU6hs0ioFh97+48DRbFS8OSPuaDAit8OdMsK/+
 Ry7613yQsmTgvCd9BW2tJEPvfTjWkY8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-AScxKUe7NYuavmMgTbrFQA-1; Thu, 14 Jan 2021 09:24:38 -0500
X-MC-Unique: AScxKUe7NYuavmMgTbrFQA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57E4F9CC1C;
 Thu, 14 Jan 2021 14:24:36 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-114-110.ams2.redhat.com
 [10.36.114.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 247445D71D;
 Thu, 14 Jan 2021 14:24:27 +0000 (UTC)
Subject: Re: [PATCH v4 2/8] acpi: Fix unmatched expected DSDT.pxb file
To: Jiahui Cen <cenjiahui@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20210107114043.9624-1-cenjiahui@huawei.com>
 <20210107114043.9624-3-cenjiahui@huawei.com>
 <20210113085942-mutt-send-email-mst@kernel.org>
 <2315137c-c6fc-8c6e-b0b4-122e8c3998d1@huawei.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <eb624354-98cd-eb9e-1f9f-f1095f25152a@redhat.com>
Date: Thu, 14 Jan 2021 15:24:25 +0100
MIME-Version: 1.0
In-Reply-To: <2315137c-c6fc-8c6e-b0b4-122e8c3998d1@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: xieyingtai@huawei.com, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ard Biesheuvel <ard.biesheuvel@arm.com>, wu.wubin@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/14/21 02:30, Jiahui Cen wrote:
> Hi Michael,
> 
> On 2021/1/13 22:00, Michael S. Tsirkin wrote:
>> On Thu, Jan 07, 2021 at 07:40:37PM +0800, Jiahui Cen wrote:
>>> Commit fe1127da11 ("unit-test: Add the binary file and clear diff.h") does not
>>> use the up-to-date expected file for pxb for ARM virt.
>>>
>>> Fix the expected DSDT.pxb file.
>>>
>>> Full diff of changed file disassembly:
>>>
>>> diff -ru /tmp/old/tests/data/acpi/virt/DSDT.pxb.dsl /tmp/new/tests/data/acpi/virt/DSDT.pxb.dsl
>>> --- /tmp/old/tests/data/acpi/virt/DSDT.pxb.dsl  2021-01-07 17:04:51.246831080 +0800
>>
>> This --- sign confuses git am. You shouldn't put this in the commit log
>> really ...
>>
> 
> Yes, it does confuse. I found there were some patches with commit log
> like this, so I did the same :(
> 
> So, I'll modify the commit logs and resend them.

It's OK to include diffs in the commit message or in the Notes section
of the patch, in general, but such diffs should always be indented, or
quoted in email-style (angle bracket on the left side), covering *all*
parts of the diff (headers, hunk headers, etc).

Laszlo


