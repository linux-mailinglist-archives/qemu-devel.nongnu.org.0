Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE25259E80C
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 18:55:03 +0200 (CEST)
Received: from localhost ([::1]:59122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQXB4-0005FC-OD
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 12:55:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oQX8j-00037P-HM; Tue, 23 Aug 2022 12:52:33 -0400
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:51578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oQX8f-00068P-Ni; Tue, 23 Aug 2022 12:52:31 -0400
Received: from myt6-81d8ab6a9f9d.qloud-c.yandex.net
 (myt6-81d8ab6a9f9d.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:520a:0:640:81d8:ab6a])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 8694C2E0ACC;
 Tue, 23 Aug 2022 19:52:19 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b4ab::1:3b] (unknown
 [2a02:6b8:b081:b4ab::1:3b])
 by myt6-81d8ab6a9f9d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 n7vy62HN4i-qHOOB0E8; Tue, 23 Aug 2022 19:52:18 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1661273538; bh=NzS4QexfvpOP9bbQvS3NJjg/WHCNrsiS5uvW026s8Zg=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=ERervWeIH0GjsP53Z1baQN69rRJg/4yRLhA/6CofGqeGpWW8FtRzTaQH7hzCQA3j0
 l/fcIEtXzT6xd/Gd+pUIWe05crSjKXioUm3GUbSzEMMCNkvqMTTFnX9j+yEeFUjcZf
 sgEyipSuDA4dNWjvkcCnAWM5JCFrWJaViyfIdoAc=
Authentication-Results: myt6-81d8ab6a9f9d.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <35ccb69a-c04c-272b-b2ac-54ff4aaa54b8@yandex-team.ru>
Date: Tue, 23 Aug 2022 19:52:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 2/2] block: add missed block_acct_setup with new block
 device init procedure
Content-Language: en-US
To: "Denis V. Lunev" <den@openvz.org>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Cc: Peter Krempa <pkrempa@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
References: <20220823095719.105387-1-den@openvz.org>
 <20220823095719.105387-3-den@openvz.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220823095719.105387-3-den@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=77.88.29.217;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
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

On 8/23/22 12:57, Denis V. Lunev wrote:
> Commit 5f76a7aac156ca75680dad5df4a385fd0b58f6b1 is looking harmless from
> the first glance, but it has changed things a lot. 'libvirt' uses it to
> detect that it should follow new initialization way and this changes
> things considerably. With this procedure followed, blockdev_init() is
> not called anymore and thus block_acct_setup() helper is not called.
> 
> This means in particular that defaults for block accounting statistics
> are changed and account_invalid/account_failed are actually initialized
> as false instead of true originally.
> 
> This commit changes things to match original world. There are the following
> constraints:
> * new default value in block_acct_init() is set to true
> * block_acct_setup() inside blockdev_init() is called before
>    blkconf_apply_backend_options()
> * thus newly created option in block device properties has precedence if
>    specified
> 
> Signed-off-by: Denis V. Lunev <den@openvz.org>
> CC: Peter Krempa <pkrempa@redhat.com>
> CC: Markus Armbruster <armbru@redhat.com>
> CC: John Snow <jsnow@redhat.com>
> CC: Kevin Wolf <kwolf@redhat.com>
> CC: Hanna Reitz <hreitz@redhat.com>
> CC: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---

[..]

> --- a/qapi/misc.json
> +++ b/qapi/misc.json
> @@ -210,12 +210,6 @@
>   #
>   # @cpu-index: The CPU to use for commands that require an implicit CPU
>   #
> -# Features:
> -# @savevm-monitor-nodes: If present, HMP command savevm only snapshots
> -#                        monitor-owned nodes if they have no parents.
> -#                        This allows the use of 'savevm' with
> -#                        -blockdev. (since 4.2)
> -#
>   # Returns: the output of the command as a string
>   #
>   # Since: 0.14
> @@ -243,8 +237,7 @@
>   ##
>   { 'command': 'human-monitor-command',
>     'data': {'command-line': 'str', '*cpu-index': 'int'},
> -  'returns': 'str',
> -  'features': [ 'savevm-monitor-nodes' ] }
> +  'returns': 'str' }
>   
>   ##
>   # @getfd:

These changes of qapi/misc.json seems accidental. With them dropped:
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>


-- 
Best regards,
Vladimir

