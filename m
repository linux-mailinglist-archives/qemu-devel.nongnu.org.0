Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5843469874B
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 22:20:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSPCK-0000K8-V8; Wed, 15 Feb 2023 16:20:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pSPCF-0000HZ-7g
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 16:20:11 -0500
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pSPCB-0001j5-SX
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 16:20:10 -0500
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id E49A361CF3;
 Thu, 16 Feb 2023 00:19:59 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b58a::1:31] (unknown
 [2a02:6b8:b081:b58a::1:31])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 wJsOi40RvSw1-CdO9u7aj; Thu, 16 Feb 2023 00:19:58 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676495998; bh=NfzFoerSUKKVinvN0mgE1WHUd2fgkJu7m5CxcS6o6vA=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=qYJEpc61yWeoUrVUAbUEYzQQGD6iItG5cfLPJFMAXZiX5uJSpQMyMGLF2NagQqMsF
 BvNC+8xXDShp4iLyynVORQ0V1Fix+aQuH+umw7SQn4DsjZDHCts6kiGNqEnjH6PN17
 OKnBgQD87XRGzXR2oHCLmTvrF0UnIj5uqEy3aCrk=
Authentication-Results: iva4-f06c35e68a0a.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <9dcd8dd1-8b82-dc18-307c-a977d6574c2b@yandex-team.ru>
Date: Thu, 16 Feb 2023 00:19:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] qemu: make version available in coredump
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Markus Armbruster
 <armbru@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Denis Plotnikov <den-plotnikov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>
References: <20220607203221.966261-1-vsementsov@yandex-team.ru>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220607203221.966261-1-vsementsov@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.136;
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

ping)

-- 
Best regards,
Vladimir


