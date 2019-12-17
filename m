Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A52122E50
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Dec 2019 15:16:42 +0100 (CET)
Received: from localhost ([::1]:41054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihDeT-0005fW-NL
	for lists+qemu-devel@lfdr.de; Tue, 17 Dec 2019 09:16:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52187)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pl@kamp.de>) id 1ihDcO-0003Pe-8K
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 09:14:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pl@kamp.de>) id 1ihDcN-00061L-27
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 09:14:31 -0500
Received: from kerio.kamp.de ([195.62.97.192]:40739)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pl@kamp.de>)
 id 1ihDcM-00057O-RS; Tue, 17 Dec 2019 09:14:31 -0500
X-Footer: a2FtcC5kZQ==
Received: from [172.21.12.60] ([172.21.12.60]) (authenticated user pl@kamp.de)
 by kerio.kamp.de with ESMTPSA
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits));
 Tue, 17 Dec 2019 15:14:19 +0100
To: qemu block <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
From: Peter Lieven <pl@kamp.de>
Subject: bdrv_co_pwritev: Assertion `!waited || !use_local_qiov' failed.
Message-ID: <16b69066-cabb-3412-0005-886055352a05@kamp.de>
Date: Tue, 17 Dec 2019 15:14:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 195.62.97.192
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
Cc: vsementsov@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,


I have a vserver running Qemu 4.0 that seems to reproducibly hit the following assertion:

  bdrv_co_pwritev: Assertion `!waited || !use_local_qiov' failed.


I noticed that the padding code was recently reworked in commit 2e2ad02f2c.

In the new code I cannot find a similar assertion. Was the assertion wrong or why was it dropped?


I try to add some debugging code to find out what is exactly happing. Especially the requests that

are in flight when the assertion is triggered.


Thanks,

Peter



