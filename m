Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DE32D4B37
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 21:06:21 +0100 (CET)
Received: from localhost ([::1]:36148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn5jA-0005Kz-9p
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 15:06:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kn4iH-0001RJ-Ri
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 14:01:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kn4i7-0007xK-Jj
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 14:01:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607540469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wgZOzJ4yjC91EehjmgI1UWhSYkwNBd2U/RqUG6g9H5c=;
 b=RmCN9PnVklMeP01at2r9sOzkJTD3Gq3Awd5sEX7FapFljJjEhI7XK4bVE4gavZsig6Wp4O
 cap2cEtgJkUtunidhfN9CbIz3h9FO0JIOJbEUHW/a7zxk3DNDLE9GkOcqpHXXybALDh6Mg
 qF1e7dhFXGfLoRdbWgjAsnF3WRF9huE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-iH5NDGNMO1eJJjx0jR8joA-1; Wed, 09 Dec 2020 14:01:07 -0500
X-MC-Unique: iH5NDGNMO1eJJjx0jR8joA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0CB4800D53;
 Wed,  9 Dec 2020 19:01:04 +0000 (UTC)
Received: from [10.36.113.30] (ovpn-113-30.ams2.redhat.com [10.36.113.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E59E95D9D3;
 Wed,  9 Dec 2020 19:00:44 +0000 (UTC)
Subject: Re: [PATCH v2 08/10] softmmu/physmem: Extend
 ram_block_discard_(require|disable) by two discard types
To: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
References: <20201208163950.29617-1-david@redhat.com>
 <20201208163950.29617-9-david@redhat.com>
 <CAM9Jb+gkw4PnCaKmvw1OV97p_WkOU=ep9v4ENfmn7pzYNbWq4A@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <39dd00d1-347a-f6e6-3b83-68088656f2a8@redhat.com>
Date: Wed, 9 Dec 2020 20:00:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAM9Jb+gkw4PnCaKmvw1OV97p_WkOU=ep9v4ENfmn7pzYNbWq4A@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Qemu Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[...]

>> +/* Disable only uncoordinated disards. */
> s/disards/discards

Thanks!

[...]

>>
>>  bool ram_block_discard_is_required(void)
>>  {
>> -    return qatomic_read(&ram_block_discard_requirers);
>> +    return qatomic_read(&ram_block_discard_requirers) ||
>> +           qatomic_read(&ram_block_coordinated_discard_requirers);
>>  }
> 
> How to differentiate if we have both un-coordinated & coordinated
> cases together?

Checking for both is sufficient for current users - which only care if
any type of discard is required to work. Thanks!

-- 
Thanks,

David / dhildenb


