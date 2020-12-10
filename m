Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5182D5EE7
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 16:04:40 +0100 (CET)
Received: from localhost ([::1]:52606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knNUl-0004B6-Nz
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 10:04:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1knNRJ-000328-TU
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 10:01:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1knNRI-0002CN-0m
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 10:01:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607612463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LIjrMmVNnTzhmp7K9eDjssrBB3lPKzWmkd13C+seQ8w=;
 b=FJQOehSuaKoad7tgbtzpDMCQd1w3CZFNLc2Uuy8+hO0gxaGLdD0bL//I5oxmdCOV2idnxy
 8tbaVuq5ZIZ851tACfc2Q31/sFlEvxof9GZOjpRijUvRGI5Cise3WqINC5jIZjwdYHakvj
 nUnPejFswxAVx6bAXnirp+CBEzbUCf4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-YhekqeQcPiWtk5dhnvUz7g-1; Thu, 10 Dec 2020 10:00:59 -0500
X-MC-Unique: YhekqeQcPiWtk5dhnvUz7g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5043787504B;
 Thu, 10 Dec 2020 15:00:52 +0000 (UTC)
Received: from [10.36.115.117] (ovpn-115-117.ams2.redhat.com [10.36.115.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0035F5D9CC;
 Thu, 10 Dec 2020 15:00:12 +0000 (UTC)
Subject: Re: [PATCH v2 07/10] softmmu/physmem: Don't use atomic operations in
 ram_block_discard_(disable|require)
To: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
References: <20201208163950.29617-1-david@redhat.com>
 <20201208163950.29617-8-david@redhat.com>
 <CAM9Jb+gOvCqW2rcz++SG1VZV0PoaZqx-_fE5X54PFttD-+1X_w@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <1a69a01e-9be5-0a3f-0ac6-c1f1fb4b4561@redhat.com>
Date: Thu, 10 Dec 2020 16:00:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAM9Jb+gOvCqW2rcz++SG1VZV0PoaZqx-_fE5X54PFttD-+1X_w@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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

>>  bool ram_block_discard_is_disabled(void)
>>  {
>> -    return qatomic_read(&ram_block_discard_disabled) > 0;
>> +    return qatomic_read(&ram_block_discard_disablers);
>>  }
> return value won't be bool?

The compiler does type conversion.

!= 0 -> true
== 0 -> false

[...]

> Apart from query above, looks good.
> Reviewed-by: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>

Thanks!


-- 
Thanks,

David / dhildenb


