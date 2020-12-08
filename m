Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B0D2D2DA6
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 15:58:14 +0100 (CET)
Received: from localhost ([::1]:55566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmeRQ-00089N-UN
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 09:58:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kmeOv-0007Fa-3E
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 09:55:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kmeOs-0000UI-P3
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 09:55:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607439333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W4neMEX12jLuZ9ThD7113iNuU2zRMYxz1pXSGOwJ/Hs=;
 b=ShpRyW2hfTaHOP9R4OMwzx6KObDcGLwG8RDzq3b18AczbXgK/HbqDbG+nRsX+8rYmnzl5a
 MWQ6xdqUalpqdfz8Os2aDsFhp8eq7dXIA5aSvNTt4rxwV5SUVP39QO/ua9gBiYXJYEsHhy
 fRe3+/RstJyF+EsD9IT+dg3N7UuuBCI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-cWbBrxTBOGa91XzeJNEMzw-1; Tue, 08 Dec 2020 09:55:31 -0500
X-MC-Unique: cWbBrxTBOGa91XzeJNEMzw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4EE75BBEE1;
 Tue,  8 Dec 2020 14:55:30 +0000 (UTC)
Received: from [10.36.113.236] (ovpn-113-236.ams2.redhat.com [10.36.113.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0CB5660BE2;
 Tue,  8 Dec 2020 14:55:28 +0000 (UTC)
Subject: Re: [PATCH] s390x: pv: Fence additional unavailable SCLP facilities
 for PV guests
To: Christian Borntraeger <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
References: <20201204083655.27946-1-frankja@linux.ibm.com>
 <1c42abcc-b28e-4b6a-d363-ff6daf7b7883@de.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <e2f69754-6b31-4854-b52a-e0e1c2676d67@redhat.com>
Date: Tue, 8 Dec 2020 15:55:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1c42abcc-b28e-4b6a-d363-ff6daf7b7883@de.ibm.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: qemu-s390x@nongnu.org, cohuck@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08.12.20 14:29, Christian Borntraeger wrote:
> 
> 
> On 04.12.20 09:36, Janosch Frank wrote:
>> There's no VSIE support for a protected guest, so let's better not
>> advertise it and its support facilities.
>>
>> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> 
> Looks sane. Assuming that all features that depend on SIE are named S390_FEAT_SIE_*
> this should take care of everything. (i compared to gen-facilities.c)

We could add dependency checks to
target/s390x/cpu_models.c:check_consistency()

What about

DEF_FEAT(ESOP, "esop", SCLP_CONF_CHAR, 46,
"Enhanced-suppression-on-protection facility")
DEF_FEAT(HPMA2, "hpma2", SCLP_CONF_CHAR, 90, "Host page management
assist 2 Facility")

Although not related so SIE, do these features make sense for protected
guests?

> 
>> ---
>> CI:
>> https://gitlab.com/frankja/qemu/-/pipelines/224881703
>> ---
>>  target/s390x/cpu_features.c | 38 ++++++++++++++++++++++++++++++++++++-
>>  target/s390x/cpu_models.c   | 24 +++++++++++++++++++++--
>>  2 files changed, 59 insertions(+), 3 deletions(-)
>>
>> diff --git a/target/s390x/cpu_features.c b/target/s390x/cpu_features.c
>> index 42fe0bf4ca..7d7ea8e3b8 100644
>> --- a/target/s390x/cpu_features.c
>> +++ b/target/s390x/cpu_features.c
>> @@ -107,8 +107,44 @@ void s390_fill_feat_block(const S390FeatBitmap features, S390FeatType type,
>>          feat = find_next_bit(features, S390_FEAT_MAX, feat + 1);
>>      }
>>  
>> -    if (type == S390_FEAT_TYPE_SCLP_FAC134 && s390_is_pv()) {
>> +    if (!s390_is_pv()) {
>> +        return;
>> +    }
>> +
>> +    /*
>> +     * Some facilities are not available for CPUs in protected mode:
>> +     * - All SIE facilities because SIE is not available
>> +     * - DIAG318
>> +     *
>> +     * As VMs can move in and out of protected mode the CPU model
>> +     * doesn't protect us from that problem because it is only
>> +     * validated at the start of the VM.
>> +     */
>> +    switch (type) {
>> +    case S390_FEAT_TYPE_SCLP_CPU:
>> +        clear_be_bit(s390_feat_def(S390_FEAT_SIE_F2)->bit, data);
>> +        clear_be_bit(s390_feat_def(S390_FEAT_SIE_SKEY)->bit, data);
>> +        clear_be_bit(s390_feat_def(S390_FEAT_SIE_GPERE)->bit, data);
>> +        clear_be_bit(s390_feat_def(S390_FEAT_SIE_SIIF)->bit, data);
>> +        clear_be_bit(s390_feat_def(S390_FEAT_SIE_SIGPIF)->bit, data);
>> +        clear_be_bit(s390_feat_def(S390_FEAT_SIE_IB)->bit, data);
>> +        clear_be_bit(s390_feat_def(S390_FEAT_SIE_CEI)->bit, data);
>> +        break;
>> +    case S390_FEAT_TYPE_SCLP_CONF_CHAR:
>> +        clear_be_bit(s390_feat_def(S390_FEAT_SIE_KSS)->bit, data);
>> +        clear_be_bit(s390_feat_def(S390_FEAT_SIE_GSLS)->bit, data);
>> +        break;
>> +    case S390_FEAT_TYPE_SCLP_CONF_CHAR_EXT:
>> +        clear_be_bit(s390_feat_def(S390_FEAT_SIE_64BSCAO)->bit, data);
>> +        clear_be_bit(s390_feat_def(S390_FEAT_SIE_CMMA)->bit, data);
>> +        clear_be_bit(s390_feat_def(S390_FEAT_SIE_PFMFI)->bit, data);
>> +        clear_be_bit(s390_feat_def(S390_FEAT_SIE_IBS)->bit, data);
>> +        break;
>> +    case S390_FEAT_TYPE_SCLP_FAC134:
>>          clear_be_bit(s390_feat_def(S390_FEAT_DIAG_318)->bit, data);
>> +        break;
>> +    default:
>> +        return;
>>      }
>>  }
>>  
>> diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
>> index b5abff8bef..51feb71546 100644
>> --- a/target/s390x/cpu_models.c
>> +++ b/target/s390x/cpu_models.c
>> @@ -239,8 +239,28 @@ bool s390_has_feat(S390Feat feat)
>>          }
>>          return 0;
>>      }
>> -    if (feat == S390_FEAT_DIAG_318 && s390_is_pv()) {
>> -        return false;
>> +
>> +    if (s390_is_pv()) {
>> +        switch (feat) {
>> +        case S390_FEAT_DIAG_318:
>> +        case S390_FEAT_SIE_F2:
>> +        case S390_FEAT_SIE_SKEY:
>> +        case S390_FEAT_SIE_GPERE:
>> +        case S390_FEAT_SIE_SIIF:
>> +        case S390_FEAT_SIE_SIGPIF:
>> +        case S390_FEAT_SIE_IB:
>> +        case S390_FEAT_SIE_CEI:
>> +        case S390_FEAT_SIE_KSS:
>> +        case S390_FEAT_SIE_GSLS:
>> +        case S390_FEAT_SIE_64BSCAO:
>> +        case S390_FEAT_SIE_CMMA:
>> +        case S390_FEAT_SIE_PFMFI:
>> +        case S390_FEAT_SIE_IBS:
>> +            return false;
>> +            break;
>> +        default:
>> +            break;
>> +        }
>>      }
>>      return test_bit(feat, cpu->model->features);
>>  }
>>
> 


-- 
Thanks,

David / dhildenb


