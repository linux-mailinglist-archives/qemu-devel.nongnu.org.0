Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1BC53FE8D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 14:17:57 +0200 (CEST)
Received: from localhost ([::1]:33896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyY9k-00013n-9y
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 08:17:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nyXIM-00049h-Jk
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 07:22:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nyXIK-0003Ct-FZ
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 07:22:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654600963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1weClXX8Vq3ZpM3LRsDFUeldnL081lcpEsjgZoYE1L4=;
 b=EczTIQul6yBf5xtp09wc2F6GiaMmSR7UVlMa8hA11HV6UHNuzee9WnpLWitTagBVH0pa6t
 8QtbbXK86v5YPN1iU+fQZYx7MNL28k3jHKgloR0MemWEVOoGT8+A2JTNQvG7QA13oS2jWg
 4Rkn2nsMJ6oRCY63gEPOacg8Ws03eAU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-121-2fMh1A3QM66zdF3YWnnaFw-1; Tue, 07 Jun 2022 07:22:42 -0400
X-MC-Unique: 2fMh1A3QM66zdF3YWnnaFw-1
Received: by mail-wr1-f70.google.com with SMTP id
 w8-20020adfde88000000b00213b7fa3a37so3016115wrl.2
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 04:22:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1weClXX8Vq3ZpM3LRsDFUeldnL081lcpEsjgZoYE1L4=;
 b=ljrOxuBPGjl05tNZtAznz+aBCZ/kaWNLrkAoFxsq0KscrnIkfZ6OmCTHZ5bNES1IVw
 gt7v5ZA5iVuayIT1BYOV3yymrlhX+5ATcniSFh+DnHFJIq7unmym0/RKhjzqq3PAYtPU
 kcbdlk4DzUjqYIwB78nt8CZuh9nRvo80Y7k3ONCLJ6aZYfr9JS/iX9OJisH9yxtDZOxe
 BhJ+IiUBJuefwtHbxvGg8i42zwtbhxs1HYjPI8j5IOmx93MEMsVfAGtFqkO8ozylt79O
 u1cZRe8m8QMDrjKWvzUmZEHdEi0tbuA1P4fT64osMF4kk8McnQxtyrrtniyb37r2pqPg
 AjmA==
X-Gm-Message-State: AOAM5336nIydg5KkgPtjbtvMqGZj+1Yk8RhZfciHxjrlxXNAjT2bxntT
 hOqfkQABr6kNIfvQE7HBnQiWX4EPubyP2IWpr7HcFx564rhJ7icoC8lq1XKeeGSyks6invH/z5X
 o0mUjBK11vPJv2ck=
X-Received: by 2002:a5d:680c:0:b0:218:2dcb:dd57 with SMTP id
 w12-20020a5d680c000000b002182dcbdd57mr11564253wru.162.1654600961294; 
 Tue, 07 Jun 2022 04:22:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJziQWnO/kEybby5eH6cV0C9K0QT6fs7JJtvfqnrl1Hcejb4h7mt92C4unjGg6Jd+ACTg01BUw==
X-Received: by 2002:a5d:680c:0:b0:218:2dcb:dd57 with SMTP id
 w12-20020a5d680c000000b002182dcbdd57mr11564205wru.162.1654600960913; 
 Tue, 07 Jun 2022 04:22:40 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 w25-20020a1cf619000000b003976fbfbf00sm20544160wmc.30.2022.06.07.04.22.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jun 2022 04:22:40 -0700 (PDT)
Message-ID: <a9ec614e-ad1d-9c54-2dab-61b9385a7c17@redhat.com>
Date: Tue, 7 Jun 2022 13:22:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 06/45] test-bdrv-graph-mod: fix filters to be filters
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, vsementsov@openvz.org,
 v.sementsov-og@mail.ru
References: <20220330212902.590099-1-vsementsov@openvz.org>
 <20220330212902.590099-7-vsementsov@openvz.org>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220330212902.590099-7-vsementsov@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 30.03.22 23:28, Vladimir Sementsov-Ogievskiy wrote:
> bdrv_pass_through is used as filter, even all node variables has
> corresponding names. We want to append it, so it should be
> backing-child-based filter like mirror_top.
> So, in test_update_perm_tree, first child should be DATA, as we don't
> want filters with two filtered children.
>
> bdrv_exclusive_writer is used as a filter once. So it should be filter
> anyway. We want to append it, so it should be backing-child-based
> fitler too.
>
> Make all FILTERED children to be PRIMARY as well. We are going to force
> this rule by assertion soon.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
> ---
>   include/block/block_int-common.h |  5 +++--
>   tests/unit/test-bdrv-graph-mod.c | 24 +++++++++++++++++-------
>   2 files changed, 20 insertions(+), 9 deletions(-)
>
> diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
> index 9d91ccbcbf..d68adc6ff3 100644
> --- a/include/block/block_int-common.h
> +++ b/include/block/block_int-common.h
> @@ -122,8 +122,9 @@ struct BlockDriver {
>       /*
>        * Only make sense for filter drivers, for others must be false.
>        * If true, filtered child is bs->backing. Otherwise it's bs->file.
> -     * Only two internal filters use bs->backing as filtered child and has this
> -     * field set to true: mirror_top and commit_top.
> +     * Two internal filters use bs->backing as filtered child and has this
> +     * field set to true: mirror_top and commit_top. There also two such test
> +     * filters in tests/unit/test-bdrv-graph-mod.c.
>        *
>        * Never create any more such filters!

I mean, it’s just a test, of course, but it is kind of strange that you 
put this very strong imperative here just a couple of patches ago and 
now you disobey it. O:)

Makes sense, though.

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


