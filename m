Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEE61DC6AF
	for <lists+qemu-devel@lfdr.de>; Thu, 21 May 2020 07:48:37 +0200 (CEST)
Received: from localhost ([::1]:51400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbe4K-0002R4-Ty
	for lists+qemu-devel@lfdr.de; Thu, 21 May 2020 01:48:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jbe3T-00020V-Ha
 for qemu-devel@nongnu.org; Thu, 21 May 2020 01:47:46 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:60083
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jbe3S-0000Xc-0x
 for qemu-devel@nongnu.org; Thu, 21 May 2020 01:47:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590040060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=lorjVBeAx5VFT9FTQq+HRZymMLWCUOEkH0Bfxy2AbDs=;
 b=OZKIeL7EiH/saQhiP/XxD+SqPyG5W6awTdQomGY1vpPVe9omi7/MywwjE/D4IISmT2uKKJ
 sehlMJtheEJaCQW3dWv58Bp6UlqdZao+OZFPHzFjxu8xpNckpgdJoOB3doV/1LFn1DWQaI
 LXQEKa0FJ5PC2Md6cnRW/ysWlhnSCL0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-ZA4bsM3GNrahjoP4-qY5wA-1; Thu, 21 May 2020 01:47:37 -0400
X-MC-Unique: ZA4bsM3GNrahjoP4-qY5wA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DFF04107ACCA;
 Thu, 21 May 2020 05:47:35 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-77.ams2.redhat.com [10.36.112.77])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 66A626F7E0;
 Thu, 21 May 2020 05:47:31 +0000 (UTC)
Subject: Re: [PATCH v2 4/9] pc-bios: s390x: Rename and use PSW_MASK_ZMODE
 constant
From: Thomas Huth <thuth@redhat.com>
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
References: <20200514123729.156283-1-frankja@linux.ibm.com>
 <20200514123729.156283-5-frankja@linux.ibm.com>
 <45c70387-c5e6-ef45-9535-de1c4002b683@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <3f7cd050-a3a5-452b-d596-e075dd213110@redhat.com>
Date: Thu, 21 May 2020 07:47:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <45c70387-c5e6-ef45-9535-de1c4002b683@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/21 01:47:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: borntraeger@de.ibm.com, qemu-s390x@nongnu.org, cohuck@redhat.com,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/05/2020 07.44, Thomas Huth wrote:
> On 14/05/2020 14.37, Janosch Frank wrote:
>> ZMODE has a lot of ambiguity with the ESAME architecture mode, but is
>> actually 64 bit addressing.
>>
>> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
>> Reviewed-by: Pierre Morel <pmorel@linux.ibm.com>
>> Reviewed-by: David Hildenbrand <david@redhat.com>
>> ---
>>  pc-bios/s390-ccw/dasd-ipl.c  | 3 +--
>>  pc-bios/s390-ccw/s390-arch.h | 2 +-
>>  2 files changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/pc-bios/s390-ccw/dasd-ipl.c b/pc-bios/s390-ccw/dasd-ipl.c
>> index 0fc879bb8e..b932531e6f 100644
>> --- a/pc-bios/s390-ccw/dasd-ipl.c
>> +++ b/pc-bios/s390-ccw/dasd-ipl.c
>> @@ -229,7 +229,6 @@ void dasd_ipl(SubChannelId schid, uint16_t cutype)
>>      run_ipl2(schid, cutype, ipl2_addr);
>>  
>>      /* Transfer control to the guest operating system */
>> -    pswl->mask |= PSW_MASK_EAMODE;   /* Force z-mode */
>> -    pswl->addr |= PSW_MASK_BAMODE;   /* ...          */
>> +    pswl->mask |= PSW_MASK_64;   /* Force 64 bit addressing */
> 
> This is not only a rename (as announced in the subject), but also a
> change in behavior since you now do not change pswl->addr anymore. So
> this is even a bug fix? Could you please mention this in the patch
> description, too?

Ah, wait, pswl is of type PSWLegacy, and ->mask and ->addr are of type
uint32_t here! So it seems wrong to use a 64-bit value for mask here,
doesn't it?

 Thomas



