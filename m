Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37936459FE8
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 11:16:35 +0100 (CET)
Received: from localhost ([::1]:47076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpSqo-0004aj-3M
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 05:16:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1mpSob-0003AU-B6; Tue, 23 Nov 2021 05:14:17 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:34990
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1mpSoY-0006Va-Fv; Tue, 23 Nov 2021 05:14:17 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AN9kmD1026739; 
 Tue, 23 Nov 2021 10:14:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Dlb+HgXaQDGOB0Q1JR3u2ljrxedMirwed5tW5g5c5hg=;
 b=PJUwqZZhNv/6RpvqOoCdrOik/K4earbmokJ5hiKD4TSAMHwCHW3pYdtcHiZTq5K3Vy30
 b58O2LuZBzT4cO4SaVDLUjRQX0/bT6ZrfCFca7WCflroft3kjhIbyKBX15p1XHib5oMD
 4nvtVS3wEyZqJZ4J/8MoZ6gSaUbVqttM4XNH+aL58SuoN8hlE34bX4nrrN1exRseq7LG
 mIB/meOJYMPvbdSA4u6EW7cnKJIsffgVSuiZb7oVbfugNAEPwbeKmPz2SQp4bEeQoQFM
 gMeP3xOwdsf/QibSxSH4Qdn+bDJ0vdXKBfZkxzdc1iRrwmde9Va+IbEE+7/W2GHxWuxF 7g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cgwyhrg0s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Nov 2021 10:14:11 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AN9tGuI025668;
 Tue, 23 Nov 2021 10:14:10 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cgwyhrg0g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Nov 2021 10:14:10 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1ANAD2hO019830;
 Tue, 23 Nov 2021 10:14:09 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 3cer9jpgdn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Nov 2021 10:14:08 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1ANA6vf163832382
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Nov 2021 10:06:57 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C1F7711C054;
 Tue, 23 Nov 2021 10:14:05 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4BC8A11C05B;
 Tue, 23 Nov 2021 10:14:05 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.0.71])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 23 Nov 2021 10:14:05 +0000 (GMT)
Date: Tue, 23 Nov 2021 11:14:03 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: Christian Borntraeger <borntraeger@linux.ibm.com>
Subject: Re: [PATCH 1/1] MAINTAINERS: update email address of Christian
 Borntraeger
Message-ID: <20211123111403.7e9aac7b.pasic@linux.ibm.com>
In-Reply-To: <20211123095511.132810-1-borntraeger@linux.ibm.com>
References: <20211123095511.132810-1-borntraeger@linux.ibm.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MV6SbCFTWOLu84wtKkCH_TRouKnK0hbi
X-Proofpoint-ORIG-GUID: EKrK5KTQhej706VJLK0e0zcIQ2xJ0Cbe
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-23_03,2021-11-23_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=966
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 clxscore=1015
 spamscore=0 impostorscore=0 bulkscore=0 malwarescore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111230055
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pasic@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Halil Pasic <pasic@linux.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 23 Nov 2021 10:55:11 +0100
Christian Borntraeger <borntraeger@linux.ibm.com> wrote:

> My borntraeger@de.ibm.com email is just a forwarder to the
> linux.ibm.com address. Let us remove the extra hop to avoid
> a potential source of errors.
> 
> While at it, add the relevant email addresses to mailmap.
> 
> Signed-off-by: Christian Borntraeger <borntraeger@de.ibm.com>

Acked-by: Halil Pasic <pasic@linux.ibm.com>

> ---
>  .mailmap    | 1 +
>  MAINTAINERS | 6 +++---
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/.mailmap b/.mailmap
> index 8beb2f95ae28..c45d1c530144 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -50,6 +50,7 @@ Aleksandar Rikalo <aleksandar.rikalo@syrmia.com> <arikalo@wavecomp.com>
>  Aleksandar Rikalo <aleksandar.rikalo@syrmia.com> <aleksandar.rikalo@rt-rk.com>
>  Alexander Graf <agraf@csgraf.de> <agraf@suse.de>
>  Anthony Liguori <anthony@codemonkey.ws> Anthony Liguori <aliguori@us.ibm.com>
> +Christian Borntraeger <borntraeger@linux.ibm.com> <borntraeger@de.ibm.com>
>  Filip Bozuta <filip.bozuta@syrmia.com> <filip.bozuta@rt-rk.com.com>
>  Frederic Konrad <konrad@adacore.com> <fred.konrad@greensocs.com>
>  Greg Kurz <groug@kaod.org> <gkurz@linux.vnet.ibm.com>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d3879aa3c12c..e19d88ca9960 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -393,7 +393,7 @@ F: target/ppc/kvm.c
>  
>  S390 KVM CPUs
>  M: Halil Pasic <pasic@linux.ibm.com>
> -M: Christian Borntraeger <borntraeger@de.ibm.com>
> +M: Christian Borntraeger <borntraeger@linux.ibm.com>
>  S: Supported
>  F: target/s390x/kvm/
>  F: target/s390x/ioinst.[ch]
> @@ -1527,7 +1527,7 @@ S390 Machines
>  -------------
>  S390 Virtio-ccw
>  M: Halil Pasic <pasic@linux.ibm.com>
> -M: Christian Borntraeger <borntraeger@de.ibm.com>
> +M: Christian Borntraeger <borntraeger@linux.ibm.com>
>  S: Supported
>  F: hw/char/sclp*.[hc]
>  F: hw/char/terminal3270.c
> @@ -1541,7 +1541,7 @@ T: git https://github.com/borntraeger/qemu.git s390-next
>  L: qemu-s390x@nongnu.org
>  
>  S390-ccw boot
> -M: Christian Borntraeger <borntraeger@de.ibm.com>
> +M: Christian Borntraeger <borntraeger@linux.ibm.com>
>  M: Thomas Huth <thuth@redhat.com>
>  S: Supported
>  F: hw/s390x/ipl.*


