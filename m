Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB8534B02C
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 21:31:12 +0100 (CET)
Received: from localhost ([::1]:53924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPt6t-00010z-Lk
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 16:31:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lPsit-0005Gi-F3
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 16:06:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lPsiq-0000PL-SX
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 16:06:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616789179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NNIh4gSEd+eUp82AvsXpoItej0D7+6kKMbEG8RFgb6U=;
 b=Jhu8ZWPsp6sXkq3LwFa4tIeBFCfbW4IsUofHBvi4XR5P3btsaaSGOZzP6sqBQI5kjxP4Lc
 eAUZM/uT4zrcHm84NWycuzAlMdxf8c+lmohsTf5A/2I2GsTFRMlwCmWxsSz7pVYjCaswOo
 2y7f0b+N4k1V/NXbuVJi4lkYOCWzw5E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-NPCJigGRNbidb6X6wewPvg-1; Fri, 26 Mar 2021 16:06:16 -0400
X-MC-Unique: NPCJigGRNbidb6X6wewPvg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFC6F5705A;
 Fri, 26 Mar 2021 20:06:14 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-48.ams2.redhat.com
 [10.36.113.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B1C2B39A73;
 Fri, 26 Mar 2021 20:06:09 +0000 (UTC)
Subject: Re: [PATCH v2 2/2] iotests/244: Test preallocation for data-file-raw
To: Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org
References: <20210326145509.163455-1-mreitz@redhat.com>
 <20210326145509.163455-3-mreitz@redhat.com>
 <1c5b2174-8ce4-e20c-8e0c-f03ac6e1d5ce@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <a4d95c36-7411-c225-967b-9a40afe09902@redhat.com>
Date: Fri, 26 Mar 2021 21:06:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <1c5b2174-8ce4-e20c-8e0c-f03ac6e1d5ce@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Alberto Garcia <berto@igalia.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26.03.21 16:17, Eric Blake wrote:
> On 3/26/21 9:55 AM, Max Reitz wrote:
>> Three test cases:
>> (1) Adding a qcow2 (metadata) file to an existing data file, see whether
>>      we can read the existing data through the qcow2 image.
>> (2) Append data to the data file, grow the qcow2 image accordingly, see
>>      whether we can read the new data through the qcow2 image.
>> (3) At runtime, add a backing image to a freshly created qcow2 image
>>      with an external data file (with data-file-raw).  Reading data from
>>      the qcow2 image must return the same result as reading data from the
>>      data file, so everything in the backing image must be ignored.
>>      (This did not use to be the case, because without the L2 tables
>>      preallocated, all clusters would appear as unallocated, and so the
>>      qcow2 driver would fall through to the backing file.)
>>
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>> ---
>>   tests/qemu-iotests/244     | 104 +++++++++++++++++++++++++++++++++++++
>>   tests/qemu-iotests/244.out |  59 +++++++++++++++++++++
>>   2 files changed, 163 insertions(+)
>>
> 
>> +
>> +# We cannot use qemu-img to create the qcow2 image, because it would
>> +# clear the data file.  Use the blockdev-create job instead, which will
>> +# only format the qcow2 image file.
> 
> Well, perhaps we could use qemu-img to create a qcow2 pointing to a
> temporary file, then rewrite it to point to the real data file, but that
> feels hackish, and your approach worked.  And besides, while we have
> qemu-img rebase -u to rewrite the backing file, I don't know if we have
> a similar qemu-img command for rewriting the data file.

Yes, we do, but I decided this would be the cleanest way.

> Reviewed-by: Eric Blake <eblake@redhat.com>

Thanks!  I’ll decide on Monday whether to include this in 6.0.  I think 
it would be small enough for rc1, but it’s also no regression, so... 
Well, I’ll see then.

Max


