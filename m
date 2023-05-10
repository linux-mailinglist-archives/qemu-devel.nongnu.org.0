Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C15A06FE405
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 20:24:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwoTZ-0005jJ-Dz; Wed, 10 May 2023 14:23:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1pwoTX-0005io-6Q
 for qemu-devel@nongnu.org; Wed, 10 May 2023 14:23:43 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1pwoTV-0003ti-JD
 for qemu-devel@nongnu.org; Wed, 10 May 2023 14:23:42 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id DE4134F07;
 Wed, 10 May 2023 21:23:40 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 778A838D6;
 Wed, 10 May 2023 21:23:39 +0300 (MSK)
Message-ID: <fa043442-b854-998a-09a1-d21e3ecaac44@msgid.tls.msk.ru>
Date: Wed, 10 May 2023 21:23:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] ui/cursor: incomplete check for integer overflow in
 cursor_alloc
Content-Language: en-US
To: Mauro Matteo Cascella <mcascell@redhat.com>, qemu-devel@nongnu.org
Cc: kraxel@redhat.com, marcandre.lureau@redhat.com, jacek.halon@gmail.com
References: <20230508141813.1086562-1-mcascell@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <20230508141813.1086562-1-mcascell@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -101
X-Spam_score: -10.2
X-Spam_bar: ----------
X-Spam_report: (-10.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.251,
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

08.05.2023 17:18, Mauro Matteo Cascella wrote:
> The cursor_alloc function still accepts a signed integer for both the cursor
> width and height. A specially crafted negative width/height could make datasize
> wrap around and cause the next allocation to be 0, potentially leading to a
> heap buffer overflow. Modify QEMUCursor struct and cursor_alloc prototype to
> accept unsigned ints.
> 
> Fixes: CVE-2023-1601
> Fixes: fa892e9a ("ui/cursor: fix integer overflow in cursor_alloc (CVE-2021-4206)")

Looks like -stable material too?

Thanks,

/mjt

