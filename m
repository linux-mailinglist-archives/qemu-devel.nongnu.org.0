Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 873423FCCA7
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 19:53:59 +0200 (CEST)
Received: from localhost ([::1]:37352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL7xG-0000Fb-NO
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 13:53:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1mL7rZ-0007W8-KK; Tue, 31 Aug 2021 13:47:57 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1mL7rX-0001js-R1; Tue, 31 Aug 2021 13:47:57 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 65D0040835;
 Tue, 31 Aug 2021 20:47:43 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 3FEF171;
 Tue, 31 Aug 2021 20:47:43 +0300 (MSK)
Subject: Re: qemu-sockets: account for trailing \0 byte in unix socket pathname
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20210830225449.1509719-1-mjt@msgid.tls.msk.ru>
 <c5887473-1df2-5827-e9c7-e6f0470ab332@msgid.tls.msk.ru>
 <CAMxuvawU2d6fFBczkDcPAJzYP4dSoin7UnesX2idHfd1WAyTOA@mail.gmail.com>
 <YS5pLKxTjguyUAlR@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <5826ad07-380d-b84a-4d16-507312baff08@msgid.tls.msk.ru>
Date: Tue, 31 Aug 2021 20:47:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YS5pLKxTjguyUAlR@redhat.com>
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
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-stable <qemu-stable@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

31.08.2021 20:38, Daniel P. Berrangé wrote:
...
>>> So it looks like libvirt provides an unnamed socket there, --
>>> maybe from a socketpair(2)?
>>>
>>
>> Yes
> 
> No, libvirt binds to a named socket path and passes in a pre-opened
> FD for the listener socket. There shouldn't be any socketpair involved.

Here's some more info from the original bugreport:

31.08.2021 00:20, dann frazier wrote:
 > Aha! It seems that the important difference is whether or not the
 > virt-manager GUI window for the VM is active. If it is active, the VM
 > crashes regardless of how it is started (virsh console start/clicking
 > "play" button). If the GUI is not active, the VM always works.
 >
 > With this knowledge I am able to confidently say that reverting
 > 4cfd970ec1 *does* reliably avoid the problem.

We'll try to figure out the calltrace, where this socket is coming from..

/mjt

