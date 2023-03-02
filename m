Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CED606A88AB
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 19:44:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXnuG-0000LM-CU; Thu, 02 Mar 2023 13:43:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pXnuA-0000FM-O8; Thu, 02 Mar 2023 13:43:51 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pXnu8-0003rU-1W; Thu, 02 Mar 2023 13:43:50 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 322IMx9q023057; Thu, 2 Mar 2023 18:43:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=KoPxG8P6lj+Q5Yg2dXfk1BUZF559TeTU2JYjSvciw88=;
 b=OGWesrOZS2n4ro7/SjCSdrrXHxmFb9fGI8T5JLMUkh4MFUk1RogyBjxKc0SgXDCYTbDK
 QaHN/hmj6AUIYlVwIXfVQiDgM3nhe40IDBT58b4I85Fl2ugTSTUpWLRhgZpGey8gu5In
 wBtkeH4M/pLIG2uDWviI2F4x0NSW8zaeXpngj6q7/BItGSJl/QROKSnpcmI2VsSkIuy3
 aAQEW1aQBLmRKjbXqGLMRh/iOG5zJ6qxRGeh35frXVx3MqI2wTojkEWYqT3nyrxaXbY/
 IFZqeb2pwPNzcE42LbtdrcbqgwcGHPtd3ZFsbcyjc/NFF8eQ+HspK/ulwbY1G2IAXiS8 UA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3p311e8g9d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Mar 2023 18:43:36 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 322IPcwR032754;
 Thu, 2 Mar 2023 18:43:35 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3p311e8g95-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Mar 2023 18:43:35 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 322Hx8Cb017424;
 Thu, 2 Mar 2023 18:43:34 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([9.208.129.116])
 by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3nybchwx9w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Mar 2023 18:43:34 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com
 [10.241.53.105])
 by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 322IhWcJ63963544
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Mar 2023 18:43:33 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 92B6A5805E;
 Thu,  2 Mar 2023 18:43:32 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7205C58043;
 Thu,  2 Mar 2023 18:43:31 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Thu,  2 Mar 2023 18:43:31 +0000 (GMT)
Message-ID: <59ec2ec5-cb8f-a82b-d48e-b04baf2a6214@linux.ibm.com>
Date: Thu, 2 Mar 2023 13:43:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 11/16] main-loop: remove qemu_fd_register(),
 win32/slirp/socket specific
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Michael Roth <michael.roth@amd.com>, qemu-arm@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 armbru@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Fam Zheng <fam@euphon.net>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Joel Stanley <joel@jms.id.au>, Hanna Reitz <hreitz@redhat.com>
References: <20230221124802.4103554-1-marcandre.lureau@redhat.com>
 <20230221124802.4103554-12-marcandre.lureau@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20230221124802.4103554-12-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 2XJaZL--RBArlGo7twCecMTtrCPlzxcZ
X-Proofpoint-GUID: IzVWkD4bjel82egZ2QEZkKB3FDsFjk6_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-02_11,2023-03-02_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 mlxscore=0
 malwarescore=0 bulkscore=0 phishscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2303020156
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 2/21/23 07:47, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Open-code the socket registration where it's needed, to avoid
> artificially used or unclear generic interface.
> 
> Furthermore, the following patches are going to make socket handling use
> FD-only inside QEMU, but we need to handle win32 SOCKET from libslirp.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   include/qemu/main-loop.h |  2 --
>   net/slirp.c              |  8 +++++++-
>   util/main-loop.c         | 11 -----------
>   3 files changed, 7 insertions(+), 14 deletions(-)
> 
> diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
> index c25f390696..b3e54e00bc 100644
> --- a/include/qemu/main-loop.h
> +++ b/include/qemu/main-loop.h
> @@ -387,8 +387,6 @@ void qemu_cond_timedwait_iothread(QemuCond *cond, int ms);
> 
>   /* internal interfaces */
> 
> -void qemu_fd_register(int fd);
> -
>   #define qemu_bh_new(cb, opaque) \
>       qemu_bh_new_full((cb), (opaque), (stringify(cb)))
>   QEMUBH *qemu_bh_new_full(QEMUBHFunc *cb, void *opaque, const char *name);
> diff --git a/net/slirp.c b/net/slirp.c
> index 2ee3f1a0d7..0730a935ba 100644
> --- a/net/slirp.c
> +++ b/net/slirp.c
> @@ -248,7 +248,13 @@ static void net_slirp_timer_mod(void *timer, int64_t expire_timer,
> 
>   static void net_slirp_register_poll_fd(int fd, void *opaque)
>   {
> -    qemu_fd_register(fd);
> +#ifdef WIN32

_WIN32 ?

With this fixed:

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>

