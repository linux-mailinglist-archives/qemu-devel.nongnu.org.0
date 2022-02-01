Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8594A653B
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 20:58:27 +0100 (CET)
Received: from localhost ([::1]:57698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEzIH-0006PM-Tp
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 14:58:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1nExIj-0003GA-Qi; Tue, 01 Feb 2022 12:50:48 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:5166
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1nExIV-0003wZ-Td; Tue, 01 Feb 2022 12:50:39 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 211Gv5Lr002612; 
 Tue, 1 Feb 2022 17:50:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=lG6zHDnCzy+qsJfcEQqMYzd//hKgtZ2WbYtHY42i36s=;
 b=ao2qF6RIE1KIRBjK9IKKbF3G6RMPrqTTZKyVJibQcuh8bNGlK/0wTcJcddFLPRD4a2k5
 e3TlV54dvw86Mn6K0n3+vlbFUtHC2mJoy7CptAnb9cYQIqjPx//B1gQF2R0a3BPFWjg9
 rOT/c4KTU/yYhog4dHYttPSpaaSo0UGWWrN0h06MOXAbF85ndI95ub2UIwbqDpVIcDTq
 uoXRbfbevn1U1RLkedPtyc5AUSBHUi6BizsqsaSGfWa0oE+J39QjvSd6GU47QlBZdPIC
 soJxCtQ1RWuUEMi+2Rq/ZYR/DDN8pvBTop0sq0gMCWAsuA9M0brPemCkgIaDqRAmJIbt OA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dy8u7h0dc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Feb 2022 17:50:09 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 211GvnBo004847;
 Tue, 1 Feb 2022 17:50:09 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dy8u7h0cs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Feb 2022 17:50:09 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 211Hl6SR005094;
 Tue, 1 Feb 2022 17:50:07 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 3dvvujf0c9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Feb 2022 17:50:07 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 211Ho4Zw37617940
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Feb 2022 17:50:04 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F0E64204B;
 Tue,  1 Feb 2022 17:50:04 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D8DD642041;
 Tue,  1 Feb 2022 17:50:03 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.90.234])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue,  1 Feb 2022 17:50:03 +0000 (GMT)
Date: Tue, 1 Feb 2022 18:50:01 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v3 1/1] virtio: fix the condition for iommu_platform not
 supported
Message-ID: <20220201185001.41d467a3.pasic@linux.ibm.com>
In-Reply-To: <20220201115136-mutt-send-email-mst@kernel.org>
References: <20220201133915.3764972-1-pasic@linux.ibm.com>
 <87h79iy1nn.fsf@redhat.com>
 <20220201115136-mutt-send-email-mst@kernel.org>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: omDbysy3t_j62UAmJSk056_kDNiyFXAW
X-Proofpoint-GUID: TvuwSnExE2I6v_w8MD-u-WEtPH_kMK7o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-01_08,2022-02-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0
 spamscore=0 mlxscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 mlxlogscore=873 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202010098
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pasic@linux.ibm.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Daniel Henrique Barboza <danielhb@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-stable@nongnu.org,
 qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Jakob Naucke <Jakob.Naucke@ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 1 Feb 2022 11:52:06 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> > > +    bool vdev_has_iommu = false;  
> > 
> > Isn't vdev_has_iommu set unconditionally before you try to use it?  
> 
> I'd like to know too.

Yes it is. Was meant as a conservative thing. AFAIR in C stuff on stack
is not initialized to anything in particular so the idea was better
use false than garbage if someone made a mistake. But on the other
hand compilers can warn about that, and this defeats the compiler
warning. So uninitialized is indeed better.

