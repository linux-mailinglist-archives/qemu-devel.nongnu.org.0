Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A532F0ED5
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 10:16:53 +0100 (CET)
Received: from localhost ([::1]:35472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kytJj-00078s-0b
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 04:16:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kytHi-0006FL-MQ
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 04:14:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kytHg-0001zE-Cy
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 04:14:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610356482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9ET5Lqe2SSaQzvAe+irZD4eDXOi4IYZnLBfZDgMigDM=;
 b=GcnD0N10eYZ/z6qpIXWluYv5H8XAotp6k3rmjSYa9hS5YI8g6ezTmB0Zlk1zGWZN+AGBQ7
 5Nrk06uKbi7rDH15h8fp4Dwsg7Ngzgw4w83LYoiK+SBjHsaRrv6PxH/+MryuKam29F2JK/
 gn9hv+rfuKgQ2d7pF8pPk8zMTXf3qPg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-47zFhXAJP4qf6rjaMyngmA-1; Mon, 11 Jan 2021 04:14:38 -0500
X-MC-Unique: 47zFhXAJP4qf6rjaMyngmA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 055D88144E5;
 Mon, 11 Jan 2021 09:14:36 +0000 (UTC)
Received: from [10.36.115.103] (ovpn-115-103.ams2.redhat.com [10.36.115.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1CB201C4;
 Mon, 11 Jan 2021 09:14:33 +0000 (UTC)
Subject: Re: [PATCH v2 0/4] s390x/tcg: fix booting Linux kernels compiled with
 clang-11 and clang-12
To: Guenter Roeck <linux@roeck-us.net>, qemu-devel@nongnu.org
References: <20210108132049.8501-1-david@redhat.com>
 <466de7db-d2bd-4091-5f62-f49c8e4d872c@roeck-us.net>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <231a06cf-08e5-4d4e-9e10-f535e18463c7@redhat.com>
Date: Mon, 11 Jan 2021 10:14:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <466de7db-d2bd-4091-5f62-f49c8e4d872c@roeck-us.net>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.012, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Nick Desaulniers <ndesaulniers@google.com>,
 Heiko Carstens <hca@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08.01.21 20:21, Guenter Roeck wrote:
> On 1/8/21 5:20 AM, David Hildenbrand wrote:
>> This series fixes booting current upstream Linux kernel compiled by
>> clang-11 and clang-12 under TCG.
>>
>> Decided to pull in already separatly sent patches. The last patch is
>> not required to fix the boot issues, but related to patch #3.
>>
>> Latest version of the patches available at:
>> git@github.com:davidhildenbrand/qemu.git clang
>>
>> v1 -> v2:
>> - Add 's390x/tcg: Don't ignore content in r0 when not specified via "b" or
>>   "x"'
>> - Add 's390x/tcg: Ignore register content if b1/b2 is zero when handling
>>   EXEUTE'
>> - "s390x/tcg: Fix ALGSI"
>> -- Fixup subject
>> - "s390x/tcg: Fix RISBHG"
>> -- Rephrase description, stating that it fixes clang-11
>>
>> David Hildenbrand (4):
>>   s390x/tcg: Fix ALGSI
>>   s390x/tcg: Fix RISBHG
>>   s390x/tcg: Only ignore content in r0 when specified via "b" or "x"
>>   s390x/tcg: Ignore register content if b1/b2 is zero when handling
>>     EXECUTE
>>
>>  target/s390x/insn-data.def | 10 +++++-----
>>  target/s390x/mem_helper.c  |  4 ++--
>>  target/s390x/translate.c   | 33 +++++++++++++++++----------------
>>  3 files changed, 24 insertions(+), 23 deletions(-)
>>
> 
> FWIW, for the series, with gcc 8.3.0 and 10.2.0, booting Linux kernel
> v5.11-rc2-178-gf5e6c330254a:
> 
> Tested-by: Guenter Roeck <linux@roeck-us.net>
> 
> Guenter
> 

Thanks Guenter, appreciated!

-- 
Thanks,

David / dhildenb


