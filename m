Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BA2563941
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 20:41:17 +0200 (CEST)
Received: from localhost ([::1]:42782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7LZs-00070v-Op
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 14:41:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1o7LXo-0005Zo-0x; Fri, 01 Jul 2022 14:39:08 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:29514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1o7LXm-0001MP-Dt; Fri, 01 Jul 2022 14:39:07 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 261HkAWj003766;
 Fri, 1 Jul 2022 18:39:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=fzYib+90H9HuNiLaSoymqlsnTJsyQBSI/xp62HJ7g/s=;
 b=M0GYF29/DlRW0q7iomkqE+0Ng8wZ1PiYfexSrDZiDymmyL4ZDl1uAwknMnwibquiQ96/
 z5rxcMTJz83+tjU83kyw9mFe4JbNl0TXwjIOMdCATiv+ouu9BmQ1SkuTHBs6sFwVPk2W
 nkEBVRxRmQKjZj310S3ul+slx/YkiOu4JwxcdSnOFEzp3Vl2rj9a98GTOalkVTYxSS54
 wGYEeEYAZDls4uYGcCg1i1rJ0dwVqkYgxv3kEZbR+Jk/zt7QGRlzf8xyy0t9lW+Bbzdg
 RD4fq6EDjWZLifCum7bsuBDDlNp+wP0ZzGxRqBQKGUv2nGO4yEiBdmXI5nJNlFMLHcM0 Zg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h25m7sauk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Jul 2022 18:39:04 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 261IMnwH019550;
 Fri, 1 Jul 2022 18:39:04 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h25m7satw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Jul 2022 18:39:04 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 261IaHKS015799;
 Fri, 1 Jul 2022 18:39:03 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma05wdc.us.ibm.com with ESMTP id 3gwt0aude2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Jul 2022 18:39:02 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 261Id1fd33817028
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 1 Jul 2022 18:39:01 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C89DC136051;
 Fri,  1 Jul 2022 18:39:01 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A3E113604F;
 Fri,  1 Jul 2022 18:39:01 +0000 (GMT)
Received: from farman-thinkpad-t470p (unknown [9.163.2.135])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  1 Jul 2022 18:39:00 +0000 (GMT)
Message-ID: <85f0020ffbba4e032ca0638bdc674bb06baea280.camel@linux.ibm.com>
Subject: Re: [PATCH 08/12] pc-bios/s390-ccw/virtio: Beautify the code for
 reading virtqueue configuration
From: Eric Farman <farman@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org, Christian
 Borntraeger <borntraeger@linux.ibm.com>
Cc: qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>, Janosch Frank
 <frankja@linux.ibm.com>
Date: Fri, 01 Jul 2022 14:38:59 -0400
In-Reply-To: <20220628131032.213986-9-thuth@redhat.com>
References: <20220628131032.213986-1-thuth@redhat.com>
 <20220628131032.213986-9-thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: xveqnzxTdOElLibJ4FebmiYEnOd5st-M
X-Proofpoint-GUID: Bns9AJJefO1f77VjEFELn-Vc22ASYcaY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-01_10,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
> It looks nicer if we separate the run_ccw() from the IPL_assert()
> statement, and the error message should talk about "virtio device"
> instead of "block device", since this code is nowadays used for
> non-block (i.e. network) devices, too.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Eric Farman <farman@linux.ibm.com>

> ---
>  pc-bios/s390-ccw/virtio.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/pc-bios/s390-ccw/virtio.c b/pc-bios/s390-ccw/virtio.c
> index d8c2b52710..f37510f312 100644
> --- a/pc-bios/s390-ccw/virtio.c
> +++ b/pc-bios/s390-ccw/virtio.c
> @@ -289,9 +289,8 @@ void virtio_setup_ccw(VDev *vdev)
>              .num = 0,
>          };
>  
> -        IPL_assert(
> -            run_ccw(vdev, CCW_CMD_READ_VQ_CONF, &config,
> sizeof(config), false) == 0,
> -            "Could not get block device VQ configuration");
> +        rc = run_ccw(vdev, CCW_CMD_READ_VQ_CONF, &config,
> sizeof(config), false);
> +        IPL_assert(rc == 0, "Could not get virtio device VQ
> configuration");
>          info.num = config.num;
>          vring_init(&vdev->vrings[i], &info);
>          vdev->vrings[i].schid = vdev->schid;


