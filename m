Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B09D557D51
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 15:53:11 +0200 (CEST)
Received: from localhost ([::1]:55042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4NGf-0002Xu-Ut
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 09:53:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1o4NED-0000bU-PX; Thu, 23 Jun 2022 09:50:39 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:22072
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1o4NE8-0000qP-Ch; Thu, 23 Jun 2022 09:50:36 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25NCJFxu027944;
 Thu, 23 Jun 2022 13:50:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=nmOOaxIA7+p9g0LUXcxoGpgokON6Qku+27CXA5ImbSM=;
 b=nqHeAuEVxDqhHhIpAhGkazldpNCHicwPUnnnELO9zL4pwugnzJJMn33pZHnI2TX08Mgm
 oeHcKJIeBoBwe3n9My4RoYThX+QicITxNJoC49+eIXZKYwQ4SbAjmj2y99qusNvA534T
 HncDkWQzp5gB5/1L6XQiAbKI1iRHEjgfsoIpJiPVo8jFafqSylUnU0X+SKJ67N+6Z8xH
 s9+mgP6CZvJP52XKNPfF46ce9OcIY31ysv6SISKVwKrKUdAvEMtKzpxB6Cxjl5meVVUF
 PhpepgFLMmA1Mm+2SX0nOTRx2iKKvw2YSbHgYGQellCxFqivObuBczSDqfkjUEba7jdc mQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gvmfhrvd0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jun 2022 13:50:26 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25NDeHZn005624;
 Thu, 23 Jun 2022 13:50:26 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gvmfhrvcb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jun 2022 13:50:26 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25NDnfs8006796;
 Thu, 23 Jun 2022 13:50:25 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma03dal.us.ibm.com with ESMTP id 3gs6ba5gcy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jun 2022 13:50:25 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 25NDoOK935127706
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Jun 2022 13:50:24 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 76A4DB2066;
 Thu, 23 Jun 2022 13:50:24 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 203ACB205F;
 Thu, 23 Jun 2022 13:50:23 +0000 (GMT)
Received: from farman-thinkpad-t470p (unknown [9.211.98.153])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 23 Jun 2022 13:50:22 +0000 (GMT)
Message-ID: <972ff995edf1e503f93187edd815adcbb5c2ba67.camel@linux.ibm.com>
Subject: Re: [PATCH 1/2] pc-bios/s390-ccw/virtio: Set missing status bits
 while initializing
From: Eric Farman <farman@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: qemu-devel@nongnu.org
Date: Thu, 23 Jun 2022 09:50:21 -0400
In-Reply-To: <20220623071131.412457-2-thuth@redhat.com>
References: <20220623071131.412457-1-thuth@redhat.com>
 <20220623071131.412457-2-thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5g1eE4ekpt8r6_lFJb_OXdn-XqR5nDH9
X-Proofpoint-ORIG-GUID: wDHJwrNX7A2r02rSwkXT2Mm9FLFmhaOD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-23_05,2022-06-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011
 priorityscore=1501 spamscore=0 mlxlogscore=999 suspectscore=0
 lowpriorityscore=0 mlxscore=0 impostorscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206230055
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farman@linux.ibm.com;
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

On Thu, 2022-06-23 at 09:11 +0200, Thomas Huth wrote:
> According chapter "3.1.1 Driver Requirements: Device Initialization"
> of the Virtio specification (v1.1), a driver for a device has to set
> the ACKNOWLEDGE and DRIVER bits in the status field after resetting
> the device. The s390-ccw bios skipped these steps so far and seems
> like QEMU never cared. Anyway, it's better to follow the spec, so
> let's set these bits now in the right spots, too.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Eric Farman <farman@linux.ibm.com>

> ---
>  pc-bios/s390-ccw/virtio.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/pc-bios/s390-ccw/virtio.c b/pc-bios/s390-ccw/virtio.c
> index 5d2c6e3381..4e85a2eb82 100644
> --- a/pc-bios/s390-ccw/virtio.c
> +++ b/pc-bios/s390-ccw/virtio.c
> @@ -220,7 +220,7 @@ int virtio_run(VDev *vdev, int vqid, VirtioCmd
> *cmd)
>  void virtio_setup_ccw(VDev *vdev)
>  {
>      int i, rc, cfg_size = 0;
> -    unsigned char status = VIRTIO_CONFIG_S_DRIVER_OK;
> +    uint8_t status;
>      struct VirtioFeatureDesc {
>          uint32_t features;
>          uint8_t index;
> @@ -234,6 +234,10 @@ void virtio_setup_ccw(VDev *vdev)
>  
>      run_ccw(vdev, CCW_CMD_VDEV_RESET, NULL, 0, false);
>  
> +    status = VIRTIO_CONFIG_S_ACKNOWLEDGE;
> +    rc = run_ccw(vdev, CCW_CMD_WRITE_STATUS, &status,
> sizeof(status), false);
> +    IPL_assert(rc == 0, "Could not write ACKNOWLEDGE status to
> host");
> +
>      switch (vdev->senseid.cu_model) {
>      case VIRTIO_ID_NET:
>          vdev->nr_vqs = 2;
> @@ -253,6 +257,11 @@ void virtio_setup_ccw(VDev *vdev)
>      default:
>          panic("Unsupported virtio device\n");
>      }
> +
> +    status |= VIRTIO_CONFIG_S_DRIVER;
> +    rc = run_ccw(vdev, CCW_CMD_WRITE_STATUS, &status,
> sizeof(status), false);
> +    IPL_assert(rc == 0, "Could not write DRIVER status to host");
> +
>      IPL_assert(
>          run_ccw(vdev, CCW_CMD_READ_CONF, &vdev->config, cfg_size,
> false) == 0,
>         "Could not get block device configuration");
> @@ -291,9 +300,10 @@ void virtio_setup_ccw(VDev *vdev)
>              run_ccw(vdev, CCW_CMD_SET_VQ, &info, sizeof(info),
> false) == 0,
>              "Cannot set VQ info");
>      }
> -    IPL_assert(
> -        run_ccw(vdev, CCW_CMD_WRITE_STATUS, &status, sizeof(status),
> false) == 0,
> -        "Could not write status to host");
> +
> +    status |= VIRTIO_CONFIG_S_DRIVER_OK;
> +    rc = run_ccw(vdev, CCW_CMD_WRITE_STATUS, &status,
> sizeof(status), false);
> +    IPL_assert(rc == 0, "Could not write DRIVER_OK status to host");
>  }
>  
>  bool virtio_is_supported(SubChannelId schid)


