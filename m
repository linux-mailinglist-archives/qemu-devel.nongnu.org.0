Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0160478F4E
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 16:15:08 +0100 (CET)
Received: from localhost ([::1]:51622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myEws-00055K-FT
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 10:15:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1myEd0-0007aN-OB; Fri, 17 Dec 2021 09:54:34 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:63438
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1myEcv-0008PQ-4b; Fri, 17 Dec 2021 09:54:34 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BHEeufG010104; 
 Fri, 17 Dec 2021 14:54:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=c/NxG1Ha4RU9ntvatYyVYEwPle1OKmcPrtTt6PuHVjQ=;
 b=P50CxUY8HNPXrNmWnon0UPzabf9axPwzaQuvj58gzvNTt9ZIgzsZRFY/TM4js2O4CUkN
 UM/pgqowtIdHm1U14w/hbCyJd48rHwO0cidJmoOVYMwNTPKmNX/XLkqeXsn0WPc1Ds2z
 fg81PdqB8HiZYh+W7uP1f2rmesHQ8SfD1bMf99lAm3PIrONa5ikY4ANleP0OkEvMbXgc
 0lv3Jf4DwlF1sK7mWhaLA5UrYbqShDkh3qERVYWRZTOCzUJZM9ZfLVaGw5gSInLTTVw0
 RLx2o/HxWEat8C4U71D0ivDr1ThghblFWGOLKx59x1XRTX5sfrRI053942nbi9W5/Sz5 YA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cyhymg486-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Dec 2021 14:54:27 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BHEk5CN023451;
 Fri, 17 Dec 2021 14:54:26 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cyhymg47q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Dec 2021 14:54:26 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BHEF2cF018167;
 Fri, 17 Dec 2021 14:54:25 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04fra.de.ibm.com with ESMTP id 3cy7vw163v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Dec 2021 14:54:24 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1BHEsLvu41156992
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Dec 2021 14:54:21 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B2F814203F;
 Fri, 17 Dec 2021 14:54:21 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F49942054;
 Fri, 17 Dec 2021 14:54:21 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.63.32])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 17 Dec 2021 14:54:21 +0000 (GMT)
Date: Fri, 17 Dec 2021 15:54:18 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: Nico Boehr <nrb@linux.ibm.com>
Subject: Re: [PATCH qemu] s390x/css: fix PMCW invalid mask
Message-ID: <20211217155418.7f5bbca0.pasic@linux.ibm.com>
In-Reply-To: <20211217145811.71dd0a70.pasic@linux.ibm.com>
References: <20211216131657.1057978-1-nrb@linux.ibm.com>
 <20211217145811.71dd0a70.pasic@linux.ibm.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Jh1M3QecuxhLBu8jvjoMY0ZmdbM6YZws
X-Proofpoint-ORIG-GUID: hiCjG-3IgYTovm8SmaVuy1PhELxafZqP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-17_05,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 mlxlogscore=999 mlxscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112170084
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pasic@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: thuth@redhat.com, frankja@linux.ibm.com, pmorel@linux.ibm.com,
 cohuck@redhat.com, qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 17 Dec 2021 14:58:11 +0100
Halil Pasic <pasic@linux.ibm.com> wrote:

> On Thu, 16 Dec 2021 14:16:57 +0100
> Nico Boehr <nrb@linux.ibm.com> wrote:
> 
> > Previously, we required bits 5, 6 and 7 to be zero (0x07 == 0b111). But,
> > as per the principles of operation, bit 5 is ignored in MSCH and bits 0,
> > 1, 6 and 7 need to be zero.  
> 
> On a second thought, don't we have to make sure then that bit 5 is
> ignored?
> 
> static void copy_pmcw_from_guest(PMCW *dest, const PMCW *src)
> {
>     int i;
> 
>     dest->intparm = be32_to_cpu(src->intparm);
>     dest->flags = be16_to_cpu(src->flags);
>     dest->devno = be16_to_cpu(src->devno);
> 
> Here we seem to grab flags as a whole, but actually we would have to
> mask of bit 5.
> 
> I can spin a patch myself, provided we agree on that this needs to be
> fixed, but, it would probably be better to have the two changes in one
> patch.
> 

I didn't read far enough. We do mask bit 5 in in css_do_msch() and
copy_pmcw_from_guest() works on a schib_copy.

Everything is fine!

Regards,
Halil

