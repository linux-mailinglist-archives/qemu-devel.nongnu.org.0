Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC5F4BFEF4
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 17:38:09 +0100 (CET)
Received: from localhost ([::1]:49024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMYAy-0003HR-4k
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 11:38:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nMXpw-0007a8-Sh
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 11:16:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nMXpt-0005VZ-PD
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 11:16:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645546580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kyda9fuiyrNp785r93zcm2PZO75JGhaKK4GSZZhdK3Q=;
 b=K6eJyCPy0BHRMmpGkLmW94KPVH0OU+KRMSoGHyAXaIe0P6ojMN1keZYsS+UAl3yuozTYhz
 NUvp/rJLPRvcjEJTz1p0XaUbJXLQxm6Pi2h5VI7L68LBLXOTS1l96UMd85YO+fjGUfxxuQ
 d+R86AWx8cdrtj51s1UG64YjpHR29+Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-331-uvawtmBvPlSEeNwGMpPQOg-1; Tue, 22 Feb 2022 11:16:18 -0500
X-MC-Unique: uvawtmBvPlSEeNwGMpPQOg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A323A804311;
 Tue, 22 Feb 2022 16:16:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7FDB283787;
 Tue, 22 Feb 2022 16:15:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0F76021B9F8B; Tue, 22 Feb 2022 17:15:57 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH] hw/mem/pc-dimm: Fix error message if no slots were
 defined some more
References: <20220222152211.1209292-1-armbru@redhat.com>
 <ef91857f-e343-580e-3f3c-d5e36c078e25@redhat.com>
Date: Tue, 22 Feb 2022 17:15:57 +0100
In-Reply-To: <ef91857f-e343-580e-3f3c-d5e36c078e25@redhat.com> (David
 Hildenbrand's message of "Tue, 22 Feb 2022 16:24:40 +0100")
Message-ID: <87r17uj2rm.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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
Cc: ani@anisinha.ca, imammedo@redhat.com, qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

David Hildenbrand <david@redhat.com> writes:

> On 22.02.22 16:22, Markus Armbruster wrote:
>> The error message added in commit 3ff333effa "pc-dimm: fix error
>> messages if no slots were defined" is misleading:
>> 
>>     $ qemu-system-x86_64 -object memory-backend-file,id=mem1,size=1M,mem-path=1G.img -device pc-dimm,id=dimm1,memdev=mem1
>>     qemu-system-x86_64: -device pc-dimm,id=dimm1,memdev=mem1: no slots where allocated, please specify the 'slots' option
>>     $ qemu-system-x86_64 -object memory-backend-file,id=mem1,size=1M,mem-path=1G.img -device pc-dimm,id=dimm1,memdev=mem1,slots=0
>>     qemu-system-x86_64: -device pc-dimm,id=dimm1,memdev=mem1,slots=0: Property 'pc-dimm.slots' not found
>> 
>> The property it called 'slot', not 'slots'.  With that fixed, we get
>> another bad error message:
>> 
>>     $ qemu-system-x86_64 -object memory-backend-file,id=mem1,size=1M,mem-path=1G.img -device pc-dimm,id=dimm1,memdev=mem1,slot=0
>>     qemu-system-x86_64: -device pc-dimm,id=dimm1,memdev=mem1,slot=0: invalid slot number 0, valid range is [0-18446744073709551615]
>> 
>> Left for another day.
>> 
>
> We're referring to the "-m 2g,maxmem=8g,slots=5" slots parameter. And I
> agree that we can make that clearer somehow :)

Aha!

So this patch actually moves us sideways rather than forward.  Please
ignore it.

A patch that moves us forward would be nice :)


