Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9836FA88D
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 12:42:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvyJp-0007LR-91; Mon, 08 May 2023 06:42:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1pvyJm-0007LJ-Jo
 for qemu-devel@nongnu.org; Mon, 08 May 2023 06:42:10 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1pvyJj-0006wc-Cc
 for qemu-devel@nongnu.org; Mon, 08 May 2023 06:42:09 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 8518640076;
 Mon,  8 May 2023 13:42:05 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id C26976D;
 Mon,  8 May 2023 13:42:04 +0300 (MSK)
Message-ID: <5492f69f-021d-cf25-5a92-8310255fddca@msgid.tls.msk.ru>
Date: Mon, 8 May 2023 13:42:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: missing boot rom: is it really a fatal error?
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
References: <d6f3e06c-ee84-5101-c583-220aa90c0c12@msgid.tls.msk.ru>
 <20230508062407-mutt-send-email-mst@kernel.org>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <20230508062407-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.964,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

08.05.2023 13:28, Michael S. Tsirkin wrote:
> On Sun, May 07, 2023 at 08:56:23PM +0300, Michael Tokarev wrote:
..

>> I'm about to revert that old change on debian, to make it just a warning instead
>> of an error (the code is different now, but the same principle applies), - because
>> I dislike dependencies which are useless 99.9% of the time and are trivial to
>> install when actually needed.
..
> I advise against it.
> If you boot guest on a system with boot rom not installed you will not
> be able to migrate to a system with boot rom installed.
> why not? because we don't know how big to make the rom BAR.
> And users will not discover until much much later after they have
> painted themselves into a corner.

Yes, I know about the migration. Actually there's an old bug report open
against debian qemu package, - the context is similar to the old bios128
vs bios256 thing in qemu upstream, - boot roms might change in size too.

In this context though, the talk is not about migration at all. The missing
dep is in Xen HVM qemu package, a xen-only build of qemu-system-i386. And
this one fails to start unless the boot roms are provided. It is not even
capable of migration to begin with :)

Thank you for the reminder, - very useful.

/mjt


