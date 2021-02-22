Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C820E32152A
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 12:32:46 +0100 (CET)
Received: from localhost ([::1]:51634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE9SH-0003e7-Sb
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 06:32:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lE9QA-00037w-Gq
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 06:30:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lE9Q3-0005rB-1K
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 06:30:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613993424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=erOluhgo1sGP9//1WgDuOpfFpdN2ZFLpoP/e4epbhZo=;
 b=Pbi0bDRgLH/aQcibkm9NtmsST7qYy8kEsO5q+bfpjuUPg9rYmb0soUdpvIYlMP4X+z71kN
 kU1EMG9nqze/87yea4olsc8Tac9SXAej9GXCcleqmt9KEmByOuEobl99z33JrRipsMClYn
 04bShqaRFpNEJq04p57RrErnL/K34EQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-HwrYagBpPuOLa0tJz14ICw-1; Mon, 22 Feb 2021 06:30:23 -0500
X-MC-Unique: HwrYagBpPuOLa0tJz14ICw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0248192CC4D;
 Mon, 22 Feb 2021 11:30:18 +0000 (UTC)
Received: from [10.36.115.16] (ovpn-115-16.ams2.redhat.com [10.36.115.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 37F021F0;
 Mon, 22 Feb 2021 11:30:00 +0000 (UTC)
Subject: Re: [PATCH v5 03/11] virtio-mem: Implement RamDiscardMgr interface
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20210121110540.33704-1-david@redhat.com>
 <20210121110540.33704-4-david@redhat.com> <20210127201441.GR3052@work-vm>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <05a25150-730b-930a-c995-94389a0d9a89@redhat.com>
Date: Mon, 22 Feb 2021 12:29:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210127201441.GR3052@work-vm>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Auger Eric <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>> +    if (ret) {
>> +        /* Could be a mapping attempt resulted in memory getting populated. */
>> +        ret2 = ram_block_discard_range(vmem->memdev->mr.ram_block, offset,
>> +                                       size);
>> +        if (ret2) {
>> +            error_report("Unexpected error discarding RAM: %s",
>> +                         strerror(-ret2));
> 
> Not a blocker, but it's good to include the RAMBlock/offset/size in
> errors like these.

Having a second look, ram_block_discard_range() already properly prints 
errors including details. I think I can drop this error_report 
completely (all errors when discarding are unexpected).

-- 
Thanks,

David / dhildenb


