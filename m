Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 427AB20BF44
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Jun 2020 09:12:04 +0200 (CEST)
Received: from localhost ([::1]:32786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jp50N-0000DS-9j
	for lists+qemu-devel@lfdr.de; Sat, 27 Jun 2020 03:12:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jp4zP-0007j5-HN
 for qemu-devel@nongnu.org; Sat, 27 Jun 2020 03:11:03 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:37410
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jp4zM-0005Ga-LT
 for qemu-devel@nongnu.org; Sat, 27 Jun 2020 03:11:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593241859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nx7cFZYCd92MIfSCWpcIP57y8sms+H8++UT4zow79HA=;
 b=XNWqZP5xaGE1JjMEVyC2Si8DSASjF8MWes/EU1HheUjvdZn2BWrJw/rG6zmoi/mKDz2GOi
 gOSTM5pQ1yd62yYlPwlksiLPdzSDNg8I1eQIjWuIzE/ofOMBeFea3PRbx6L6ZpHyOKCbMG
 mGakGGaOs2WMxhzwIconTRYC9ZBn0ko=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-Y9LVhkmfOT6lhPipEilgEA-1; Sat, 27 Jun 2020 03:10:55 -0400
X-MC-Unique: Y9LVhkmfOT6lhPipEilgEA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 52C521005512;
 Sat, 27 Jun 2020 07:10:54 +0000 (UTC)
Received: from [10.36.114.197] (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D868460BF4;
 Sat, 27 Jun 2020 07:10:45 +0000 (UTC)
Subject: Re: [PATCH v6 2/5] virtio-iommu: Implement RESV_MEM probe request
To: Markus Armbruster <armbru@redhat.com>
References: <20200626103057.11263-1-eric.auger@redhat.com>
 <20200626103057.11263-3-eric.auger@redhat.com>
 <87o8p5rno0.fsf@dusky.pond.sub.org>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <35f340c9-2394-a04b-879b-7e5fd848155f@redhat.com>
Date: Sat, 27 Jun 2020 09:10:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <87o8p5rno0.fsf@dusky.pond.sub.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/27 02:55:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, mst@redhat.com, qemu-devel@nongnu.org,
 peterx@redhat.com, jean-philippe@linaro.org, qemu-arm@nongnu.org,
 pbonzini@redhat.com, bbhushan2@marvell.com, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Markus,

On 6/27/20 9:08 AM, Markus Armbruster wrote:
> Eric Auger <eric.auger@redhat.com> writes:
> 
>> This patch implements the PROBE request. At the moment,
>> only THE RESV_MEM property is handled. The first goal is
>> to report iommu wide reserved regions such as the MSI regions
>> set by the machine code. On x86 this will be the IOAPIC MSI
>> region, [0xFEE00000 - 0xFEEFFFFF], on ARM this may be the ITS
>> doorbell.
>>
>> In the future we may introduce per device reserved regions.
>> This will be useful when protecting host assigned devices
>> which may expose their own reserved regions
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
>>
>> ---
>>
>> v5 -> v6:
>> - removed validation of s->reserved_regions[i].type in the
>>   probe request as it should rather happen in the realize()
> 
> Consider keeping the assertion.  I'd makes it locally obvious that the
> assignment to subtype is not supposed to truncate.  The realize method
> is in another file.  This is not a demand.

OK I will add the assert again

Thanks

Eric
> 
> [...]
> 


