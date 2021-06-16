Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7DC3A9EE8
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 17:23:46 +0200 (CEST)
Received: from localhost ([::1]:42790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltXOK-0006ih-Qq
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 11:23:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.albrecht@linux.vnet.ibm.com>)
 id 1ltXMv-0005y5-6p; Wed, 16 Jun 2021 11:22:17 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:34496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.albrecht@linux.vnet.ibm.com>)
 id 1ltXMt-0005XG-3v; Wed, 16 Jun 2021 11:22:16 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15GF4PpO007542; Wed, 16 Jun 2021 11:22:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type : date :
 from : to : cc : subject : in-reply-to : references : message-id :
 content-transfer-encoding : mime-version; s=pp1;
 bh=WPjgtc5RdHTuSBuyuJieXHxlQSJnJYvyaGUXj312lKw=;
 b=hHWX4wO41czN6J5r6nXb8XTafv53ackM6g7ijHYJAaQEeopM3DnQR558avT0Rb+AntcN
 9RGSq1AB7GNssmlRT7BEuXTg2IbdFG1ePsxXOcttPyi1cwGJwLM/FvOUyjrUR6k9XzOI
 S8CZOqo08du4foWmnQDB8jztKPGxlXl7Tx2w+Vd72HIl+4WzKVTvnXkwJ4mhBDWqUgnF
 5glId95yA1HWnS5ZMuQpevD+kXofghq69FTECKWrinTsE8N27mrSvAD0ZMdmveyAXXL3
 dbwcylqUn8G2oDU7LoFTD0AllaS0wDAGp3UekGOE0UZ3UnJYNm6Bw94qHAQ74KY9qm2D +w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 397khq0uv5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Jun 2021 11:22:12 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15GF4QoJ007669;
 Wed, 16 Jun 2021 11:22:12 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 397khq0uuw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Jun 2021 11:22:12 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15GFBxAm021574;
 Wed, 16 Jun 2021 15:22:11 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma01dal.us.ibm.com with ESMTP id 394mjahmny-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Jun 2021 15:22:11 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15GFMABW11797258
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Jun 2021 15:22:10 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B36DAE06A;
 Wed, 16 Jun 2021 15:22:10 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C75D5AE062;
 Wed, 16 Jun 2021 15:22:09 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.10.229.42])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 16 Jun 2021 15:22:09 +0000 (GMT)
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Date: Wed, 16 Jun 2021 11:22:09 -0400
From: "jonathan.albrecht" <jonathan.albrecht@linux.vnet.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH 0/5] linux-user/s390x: Fix psw.mask handling in signals
Organization: IBM
In-Reply-To: <877ditx38o.fsf@redhat.com>
References: <20210615030744.1252385-1-richard.henderson@linaro.org>
 <87431a2f3cdefff42dc375ec888660e4@imap.linux.ibm.com>
 <877ditx38o.fsf@redhat.com>
Message-ID: <8bdd167c7f72f8f3df0aa5109330522c@imap.linux.ibm.com>
X-Sender: jonathan.albrecht@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.1.12
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: sac-3TRmJ_LVmzV4pYKxeGIWnaczXnd0
X-Proofpoint-GUID: meKDoTWHxVTLzbo3aXxG3AGt8gA61V_i
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-16_08:2021-06-15,
 2021-06-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 phishscore=0
 mlxlogscore=877 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106160087
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=jonathan.albrecht@linux.vnet.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: ruixin.bao@ibm.com, david@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-s390x
 <qemu-s390x-bounces+jonathan.albrecht=linux.vnet.ibm.com@nongnu.org>,
 qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021-06-16 11:01 am, Cornelia Huck wrote:
> On Tue, Jun 15 2021, "jonathan.albrecht"
> <jonathan.albrecht@linux.vnet.ibm.com> wrote:
> 
>> On 2021-06-14 11:07 pm, Richard Henderson wrote:
>>> The PSW_MASK_CC component of psw.mask was not handled properly
>>> in the creation or restoration of signal frames.
>>> 
>> 
>> Thanks Richard! Peter and I tested this series against:
>>   * https://bugs.launchpad.net/qemu/+bug/1886793
>>   * https://bugs.launchpad.net/qemu/+bug/1893040
>> and they look fixed now.
> 
> May I add some Tested-by: tags for this? (I don't know who Peter is.)

Yes, thanks. Peter is ruixin.bao@ibm.com

