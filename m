Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA675E77DF
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 12:03:43 +0200 (CEST)
Received: from localhost ([::1]:53692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obfX3-00031M-Hs
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 06:03:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1obfPp-0007aM-Q6
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 05:56:17 -0400
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:52524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1obfPh-0008AR-Cu
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 05:56:10 -0400
Received: from myt5-70c90f7d6d7d.qloud-c.yandex.net
 (myt5-70c90f7d6d7d.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e2c:0:640:70c9:f7d])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id F26552E11DD;
 Fri, 23 Sep 2022 12:55:54 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b65b::1:34] (unknown
 [2a02:6b8:b081:b65b::1:34])
 by myt5-70c90f7d6d7d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 7IOSaomfBU-tqOisWdh; Fri, 23 Sep 2022 12:55:54 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1663926954; bh=2FQHBOigYqfQ9YNzLdO611GpICTWBgTFEaZJLsrj49U=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=KvL8ykU6WmzMOSILjgvcX29TilRzvCJS5w26Kqk0EuXpqnwlFNcdHyopK4iNgjzCL
 y3D1rvzR579PpzXf1ca/Boo+uV0EJT/GiM5onCgcsHm8K8lkoU28hM6x2ZmLCDLoIQ
 3aZ0nkCvb7mpzy2eyQgHzoPMMBq8ekiE0pBw3tro=
Authentication-Results: myt5-70c90f7d6d7d.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <9b2cf0b8-634f-49d6-55c3-be66b19e601d@yandex-team.ru>
Date: Fri, 23 Sep 2022 12:55:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] add keepalive for qemu-nbd
Content-Language: en-US
To: "Denis V. Lunev" <den@virtuozzo.com>, songlinfeng <slf553@126.com>,
 qemu-devel@nongnu.org
Cc: eblake@redhat.com, songlinfeng <songlinfeng@inspur.com>
References: <1663749369-3057-1-git-send-email-slf553@126.com>
 <09e2a607-695e-7cb5-17cd-fcb84fd71815@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <09e2a607-695e-7cb5-17cd-fcb84fd71815@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1a2d::193;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.893,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/21/22 18:34, Denis V. Lunev wrote:
> On 9/21/22 10:36, songlinfeng wrote:
>> From: songlinfeng <songlinfeng@inspur.com>
>>
>> we want to export a image with qemu-nbd as server, in client we use libnbd to connect qemu-nbd,but when client power down,the server is still working.
>> qemu-nbd will exit when last client exit.so,we still want server exit when client power down.maybe qmp can handle it,but i don't know how to do .

Please wrap commit message to 72 characters in line.


>> Signed-off-by: songlinfeng <songlinfeng@inspur.com>
>> ---
>>   qemu-nbd.c | 23 ++++++++++++++++++++++-
>>   1 file changed, 22 insertions(+), 1 deletion(-)
>>
>> diff --git a/qemu-nbd.c b/qemu-nbd.c
>> index 0cd5aa6..115ef2b 100644
>> --- a/qemu-nbd.c
>> +++ b/qemu-nbd.c
>> @@ -20,7 +20,8 @@
>>   #include <getopt.h>
>>   #include <libgen.h>
>>   #include <pthread.h>
>> -
>> +#include <sys/types.h>
>> +#include <sys/socket.h>
>>   #include "qemu/help-texts.h"
>>   #include "qapi/error.h"
>>   #include "qemu/cutils.h"
>> @@ -365,6 +366,26 @@ static void nbd_accept(QIONetListener *listener, QIOChannelSocket *cioc,
>>       nb_fds++;
>>       nbd_update_server_watch();
>>       nbd_client_new(cioc, tlscreds, tlsauthz, nbd_client_closed);
>> +    int tcp_keepalive_intvl = 5;
>> +    int tcp_keepalive_probes = 5;
>> +    int tcp_keepalive_time = 60;
>> +    int tcp_keepalive_on = 1;
>> +    if (setsockopt(cioc->fd, SOL_TCP, TCP_KEEPINTVL,
>> +                   &tcp_keepalive_intvl, sizeof(tcp_keepalive_intvl)) < 0) {
>> +        perror("setsockopt failed\n");
>> +    }
>> +    if (setsockopt(cioc->fd, SOL_TCP, TCP_KEEPCNT,
>> +                   &tcp_keepalive_probes, sizeof(tcp_keepalive_probes)) < 0) {
>> +        perror("setsockopt failed\n");
>> +    }
>> +    if (setsockopt(cioc->fd, SOL_TCP, TCP_KEEPIDLE,
>> +                   &tcp_keepalive_time, sizeof(tcp_keepalive_time)) < 0) {
>> +        perror("setsockopt failed\n");
>> +    }
>> +    if (setsockopt(cios->fd, SOL_SOCKET, SO_KEEPALIVE,
>> +                   &tcp_keepalive_on, sizeof(tcp_keepalive_on)) < 0) {
>> +        perror("setsockopt failed\n");
>> +    }
>>   }
>>   static void nbd_update_server_watch(void)
> I tend to so no. Not in this exact form.
> 
> In general we have NBD server which could be created and configured
> in several different ways. Through qemu-nbd and through QMP.
> 
> At the moment we do set KEEP_ALIVE for outgoing connections
> only and that is configurable, please refer to
> 
> int inet_parse(InetSocketAddress *addr, const char *str, Error **errp)
> 
> which I believe should be called for the any real configuration
> setting with an IP address specified. This option will get
> InetSocketAddress->keep_alive/has_keep_alive set.
> 
> Though this option has no effect for the listen socket and
> this is wrong for you case. You are absolutely right,
> as specified in
> static int inet_listen_saddr(InetSocketAddress *saddr,
>                               int port_offset,
>                               int num,
>                               Error **errp)
> {
>      struct addrinfo ai,*res,*e;
>      char port[33];
>      char uaddr[INET6_ADDRSTRLEN+1];
>      char uport[33];
>      int rc, port_min, port_max, p;
>      int slisten = -1;
>      int saved_errno = 0;
>      bool socket_created = false;
>      Error *err = NULL;
> 
>      if (saddr->keep_alive) {
>          error_setg(errp, "keep-alive option is not supported for passive "
>                     "sockets");
>          return -1;
>      }
> 
> thus you should technically remove this pitfall and set keep_alive
> in the generic accept code if you have it specified for the listen
> socket.
> 
> This seems consistent to me.

I agree.

> Adding Vladimir to the loop as
> the submitter of the original keep-alive code (if my memory
> does not fail me :).

Yes please keep me in CC for NBD patches, you just need to run ./scripts/get_maintainer.pl /path/to/patch to get all involved maintainers.

-- 
Best regards,
Vladimir

