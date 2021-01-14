Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E5F2F5D24
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 10:21:01 +0100 (CET)
Received: from localhost ([::1]:39968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzyoO-0002xt-ER
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 04:21:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1kzynC-0002PN-W8; Thu, 14 Jan 2021 04:19:47 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:64914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1kzynB-0006u2-5o; Thu, 14 Jan 2021 04:19:46 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10E93gR9074536; Thu, 14 Jan 2021 04:19:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=N2f5NJl0xKb+8CghJavXOMpM5bwqftk5qQprhcXJ5TE=;
 b=gAKOCmYI/TfZzrx3yjYXSJEBleYf6Nj7oHBEP5MfPkiUC54kN4JX0hLHTJdbn2KdM/8F
 pwOKfQ3sO5vxcy1nQQtI7yxsDUgXGxyYagVnPdLf9wpeNWTSWVgpEv7IR0T3FfNEasia
 HZFHYWoBEOenocpySxt3BSjK9gfvZzg+NOHxojEej2u1MhxuabRDXlvdDr/qnx1XZTbT
 0mr7a/AoRuDws6OR2xtaaKQ8+t3GGz0XHuHX3N7TebkAvMY3MqMUJYzvb/Au4eEkYEXQ
 aVJDgogB69PKj+Ns3oocICopE4EUTVKZDBeD5XbimibIm3Sm2HICK8XKfHLGegp2uEHz Zg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 362gxnbxec-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jan 2021 04:19:30 -0500
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10E951W2078923;
 Thu, 14 Jan 2021 04:19:29 -0500
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 362gxnbxdp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jan 2021 04:19:29 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10E9CUtU004766;
 Thu, 14 Jan 2021 09:19:26 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 35y448e87k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jan 2021 09:19:26 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10E9JNMS32440618
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Jan 2021 09:19:24 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CF2C84C052;
 Thu, 14 Jan 2021 09:19:23 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8C8654C050;
 Thu, 14 Jan 2021 09:19:22 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.19.194])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 14 Jan 2021 09:19:22 +0000 (GMT)
Subject: Re: [PATCH v7 13/13] s390: Recognize confidential-guest-support option
From: Christian Borntraeger <borntraeger@de.ibm.com>
To: David Gibson <david@gibson.dropbear.id.au>, brijesh.singh@amd.com,
 pair@us.ibm.com, dgilbert@redhat.com, pasic@linux.ibm.com,
 qemu-devel@nongnu.org
References: <20210113235811.1909610-1-david@gibson.dropbear.id.au>
 <20210113235811.1909610-14-david@gibson.dropbear.id.au>
 <ba08f5da-e31f-7ae2-898d-a090c5c1b1cf@de.ibm.com>
Message-ID: <aa72b499-1b84-54a3-fd06-2fec4402b699@de.ibm.com>
Date: Thu, 14 Jan 2021 10:19:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <ba08f5da-e31f-7ae2-898d-a090c5c1b1cf@de.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-14_03:2021-01-13,
 2021-01-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 spamscore=0 adultscore=0 mlxscore=0 clxscore=1015
 mlxlogscore=999 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101140052
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, thuth@redhat.com,
 Marcelo Tosatti <mtosatti@redhat.com>, berrange@redhat.com,
 jun.nakajima@intel.com, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>, cohuck@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 mdroth@linux.vnet.ibm.com, pragyansri.pathi@intel.com, qemu-s390x@nongnu.org,
 frankja@linux.ibm.com, mst@redhat.com, andi.kleen@intel.com,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 14.01.21 10:10, Christian Borntraeger wrote:
> 
> 
> On 14.01.21 00:58, David Gibson wrote:
> [...]
>> +int s390_pv_init(ConfidentialGuestSupport *cgs, Error **errp)
>> +{
>> +    if (!object_dynamic_cast(OBJECT(cgs), TYPE_S390_PV_GUEST)) {
>> +        return 0;
>> +    }
>> +
>> +    if (!s390_has_feat(S390_FEAT_UNPACK)) {
>> +        error_setg(errp,
>> +                   "CPU model does not support Protected Virtualization");
>> +        return -1;
>> +    }
> 
> I am triggering this and I guess this is because the cpu model is not yet initialized at
> this point in time.
> 
When I remove the check, things seems to work though ( I can access virtio-blk devices without
specifying iommu for example)

