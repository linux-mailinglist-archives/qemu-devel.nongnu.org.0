Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AD7366AC3
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 14:28:02 +0200 (CEST)
Received: from localhost ([::1]:46698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZBxZ-00050r-80
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 08:28:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lZBvH-0003zG-Gl
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 08:25:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lZBvF-0000dd-Mi
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 08:25:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619007936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dOnL1kPm6+Z72DjXr7Rz9+42FO8LNVMDJa86yKS5rH0=;
 b=FzKavO7AdVEOa0WBKD7Ub/7eXfe0zyXo4T5Nc6IAfFFfPq57Q8KcWauvRljUWCpNB9qC/P
 +y24fx34Y7aabK56kmfxGv4jSVtLmMxpQLRaqCzO34MapwqlFhGy1Shh2sC7/U7Mlcy/Jl
 OzYzjEHhOix3l4D8Zi9VZNB1zIUjudA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-tocJme7TPUmbMckZra7BHg-1; Wed, 21 Apr 2021 08:25:34 -0400
X-MC-Unique: tocJme7TPUmbMckZra7BHg-1
Received: by mail-wr1-f69.google.com with SMTP id
 l18-20020a0560000232b02901026f4b8548so12616471wrz.10
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 05:25:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dOnL1kPm6+Z72DjXr7Rz9+42FO8LNVMDJa86yKS5rH0=;
 b=g4LMqSjwlvSW7avR3qg5WCthd2+i9yDpFSAtMIqLZAR3NL+6bAh9uXxuNNwpbPHT0U
 45l0kCRiTlqd5nNm98UQZoC5W8qhrGS0QYMXWzV3NO5Ei4SYzdVSHxFLPvrqPf76zS6B
 9lSJbp/MhRZKLsqT3p6SYi+Jr3tJQDalmuvaIT9daB+9bdrBu10WkwB/eXaBttSxNHDs
 Fv7O7N7kH0V/eki2gO9M04ha/5FmN0LAGNnabwinAIvyVLpzZgtci8n4gFV971xt/vR1
 FZTYwfhbxgi5sDFirSwGzdZT0RcMu2mSMcE4adQcvTcSeLSyJEQrofGvEURgQAMA/fAr
 tsnA==
X-Gm-Message-State: AOAM531jFj7ePUctPI0e1wqPYAKRtaHwWike9B4fffEsEXIP6UnJssBg
 MvrpcxLHebkBlW8S9WeoDw0XO4Yy/6GXFGR7u/2twJJa/TFVA1ioxsLyc7U2HajXI9CFyQFuuDu
 pFUdiKvyIFysG4n4m9gwnowXqtjEV3Moz0JMuph3/bl2yzU3Uvo23e4etbPNYC7vsx/s=
X-Received: by 2002:adf:cf09:: with SMTP id o9mr27288962wrj.366.1619007933143; 
 Wed, 21 Apr 2021 05:25:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfIv+Z3bnO3Gto/Gug/dPRzhXNTKMNdAoxyRp0CI8OqlCMoAETd3uaIdmYkMbJEvwACSBKBg==
X-Received: by 2002:adf:cf09:: with SMTP id o9mr27288929wrj.366.1619007932846; 
 Wed, 21 Apr 2021 05:25:32 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p3sm2015279wmq.31.2021.04.21.05.25.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Apr 2021 05:25:32 -0700 (PDT)
Subject: Re: [PATCH v2 0/8] Block layer thread-safety, continued
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210419085541.22310-1-eesposit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <87d7b5d6-0d92-b041-14d7-c4f1c2bd15ec@redhat.com>
Date: Wed, 21 Apr 2021 14:25:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210419085541.22310-1-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/04/21 10:55, Emanuele Giuseppe Esposito wrote:
> This and the following serie of patches are based on Paolo's
> v1 patches sent in 2017[*]. They have been ported to the current QEMU
> version, but the goal remains the same:
> - make the block layer thread-safe (patches 1-5), and
> - remove aio_context_acquire/release (patches 6-8).
> 
> [*] = https://lists.gnu.org/archive/html/qemu-devel/2017-07/msg01398.html
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

This looks good to me, though the commit message of patch 8 needs to be 
rewritten.

Paolo

> ---
> v1 (2017) -> v2 (2021):
> - v1 Patch "block-backup: add reqs_lock" has been dropped, because now
>    is completely different from the old version and all functions
>    that were affected by it have been moved or deleted.
>    It will be replaced by another serie that aims to thread safety to
>    block/block-copy.c
> - remaining v1 patches will be integrated in next serie.
> - Patch "block: do not acquire AioContext in check_to_replace_node"
>    moves part of the logic of check_to_replace_node to the caller,
>    so that the function can be included in the aio_context_acquire/release
>    block that follows.
> 
> Emanuele Giuseppe Esposito (8):
>    block: prepare write threshold code for thread safety
>    block: protect write threshold QMP commands from concurrent requests
>    util: use RCU accessors for notifiers
>    block: make before-write notifiers thread-safe
>    block: add a few more notes on locking
>    block: do not acquire AioContext in check_to_replace_node
>    block/replication: do not acquire AioContext
>    block: do not take AioContext around reopen
> 
>   block.c                   | 28 ++++++--------------
>   block/block-backend.c     |  4 ---
>   block/io.c                | 12 +++++++++
>   block/mirror.c            |  9 -------
>   block/replication.c       | 54 +++++++++------------------------------
>   block/write-threshold.c   | 39 ++++++++++++++--------------
>   blockdev.c                | 26 +++++++++----------
>   include/block/block.h     |  1 +
>   include/block/block_int.h | 42 +++++++++++++++++++++++++++++-
>   util/notify.c             | 13 +++++-----
>   10 files changed, 113 insertions(+), 115 deletions(-)
> 


