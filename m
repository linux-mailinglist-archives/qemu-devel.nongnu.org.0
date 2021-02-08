Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B28D313551
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 15:38:08 +0100 (CET)
Received: from localhost ([::1]:34864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l97fy-0001I4-MO
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 09:38:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l92Se-0005Tq-DX
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 04:04:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l92SE-0001iR-M6
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 04:03:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612775000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oEpAGaAlWpUPsiGWyHmZvyW881ytgzfA+TjPnCI2T8A=;
 b=AFwMA3Tr/+wCrTH9atgAZf7AKX2gg+beh6zJlJ4qV1i2Ho8Nzx3+UY5Rtqy/AQMUSa3HFo
 BjzWbq3S9hsDDXzkfJZtcG0UsPFtL+Nfxk/eJ+lE/fuVncfgid8PkJPWo/XW6sMg64O46L
 Q3MVC0ary+t9D/dwUoOgQ4sCkD6GOho=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-d3oCLRFHPPmH8K9WM9aEEw-1; Mon, 08 Feb 2021 04:03:18 -0500
X-MC-Unique: d3oCLRFHPPmH8K9WM9aEEw-1
Received: by mail-wr1-f70.google.com with SMTP id j8so12472984wrx.17
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 01:03:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oEpAGaAlWpUPsiGWyHmZvyW881ytgzfA+TjPnCI2T8A=;
 b=lu+JilgGmJOnorR9qwH7YUP8ZQZHycf9cjg80X1+0XVJ23t9ZxarbW4o4gIHzBoVbI
 zEFqMyss3lS2t7ImTXJP9U0zKCxxFK8IRCh5ddnPOJCUZDoKxxDOFjtmr5h6KfkHF8Wz
 moaTOntlOa/IjIfchiG5Cb+gVvXvQHkRfZgzU/KfHC6lgoyxz41gOUK7r7W4x4i4EiqV
 F+KVaSp7LSKKz/dWqlMwFKefCqfPJLy4fbCpi5juo3Aoeg0wCMmqXDlM2hLhUfmpLZ6Q
 wbXp/Sgg9BMxP0GNDZiNTTU/Da6XL8xBbkMx2uNosLjxeQSYayQLuz8/HthaB0b7BOCh
 psDw==
X-Gm-Message-State: AOAM530/r0DWobnYcZD58Y/jUIHxC5ZbQLwc8BjovlXeBxN+TRM1qVdN
 4dKKtZmCtCowwgJjp8qZc+IO3TyB2URQL8tCQmW6wVi4iBbvBZQG9N9WMITtbhKOyPV6VaAvUrH
 CiJFYWrmm16LpPJ8=
X-Received: by 2002:a1c:2e83:: with SMTP id u125mr13119891wmu.13.1612774997604; 
 Mon, 08 Feb 2021 01:03:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzHTJKo2OUTWTl1QmZGdH7B8o/sMSpVhM5d0HKbDexFSiB4tOpVU4PewNUVlITk2Jk8ZWX5DA==
X-Received: by 2002:a1c:2e83:: with SMTP id u125mr13119874wmu.13.1612774997388; 
 Mon, 08 Feb 2021 01:03:17 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id w15sm26630365wrp.15.2021.02.08.01.03.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 01:03:16 -0800 (PST)
Subject: Re: [PATCH] hw/block/nvme: fix Close Zone
To: Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Klaus Jensen <k.jensen@samsung.com>, Keith Busch <kbusch@kernel.org>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-devel@nongnu.org
References: <20210208003256.9280-1-dmitry.fomichev@wdc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <435eb631-e53d-a47a-6c27-68d12496fe00@redhat.com>
Date: Mon, 8 Feb 2021 10:03:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210208003256.9280-1-dmitry.fomichev@wdc.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Dmitry, Klaus.

On 2/8/21 1:32 AM, Dmitry Fomichev wrote:
> Implicitly and Explicitly Open zones can be closed by Close Zone
> management function. This got broken by a recent commit and now such
> commands fail with Invalid Zone State Transition status.
> 
> Modify nvm_zrm_close() function to make Close Zone work correctly.
> 
> Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
> Fixes: 053b5a302c3("hw/block/nvme: refactor zone resource management")

'053b5a302c3': unknown revision or path not in the working tree.

If you point at an unmerged commit, why not fix it directly
before merging?

> ---
>  hw/block/nvme.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index 6b84e34843..c2f0c88fbf 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -1308,14 +1308,13 @@ static uint16_t nvme_zrm_finish(NvmeNamespace *ns, NvmeZone *zone)
>  static uint16_t nvme_zrm_close(NvmeNamespace *ns, NvmeZone *zone)
>  {
>      switch (nvme_get_zone_state(zone)) {
> -    case NVME_ZONE_STATE_CLOSED:
> -        return NVME_SUCCESS;
> -
>      case NVME_ZONE_STATE_EXPLICITLY_OPEN:
>      case NVME_ZONE_STATE_IMPLICITLY_OPEN:
>          nvme_aor_dec_open(ns);
>          nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_CLOSED);
>          /* fall through */
> +    case NVME_ZONE_STATE_CLOSED:
> +        return NVME_SUCCESS;
>  
>      default:
>          return NVME_ZONE_INVAL_TRANSITION;
> 


