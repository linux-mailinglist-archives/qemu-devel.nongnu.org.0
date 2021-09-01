Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 739753FD6BD
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 11:28:22 +0200 (CEST)
Received: from localhost ([::1]:37704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLMXc-0004Fu-SI
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 05:28:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1mLMQ2-0002ZH-PV; Wed, 01 Sep 2021 05:20:31 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:35307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1mLMQ0-0007VN-RQ; Wed, 01 Sep 2021 05:20:30 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id D82ED4000A;
 Wed,  1 Sep 2021 12:20:23 +0300 (MSK)
Received: from [192.168.177.132] (mjt-x200la.wg.tls.msk.ru [192.168.177.132])
 by tsrv.corpit.ru (Postfix) with ESMTP id A84117D;
 Wed,  1 Sep 2021 12:20:23 +0300 (MSK)
Subject: Re: [PATCH] qemu-sockets: fix unix socket path copy (again)
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20210831182623.1792608-1-mjt@msgid.tls.msk.ru>
 <CAMxuvayrgXYBU0dcmmO2=Po1fBLFugxP7JS7KrR83iVQZE9fKg@mail.gmail.com>
 <YS9EAOX4g7zIjxhp@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <f12881b4-beae-2b81-5450-a0a2680cd8ba@msgid.tls.msk.ru>
Date: Wed, 1 Sep 2021 12:20:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YS9EAOX4g7zIjxhp@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: ru-RU
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
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-stable <qemu-stable@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01.09.2021 12:12, Daniel P. Berrangé wrote:
>> Seems right to me, however there are some notes in libc bits/socket.h
>> /* Structure large enough to hold any socket address (with the historical
>>     exception of AF_UNIX).  */
>>
>> And also this
>> https://idea.popcount.org/2019-12-06-addressing/#fn:sockaddr_storage
>>
>> I must say I feel confused by those comments :) Is it large enough or not??
> 
>  From 'man unix(7)'

I quoted this very place in other thread yesterday. And also included
the kernel code which actually does this.

But the question here is about different issue: is sockaddr_un larger
than sockaddr_storage?

/mjt

