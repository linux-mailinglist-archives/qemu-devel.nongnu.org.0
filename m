Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4185369823D
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 18:35:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSLgh-0003c5-1E; Wed, 15 Feb 2023 12:35:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pSLgb-0003bI-9m; Wed, 15 Feb 2023 12:35:17 -0500
Received: from forwardcorp1b.mail.yandex.net
 ([2a02:6b8:c02:900:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pSLgY-0000Xp-0l; Wed, 15 Feb 2023 12:35:16 -0500
Received: from sas1-1ced178f0cda.qloud-c.yandex.net
 (sas1-1ced178f0cda.qloud-c.yandex.net
 [IPv6:2a02:6b8:c14:3a29:0:640:1ced:178f])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id E8A316294E;
 Wed, 15 Feb 2023 20:34:43 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b4bf::1:2e] (unknown
 [2a02:6b8:b081:b4bf::1:2e])
 by sas1-1ced178f0cda.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 gYoPoD0Qva61-uXDPF2Mn; Wed, 15 Feb 2023 20:34:43 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676482483; bh=AZKI0wIH4/sPmQC0m5o9HN0ir/LTVnAqY2kvdcGWjGU=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=LMPgidYlZj8HWNVqAy1qnWiiXz12GkpWwBM78cRsOPPSEXGYiEfl/gqPAzhmBq2Yv
 979VkUslXNOjBoLXeDvseOAOJQeMxu+X68VgLAoTMZlBQiw2IHRiHr94CeJv/Al0e1
 18ekMXPJ5o+JZKFfIrX81ATFOhy6rjZtZ66UAtz0=
Authentication-Results: sas1-1ced178f0cda.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <b58584d5-9989-6151-efa7-b5b44c8ea34f@yandex-team.ru>
Date: Wed, 15 Feb 2023 20:34:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 1/3] migration: In case of postcopy, the memory ends in
 res_postcopy_only
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Fam Zheng
 <fam@euphon.net>, Alex Williamson <alex.williamson@redhat.com>,
 qemu-s390x@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Eric Farman <farman@linux.ibm.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@redhat.com>
References: <20230215170345.6220-1-quintela@redhat.com>
 <20230215170345.6220-2-quintela@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20230215170345.6220-2-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:c02:900:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 15.02.23 20:03, Juan Quintela wrote:
> So remove last assignation of res_compatible.
> 
> Signed-off-by: Juan Quintela<quintela@redhat.com>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

-- 
Best regards,
Vladimir


