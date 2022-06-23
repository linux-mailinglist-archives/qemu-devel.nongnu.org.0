Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C00D5574C9
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 10:04:14 +0200 (CEST)
Received: from localhost ([::1]:37280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4Hoz-0003tf-3N
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 04:04:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1o4Hkr-0002u1-9E; Thu, 23 Jun 2022 03:59:57 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:14102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1o4Hkp-0007tX-JQ; Thu, 23 Jun 2022 03:59:57 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25N7dHuQ029226;
 Thu, 23 Jun 2022 07:59:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=94YgMjW3IzCezbh/PySHDdFmq7JD1vhyZfqg0KkZFUo=;
 b=LSswVCRU9qfD4LvjTQqTa5BMxSlqYjDXYhFbmO8tb9RXH3B/Gd7wcG/qL/staycFVOXZ
 fOrXGAwMG5u4ewAcU1OlxX5aBThkpuY/+PZBvJ7Rvg+TGzvyOr1thyDxGVu8TnG0KhH2
 hStgyQPVF6gl+ucMRtsImOZXatO2fz3OIVLiJa68S1x2iKwTSgFjTwe87CIhFOrzpXPp
 VJd0+ZUg3nUdSfJQ3GRlUE3fZJDpOIqicC5sItqUOB7564eFt9azeSAuMlDBNFD8mWw+
 RwVOHf+f/VW9TjmkeN4/Y3CT55jJXWxn6gqYVUq0jRMrJ5ISQDWdaG95oCgaK5tZKcQY FA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gvedq8udc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jun 2022 07:59:51 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25N7p2VJ023414;
 Thu, 23 Jun 2022 07:59:51 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gvedq8uca-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jun 2022 07:59:50 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25N7p4Av022992;
 Thu, 23 Jun 2022 07:59:47 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma05fra.de.ibm.com with ESMTP id 3gs6b95cuw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jun 2022 07:59:47 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 25N7xjAq21954838
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Jun 2022 07:59:45 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6076242041;
 Thu, 23 Jun 2022 07:59:45 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1F92542047;
 Thu, 23 Jun 2022 07:59:45 +0000 (GMT)
Received: from [9.171.64.33] (unknown [9.171.64.33])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 23 Jun 2022 07:59:45 +0000 (GMT)
Message-ID: <46f04265-3baf-8845-3bfc-74734f9daf35@linux.ibm.com>
Date: Thu, 23 Jun 2022 09:59:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/2] pc-bios/s390-ccw/virtio: Set missing status bits
 while initializing
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-s390x@nongnu.org, Eric Farman <farman@linux.ibm.com>
Cc: qemu-devel@nongnu.org
References: <20220623071131.412457-1-thuth@redhat.com>
 <20220623071131.412457-2-thuth@redhat.com>
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <20220623071131.412457-2-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: RAO3vTds_LTH0NNCv97E9FT0Az3451kF
X-Proofpoint-GUID: WArvqUIcJCrJwBOoidJqQYJjgp40h-KI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-23_03,2022-06-22_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 clxscore=1011 mlxlogscore=999 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206230028
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Am 23.06.22 um 09:11 schrieb Thomas Huth:
> According chapter "3.1.1 Driver Requirements: Device Initialization"
> of the Virtio specification (v1.1), a driver for a device has to set
> the ACKNOWLEDGE and DRIVER bits in the status field after resetting
> the device. The s390-ccw bios skipped these steps so far and seems
> like QEMU never cared. Anyway, it's better to follow the spec, so
> let's set these bits now in the right spots, too.

I have not tested that but I agree with this

Acked-by: Christian Borntraeger <borntraeger@linux.ibm.com>


> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   pc-bios/s390-ccw/virtio.c | 18 ++++++++++++++----
>   1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/pc-bios/s390-ccw/virtio.c b/pc-bios/s390-ccw/virtio.c
> index 5d2c6e3381..4e85a2eb82 100644
> --- a/pc-bios/s390-ccw/virtio.c
> +++ b/pc-bios/s390-ccw/virtio.c
> @@ -220,7 +220,7 @@ int virtio_run(VDev *vdev, int vqid, VirtioCmd *cmd)
>   void virtio_setup_ccw(VDev *vdev)
>   {
>       int i, rc, cfg_size = 0;
> -    unsigned char status = VIRTIO_CONFIG_S_DRIVER_OK;
> +    uint8_t status;
>       struct VirtioFeatureDesc {
>           uint32_t features;
>           uint8_t index;
> @@ -234,6 +234,10 @@ void virtio_setup_ccw(VDev *vdev)
>   
>       run_ccw(vdev, CCW_CMD_VDEV_RESET, NULL, 0, false);
>   
> +    status = VIRTIO_CONFIG_S_ACKNOWLEDGE;
> +    rc = run_ccw(vdev, CCW_CMD_WRITE_STATUS, &status, sizeof(status), false);
> +    IPL_assert(rc == 0, "Could not write ACKNOWLEDGE status to host");
> +
>       switch (vdev->senseid.cu_model) {
>       case VIRTIO_ID_NET:
>           vdev->nr_vqs = 2;
> @@ -253,6 +257,11 @@ void virtio_setup_ccw(VDev *vdev)
>       default:
>           panic("Unsupported virtio device\n");
>       }
> +
> +    status |= VIRTIO_CONFIG_S_DRIVER;
> +    rc = run_ccw(vdev, CCW_CMD_WRITE_STATUS, &status, sizeof(status), false);
> +    IPL_assert(rc == 0, "Could not write DRIVER status to host");
> +
>       IPL_assert(
>           run_ccw(vdev, CCW_CMD_READ_CONF, &vdev->config, cfg_size, false) == 0,
>          "Could not get block device configuration");
> @@ -291,9 +300,10 @@ void virtio_setup_ccw(VDev *vdev)
>               run_ccw(vdev, CCW_CMD_SET_VQ, &info, sizeof(info), false) == 0,
>               "Cannot set VQ info");
>       }
> -    IPL_assert(
> -        run_ccw(vdev, CCW_CMD_WRITE_STATUS, &status, sizeof(status), false) == 0,
> -        "Could not write status to host");
> +
> +    status |= VIRTIO_CONFIG_S_DRIVER_OK;
> +    rc = run_ccw(vdev, CCW_CMD_WRITE_STATUS, &status, sizeof(status), false);
> +    IPL_assert(rc == 0, "Could not write DRIVER_OK status to host");
>   }
>   
>   bool virtio_is_supported(SubChannelId schid)

