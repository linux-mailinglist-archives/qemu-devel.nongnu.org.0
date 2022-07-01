Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0267563940
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 20:40:45 +0200 (CEST)
Received: from localhost ([::1]:41968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7LZM-0006Tt-LS
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 14:40:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1o7LXZ-0005IA-LA; Fri, 01 Jul 2022 14:38:53 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:28858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1o7LXX-0001LW-Vg; Fri, 01 Jul 2022 14:38:53 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 261HA4RO023254;
 Fri, 1 Jul 2022 18:38:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=p70Phsog4h5MjDEQNSPZ4uGoM3caGj4jINoDKV+3vVs=;
 b=OyHJVdskrJU57y2gNlgerTD7t5o5DinjHl7qvPdIBuMCrRw3pxJ6pCu07xS3VcRa0ZYB
 z31KS0KxwjvLej1P160xuD1VBl04jXw3msBIYp4SHESj0m5BepvBb6Ju7FxWrYk83txj
 lfUU4A9gtt4catfRSHq+BJ0JiKagDVOsXNSCUlt5Jq8U1rBT3SoBPTrnqM+/Ktd4tIZC
 EozJFSetnOfu5B/n/peTPAW0F/zNLxp0OU4Bq37EqqLKuiQfQsZZ2YbLq/4/W8QHfxxr
 MroXOLFAwvxkEkgZUqokmgp5KuYDgxvjAFYS/DWxhudqjGCofGmI+lBRid2GVRvKYmCd Jw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h24cqkjrr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Jul 2022 18:38:47 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 261IKbgL018513;
 Fri, 1 Jul 2022 18:38:47 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h24cqkjrc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Jul 2022 18:38:47 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 261IaIIk001753;
 Fri, 1 Jul 2022 18:38:46 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma03dal.us.ibm.com with ESMTP id 3gwt0be5u0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Jul 2022 18:38:46 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 261IcjSl34799924
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 1 Jul 2022 18:38:45 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5602FAE05C;
 Fri,  1 Jul 2022 18:38:45 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D45B8AE060;
 Fri,  1 Jul 2022 18:38:43 +0000 (GMT)
Received: from farman-thinkpad-t470p (unknown [9.163.2.135])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  1 Jul 2022 18:38:43 +0000 (GMT)
Message-ID: <12cea618bb2bea7a3ac77c9423727b1cda6aeaa8.camel@linux.ibm.com>
Subject: Re: [PATCH 07/12] pc-bios/s390-ccw/virtio: Read device config after
 feature negotiation
From: Eric Farman <farman@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org, Christian
 Borntraeger <borntraeger@linux.ibm.com>
Cc: qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>, Janosch Frank
 <frankja@linux.ibm.com>
Date: Fri, 01 Jul 2022 14:38:42 -0400
In-Reply-To: <20220628131032.213986-8-thuth@redhat.com>
References: <20220628131032.213986-1-thuth@redhat.com>
 <20220628131032.213986-8-thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: TK9SNzpu8vYqWD3lgpwPwM1tMjOhaN69
X-Proofpoint-GUID: hFoZJ-08X37yxHC3tL1soVtECcAolSBZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-01_11,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2207010073
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farman@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2022-06-28 at 15:10 +0200, Thomas Huth wrote:
> Feature negotiation should be done first, since some fields in the
> config area can depend on the negotiated features and thus should
> rather be read afterwards.
> 
> While we're at it, also adjust the error message here a little bit
> (the code is nowadays used for non-block virtio devices, too).
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Eric Farman <farman@linux.ibm.com>

> ---
>  pc-bios/s390-ccw/virtio.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/pc-bios/s390-ccw/virtio.c b/pc-bios/s390-ccw/virtio.c
> index 4e85a2eb82..d8c2b52710 100644
> --- a/pc-bios/s390-ccw/virtio.c
> +++ b/pc-bios/s390-ccw/virtio.c
> @@ -262,10 +262,6 @@ void virtio_setup_ccw(VDev *vdev)
>      rc = run_ccw(vdev, CCW_CMD_WRITE_STATUS, &status,
> sizeof(status), false);
>      IPL_assert(rc == 0, "Could not write DRIVER status to host");
>  
> -    IPL_assert(
> -        run_ccw(vdev, CCW_CMD_READ_CONF, &vdev->config, cfg_size,
> false) == 0,
> -       "Could not get block device configuration");
> -
>      /* Feature negotiation */
>      for (i = 0; i < ARRAY_SIZE(vdev->guest_features); i++) {
>          feats.features = 0;
> @@ -278,6 +274,9 @@ void virtio_setup_ccw(VDev *vdev)
>          IPL_assert(rc == 0, "Could not set features bits");
>      }
>  
> +    rc = run_ccw(vdev, CCW_CMD_READ_CONF, &vdev->config, cfg_size,
> false);
> +    IPL_assert(rc == 0, "Could not get virtio device
> configuration");
> +
>      for (i = 0; i < vdev->nr_vqs; i++) {
>          VqInfo info = {
>              .queue = (unsigned long long) ring_area + (i *
> VIRTIO_RING_SIZE),


