Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F33942EB04D
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 17:40:37 +0100 (CET)
Received: from localhost ([::1]:54980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwpNt-0004dt-1X
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 11:40:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1kwpIm-0000Wa-3B
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:35:20 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:58774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1kwpIk-00046q-Di
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:35:19 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 105GIkxJ036102;
 Tue, 5 Jan 2021 16:35:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=BculOCjTE3EzHuXSJDxGdkbxdvYEBBsY24JXdzH0GGA=;
 b=fonZUZBOACTGbYHTQLiUnBKnqKYTESKHaJvICX3PX/koSHOyxPNIRLFxl5sQaga+3WIM
 h/Fz9mJ2D8hZ3pqW298cmNfYe991rzuVQkMmeD56WF+6rG3OquB1zuC1/KwkNXa9R5X0
 KHDIxAVZHX0uiDsBmlXR/5oKezZ41FnMtIukbx1KhFHbp4DlwhV46QA0+3kGKQEUxbc3
 ryC5EhScX/MhpXSlz0u9UL7NWIu0cUaapqAN/HJr0hMgQA+QTVazdRvAA7Xcg8XQhw4+
 GG/nzPoAS5GAFK8/sHl8oSy/G/H/FIqJA8771uL5TVRtk7w9QJ2Iook12UDS06Sg/w6d /w== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 35tebaspxs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 05 Jan 2021 16:35:15 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 105GKmWQ087116;
 Tue, 5 Jan 2021 16:35:14 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 35v1f8tn91-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Jan 2021 16:35:14 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 105GZDNA029466;
 Tue, 5 Jan 2021 16:35:13 GMT
Received: from [10.39.222.70] (/10.39.222.70)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 05 Jan 2021 16:35:13 +0000
Subject: Re: [PATCH V2 18/22] chardev: cpr for sockets
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <1609861330-129855-1-git-send-email-steven.sistare@oracle.com>
 <1609861330-129855-19-git-send-email-steven.sistare@oracle.com>
 <20210105162243.GG724458@redhat.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
Message-ID: <c91f963a-09ea-9fef-3664-527f27e60742@oracle.com>
Date: Tue, 5 Jan 2021 11:35:10 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210105162243.GG724458@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9855
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101050100
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9855
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101050100
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=steven.sistare@oracle.com; helo=aserp2130.oracle.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.249, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/5/2021 11:22 AM, Daniel P. Berrangé wrote:
> On Tue, Jan 05, 2021 at 07:42:06AM -0800, Steve Sistare wrote:
>> Define qio_channel_socket_reuse to initialize a channel based on an existing
>> socket fd.  Save accepted socket fds in the environment before cprsave, and
>> look for fds in the environment after cprload.  Reject cprsave if a socket
>> enables the TLS or websocket option.
>>
>> Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>> ---
>>  chardev/char-socket.c       | 30 ++++++++++++++++++++++++++++++
>>  include/io/channel-socket.h | 12 ++++++++++++
>>  io/channel-socket.c         |  9 +++++++++
>>  stubs/Makefile.objs         |  1 +
>>  stubs/cpr.c                 |  3 +++
>>  5 files changed, 55 insertions(+)
>>  create mode 100644 stubs/cpr.c
>>
> 
>> diff --git a/include/io/channel-socket.h b/include/io/channel-socket.h
>> index 777ff59..e425a01 100644
>> --- a/include/io/channel-socket.h
>> +++ b/include/io/channel-socket.h
>> @@ -260,5 +260,17 @@ QIOChannelSocket *
>>  qio_channel_socket_accept(QIOChannelSocket *ioc,
>>                            Error **errp);
>>  
>> +/**
>> + * qio_channel_socket_reuse:
>> + * @fd: existing client socket descriptor
>> + * @errp: pointer to a NULL-initialized error object
>> + *
>> + * Construct a client channel using @fd.
>> + *
>> + * Returns: the new client channel, or NULL on error
>> + */
>> +QIOChannelSocket *
>> +qio_channel_socket_reuse(int fd,
>> +                         Error **errp);
>>  
>>  #endif /* QIO_CHANNEL_SOCKET_H */
>> diff --git a/io/channel-socket.c b/io/channel-socket.c
>> index de49880..07981be 100644
>> --- a/io/channel-socket.c
>> +++ b/io/channel-socket.c
>> @@ -400,6 +400,15 @@ qio_channel_socket_accept(QIOChannelSocket *ioc,
>>      return NULL;
>>  }
>>  
>> +QIOChannelSocket *
>> +qio_channel_socket_reuse(int fd,
>> +                         Error **errp)
>> +{
>> +    QIOChannelSocket *cioc = qio_channel_socket_new();
>> +    cioc->fd = fd;
>> +    return qio_channel_socket_post_accept(cioc, errp) ? 0 : cioc;
>> +}
> 
> Why do we need to add this new API when we already have
> 
>  qio_channel_socket_new_fd(int fd, Error **errp)
> 
> which accepts a pre-opened socket FD ?

That was fast!
Good call, thanks.  I missed that qio_channel_socket_new_fd calls qio_channel_socket_set_fd and
the latter performs the necessary post-accept actions.  I will also delete patch 17.

- Steve

