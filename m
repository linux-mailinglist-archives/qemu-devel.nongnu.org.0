Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6935E3B1617
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 10:43:45 +0200 (CEST)
Received: from localhost ([::1]:54474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvyU4-0007al-H2
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 04:43:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1lvySb-0006bq-6O
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 04:42:13 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:15814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1lvySY-0001nj-0z
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 04:42:12 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15N8YKPd144779; Wed, 23 Jun 2021 04:42:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=9Bimb5e2mctAFu5XUyKLwgezeepDGhG6NbCguMZktDY=;
 b=hFKNrp7iD8yxs/ENbcTGzPkCvdWVgpbjeRDAtkte6NP/24AJX1TJkLjfELZYhYdWEO3n
 tEQXFhgl6UqnPo077/Tsuf6OrRgA0ZhveIjDi2WhYb07Oz5HQjLm3+HWB5a7YzM5FqlB
 thNvpMsO6T9n3vmGyIK2ri09UeTBKeTzexUn9/6XMdWAfOzuayRNHMyyoAN/wdeRhCzH
 WHkHnbx9hS37+/sfmX2frZldbhbo+eSOW7s1KnYjJjvcqvAcs/up7TAps5GbtGjegQR4
 5FFHipf9hy4cp7NtkiFI6c4A1qX3nMGImLKNXb/sLkV/7Q5zYmzqdotX2ZYBO2ZTZi+J eg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39c1j9r8rh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Jun 2021 04:42:05 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15N8YpkR148600;
 Wed, 23 Jun 2021 04:42:04 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39c1j9r8pn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Jun 2021 04:42:04 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15N8aMC0004571;
 Wed, 23 Jun 2021 08:42:01 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma02fra.de.ibm.com with ESMTP id 39987891py-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Jun 2021 08:42:01 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15N8fwkm34341288
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Jun 2021 08:41:58 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4F14152050;
 Wed, 23 Jun 2021 08:41:58 +0000 (GMT)
Received: from [9.148.12.78] (unknown [9.148.12.78])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 269DE52051;
 Wed, 23 Jun 2021 08:41:57 +0000 (GMT)
Subject: Re: [PATCH v2 1/2] sev/i386: Introduce sev_add_kernel_loader_hashes
 for measured linux boot
To: Connor Kuehl <ckuehl@redhat.com>, qemu-devel@nongnu.org
References: <20210621190553.1763020-1-dovmurik@linux.ibm.com>
 <20210621190553.1763020-2-dovmurik@linux.ibm.com>
 <de9d8cd5-fcc3-10d2-6dda-003e4ad5524d@redhat.com>
From: Dov Murik <dovmurik@linux.ibm.com>
Message-ID: <36ff1adc-79c5-5526-2212-0aa28283fd75@linux.ibm.com>
Date: Wed, 23 Jun 2021 11:41:56 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <de9d8cd5-fcc3-10d2-6dda-003e4ad5524d@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: fGMM0HoFxBl2PiFf1rP5XOwcFuDuAMCB
X-Proofpoint-ORIG-GUID: heJn-bbgN6Ckp1sK4V0L8DVLbqxjKGSO
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-23_02:2021-06-22,
 2021-06-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 mlxscore=0
 bulkscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2106230050
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Connor,

+cc: Daniel

On 23/06/2021 0:15, Connor Kuehl wrote:
> On 6/21/21 2:05 PM, Dov Murik wrote:
>> +static void fill_sev_hash_table_entry(SevHashTableEntry *e, const uint8_t *guid,
>> +                                      const uint8_t *hash, size_t hash_len)
>> +{
>> +    memcpy(e->guid, guid, sizeof(e->guid));
>> +    e->len = sizeof(*e);
>> +    memcpy(e->hash, hash, hash_len);
> 
> Should this memcpy be constrained to MIN(sizeof(e->hash), hash_len)? Or
> perhaps an assert statement since I see below that this function's
> caller sets this to HASH_SIZE which is currently == sizeof(e->hash).
> 
> Actually, the assert statement would be easier to debug if the input
> to this function is ever unexpected, especially since it avoids an
> outcome where the input is silently truncated; which is a pitfall that
> that the memcpy clamping would fall into.

I agree.  I'll change it to:

    assert(hash_len == sizeof(e->hash));
    memcpy(e->hash, hash, sizeof(e->hash));

This way also the memcpy length is known at compile-time.



Related: I wondered if I could replace HASH_SIZE in:


  /* hard code sha256 digest size */
  #define HASH_SIZE 32

  typedef struct QEMU_PACKED SevHashTableEntry {
      QemuUUID guid;
      uint16_t len;
      uint8_t hash[HASH_SIZE];
  } SevHashTableEntry;


with some SHA256-related constant from crypto/hash.h, but I only found
the qcrypto_hash_digest_len(QCRYPTO_HASH_ALG_SHA256) function which
doesn't work for setting sizes of arrays at compile-time.

Daniel: do you know what would be the proper way?


Thanks,
-Dov

