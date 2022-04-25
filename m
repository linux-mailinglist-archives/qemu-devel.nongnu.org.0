Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4875A50DA60
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 09:47:49 +0200 (CEST)
Received: from localhost ([::1]:46042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nitRj-00043f-ST
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 03:47:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1nitOQ-0003Ar-Da; Mon, 25 Apr 2022 03:44:22 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:28648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1nitOO-0004XB-2M; Mon, 25 Apr 2022 03:44:21 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23P59J1k007224;
 Mon, 25 Apr 2022 07:44:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=mDSdOtU32H6/hDLoFnMZrsEO1DUplC3VtqilWHGDEJo=;
 b=dM0PToWLrErIyYLq+YKn6q946Ie8j5mrnnDoERT3Ao5ZTKVEYCKtM9PdFsHzUXCEmds6
 nk4LFJgOQf/n8cKijUJhVwUftKHv3b8mQXWuA7z9iIAb91bqE5Zd4PXHOKygyhKexHPZ
 oU+DWw0VxQkEU62ReWPxMLVPbYEQJoXMKSwpLaqWvwhjrDob3PVsZXcLBVhuNZfSGt7x
 YTpCc3+BO6406yZJ4MWEbim8+xGoJESqy/Zh1jigjvflC9NRXMLWnqZXpWU4Ikj1ygXb
 yctUlX3XNFtJK3CMkIMpvddM1Zo1i3BVkWctGLu5wAjdfNObQ+ldJChrKz8fHqDJLH+U 8w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fmuedapvj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Apr 2022 07:44:01 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 23P7c09c003597;
 Mon, 25 Apr 2022 07:44:01 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fmuedaput-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Apr 2022 07:44:00 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23P7bMmF022908;
 Mon, 25 Apr 2022 07:43:58 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03fra.de.ibm.com with ESMTP id 3fm938smkr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Apr 2022 07:43:57 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23P7hsRq40108498
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Apr 2022 07:43:54 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB5084C052;
 Mon, 25 Apr 2022 07:43:54 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4A2D34C044;
 Mon, 25 Apr 2022 07:43:54 +0000 (GMT)
Received: from [9.171.39.215] (unknown [9.171.39.215])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 25 Apr 2022 07:43:54 +0000 (GMT)
Message-ID: <25e876da-c2ac-ad55-0830-6fe149e0691f@linux.ibm.com>
Date: Mon, 25 Apr 2022 09:43:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5 00/11] s390x/tcg: Implement Vector-Enhancements
 Facility 2
Content-Language: en-US
To: David Miller <dmiller423@gmail.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
References: <20220323135722.1623-1-dmiller423@gmail.com>
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <20220323135722.1623-1-dmiller423@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 49IvpNKPS3ONSipMKMvlpH0cwjDNW75e
X-Proofpoint-ORIG-GUID: k9OjpjMEzBJ2zvf_q_GX37ENBlSUzNop
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-25_02,2022-04-22_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 bulkscore=0 adultscore=0 mlxlogscore=999 suspectscore=0 clxscore=1011
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204250033
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: thuth@redhat.com, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, farman@linux.ibm.com, pasic@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 23.03.22 um 14:57 schrieb David Miller:
> Implement Vector-Enhancements Facility 2 for s390x
> 
> resolves: https://gitlab.com/qemu-project/qemu/-/issues/738
> 
> implements:
>      VECTOR LOAD ELEMENTS REVERSED               (VLER)
>      VECTOR LOAD BYTE REVERSED ELEMENTS          (VLBR)
>      VECTOR LOAD BYTE REVERSED ELEMENT           (VLEBRH, VLEBRF, VLEBRG)
>      VECTOR LOAD BYTE REVERSED ELEMENT AND ZERO  (VLLEBRZ)
>      VECTOR LOAD BYTE REVERSED ELEMENT AND REPLICATE (VLBRREP)
>      VECTOR STORE ELEMENTS REVERSED              (VSTER)
>      VECTOR STORE BYTE REVERSED ELEMENTS         (VSTBR)
>      VECTOR STORE BYTE REVERSED ELEMENTS         (VSTEBRH, VSTEBRF, VSTEBRG)
>      VECTOR SHIFT LEFT DOUBLE BY BIT             (VSLD)
>      VECTOR SHIFT RIGHT DOUBLE BY BIT            (VSRD)
>      VECTOR STRING SEARCH                        (VSTRS)
> 
>      modifies:
>      VECTOR FP CONVERT FROM FIXED                (VCFPS)
>      VECTOR FP CONVERT FROM LOGICAL              (VCFPL)
>      VECTOR FP CONVERT TO FIXED                  (VCSFP)
>      VECTOR FP CONVERT TO LOGICAL                (VCLFP)
>      VECTOR SHIFT LEFT                           (VSL)
>      VECTOR SHIFT RIGHT ARITHMETIC               (VSRA)
>      VECTOR SHIFT RIGHT LOGICAL                  (VSRL)
> 
> 
> David Miller (9):
>    tcg: Implement tcg_gen_{h,w}swap_{i32,i64}
>    target/s390x: vxeh2: vector convert short/32b
>    target/s390x: vxeh2: vector string search
>    target/s390x: vxeh2: Update for changes to vector shifts
>    target/s390x: vxeh2: vector shift double by bit
>    target/s390x: vxeh2: vector {load, store} elements reversed
>    target/s390x: vxeh2: vector {load, store} byte reversed elements
>    target/s390x: vxeh2: vector {load, store} byte reversed element
>    target/s390x: add S390_FEAT_VECTOR_ENH2 to qemu CPU model
>    tests/tcg/s390x: Tests for Vector Enhancements Facility 2
>    target/s390x: Fix writeback to v1 in helper_vstl
> 
> Richard Henderson (2):
>    tcg: Implement tcg_gen_{h,w}swap_{i32,i64}
>    target/s390x: Fix writeback to v1 in helper_vstl


I guess we can now re-do this series against 7.1-devel (qemu/master) which does
have the machine compat changes. Apart from that this should be ready now?

