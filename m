Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D453D6390E0
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 21:54:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyfhO-0001QX-4G; Fri, 25 Nov 2022 15:53:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oyfhK-0001Pb-El; Fri, 25 Nov 2022 15:53:22 -0500
Received: from forwardcorp1a.mail.yandex.net ([178.154.239.72])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oyfhG-0007g0-JQ; Fri, 25 Nov 2022 15:53:21 -0500
Received: from vla1-81430ab5870b.qloud-c.yandex.net
 (vla1-81430ab5870b.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:35a1:0:640:8143:ab5])
 by forwardcorp1a.mail.yandex.net (Yandex) with ESMTP id 878895FF12;
 Fri, 25 Nov 2022 23:52:55 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:16::1:7] (unknown [2a02:6b8:b081:16::1:7])
 by vla1-81430ab5870b.qloud-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id sqTUt30NvqM1-mUM5bjS3; Fri, 25 Nov 2022 23:52:55 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1669409575; bh=Tudxd6deO2+mR+egwYxXaEZ907bK3wL8YtxoNABBLWo=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=rMVkkY51hDBX+i2rOByKrzBQ+fDWjqyBX+lxHJUNAixXdNJ0+p5ZuF74rywHB0Ifw
 mu3mYeB8ltjE6yQE4cScjlYYemAubXXgOMC05DqkmUwqYi43pVCv+X0lvedVL1URf+
 41nj9XehWHEBoVQBK1bmRJLbuzZgiCodzhQ3g9s0=
Authentication-Results: vla1-81430ab5870b.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <3652488b-cc6e-4c51-5fec-93bba1d7f128@yandex-team.ru>
Date: Fri, 25 Nov 2022 23:52:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v6 12/14] block-coroutine-wrapper.py: support also basic
 return types
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Stefan Weil <sw@weilnetz.de>, Jeff Cody <codyprime@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20221125133518.418328-1-eesposit@redhat.com>
 <20221125133518.418328-13-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20221125133518.418328-13-eesposit@redhat.com>
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

On 11/25/22 16:35, Emanuele Giuseppe Esposito wrote:
> Extend the regex to cover also return type, pointers included.
> This implies that the value returned by the function cannot be
> a simple "int" anymore, but the custom return type.
> Therefore remove poll_state->ret and instead use a per-function
> custom "ret" field.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Kevin Wolf <kwolf@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

> ---
>   block/block-gen.h                  |  5 +----
>   scripts/block-coroutine-wrapper.py | 19 +++++++++++--------
>   2 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/block/block-gen.h b/block/block-gen.h
> index 08d977f493..89b7daaa1f 100644
> --- a/block/block-gen.h
> +++ b/block/block-gen.h

[..]

>   
>   # Match wrappers declared with a co_wrapper mark
> -func_decl_re = re.compile(r'^int\s*co_wrapper'
> +func_decl_re = re.compile(r'^(?P<return_type>[a-zA-Z][a-zA-Z0-9_]* [*]?)'

hmm interesting. I'd just write \* to mean '*' symbol. Probably it's a tiny bit faster (and tiny bit shorter:)

-- 
Best regards,
Vladimir


