Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 156894B58C5
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 18:43:00 +0100 (CET)
Received: from localhost ([::1]:45570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJfNK-0001C6-5y
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 12:42:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJfK2-0007fX-IH; Mon, 14 Feb 2022 12:39:34 -0500
Received: from [2a00:1450:4864:20::631] (port=45907
 helo=mail-ej1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJfK0-0002Ig-VB; Mon, 14 Feb 2022 12:39:34 -0500
Received: by mail-ej1-x631.google.com with SMTP id lw4so8204523ejb.12;
 Mon, 14 Feb 2022 09:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cTGx+UHqI107Hfmh8Cke/VfLm7hPmNzKjC76bs9CTpQ=;
 b=kMfOaDTO2zxXEMNtJ0Ud19E5iZaqFq/4kS5Lsrp+WUm2oER+OkBuE76wta+UAgxKC3
 vvJ17vHtWaF1GxD9MBmMHO4RoknMEwUPRwxNuWX5/UOAwn0S+5qDPHljxbjNgqNgZbHn
 9nEnNAsEHDbQcFP4VsOrf1dfxVQIVFP8S04EUaxWJeuGvbGJ9ECRR4KVvIJnRVhwBwRD
 QFgBUit6b5KQzX5mjZL61Gvu0ZKnO+RCNNZJvD6SXuTnuJ08q7AlyEIKcdos6FUhau2P
 OkKMD9LRrUIBx1urRJs2EPcoZxoz8Hw3dTq+kmyeNoQwFBeDW+7TX5KaHyapFqCMgkJX
 Plyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cTGx+UHqI107Hfmh8Cke/VfLm7hPmNzKjC76bs9CTpQ=;
 b=GrDzsxILYS8Z6SeiHxdi45UFbojR8eCtpBjoHsD/2BpFD25p6TA11u/WsNqdmIzSKI
 uJ8cXwglo3XAACqeq5qk7RTfocml2YmIjqL2CHcqRdc7XnyOeJOEuAX3uWD2nfYrJOdJ
 tqiUUTO+W+eZHJRI6dCp64ZOxt/Q0xJcSr9BX2yBHSWSVhWd72L3jOigwNU4tfqxHK84
 UuwtGGhQmgCTh5GJBaDqMD39jvDSzTu+Jtwn64MD3A2dmVGodEFX9kriDnt7xA67DM3C
 5X0sEh0lBlZm4CUkeH31TysGtLTVlF4JtfmI31NE3XGhnskFITxKcICWZ//ygmpb9aab
 Y1eA==
X-Gm-Message-State: AOAM533GPLpyWh9yvxdkVTirCXffZB1QkMmWWphjYeAxIStm1eEWkbSj
 Pnled0wG1PB6AdD3GjLm6Yo=
X-Google-Smtp-Source: ABdhPJx/O6WaqCwZUIoWUyKpfbE6elgutUK5bBEjVPa4xLzFEM2mVwTXTFX01JovmeyHBWnkc2dTnQ==
X-Received: by 2002:a17:906:73d2:: with SMTP id
 n18mr558869ejl.674.1644860370296; 
 Mon, 14 Feb 2022 09:39:30 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id b4sm1891682ejv.108.2022.02.14.09.39.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 09:39:29 -0800 (PST)
Message-ID: <90640916-992b-6851-1a17-317c48369133@redhat.com>
Date: Mon, 14 Feb 2022 18:39:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 5/6] test-bdrv-drain.c: remove test_detach_by_parent_cb()
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>
References: <20220208153655.1251658-1-eesposit@redhat.com>
 <20220208153655.1251658-6-eesposit@redhat.com> <YgaDBkblIA6wu82p@redhat.com>
 <db25869b-fbf2-f5ca-b2f8-4fe4f3c0a040@redhat.com>
 <Ygp1FJyh8v0SRxZq@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <Ygp1FJyh8v0SRxZq@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::631
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/14/22 16:28, Kevin Wolf wrote:
> The BlockBackend could safely return false from blk_root_drained_poll()
> while requests are still in their callbacks (if they do anything that
> touches a node, they would increase in_flight again), it just doesn't do
> it yet. It's only blk_drain(_all)() that would still have to wait for
> those.

That would be very subtle, especially it's not clear to me why this 
wouldn't be "a drain completing while the callback hasn't actually 
completed yet".  The drain referred to in the commit message of 
46aaf2a56 could *not* use blk_drain, because it is not coroutine 
friendly; it must use bdrv_drained_begin.

>> My answer is respectively 1) it's correct, many coroutines do inc_in_flight
>> before creation and dec_in_flight at the end, we're just saying that it's
>> _always_  the case for callback-based operations; 2) no, it's not unexpected
>> and therefore the test is the incorrect one.
> My question isn't really only about the test, though. If it is now
> forbidden to call bdrv_replace_child_noperm() in a callback, how do we
> verify that the test is the only incorrect one rather than just the
> obvious one?
> 
> And is it better to throw away the test and find and fix all other
> places that are using something that is now forbidden, or wouldn't it be
> better to actually allow bdrv_replace_child_noperm() in callbacks?

The question is would you ever need bdrv_replace_child_noperm() in 
callbacks?  The AIO functions are called from any iothread and so are 
the callbacks.  We do have a usecase (in block/mirror.c) for 
bdrv_drained_begin from a coroutine; do we have a usecase for calling 
global-state functions from a callback, in such a way that:

1) going through a bottom half would not be possible

2) it's only needed in the special case of a BlockBackend homed in the 
main event loop (because otherwise you'd have to go through a bottom 
half, and we have excluded that already)?

Thanks,

Paolo

