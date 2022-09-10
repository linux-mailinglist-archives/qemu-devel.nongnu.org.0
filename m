Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 796B65B45E4
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Sep 2022 12:20:34 +0200 (CEST)
Received: from localhost ([::1]:49964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWxbF-0004fj-5E
	for lists+qemu-devel@lfdr.de; Sat, 10 Sep 2022 06:20:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oWxZ9-0003Au-5L; Sat, 10 Sep 2022 06:18:23 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:36510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oWxZ5-0002MH-D9; Sat, 10 Sep 2022 06:18:21 -0400
Received: from sas1-7470331623bb.qloud-c.yandex.net
 (sas1-7470331623bb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bd1e:0:640:7470:3316])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 1ADAE2E09E2;
 Sat, 10 Sep 2022 13:18:06 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:1329::1:2d] (unknown
 [2a02:6b8:b081:1329::1:2d])
 by sas1-7470331623bb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 103c0tZzgL-I4PaIeW3; Sat, 10 Sep 2022 13:18:05 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1662805085; bh=603Ws+ALd0qF+FzUB87g2C4O+LyZneGIA6p3hiip0Iw=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=cLwKzqXNuLMDDeHZspBhEerd3lNTskXPDvYSLHLTCQxd+SsA2hRo3pf6GP6J5Scbp
 aFw0EvlEzsqMp0jQs+5B1EjJ0i1vTyPSqwpLZehoYpwLqV44uEJ8NnmzuDyxTe+p1i
 490wt4qfP0GYUJW9IRC3Yfw4frBi3oXNPHf+EWSE=
Authentication-Results: sas1-7470331623bb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <626e7cce-d85f-7448-b28f-a5de559f6aa6@yandex-team.ru>
Date: Sat, 10 Sep 2022 13:18:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] bugfix:migrate with block-dirty-bitmap (disk size is big
 enough) can't be finished
Content-Language: en-US
To: liuhaiwei <liuhaiwei9699@126.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Cc: stefanha@redhat.com, fam@euphon.net, eblake@redhat.com, jsnow@redhat.com, 
 quintela@redhat.com, dgilbert@redhat.com, liuhaiwei <liuhaiwei@inspur.com>
References: <20220910063542.3036319-1-liuhaiwei9699@126.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220910063542.3036319-1-liuhaiwei9699@126.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.079,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/10/22 09:35, liuhaiwei wrote:
> From: liuhaiwei <liuhaiwei@inspur.com>
> 
> bug description as  https://gitlab.com/qemu-project/qemu/-/issues/1203
> Usually,we use the precopy or postcopy mode to migrate block dirty bitmap.
> but if block-dirty-bitmap size more than threshold size,we cannot entry the migration_completion in migration_iteration_run function
> To solve this problem, we can setting  the pending size to a fake value(threshold-1 or 0) to tell  migration_iteration_run function to entry the migration_completion,if pending size > threshold size
> 


Actually, bitmaps migrate in postcopy. So, you should start postcopy for it to work (qmp command migrate-start-postcopy). This command simply set the boolean variable, so that in migration_iteration_run() we'll move to postcopy when needed. So, you can start this command immediately after migrate command, or even before it, but after setting the "dirty-bitmaps" capability.

Fake pending is a wrong thing to do, it means that you will make downtime to be larger than expected.

-- 
Best regards,
Vladimir

