Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8167A4223E1
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 12:48:45 +0200 (CEST)
Received: from localhost ([::1]:59772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXi04-0000vX-Hv
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 06:48:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1mXhyB-0007Ye-CL
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 06:46:47 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:45762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1mXhy9-0004xm-Ss
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 06:46:47 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1959g0I1007011; 
 Tue, 5 Oct 2021 06:46:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=deadNT7igQA5kiktClWxY+e0NuQjlhQ0rN218pA/ZNk=;
 b=QZFEvcfGhMXktUtgPOybyKH43qDP/m8rrpZkeAdxzxnPFbMbEZM4vR6g0bf3lpfuvL6m
 TPdzTdjNmnFNT4OVwitGcpqLZ2NkX+dhirE20HG6KmCcpMPv8MjSdk+f7ZIvF7OAwNBp
 mvWGHjjLCOACIuCnNRHq0rYzPxfnFIcAtSJIlX0eRhQ9wusuoNVND7jsi15DpxBBlIlU
 BIugvVHCDn+T5WDjWOR52jrGSmIb/FqwI2hdd6Iaf8FqLZ+0ITHLqpcxYNOupbCX5hsk
 cOFzNKDgFgameiQd9IpVFCvVaJXdzvcT1MA336hmrJ9xLp6nHBcVepXxnGe1B1blayzj mQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bgma4sdfj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Oct 2021 06:46:43 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 195Akh86025213;
 Tue, 5 Oct 2021 06:46:43 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bgma4sdey-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Oct 2021 06:46:43 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 195AhClO009016;
 Tue, 5 Oct 2021 10:46:41 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 3bef2a17gq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Oct 2021 10:46:41 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 195Akbrj5309060
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 5 Oct 2021 10:46:37 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B73EDAE081;
 Tue,  5 Oct 2021 10:46:37 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CC792AE089;
 Tue,  5 Oct 2021 10:46:36 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.45.119])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue,  5 Oct 2021 10:46:36 +0000 (GMT)
Date: Tue, 5 Oct 2021 12:46:34 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [RFC PATCH 1/1] virtio: write back features before verify
Message-ID: <20211005124634.2a774796.pasic@linux.ibm.com>
In-Reply-To: <20211005035014-mutt-send-email-mst@kernel.org>
References: <20210930012049.3780865-1-pasic@linux.ibm.com>
 <20210930070444-mutt-send-email-mst@kernel.org>
 <20211001092125.64fef348.pasic@linux.ibm.com>
 <20211002055605-mutt-send-email-mst@kernel.org>
 <87bl452d90.fsf@redhat.com>
 <20211004090018-mutt-send-email-mst@kernel.org>
 <20211005092539.145c9cc4.pasic@linux.ibm.com>
 <20211005035014-mutt-send-email-mst@kernel.org>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: dISC-4Fas47o_uRyUynz0RAGrkvMT9az
X-Proofpoint-GUID: tCE_4RJXbd3HchYj9DxiZqvQ87w1z1GS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-04_05,2021-10-04_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110050061
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pasic@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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
Cc: linux-s390@vger.kernel.org, markver@us.ibm.com,
 Xie Yongji <xieyongji@bytedance.com>, Jason Wang <jasowang@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 linux-kernel@vger.kernel.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 virtualization@lists.linux-foundation.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 5 Oct 2021 03:53:17 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> > Wouldn't a call from transport code into virtio core
> > be more handy? What I have in mind is stuff like vhost-user and vdpa. My
> > understanding is, that for vhost setups where the config is outside qemu,
> > we probably need a new  command that tells the vhost backend what
> > endiannes to use for config. I don't think we can use
> > VHOST_USER_SET_VRING_ENDIAN because  that one is on a virtqueue basis
> > according to the doc. So for vhost-user and similar we would fire that
> > command and probably also set the filed, while for devices for which
> > control plane is handled by QEMU we would just set the field.
> > 
> > Does that sound about right?  
> 
> I'm fine either way, but when would you invoke this?
> With my idea backends can check the field when get_config
> is invoked.
> 
> As for using this in VHOST, can we maybe re-use SET_FEATURES?
> 
> Kind of hacky but nice in that it will actually make existing backends
> work...

Basically the equivalent of this patch, just on the vhost interface,
right? Could work I have to look into it :)

