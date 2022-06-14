Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6317354AAF8
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 09:52:05 +0200 (CEST)
Received: from localhost ([::1]:55118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o11LI-00046h-5v
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 03:52:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o11K1-0002gr-Sb; Tue, 14 Jun 2022 03:50:45 -0400
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:52962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o11Jy-0007kZ-QU; Tue, 14 Jun 2022 03:50:44 -0400
Received: from sas2-6a1db1376cb6.qloud-c.yandex.net
 (sas2-6a1db1376cb6.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bb0f:0:640:6a1d:b137])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 841C22E1A73;
 Tue, 14 Jun 2022 10:50:34 +0300 (MSK)
Received: from sas1-c73b4b4f4b95.qloud-c.yandex.net
 (sas1-c73b4b4f4b95.qloud-c.yandex.net [2a02:6b8:c08:12a9:0:640:c73b:4b4f])
 by sas2-6a1db1376cb6.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 RRZ8rzfTqS-oYJCKi2l; Tue, 14 Jun 2022 10:50:34 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1655193034; bh=lAZdhnvLyQsGDMGbXMMQDM9sJREpj93Wa6R/UCZmPqU=;
 h=In-Reply-To:From:Cc:To:Subject:Message-ID:References:Date;
 b=rJbxnxNQK4QkT56Hsqhs/gLX/wVwHM2EIlZJG6QCg8AG6Q0i9qCdce+/urvUA8ZRX
 n5VZA7T7dB8TmmX7xZKyRDWWdiUY+4SVy7dI2BJ/PQQxdX2qv9+ZquvdKM1OHnDMMT
 jy+OEerW35iGrn8hYGfPQsinn5gM/CCgRlVsz1MI=
Authentication-Results: sas2-6a1db1376cb6.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from [IPV6:2a02:6b8:b081:a427::1:2e] (unknown
 [2a02:6b8:b081:a427::1:2e])
 by sas1-c73b4b4f4b95.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 A5uHuq4H85-oXNaAFdc; Tue, 14 Jun 2022 10:50:33 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Message-ID: <7ab80558-f383-7727-0e0b-cff36a757b89@yandex-team.ru>
Date: Tue, 14 Jun 2022 10:50:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/1] block: use 'unsigned' for in_flight field on driver
 state
Content-Language: en-US
To: "Denis V. Lunev" <den@openvz.org>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Eric Blake <eblake@redhat.com>
References: <20220530103957.629398-1-den@openvz.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220530103957.629398-1-den@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.45.199.163;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 5/30/22 13:39, Denis V. Lunev wrote:
> This patch makes in_flight field 'unsigned' for BDRVNBDState and
> MirrorBlockJob. This matches the definition of this field on BDS
> and is generically correct - we should never get negative value here.
> 
> Signed-off-by: Denis V. Lunev<den@openvz.org>
> CC: John Snow<jsnow@redhat.com>
> CC: Vladimir Sementsov-Ogievskiy<vsementsov@yandex-team.ru>
> CC: Kevin Wolf<kwolf@redhat.com>
> CC: Hanna Reitz<hreitz@redhat.com>
> CC: Eric Blake<eblake@redhat.com>


Thanks, applied to my block branch at https://gitlab.com/vsementsov/qemu/-/commits/block

-- 
Best regards,
Vladimir

