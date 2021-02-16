Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 121C931CBC0
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 15:21:31 +0100 (CET)
Received: from localhost ([::1]:44554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC1EI-0000bf-5h
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 09:21:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1lC1Cq-00082e-3B; Tue, 16 Feb 2021 09:20:00 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:4486
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1lC1Cn-0001Af-B8; Tue, 16 Feb 2021 09:19:59 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11GE26lL040150; Tue, 16 Feb 2021 09:19:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=lLpAaN8e0M0pVGt7l6FhU+skFWnoiyaXGubx2SAIqbI=;
 b=N8/2Rg221+z15+GqdB/N+XSdMh1SejhUhdqmKpRrQzZu1pw9R7fDgL3wKRpbyLsgkqI8
 ZVE5FHQpPXtQjEpc6Z2ljL2Pf1vQZdeKsr+/fdmXbNp3iMEwgqmXcI3ANNiEgGW7W56J
 fmYYTY3y8hMZvJGPEewnMmv4zfZlQGGFkyqaLsipMl9H1ZBMYNAjs6JIcUCzcvImkiDf
 XEjV3z2JUAYjhMbEAcGJsVkgAR8GELX99w8XWVQAOIt2MVP0mrLfMh0m6IAndQzAgKJw
 VT0C7i2v1Ko8WpePbozqs5ydgG6f/csLGifvdsLpa/6fl6Z4k8qJlPFMfUmQcDjVDhOJ pQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36reexjx7k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Feb 2021 09:19:53 -0500
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 11GE3jDJ048537;
 Tue, 16 Feb 2021 09:19:53 -0500
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36reexjx6t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Feb 2021 09:19:52 -0500
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11GEICFC003045;
 Tue, 16 Feb 2021 14:19:51 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04fra.de.ibm.com with ESMTP id 36p6d89f9f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Feb 2021 14:19:51 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11GEJnWj41681334
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Feb 2021 14:19:49 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D7287A405D;
 Tue, 16 Feb 2021 14:19:48 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 810ACA4051;
 Tue, 16 Feb 2021 14:19:48 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.71.158])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 16 Feb 2021 14:19:48 +0000 (GMT)
Date: Tue, 16 Feb 2021 15:19:45 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH] virtio-ccw: commands on revision-less devices
Message-ID: <20210216151945.736eb6c7.pasic@linux.ibm.com>
In-Reply-To: <20210216111830.1087847-1-cohuck@redhat.com>
References: <20210216111830.1087847-1-cohuck@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-16_03:2021-02-16,
 2021-02-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 mlxscore=0 spamscore=0 mlxlogscore=999 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102160126
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pasic@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@de.ibm.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Feb 2021 12:18:30 +0100
Cornelia Huck <cohuck@redhat.com> wrote:

> The virtio standard specifies that any non-transitional device must
> reject commands prior to revision setting (which we do) and else
> assume revision 0 (legacy) if the driver sends a non-revision-setting
> command first. We neglected to do the latter.

Huh, I my opinion, it ain't very clear what is specified by the virtio
standard (which starts with version 1.0) for the described situation.

The corresponding device normative section (4.3.2.1.1 Device
Requirements: Setting the Virtio Revision) says that: "A device MUST
treat the revision as unset from the time the associated subchannel has
been enabled until a revision has been successfully set by the driver.
This implies that revisions are not persistent across disabling and
enabling of the associated subchannel.". It doesn't say anything more
about the situation where the first command is not SET_VIRTIO_REV.

The section "4.3.2.1.3 Legacy Interfaces: A Note on Setting the Virtio
Revision" which is to my best knowledge not normative, as none of the
legacy-interface stuff is normative, but a mere advice on how to deal
with legacy then says: "A legacy driver will not issue the
CCW_CMD_SET_VIRTIO_REV prior to issuing other virtio-ccw specific
channel commands." ... "A transitional device MUST assume
in this case that the driver is a legacy driver and continue as if the
driver selected revision 0. This implies that the device MUST reject any
command not valid for revision 0, including a subsequent
CCW_CMD_SET_VIRTIO_REV."

Do we agree that the legacy interface sections in general, and 4.3.2.1.3
in particular is non-normative?

In my opinion the normative 'must threat as unset until set by driver'
and 'if first cmd is not _REV, must continue as if the driver selected
revision 0' is in a slight collision.


> 
> Fortunately, nearly everything worked as intended anyway; the only
> problem was not properly rejecting revision setting after some other
> command had been issued. Easy to fix by setting revision to 0 if
> we see a non-revision command on a legacy-capable revision-less
> device.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>

The change won't hurt so with a toned down commit message:
Acked-by: Halil Pasic <pasic@linux.ibm.com>

> ---
>  hw/s390x/virtio-ccw.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
> index 4582e94ae7dc..06c06056814b 100644
> --- a/hw/s390x/virtio-ccw.c
> +++ b/hw/s390x/virtio-ccw.c
> @@ -327,13 +327,20 @@ static int virtio_ccw_cb(SubchDev *sch, CCW1 ccw)
>                                     ccw.cmd_code);
>      check_len = !((ccw.flags & CCW_FLAG_SLI) && !(ccw.flags & CCW_FLAG_DC));
>  
> -    if (dev->force_revision_1 && dev->revision < 0 &&
> -        ccw.cmd_code != CCW_CMD_SET_VIRTIO_REV) {
> -        /*
> -         * virtio-1 drivers must start with negotiating to a revision >= 1,
> -         * so post a command reject for all other commands
> -         */
> -        return -ENOSYS;
> +    if (dev->revision < 0 && ccw.cmd_code != CCW_CMD_SET_VIRTIO_REV) {
> +        if (dev->force_revision_1) {
> +            /*
> +             * virtio-1 drivers must start with negotiating to a revision >= 1,
> +             * so post a command reject for all other commands
> +             */
> +            return -ENOSYS;
> +        } else {
> +            /*
> +             * If the driver issues any command that is not SET_VIRTIO_REV,
> +             * we'll have to operate the device in legacy mode.
> +             */
> +            dev->revision = 0;
> +        }
>      }
>  
>      /* Look at the command. */


