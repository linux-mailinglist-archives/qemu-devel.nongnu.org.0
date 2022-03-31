Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0703D4ED0FC
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 02:44:38 +0200 (CEST)
Received: from localhost ([::1]:46730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZivV-0006yu-4C
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 20:44:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1nZiZe-0001TY-K6; Wed, 30 Mar 2022 20:22:02 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:44022
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1nZiZc-0004Aa-P2; Wed, 30 Mar 2022 20:22:02 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22UKRsNL013905; 
 Thu, 31 Mar 2022 00:21:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=TUrn2F62z98/vRl3VmuSYOcFijNFYzcHCNGeiTHKsPI=;
 b=MRgn8tQ1g5Bj4cOB+EA9mZvT1pAQX0hLCN6r3Sdw6h4tWbLGg5mnm60zAbr3jP8Hs37v
 coHCkUyzzW3XtcI5QR8+NwhOWX2M2jYVPO0pytRxRgtWW38nABcdRGE0OHYCMHFpyyv1
 bNfyDa4RKwebPygbwUxuz3gKm4JXmOJmKIcz7EMLGzMRNMqSoa/krXClm2n5ykqgyM/m
 sFRRV6kaRYW4UZwkIuzFhSdZfmMEtLKQkKrdFo+H2VISj1wCv1i083TOgLfeBZJgWreU
 68z19ePa4Un2MjhfVPCnX3T0OJ9QJR+E6PX8ij5Zk1Z5P1bEEtcNbL0YYsjJZTcS73Ap Zw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3f4x3kuku7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Mar 2022 00:21:58 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22V01C0a002045;
 Thu, 31 Mar 2022 00:21:57 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3f4x3kukty-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Mar 2022 00:21:57 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22V0CidX032498;
 Thu, 31 Mar 2022 00:21:56 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma01fra.de.ibm.com with ESMTP id 3f1tf8r451-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Mar 2022 00:21:55 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22V0LqBq39977330
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 31 Mar 2022 00:21:52 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3A8D611C050;
 Thu, 31 Mar 2022 00:21:52 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B3E7911C04C;
 Thu, 31 Mar 2022 00:21:51 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.15.152])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 31 Mar 2022 00:21:51 +0000 (GMT)
Date: Thu, 31 Mar 2022 02:21:49 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 1/4] s390x: follow qdev tree to detect SCSI device on a
 CCW bus
Message-ID: <20220331022149.15235ae7.pasic@linux.ibm.com>
In-Reply-To: <20220328143019.682245-2-pbonzini@redhat.com>
References: <20220328143019.682245-1-pbonzini@redhat.com>
 <20220328143019.682245-2-pbonzini@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NXxQ17W0O1ab2w6GVSBc6JcA0lJ6gYcp
X-Proofpoint-ORIG-GUID: BEPTSufGMjmKmajRooGbK7PCrF7Jm7qC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-30_06,2022-03-30_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 spamscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203300115
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pasic@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: farman@linux.ibm.com, cohuck@redhat.com, thuth@redhat.com,
 qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 qemu-s390x@nongnu.org, borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 28 Mar 2022 16:30:16 +0200
Paolo Bonzini <pbonzini@redhat.com> wrote:

> Do not make assumptions on the parent type of the SCSIDevice, instead
> use object_dynamic_cast all the way up to the CcwDevice.  This is cleaner
> because there is no guarantee that the bus is on a virtio-scsi device;
> that is only the case for the default configuration of QEMU's s390x
> target.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Halil Pasic <pasic@linux.ibm.com>

