Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0FC6AC20E
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 15:00:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZBNX-0006XX-9s; Mon, 06 Mar 2023 08:59:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pZBNT-0006Ov-3u; Mon, 06 Mar 2023 08:59:47 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pZBNR-000649-6i; Mon, 06 Mar 2023 08:59:46 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 326CWTp9032687; Mon, 6 Mar 2023 13:59:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=xN5Y+5emN9VCdPjYcPQlD5yB25qL6zQ3wkmqg1Xiqjw=;
 b=DuW2WuDemmNk+tUKKA1ldW4xcr9VK2jV5wIRFjWnUWEETW3RIDEBWYzsOXD3YscPcd7o
 Rj6au6PwYRW+gbbmtDZL8csXZ0D5rm2GXBkEZGbL78gtHS7G7J9LkMvQzLP9PsJ8YnW1
 /CJ3Lm5aRXTp0Wthlyh1Vrqb4t8JQLU5t9+qsSZmmJgfekp5YCD3sLWKpjrN5Wh4Ak44
 u3wAEh+zq/KMzzin2uY7VepyJSTjUEX731R4P/IMD8bp7ZQRX4IV+FjNf1sIU4C7T2A7
 RpPCwdWs4w/LTYt+pTI7aVB0DULkPvG2onzod0UNUCXsmszAOT//iLJyR433I7hEOTYT 3A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3p4x1hq42m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Mar 2023 13:59:27 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 326Dr95k008730;
 Mon, 6 Mar 2023 13:59:26 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3p4x1hq41r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Mar 2023 13:59:26 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 326CxLZT010180;
 Mon, 6 Mar 2023 13:59:25 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([9.208.130.101])
 by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3p419e5f2r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Mar 2023 13:59:25 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com
 [10.39.53.231])
 by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 326DxOCJ8782360
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Mar 2023 13:59:24 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7410858045;
 Mon,  6 Mar 2023 13:59:24 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA0435805F;
 Mon,  6 Mar 2023 13:59:22 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Mon,  6 Mar 2023 13:59:22 +0000 (GMT)
Message-ID: <3a828966-2032-a432-ad44-b8198fb95945@linux.ibm.com>
Date: Mon, 6 Mar 2023 08:59:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 13/16] slirp: open-code qemu_socket_(un)select()
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
 <20230221124802.4103554-14-marcandre.lureau@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20230221124802.4103554-14-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rP5xiESczVtoYMOEzlD10aOr1ngx3FVC
X-Proofpoint-ORIG-GUID: YsWKSSKsfQ4UovvVVJwfvtiMF2-gls9P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_05,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=954 spamscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 adultscore=0 phishscore=0 mlxscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2303060120
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
> We are about to make the QEMU socket API use file-descriptor space only,
> but libslirp gives us SOCKET as fd, still.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   net/slirp.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/net/slirp.c b/net/slirp.c
> index a7c35778a6..c33b3e02e7 100644
> --- a/net/slirp.c
> +++ b/net/slirp.c
> @@ -251,16 +251,20 @@ static void net_slirp_register_poll_fd(int fd, void *opaque)

Shouldn't this int fd rather be a SOCKET s instead? Or do you get compiler warnings then?

>   #ifdef WIN32
>       AioContext *ctxt = qemu_get_aio_context();
> 
> -    qemu_socket_select(fd, event_notifier_get_handle(&ctxt->notifier),
> +    if (WSAEventSelect(fd, event_notifier_get_handle(&ctxt->notifier),
>                          FD_READ | FD_ACCEPT | FD_CLOSE |
> -                       FD_CONNECT | FD_WRITE | FD_OOB, NULL);
> +                       FD_CONNECT | FD_WRITE | FD_OOB) != 0) {
> +        error_setg_win32(&error_warn, WSAGetLastError(), "failed to WSAEventSelect()");
> +    }
>   #endif
>   }
> >   static void net_slirp_unregister_poll_fd(int fd, void *opaque)

Same here.

>   {
>   #ifdef WIN32
> -    qemu_socket_unselect(fd, NULL);
> +    if (WSAEventSelect(fd, NULL, 0) != 0) {
> +        error_setg_win32(&error_warn, WSAGetLastError(), "failed to WSAEventSelect()");
> +    }
>   #endif
>   }
> 

