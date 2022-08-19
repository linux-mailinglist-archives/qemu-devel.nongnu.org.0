Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07707599EDA
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 17:59:14 +0200 (CEST)
Received: from localhost ([::1]:44706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP4Ov-0001S5-5w
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 11:59:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oP4HN-0007fj-J3; Fri, 19 Aug 2022 11:51:25 -0400
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:37586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oP4HM-0007zL-1y; Fri, 19 Aug 2022 11:51:25 -0400
Received: from sas1-7470331623bb.qloud-c.yandex.net
 (sas1-7470331623bb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bd1e:0:640:7470:3316])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id E2D3F2E0AB2;
 Fri, 19 Aug 2022 18:51:13 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b4ab::1:3b] (unknown
 [2a02:6b8:b081:b4ab::1:3b])
 by sas1-7470331623bb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 atOvRK0bE6-pCOGQkQ6; Fri, 19 Aug 2022 18:51:13 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1660924273; bh=B2VQY90qiNCDMY9nqwkyBxVF9UdGFMv2M3lQ0XWLyOg=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=fXHvMKKnf2yUwWJV9bCDK9ZV1QQIIB0wZ/vaEcJLYYP0HOMMFwMP9j4gbLVdnDKnZ
 xqFEuMnIB6gn8RH5AEwb9nDnZv1DH4Y37ljAwk36YZBNxDLi4fmBpXl/de901dQm7i
 iT4jYZa5kUfAzD6duz5TNhTzelTpLAqXI62y3JZU=
Authentication-Results: sas1-7470331623bb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <257778c1-61af-6021-e0cd-217d918730e1@yandex-team.ru>
Date: Fri, 19 Aug 2022 18:51:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/2] block: use bdrv_is_sg() helper instead of raw bs->sg
 reading
Content-Language: en-US
To: "Denis V. Lunev" <den@openvz.org>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Lieven <pl@kamp.de>
References: <20220817083736.40981-1-den@openvz.org>
 <20220817083736.40981-2-den@openvz.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220817083736.40981-2-den@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.45.199.163;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 8/17/22 11:37, Denis V. Lunev wrote:
> I believe that if the helper exists, it must be used always for reading
> of the value. It breaks expectations in the other case.
> 
> Signed-off-by: Denis V. Lunev<den@openvz.org>
> CC: Kevin Wolf<kwolf@redhat.com>
> CC: Hanna Reitz<hreitz@redhat.com>
> CC: Stefan Hajnoczi<stefanha@redhat.com>
> CC: Fam Zheng<fam@euphon.net>
> CC: Ronnie Sahlberg<ronniesahlberg@gmail.com>
> CC: Paolo Bonzini<pbonzini@redhat.com>
> CC: Peter Lieven<pl@kamp.de>
> CC: Vladimir Sementsov-Ogievskiy<vsementsov@yandex-team.ru>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

-- 
Best regards,
Vladimir

