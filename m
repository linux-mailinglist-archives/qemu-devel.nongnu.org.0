Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D36B834185A
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 10:32:07 +0100 (CET)
Received: from localhost ([::1]:56172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNBUE-0005Kk-UU
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 05:32:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lNBRK-00049n-Dp
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 05:29:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lNBRH-00080F-FS
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 05:29:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616146142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3kL2fbFJgNl7Yfy9FD5I0SNkr2FEVhpcVcM64WrkMDQ=;
 b=NroQeuJ4r7M4pylFhMtW8qOiwy9wr7clUyz/eSbBEq3rfShCZUAmIPvgWPwk1hfPelaMvs
 8dhivFMFfimbKEZQuQ3tBS2O1h4Ij7P1P2DkdtW/asOE6F4j3TbsIKeXYm1xiLOx51K99O
 psht0AERJdXb+uk7273uOp/MJ6tYlyk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-7Y71hOkbPamLV-Mz0P6I_A-1; Fri, 19 Mar 2021 05:29:00 -0400
X-MC-Unique: 7Y71hOkbPamLV-Mz0P6I_A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1DB2593A0;
 Fri, 19 Mar 2021 09:28:58 +0000 (UTC)
Received: from [10.36.112.11] (ovpn-112-11.ams2.redhat.com [10.36.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC0EA690FA;
 Fri, 19 Mar 2021 09:28:53 +0000 (UTC)
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>, qemu-devel@nongnu.org
References: <20210318174611.293520-1-andrey.gruzdev@virtuozzo.com>
 <20210318174611.293520-4-andrey.gruzdev@virtuozzo.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Subject: Re: [PATCH 3/3] migration: Pre-fault memory before starting
 background snasphot
Message-ID: <a5c70d97-0560-0f7e-309e-a07f60a2e1a3@redhat.com>
Date: Fri, 19 Mar 2021 10:28:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210318174611.293520-4-andrey.gruzdev@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Den Lunev <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> +/*
> + * ram_block_populate_pages: populate memory in the RAM block by reading
> + *   an integer from the beginning of each page.
> + *
> + * Since it's solely used for userfault_fd WP feature, here we just
> + *   hardcode page size to TARGET_PAGE_SIZE.
> + *
> + * @bs: RAM block to populate
> + */
> +volatile int ram_block_populate_pages__tmp;
> +static void ram_block_populate_pages(RAMBlock *bs)
> +{
> +    ram_addr_t offset = 0;
> +    int tmp = 0;
> +
> +    for (char *ptr = (char *) bs->host; offset < bs->used_length;
> +            ptr += TARGET_PAGE_SIZE, offset += TARGET_PAGE_SIZE) {

You'll want qemu_real_host_page_size instead of TARGET_PAGE_SIZE

> +        /* Try to do it without memory writes */
> +        tmp += *(volatile int *) ptr;
> +    }


The following is slightly simpler and doesn't rely on volatile semantics [1].
Should work on any arch I guess.

static void ram_block_populate_pages(RAMBlock *bs)
{
     char *ptr = (char *) bs->host;
     ram_addr_t offset;

     for (offset = 0; offset < bs->used_length;
          offset += qemu_real_host_page_size) {
	char tmp = *(volatile char *)(ptr + offset)

	/* Don't optimize the read out. */
	asm volatile ("" : "+r" (tmp));
}

Compiles to

     for (offset = 0; offset < bs->used_length;
     316d:       48 8b 4b 30             mov    0x30(%rbx),%rcx
     char *ptr = (char *) bs->host;
     3171:       48 8b 73 18             mov    0x18(%rbx),%rsi
     for (offset = 0; offset < bs->used_length;
     3175:       48 85 c9                test   %rcx,%rcx
     3178:       74 ce                   je     3148 <ram_write_tracking_prepare+0x58>
          offset += qemu_real_host_page_size) {
     317a:       48 8b 05 00 00 00 00    mov    0x0(%rip),%rax        # 3181 <ram_write_tracking_prepare+0x91>
     3181:       48 8b 38                mov    (%rax),%rdi
     3184:       0f 1f 40 00             nopl   0x0(%rax)
         char tmp = *(volatile char *)(ptr + offset);
     3188:       48 8d 04 16             lea    (%rsi,%rdx,1),%rax
     318c:       0f b6 00                movzbl (%rax),%eax
          offset += qemu_real_host_page_size) {
     318f:       48 01 fa                add    %rdi,%rdx
     for (offset = 0; offset < bs->used_length;
     3192:       48 39 ca                cmp    %rcx,%rdx
     3195:       72 f1                   jb     3188 <ram_write_tracking_prepare+0x98>


[1] https://programfan.github.io/blog/2015/04/27/prevent-gcc-optimize-away-code/


I'll send patches soon to take care of virtio-mem via RamDiscardManager -
to skip populating the parts that are supposed to remain discarded and not migrated.
Unfortunately, the RamDiscardManager patches are still stuck waiting for
acks ... and now we're in soft-freeze.

-- 
Thanks,

David / dhildenb


