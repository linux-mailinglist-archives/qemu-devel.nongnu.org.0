Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E53C5BA889
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 10:50:22 +0200 (CEST)
Received: from localhost ([::1]:60098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZ73F-00072O-1z
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 04:50:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oZ6vc-0000fE-Ig; Fri, 16 Sep 2022 04:42:28 -0400
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:34710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oZ6vY-000401-20; Fri, 16 Sep 2022 04:42:27 -0400
Received: from vla1-81430ab5870b.qloud-c.yandex.net
 (vla1-81430ab5870b.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:35a1:0:640:8143:ab5])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 33D872E0A35;
 Fri, 16 Sep 2022 11:42:12 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b709::1:2b] (unknown
 [2a02:6b8:b081:b709::1:2b])
 by vla1-81430ab5870b.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 FRGy1Z1mCr-gAPCUb7l; Fri, 16 Sep 2022 11:42:11 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1663317731; bh=vLrXK1YaD4TcgAXe7p7jXYIjwxTLRE/tMbGjuvgTVuY=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=QaBaB/F2G7FzkKsSRPq+04TJpRorIXsbmNMjwS46ef9zr+UZYLefNtXcMfaOv9rGO
 qHIZ8yvHXeaY9xxRcRpgJk2Z/VK2TYvJGaRhhPwLvsQKgS4yIA8aZkk/tavCwfvDnN
 L8xsMSk6c+08g0wgK3wPOUeEqOQMIcYeYGcCrGJU=
Authentication-Results: vla1-81430ab5870b.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <09077aee-56f7-fd71-7c38-66d05de8fcdc@yandex-team.ru>
Date: Fri, 16 Sep 2022 11:42:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 00/27] qapi: Elide redundant has_FOO in generated C
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: michael.roth@amd.com, jsnow@redhat.com, eblake@redhat.com,
 Ani Sinha <ani@anisinha.ca>, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Jiri Pirko <jiri@resnulli.us>,
 Juan Quintela <quintela@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Mark Kanda <mark.kanda@oracle.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Yanan Wang <wangyanan55@huawei.com>, qemu-block@nongnu.org
References: <20220915204317.3766007-1-armbru@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220915204317.3766007-1-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:0:1619::183;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.816,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/15/22 23:42, Markus Armbruster wrote:
> In QAPI, absent optional members are distinct from any present value.
> We thus represent an optional schema member FOO as two C members: a
> FOO with the member's type, and a bool has_FOO.  Likewise for function
> arguments.
> 
> However, the has_FOO is actually redundant for a pointer-valued FOO,
> which can be null only when has_FOO is false, i.e. has_FOO == !!FOO.
> Except for arrays, where we a null FOO can also be a present empty
> array.
> 
> The redundant has_FOO are a nuisance to work with.  Improve the
> generator to elide them.
> 
> PATCH 01+02 are trivial documentation cleanups.
> 
> PATCH 03 tweaks an example in documentation so it'll show the change.
> 
> PATCH 04 improves the code generator, but nerfs the change for the
> schema modules where handwritten code needs to be updated.
> 
> PATCH 05-26 un-nerfs in reviewable chunks.  Their commit messages
> refer back to PATCH 04 for an explanation of the transformation.
> Please read that first.  Note that these patches combine the
> mechanical transformation with obvious, local follow-up
> simplifications.  If you want them separate for easier review, let me
> know.
> 

[..]

>   98 files changed, 456 insertions(+), 674 deletions(-)
> 

Good stats!

-- 
Best regards,
Vladimir

