Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A96A3FCDB4
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 21:34:25 +0200 (CEST)
Received: from localhost ([::1]:41100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL9Wa-0003Ua-7k
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 15:34:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1mL9OZ-0006wj-Tx; Tue, 31 Aug 2021 15:26:07 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1mL9OW-0000IK-41; Tue, 31 Aug 2021 15:26:07 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id AA95440835;
 Tue, 31 Aug 2021 22:26:00 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 7E53E71;
 Tue, 31 Aug 2021 22:26:00 +0300 (MSK)
Subject: Re: [PATCH] qemu-sockets: fix unix socket path copy (again)
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20210831182623.1792608-1-mjt@msgid.tls.msk.ru>
 <CAMxuvayrgXYBU0dcmmO2=Po1fBLFugxP7JS7KrR83iVQZE9fKg@mail.gmail.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <b4b9e0af-2709-68ba-7687-a8209641d90c@msgid.tls.msk.ru>
Date: Tue, 31 Aug 2021 22:26:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAMxuvayrgXYBU0dcmmO2=Po1fBLFugxP7JS7KrR83iVQZE9fKg@mail.gmail.com>
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
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-stable <qemu-stable@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

31.08.2021 22:21, Marc-André Lureau wrote:
...

> Seems right to me, however there are some notes in libc bits/socket.h
> /* Structure large enough to hold any socket address (with the historical
>     exception of AF_UNIX).  */
> 
> And also this
> https://idea.popcount.org/2019-12-06-addressing/#fn:sockaddr_storage <https://idea.popcount.org/2019-12-06-addressing/#fn:sockaddr_storage>
> 
> I must say I feel confused by those comments :) Is it large enough or not??

It was my first thought too when I first saw the prototype
of this very function we're patching here:

   socket_sockaddr_to_address_unix(struct sockaddr_storage *sa, ...)

it uses sockaddr_storage and I swear I always thought sockaddr_storage
is for sockaddr_in and sockaddr_in6 but NOT for sockaddr_un.

If this is the case we're in trouble actually and all this stuff
needs serious review.

However by fact sockaddr_storage is actually LARGER than sockaddr_un.
I dunno how universal it is.

/mjt

