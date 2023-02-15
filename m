Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6A2698576
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 21:22:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSOHE-0007XU-Oh; Wed, 15 Feb 2023 15:21:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pSOHB-0007X3-TX
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 15:21:14 -0500
Received: from forwardcorp1b.mail.yandex.net
 ([2a02:6b8:c02:900:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pSOH6-0006cS-HZ
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 15:21:13 -0500
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id B5A0A61B23;
 Wed, 15 Feb 2023 23:20:59 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b58a::1:31] (unknown
 [2a02:6b8:b081:b58a::1:31])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 xKrfa40R44Y1-l2DHAjAI; Wed, 15 Feb 2023 23:20:59 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676492459; bh=KkDY3C3o8yctuSIaHsoCGE1Ncmbnfs6ccNvlm58cA1o=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=xP5bClFL+Ctc3AHWKhXwqCg60C31Wc+im1/r/MNNTyqpm8EQC1nlryc/Gjk+iPhF0
 ebJBGRDQOQprHAGGWPLEa6dRpCxnK/hEn2yQ4GPaTAhkJNhJ0jqldlJuz08NTS3d24
 0o5+IN+SO8heR2Y8zttR75HHnctyc65++XyhISiA=
Authentication-Results: iva4-f06c35e68a0a.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <35c7e623-1433-5250-6188-29424814bccb@yandex-team.ru>
Date: Wed, 15 Feb 2023 23:20:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] coverity: physmem: use simple assertions instead of
 modelling
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, david@redhat.com, peterx@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, armbru@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20221226220351.754204-1-vsementsov@yandex-team.ru>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20221226220351.754204-1-vsementsov@yandex-team.ru>
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

ping

[add Stefan]

-- 
Best regards,
Vladimir


