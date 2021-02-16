Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFAC31D07B
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 19:53:50 +0100 (CET)
Received: from localhost ([::1]:40196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC5Tq-0007ig-0H
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 13:53:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lC5R0-0005nC-Do
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 13:50:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lC5Qy-0001wA-Lg
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 13:50:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613501451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7SpqN4QggzB6TyEu4x1ZFNYSw8xZSCC3xPQYgpioOtk=;
 b=QLhtsuEuQfZKuPNdjhW1TgAd4CMMXbvcBN928eVFXZw7VOH8qq7u+rUeZTwzInXpzqiNCL
 a5vuhJuDs9dFZXkR7nBq4Il0H9GrzYZ2fyHM56js35AtrKQeIKOypall8rcWhePbAiUiq8
 zFOqDFzJnaJS9EQgZA3yVv+cUx5o4cc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-MpdbI1FcMw2YsbuNXzNWEA-1; Tue, 16 Feb 2021 13:50:48 -0500
X-MC-Unique: MpdbI1FcMw2YsbuNXzNWEA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D33C88463A1;
 Tue, 16 Feb 2021 18:50:41 +0000 (UTC)
Received: from [10.36.114.70] (ovpn-114-70.ams2.redhat.com [10.36.114.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 652FD70484;
 Tue, 16 Feb 2021 18:50:26 +0000 (UTC)
Subject: Re: [PATCH v5 01/11] memory: Introduce RamDiscardMgr for RAM memory
 regions
To: qemu-devel@nongnu.org
References: <20210121110540.33704-1-david@redhat.com>
 <20210121110540.33704-2-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <f1085e70-a0ea-65ae-a029-8bfe482059cc@redhat.com>
Date: Tue, 16 Feb 2021 19:50:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210121110540.33704-2-david@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Marek Kedzierski <mkedzier@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 teawater <teawaterz@linux.alibaba.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> +    /**
> +     * @is_populated:
> +     *
> +     * Check whether the given range within the #MemoryRegion is completely
> +     * populated (i.e., no parts are currently discarded). There are no
> +     * alignment requirements for the range.
> +     *
> +     * @rdm: the #RamDiscardMgr
> +     * @mr: the #MemoryRegion
> +     * @offset: offset into the #MemoryRegion
> +     * @size: size in the #MemoryRegion
> +     *
> +     * Returns whether the given range is completely populated.
> +     */
> +    bool (*is_populated)(const RamDiscardMgr *rdm, const MemoryRegion *mr,
> +                         ram_addr_t start, ram_addr_t offset);

Minor thing I noticed in the meanwhile: Variable naming here is wrong. 
Last line should be:

"ram_addr_t offset, ram_addr_t size"

-- 
Thanks,

David / dhildenb


