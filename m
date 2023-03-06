Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 953C66AC3B6
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 15:47:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZC5s-0003DG-Be; Mon, 06 Mar 2023 09:45:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pZC5m-00038z-EK; Mon, 06 Mar 2023 09:45:34 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pZC5k-0008Fj-9b; Mon, 06 Mar 2023 09:45:34 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 326E7V80001475; Mon, 6 Mar 2023 14:45:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=8HCDlRjtNpAvDsHPhbPNMJnymF3BvY40fQgZdH7OnJ8=;
 b=i1lNUe85Ph5dAS8AHeEs6Q+RKvMifXvN42ZMpLX+C4BiWjRUQjH7AVuIhuPD89tL7Jst
 WFcMGn8nIPHxXiEIiLL+6yejDw/2jg1SwwAfM08q7FynfK0oAgwJeg9My8gFOKV5Xt4J
 vWuMxW3v8QiApAZMKunHclDBXsQrdSwtsuuFQGzrawYc8xZjiLI81dbLhep/ddB+S5Pt
 9SJBpLR0QCh9Wxcp/Cl8LM8EjD+VqNVwPKwHThlnw5yJ7gpDsMBl+5tTk9eY5mIulTrR
 ZzmAgw2nz8pkg47xh2JxCgVD/AlipjE6XFXkyF5KtHo/rcW5LTTArzSmIr4mrK301gO5 cw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p507nxccd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Mar 2023 14:45:18 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 326EcSrY018324;
 Mon, 6 Mar 2023 14:45:17 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p507nxcc2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Mar 2023 14:45:17 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 326Ch4Ye005012;
 Mon, 6 Mar 2023 14:45:17 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([9.208.129.118])
 by ppma01wdc.us.ibm.com (PPS) with ESMTPS id 3p41845p41-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Mar 2023 14:45:17 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com
 [10.39.53.232])
 by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 326EjGo058130872
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Mar 2023 14:45:16 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA53E5805D;
 Mon,  6 Mar 2023 14:45:15 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DE7CC58053;
 Mon,  6 Mar 2023 14:45:13 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Mon,  6 Mar 2023 14:45:13 +0000 (GMT)
Message-ID: <1ecbfe9f-402a-1af0-cac9-170ae17a1ceb@linux.ibm.com>
Date: Mon, 6 Mar 2023 09:45:13 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 16/16] win32: replace closesocket() with close() wrapper
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
 <20230221124802.4103554-17-marcandre.lureau@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20230221124802.4103554-17-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: SzArglpmQBKBayfnUbfYtG7Jz3rPHZer
X-Proofpoint-ORIG-GUID: 37ViK0TidUpvJdmo6BlBJTGUumHuwlR8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_08,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 adultscore=0 phishscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 mlxscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303060128
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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



On 2/21/23 07:48, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Use a close() wrapper instead, so that we don't need to worry about
> closesocket() vs close() anymore, let's hope.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>

> diff --git a/util/oslib-win32.c b/util/oslib-win32.c
> index 7836fb0be3..29a667ae3d 100644
> --- a/util/oslib-win32.c
> +++ b/util/oslib-win32.c
> @@ -370,39 +370,39 @@ int qemu_bind_wrap(int sockfd, const struct sockaddr *addr,
>   }
> 
> 
> -#undef closesocket
> -int qemu_closesocket_wrap(int fd)
> +#undef close
> +int qemu_close_wrap(int fd)
>   {
>       int ret;
>       DWORD flags = 0;
> -    SOCKET s = _get_osfhandle(fd);
> +    SOCKET s = INVALID_SOCKET;
> 
> -    if (s == INVALID_SOCKET) {
> -        return -1;
> -    }
> +    if (fd_is_socket(fd)) {
> +        s = _get_osfhandle(fd);
> 
> -    /*
> -     * If we were to just call _close on the descriptor, it would close the
> -     * HANDLE, but it wouldn't free any of the resources associated to the
> -     * SOCKET, and we can't call _close after calling closesocket, because
> -     * closesocket has already closed the HANDLE, and _close would attempt to
> -     * close the HANDLE again, resulting in a double free. We can however
> -     * protect the HANDLE from actually being closed long enough to close the
> -     * file descriptor, then close the socket itself.
> -     */
> -    if (!GetHandleInformation((HANDLE)s, &flags)) {
> -        errno = EACCES;
> -        return -1;
> -    }
> +        /*
> +         * If we were to just call _close on the descriptor, it would close the
> +         * HANDLE, but it wouldn't free any of the resources associated to the
> +         * SOCKET, and we can't call _close after calling closesocket, because
> +         * closesocket has already closed the HANDLE, and _close would attempt to
> +         * close the HANDLE again, resulting in a double free. We can however
> +         * protect the HANDLE from actually being closed long enough to close the
> +         * file descriptor, then close the socket itself.
> +         */
> +        if (!GetHandleInformation((HANDLE)s, &flags)) {
> +            errno = EACCES;
> +            return -1;
> +        }
> 
> -    if (!SetHandleInformation((HANDLE)s, HANDLE_FLAG_PROTECT_FROM_CLOSE, HANDLE_FLAG_PROTECT_FROM_CLOSE)) {
> -        errno = EACCES;
> -        return -1;
> +        if (!SetHandleInformation((HANDLE)s, HANDLE_FLAG_PROTECT_FROM_CLOSE, HANDLE_FLAG_PROTECT_FROM_CLOSE)) {
> +            errno = EACCES;
> +            return -1;
> +        }
>       }
> 
>       ret = close(fd);
> 
> -    if (!SetHandleInformation((HANDLE)s, flags, flags)) {
> +    if (s != INVALID_SOCKET && !SetHandleInformation((HANDLE)s, flags, flags)) {
>           errno = EACCES;
>           return -1;
>       }
> @@ -411,13 +411,15 @@ int qemu_closesocket_wrap(int fd)
>        * close() returns EBADF since we PROTECT_FROM_CLOSE the underlying handle,
>        * but the FD is actually freed
>        */
> -    if (ret < 0 && errno != EBADF) {
> +    if (ret < 0 && (s == INVALID_SOCKET || errno != EBADF)) {
>           return ret;
>       }
> 
> -    ret = closesocket(s);
> -    if (ret < 0) {
> -        errno = socket_error();
> +    if (s != INVALID_SOCKET) {
> +        ret = closesocket(s);
> +        if (ret < 0) {
> +            errno = socket_error();
> +        }
>       }


if (fs_is_socket()) {{
     ...
     close()
     ...
     closesocket()
     ...
} else {
     ...
     close()
     ...
}

would avoid the threading and make this function look a bit simpler.

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>

