Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAF458421E
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 16:46:29 +0200 (CEST)
Received: from localhost ([::1]:34076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH4mP-0001rE-AS
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 10:46:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oH4iz-0006k4-0g; Thu, 28 Jul 2022 10:42:53 -0400
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:60236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oH4iu-0000nk-W9; Thu, 28 Jul 2022 10:42:51 -0400
Received: from vla1-81430ab5870b.qloud-c.yandex.net
 (vla1-81430ab5870b.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:35a1:0:640:8143:ab5])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 7C90D2E046F;
 Thu, 28 Jul 2022 17:42:30 +0300 (MSK)
Received: from [10.211.24.38] (10.211.24.38-vpn.dhcp.yndx.net [10.211.24.38])
 by vla1-81430ab5870b.qloud-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id aIXPCEuCME-gSOa1dPh; Thu, 28 Jul 2022 17:42:29 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1659019349; bh=ixefPU+SFl6A15nCZsEMlxO9Jw3fDTb/OnL2TnIHTuU=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=FcWTzywqxBlGP07G5WINmbYvtqxqzPIXOn9+fY4gUkV7yr1/w8NfpRZx5KulNlMRL
 BwcWUFgpRcG8xnqJ97fHqUC+oM7wPS2UaCYLDtwqFfoufms5y5cAvccTUNLXEd/feg
 VLfpGsYPAqxpjsaCqAIjQd60yn7gFzm/+1x72FEM=
Authentication-Results: vla1-81430ab5870b.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <1aa3921a-0e67-d580-9bf2-c098d242e380@yandex-team.ru>
Date: Thu, 28 Jul 2022 17:42:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/1] block: add missed block_acct_setup with new block
 device init procedure
Content-Language: en-US
To: "Denis V. Lunev" <den@openvz.org>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, qemu-stable@nongnu.org
Cc: Peter Krempa <pkrempa@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
References: <20220711110725.425261-1-den@openvz.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220711110725.425261-1-den@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:0:1619::183;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 7/11/22 14:07, Denis V. Lunev wrote:
> Commit 5f76a7aac156ca75680dad5df4a385fd0b58f6b1 is looking harmless from
> the first glance, but it has changed things a lot. 'libvirt' uses it to
> detect that it should follow new initialization way and this changes
> things considerably. With this procedure followed, blockdev_init() is
> not called anymore and thus block_acct_setup() helper is not called.

I'm not sure that 5f76a7aac156ca is really the corner stone.. But yes,
libvirt moved to "blockdev era", which means that we don't use old -drive,
instead block nodes are created by -blockdev / qmp: blockdev-add, and attached
to block devices by node-name.

And if I understand correctly blockdev_init() is called only on -drive path.

I have some questions:

1. After this patch, don't we call block_acct_setup() twice on old path with -drive? That seems safe as block_acct_setup just assign fields of BlockAcctStats.. But that's doesn't look good.

2. Do we really need these options? Could we instead just enable accounting invalid and failed ops unconditionally? I doubt that someone will learn that these new options appeared and will use them to disable the failed/invalid accounting again.


> 
> This means in particular that defaults for block accounting statistics
> are changed and account_invalid/account_failed are actually initialized
> as false instead of true originally.
> 
> This commit changes things to match original world. It adds
> account_invalid/account_failed properties to BlockConf and setups them
> accordingly.
> 
> Signed-off-by: Denis V. Lunev <den@openvz.org>
> CC: Peter Krempa <pkrempa@redhat.com>
> CC: Markus Armbruster <armbru@redhat.com>
> CC: John Snow <jsnow@redhat.com>
> CC: Kevin Wolf <kwolf@redhat.com>
> CC: Hanna Reitz <hreitz@redhat.com>
> ---
>   hw/block/block.c           |  2 +
>   include/hw/block/block.h   |  7 +++-
>   tests/qemu-iotests/172.out | 76 ++++++++++++++++++++++++++++++++++++++
>   3 files changed, 84 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/block/block.c b/hw/block/block.c
> index 25f45df723..53b100cdc3 100644
> --- a/hw/block/block.c
> +++ b/hw/block/block.c
> @@ -205,6 +205,8 @@ bool blkconf_apply_backend_options(BlockConf *conf, bool readonly,
      BlockdevOnError rerror;
>       blk_set_enable_write_cache(blk, wce);
>       blk_set_on_error(blk, rerror, werror);
>   
> +    block_acct_setup(blk_get_stats(blk), conf->account_invalid,
> +                     conf->account_failed);
>       return true;
>   }
>   
> diff --git a/include/hw/block/block.h b/include/hw/block/block.h
> index 5902c0440a..ffd439fc83 100644
> --- a/include/hw/block/block.h
> +++ b/include/hw/block/block.h
> @@ -31,6 +31,7 @@ typedef struct BlockConf {
>       uint32_t lcyls, lheads, lsecs;
>       OnOffAuto wce;
>       bool share_rw;
> +    bool account_invalid, account_failed;
>       BlockdevOnError rerror;
>       BlockdevOnError werror;
>   } BlockConf;
> @@ -61,7 +62,11 @@ static inline unsigned int get_physical_block_exp(BlockConf *conf)
>                          _conf.discard_granularity, -1),                  \
>       DEFINE_PROP_ON_OFF_AUTO("write-cache", _state, _conf.wce,           \
>                               ON_OFF_AUTO_AUTO),                          \
> -    DEFINE_PROP_BOOL("share-rw", _state, _conf.share_rw, false)
> +    DEFINE_PROP_BOOL("share-rw", _state, _conf.share_rw, false),        \
> +    DEFINE_PROP_BOOL("account-invalid", _state,                         \
> +                     _conf.account_invalid, true),                      \
> +    DEFINE_PROP_BOOL("account-failed", _state,                          \
> +                     _conf.account_failed, true)
>   
>   #define DEFINE_BLOCK_PROPERTIES(_state, _conf)                          \
>       DEFINE_PROP_DRIVE("drive", _state, _conf.blk),                      \
> diff --git a/tests/qemu-iotests/172.out b/tests/qemu-iotests/172.out
> index 9479b92185..a6c451e098 100644
> --- a/tests/qemu-iotests/172.out
> +++ b/tests/qemu-iotests/172.out
> @@ -28,6 +28,8 @@ Formatting 'TEST_DIR/t.IMGFMT.3', fmt=IMGFMT size=737280
>                   discard_granularity = 4294967295 (4 GiB)
>                   write-cache = "auto"
>                   share-rw = false
> +                account-invalid = true
> +                account-failed = true
>                   drive-type = "288"
>   
>   
> @@ -55,6 +57,8 @@ Testing: -fda TEST_DIR/t.qcow2
>                   discard_granularity = 4294967295 (4 GiB)
>                   write-cache = "auto"
>                   share-rw = false
> +                account-invalid = true
> +                account-failed = true
>                   drive-type = "144"
>   floppy0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
>       Attached to:      /machine/unattached/device[N]
> @@ -92,6 +96,8 @@ Testing: -fdb TEST_DIR/t.qcow2
>                   discard_granularity = 4294967295 (4 GiB)
>                   write-cache = "auto"
>                   share-rw = false
> +                account-invalid = true
> +                account-failed = true
>                   drive-type = "144"
>                 dev: floppy, id ""
>                   unit = 0 (0x0)
> @@ -104,6 +110,8 @@ Testing: -fdb TEST_DIR/t.qcow2
>                   discard_granularity = 4294967295 (4 GiB)

[..]


-- 
Best regards,
Vladimir

