Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C77156EC1A2
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 20:38:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqeak-00040C-Mw; Sun, 23 Apr 2023 14:37:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1pqeaW-0003zt-QS
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 14:37:28 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1pqea6-0000iM-B6
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 14:37:16 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id B4ECD401AE;
 Sun, 23 Apr 2023 21:37:01 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 502A395;
 Sun, 23 Apr 2023 21:37:00 +0300 (MSK)
Message-ID: <635b7a76-9972-1c5a-5215-1d148a098e37@msgid.tls.msk.ru>
Date: Sun, 23 Apr 2023 21:37:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: get_relocated_path: the configured paths are not looked for?
Content-Language: en-US
From: Michael Tokarev <mjt@tls.msk.ru>
To: Akihiko Odaki <akihiko.odaki@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <7f96ff38-2268-07d3-23a3-d46bf036b711@msgid.tls.msk.ru>
 <20e76562-b1c7-3574-a277-7df6260226cc@gmail.com>
 <a01a470e-891e-bdfc-aefc-00701a6a0413@msgid.tls.msk.ru>
 <63948283-d7dc-924b-c19a-6e376096daac@gmail.com>
 <30817af4-5b21-b1ff-293c-f39196842077@msgid.tls.msk.ru>
 <fa344795-07c0-b6a2-5666-9a44e1671b38@gmail.com>
 <bccc8256-30f9-95e4-68a2-793ba4bceb0a@msgid.tls.msk.ru>
 <c5568089-d8e4-36da-4a77-92ccc350f003@gmail.com>
 <0803ed60-9ed6-26aa-f5a8-c955c8ca085a@msgid.tls.msk.ru>
 <dfa9e438-d1be-caec-6320-c5f196ced2f5@gmail.com>
 <8bbe3316-2020-e995-9b57-d6a93da4ab1f@msgid.tls.msk.ru>
In-Reply-To: <8bbe3316-2020-e995-9b57-d6a93da4ab1f@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.143,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

23.04.2023 21:33, Michael Tokarev пишет:

> $ cd /tmp; printf '#include <stdio.h>\nint main(){puts("Hello!");return 0;}' > hello.c; cp /usr/bin/gcc .; ./gcc hello.c; ./a.out ; ./gcc --version; 
> ls -l gcc; cd /tmp
> Hello!

execve("/tmp/../lib/gcc/x86_64-linux-gnu/12/cc1", [...])

Since this is merged-usr system, it finds its component just fine,
that's why it works here in /tmp, doesn't work in a subdir of /tmp,
and doesn't work in your case (non-merged /usr).

> Still, GCC is an exception. It is very rare.

/mjt


