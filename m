Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE08321E5F
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 18:43:26 +0100 (CET)
Received: from localhost ([::1]:47630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEFEz-0002Px-66
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 12:43:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lEF7C-0000pd-T5
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 12:35:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lEF79-0000CZ-M0
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 12:35:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614015319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CCBuxvP+0f8vQ1vH+Q2GUi71W7zfny5IKXWjc5Ao9ic=;
 b=HiB/vPiiS8lMAP3MTRWMqKJrrYwaCq/dNwtBV16EDq9VkkaTXGjqWLf7Kwkb0Hgh2BkaWb
 o/qVHzO3BILSiMTNSKyRX1/Hoiu8RStAZZTUkfpKfY7dU4jC3IahTlrvBIdVfb9BQ+jcg2
 gIqbSz4pEil087KGH1/HShTlkax4F6Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-GuJmBRy8Odqu1dvnQ-eG-g-1; Mon, 22 Feb 2021 12:35:17 -0500
X-MC-Unique: GuJmBRy8Odqu1dvnQ-eG-g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1DC6D18C229D;
 Mon, 22 Feb 2021 17:34:57 +0000 (UTC)
Received: from [10.36.115.16] (ovpn-115-16.ams2.redhat.com [10.36.115.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 838B16C932;
 Mon, 22 Feb 2021 17:34:01 +0000 (UTC)
Subject: Re: [PATCH v6 05/12] vfio: Support for RamDiscardMgr in the !vIOMMU
 case
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210222115708.7623-1-david@redhat.com>
 <20210222115708.7623-6-david@redhat.com>
 <5920c566-6f4b-8935-bf4c-b941a67152aa@redhat.com>
 <0aaa0fe2-9fac-5cbb-59f8-e087b2397a55@redhat.com>
 <95e52a5e-5af9-8739-b15b-5086ecfe5efd@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <d42fa44b-3356-4772-1bd9-88b54e027e58@redhat.com>
Date: Mon, 22 Feb 2021 18:34:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <95e52a5e-5af9-8739-b15b-5086ecfe5efd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>, Igor Mammedov <imammedo@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.02.21 18:29, Paolo Bonzini wrote:
> On 22/02/21 15:43, David Hildenbrand wrote:
>>> Also, why can't you just pass vrdl to the call?
>>
>> I have to modify the callbacks. Similarly done for
>> memory_region_iommu_replay().
> 
> Since replay_populate only uses a single callback, that suggests using a
> function pointer instead of the RamDiscardListener*.

Yep, already changed that. Thanks!


-- 
Thanks,

David / dhildenb


