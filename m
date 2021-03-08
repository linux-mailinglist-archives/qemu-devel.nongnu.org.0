Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE3C331215
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 16:26:17 +0100 (CET)
Received: from localhost ([::1]:36484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJHlw-0002qq-NI
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 10:26:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1lJHk2-0000pG-C2
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 10:24:19 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:40718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1lJHjv-0000BP-4m
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 10:24:18 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 128F4jAv066411
 for <qemu-devel@nongnu.org>; Mon, 8 Mar 2021 10:24:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=vnpSmlplmat5QcyJauD+04tKzFKwqcDVoEqzB2ZZD00=;
 b=RnFsvLz+wJryaoeneolqUCvzVlT2ovAW0iSm1zLmy47fjZPV89H1HRpRJoMZViv1nR6V
 z20XIJbDlPJrSPjFX8FGNs2yd+cjUH9LArq8HwQDSZS7eG2I0PDDh6zwFbn6hEAWvCQr
 8iVeSxhYBIk07QV0sBZuoXVRO1OnM8G4NG6gOsDflYa9IoCOPBBoWzHNlNxVVK7vseco
 tkidO2jYbaGrjrEqh5zVtaZZcN95ns/VtoHq3vEAFBL+uF9GM/CyP7o7IyjPGzgzIt8O
 2I4/wJ5j9SevkBTmlGFNiXYQqeW8jxsvZJbNbMURtVYbsJnDuAJM4poap5aI2wkXgz7w mw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 375nsv20q9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 10:24:08 -0500
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 128F6Vhv078353
 for <qemu-devel@nongnu.org>; Mon, 8 Mar 2021 10:24:08 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 375nsv20pf-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Mar 2021 10:24:08 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 128F1GMe023518;
 Mon, 8 Mar 2021 15:05:48 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma04dal.us.ibm.com with ESMTP id 3741c9b9e1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Mar 2021 15:05:48 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 128F5lIZ30409020
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Mar 2021 15:05:47 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0322E6A051;
 Mon,  8 Mar 2021 15:05:47 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AAC306A064;
 Mon,  8 Mar 2021 15:05:46 +0000 (GMT)
Received: from [9.211.86.147] (unknown [9.211.86.147])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  8 Mar 2021 15:05:46 +0000 (GMT)
Subject: Re: [PATCH] meson: Stop if cfi is enabled with system slirp
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210304025939.9164-1-dbuono@linux.vnet.ibm.com>
 <YEC4Rk/eAStVIFU7@redhat.com>
 <5829357a-6759-8314-140c-214016862446@redhat.com>
 <19c10e57-b515-ae96-1924-54103d575a58@linux.vnet.ibm.com>
 <de675aaa-0cff-e953-58da-cb0a86daa984@redhat.com>
From: Daniele Buono <dbuono@linux.vnet.ibm.com>
Message-ID: <d25da3e9-215a-d764-ba52-3f13f42f22e2@linux.vnet.ibm.com>
Date: Mon, 8 Mar 2021 10:05:45 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <de675aaa-0cff-e953-58da-cb0a86daa984@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-08_08:2021-03-08,
 2021-03-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 mlxlogscore=999 impostorscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103080083
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=dbuono@linux.vnet.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/5/2021 12:18 PM, Paolo Bonzini wrote:
>>
> 
> Ok, so let's go with your patch for now.  Independently we could change 
> libslirp to:
> 
> - add a separate callback (timer_new_v2?) in SlirpCb.  If it is set, we 
> use it and pass an enum instead of the SlirpTimerCb cb.
> 
> - add a function slirp_timer_expired(enum SlirpTimerId timer_id, void 
> *cb_opaque) that does the indirection but without passing around an 
> arbitrary function pointer.
> 
> In 6.1 we will update the internal libslirp to a version that supports 
> the new API, through a patch very similar to mine above.  By requiring 
> that new version as the minimum supported one, enabling CFI will be 
> possible even with system slirp.
> 
> You can open a slirp merge request at 
> https://gitlab.freedesktop.org/slirp/libslirp.

Hi Paolo,
sounds like a good plan!

I'll start working on this.

Regards,
Daniele

