Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0A46C11BB
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 13:21:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peEVB-0008Rj-Ey; Mon, 20 Mar 2023 08:20:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1peEV8-0008RE-Kh
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 08:20:34 -0400
Received: from forwardcorp1c.mail.yandex.net
 ([2a02:6b8:c03:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1peEV6-0008Ca-La
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 08:20:34 -0400
Received: from mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:1fa8:0:640:3b74:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 512B35E4EE;
 Mon, 20 Mar 2023 15:20:25 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b71c::1:38] (unknown
 [2a02:6b8:b081:b71c::1:38])
 by mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id OKnjsN0OqiE0-KCRFTlyj; Mon, 20 Mar 2023 15:20:24 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1679314824; bh=HOtMesTWTo+YV832HhnzoKsbHjGvEwkHs1EJr/QArIU=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=qvkhR5xrzPqdNw17Vf+9EMGA7x15Zq90gwxp/PN4KtMVFtXtlgVpRuzwY3Ha/3TmX
 xgxFZum+Do6r8ZiXZiIq3NnmxGRLgWFtjGsZeO7Nk+5ewZO7Rt8VCdjlH1p1WjFdQN
 IkFFa+mKGfQgeXdFRcZOyXHZ4Izd2RYE0GX5KpFI=
Authentication-Results: mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <00341422-35d7-7091-5be4-808e1431f113@yandex-team.ru>
Date: Mon, 20 Mar 2023 15:20:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] python: honour message limit when using pre-opened socket
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 John Snow <jsnow@redhat.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>
References: <20230320105404.637661-1-berrange@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20230320105404.637661-1-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c03:500:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 20.03.23 13:54, Daniel P. Berrangé wrote:
> The default message recv limit in asyncio is smaller than our needs, so
> when opening connections we override it. This was done when opening a
> connection using a socket address, but was missed when using a
> pre-opened socket file descriptor.
> 
> This latent bug was exposed when the QEMUMachine class was enhanced to
> use socketpair() when no socket address was passed by:
> 
>    commit bd4c0ef409140bd1be393407c04005ac077d4574
>    Author: Marc-André Lureau<marcandre.lureau@redhat.com>
>    Date:   Wed Jan 11 12:01:01 2023 +0400
> 
>      python/qemu/machine: use socketpair() for QMP by default
> 
> Signed-off-by: Daniel P. Berrangé<berrange@redhat.com>

Tested-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Thanks!

-- 
Best regards,
Vladimir


