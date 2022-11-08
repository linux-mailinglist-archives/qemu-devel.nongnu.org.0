Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B5E62162D
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 15:23:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osPU7-0000mZ-Vj; Tue, 08 Nov 2022 09:21:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1osPTt-0000lj-Cp; Tue, 08 Nov 2022 09:21:38 -0500
Received: from forwardcorp1a.mail.yandex.net ([178.154.239.72])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1osPTq-0007tM-83; Tue, 08 Nov 2022 09:21:35 -0500
Received: from vla1-81430ab5870b.qloud-c.yandex.net
 (vla1-81430ab5870b.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:35a1:0:640:8143:ab5])
 by forwardcorp1a.mail.yandex.net (Yandex) with ESMTP id 5BE4F5FF33;
 Tue,  8 Nov 2022 17:21:22 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b535::1:28] (unknown
 [2a02:6b8:b081:b535::1:28])
 by vla1-81430ab5870b.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 WJ1zSh8C87-LLNiXCqQ; Tue, 08 Nov 2022 17:21:21 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1667917281; bh=vz7r5GvKdphlS2nUn2eGwibAUgRN8DQDqWgIgnWnW4s=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=f4sFeoJG/ZVYo2zcAkT7lfee3DMqWag3P4fS2GF7aQToKG4Mdp2EXsxqgmAggRK2D
 XaZPJzkzQJTJtDKqvUUaiIJDqBpyyOx40F/Lv8kil2Udp3DxEL0MmSzZGtjLOSC+i4
 KBqEJd7o3RgSe9bTi91vJiC4Kg/UUTcJ6Izmw9s8=
Authentication-Results: vla1-81430ab5870b.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <77ab4539-2f55-1fb3-9371-71a0695cc6da@yandex-team.ru>
Date: Tue, 8 Nov 2022 17:21:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3 09/30] nbd/server: Clean up abuse of
 BlockExportOptionsNbd member @arg
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: jsnow@redhat.com, eblake@redhat.com, michael.roth@amd.com,
 qemu-block@nongnu.org
References: <20221104160712.3005652-1-armbru@redhat.com>
 <20221104160712.3005652-10-armbru@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20221104160712.3005652-10-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.72;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1a.mail.yandex.net
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

On 11/4/22 19:06, Markus Armbruster wrote:
> block-export-add argument @name defaults to the value of argument
> @node-name.
> 
> nbd_export_create() implements this by copying @node_name to @name.
> It leaves @has_node_name false, violating the "has_node_name ==
> !!node_name" invariant.  Unclean.  Falls apart when we elide
> @has_node_name (next commit): then QAPI frees the same value twice,
> once for @node_name and once @name.  iotest 307 duly explodes.
> 
> Goes back to commit c62d24e906 "blockdev-nbd: Boxed argument type for
> nbd-server-add" (v5.0.0).  Got moved from qmp_nbd_server_add() to
> nbd_export_create() (commit 56ee86261e), then copied back (commit
> b6076afcab).  Commit 8675cbd68b "nbd: Utilize QAPI_CLONE for type
> conversion" (v5.2.0) cleaned up the copy in qmp_nbd_server_add()
> noting
> 
>      Second, our assignment to arg->name is fishy: the generated QAPI code
>      for qapi_free_NbdServerAddOptions does not visit arg->name if
>      arg->has_name is false, but if it DID visit it, we would have
>      introduced a double-free situation when arg is finally freed.
> 
> Exactly.  However, the copy in nbd_export_create() remained dirty.
> 
> Clean it up.  Since the value stored in member @name is not actually
> used outside this function, use a local variable instead of modifying
> the QAPI object.
> 
> Signed-off-by: Markus Armbruster<armbru@redhat.com>
> Cc: Eric Blake<eblake@redhat.com>
> Cc: Vladimir Sementsov-Ogievskiy<vsementsov@yandex-team.ru>
> Cc:qemu-block@nongnu.org


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

-- 
Best regards,
Vladimir


