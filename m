Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF68416399
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 18:49:12 +0200 (CEST)
Received: from localhost ([::1]:34288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTRuJ-0006zV-6v
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 12:49:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1mTRt5-0006B9-7g; Thu, 23 Sep 2021 12:47:55 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:64424
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1mTRt1-0002sK-AY; Thu, 23 Sep 2021 12:47:54 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18NG0En5008148; 
 Thu, 23 Sep 2021 12:47:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=4zcnOhAJnRiOi5BPkyYBW2cKSZhvgA8MxOoRBB4VPD8=;
 b=NR00wTTmbFFoYZhQHkegz8L1E9QhpPWy2tS4wXHUpnC77fEkk2UCvFvnFfyofNvAweLY
 sHHX7UwtrY46RJb2wRq34xOZWA0MZlsCK3ICilegfJIzJCgM/vFjdkMuqw2zNYhvPgHJ
 jBjDlUxN5FZjjplA8ARnU113i3tk0rgiF/sP2MtrhzOPm8FkZzaaYM4BBQ0vGosN6gtR
 4YtWTMbh3sxOTR+S4vkQboQ2LY9jXmQSIxgcX5X2pg0r2JoPrcUYPEAz80tzHn6eekP4
 mVKxT2eJtb8KIU+7pe0ZlUv1LxQjHvKrD6tohVB2rcQUEpJ3Zy/91pqxXvSAOiYsS9Ug YQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3b8vqk9asv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Sep 2021 12:47:48 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18NGHga5014401;
 Thu, 23 Sep 2021 12:47:48 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3b8vqk9as9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Sep 2021 12:47:48 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18NGg79g024478;
 Thu, 23 Sep 2021 16:47:46 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma02fra.de.ibm.com with ESMTP id 3b7q6s3xx1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Sep 2021 16:47:46 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18NGlh1j57344308
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Sep 2021 16:47:43 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4719B42049;
 Thu, 23 Sep 2021 16:47:43 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D564E42052;
 Thu, 23 Sep 2021 16:47:42 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.13.138])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 23 Sep 2021 16:47:42 +0000 (GMT)
Date: Thu, 23 Sep 2021 18:47:40 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] block: introduce max_hw_iov for use in scsi-generic
Message-ID: <20210923184740.6363ea31.pasic@linux.ibm.com>
In-Reply-To: <20210923162811.3ab68c5f.pasic@linux.ibm.com>
References: <20210923130436.1187591-1-pbonzini@redhat.com>
 <20210923162811.3ab68c5f.pasic@linux.ibm.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: yYDFtFDjl0dwTd5xX6w2pWZKMPN7az2P
X-Proofpoint-GUID: cWC5ARZJD1Llyixyp0yJF_YmDAIxG4-_
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-23_05,2021-09-23_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 mlxscore=0 phishscore=0 impostorscore=0 mlxlogscore=982
 malwarescore=0 priorityscore=1501 spamscore=0 adultscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109200000 definitions=main-2109230102
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
Cc: Kevin Wolf <kwolf@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 23 Sep 2021 16:28:11 +0200
Halil Pasic <pasic@linux.ibm.com> wrote:

> Can't we use some of the established constants instead of hard coding a
> qemu specific IOV_MAX?
> 
> POSIX.1 seems to guarantee the availability of IOV_MAX in <limits.h>
> according to: https://man7.org/linux/man-pages/man2/readv.2.html
> and <sys/uio.h> may have UIO_MAXIOV defined.

Never mind, the 
#define IOV_MAX 1024
in osdep.h is conditional and I guess we already use IOV_MAX from limit
when CONFIG_IOVEC is defined, i.e. when we don't emulate the interface.

Sorry for the noise.

Regards,
Halil

