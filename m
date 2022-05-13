Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E65BB5269BC
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 20:59:19 +0200 (CEST)
Received: from localhost ([::1]:36480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npaVS-0006L9-Uy
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 14:59:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1npaR9-0003CL-IQ
 for qemu-devel@nongnu.org; Fri, 13 May 2022 14:54:51 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:43677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1npaR7-0005fQ-Ad
 for qemu-devel@nongnu.org; Fri, 13 May 2022 14:54:50 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 9D5AE409F5
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 21:54:37 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 3EB8512D
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 21:54:36 +0300 (MSK)
Message-ID: <c457ed64-9457-9ebf-2935-bda2ae93ada5@msgid.tls.msk.ru>
Date: Fri, 13 May 2022 21:54:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: QEMU Developers <qemu-devel@nongnu.org>
From: Michael Tokarev <mjt@tls.msk.ru>
Subject: -blockdev vs -snapshot bug
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi!

Now here's something.. interesting.

I tested -blockdev here with a real image.  This way:

qemu-system-x86_64 ... -snapshot \
  -blockdev qcow2,node-name=q,file.driver=file,file.filename=w.qcow2 \
  -device ide-hd,drive=q

I always use -snapshot when testing something, not to damage the image.

And to my great surprise, the above command *did* damage my image.

It looks like -snapshot is entirely ignored by -blockdev.

This is quite a serious issue, to me anyway, - it is seriously
unexpected.

If it is intentional, I think an error should be thrown back
because the expectation is definitely different.

Or am I doing it wrong?

Thanks,

/mjt

