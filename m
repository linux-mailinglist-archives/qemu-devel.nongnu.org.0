Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1502C3FBEFE
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 00:29:10 +0200 (CEST)
Received: from localhost ([::1]:51842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKpm3-0005fH-Bc
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 18:29:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1mKpfj-0003R8-EV
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 18:22:31 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:37479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1mKpfh-0004d2-Ca
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 18:22:31 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id D21C840798;
 Tue, 31 Aug 2021 01:22:24 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 350C77D;
 Tue, 31 Aug 2021 01:22:25 +0300 (MSK)
Subject: Re: [PATCH] util: fix abstract socket path copy
From: Michael Tokarev <mjt@tls.msk.ru>
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20210719130112.932069-1-marcandre.lureau@redhat.com>
 <12894fce-38cd-8d29-9c2b-fc2d8f73a42f@msgid.tls.msk.ru>
 <1706f18b-d6e3-e88c-ac12-decdfbd7d9b2@msgid.tls.msk.ru>
Message-ID: <6dd4a9d9-c264-a747-0fb5-2d470f19ad16@msgid.tls.msk.ru>
Date: Tue, 31 Aug 2021 01:22:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1706f18b-d6e3-e88c-ac12-decdfbd7d9b2@msgid.tls.msk.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -77
X-Spam_score: -7.8
X-Spam_bar: -------
X-Spam_report: (-7.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.932,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: zxq_yx_007@163.com, berrange@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

31.08.2021 01:06, Michael Tokarev wrote:
...
> And this is the value used to be returned in the getsockname/getpeername
> calls.
> 
> So this has nothing to do with socket being abstract or not. We asked for
> larger storage for the sockaddr structure, and the kernel was able to build
> one for us, including the trailing \0 byte. Currently kernel will only
> return +1 byte for non-abstract sockets, but this is an implementation
> detail. We asked for it. So we - I think - should account for this +1
> byte here.

And here's the note from man 7 unix:

BUGS
        When binding a socket to an address, Linux is one of the implementations that appends a null termina‐
        tor if none is supplied in sun_path.  In most cases this is unproblematic: when the socket address is
        retrieved, it will be one byte longer than that supplied when the socket was bound.   However,  there
        is  one case where confusing behavior can result: if 108 non-null bytes are supplied when a socket is
        bound,  then  the  addition  of  the  null  terminator  takes  the  length  of  the  pathname  beyond
        sizeof(sun_path).   Consequently, when retrieving the socket address (for example, via accept(2)), if
        the input addrlen argument for the retrieving call is specified as sizeof(struct  sockaddr_un),  then
        the returned address structure won't have a null terminator in sun_path.

So how about this:

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index f2f3676d1f..83926dc2bc 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -1345,8 +1345,9 @@ socket_sockaddr_to_address_unix(struct sockaddr_storage *sa,
      SocketAddress *addr;
      struct sockaddr_un *su = (struct sockaddr_un *)sa;

+    /* kernel might have added \0 terminator to non-abstract socket */
      assert(salen >= sizeof(su->sun_family) + 1 &&
-           salen <= sizeof(struct sockaddr_un));
+           salen <= sizeof(struct sockaddr_un) + su->sun_path[0] ? 1 : 0);

      addr = g_new0(SocketAddress, 1);
      addr->type = SOCKET_ADDRESS_TYPE_UNIX;

?

/mjt

