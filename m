Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7B06F4B99
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 22:49:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptwv7-0001Z5-2p; Tue, 02 May 2023 16:48:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ptwv5-0001Ys-EG
 for qemu-devel@nongnu.org; Tue, 02 May 2023 16:48:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ptwv3-0007mD-Cn
 for qemu-devel@nongnu.org; Tue, 02 May 2023 16:48:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683060496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=57An2FPiMipS1NpK2UUlSysOdvfMRdW68COg5ilJa0k=;
 b=FYgUQ0eCtLCGVaepKtqXuJKBUUSW0Ir/hCD075+HLaIHVNmRPNtYHshX8Sq3DGajTfk45J
 2Cw+2dBXUkk2NSr3qEWgAkexxJ29DKe41xH1PpCzEdwpLOzoKa98GjkJmBK/e4FXce6Dwp
 uGQRgubigFaANoN9ED+7INnJlhD2sTQ=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-4ASl29rSNDahc1dhmlCNCA-1; Tue, 02 May 2023 16:48:15 -0400
X-MC-Unique: 4ASl29rSNDahc1dhmlCNCA-1
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-74faf5008bbso54035285a.0
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 13:48:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683060494; x=1685652494;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=57An2FPiMipS1NpK2UUlSysOdvfMRdW68COg5ilJa0k=;
 b=W6bZ58zX7UuQt+Azv0m28D+xqrZCnXfbJ5KvctKg58nMMADDuahOuYRUg5axmfue9K
 ODwE7S0Q4MKoA+aUMRqgRsqZ7DJk4Ql4L8wBRfztcTjPAien5LaXvyII5HkqEvYmk4jg
 PccRL6R8guApd2Lf7zaB52rwFHOYlIWqR/tMSq1fqS+vNuZulaEzN19SboLkgRa8N1Vg
 g/1y2pUUkR+76l1EZVz0mcitwSU8piO6EAekCl1fX7Qb0DnAU6wQnMSo1/oUs273pycI
 tuMo8/4G9wqJ4FZQ/N54HoHMhEQ0nKiaHEyhKnVdgUDCvp7+bV9z4nIba0pLLh1XmevP
 XyJA==
X-Gm-Message-State: AC+VfDwAD9z9fCsLmc454OkUXqItVMVHlEhQUqOd1M+KcFnJGhnMKPwr
 7QBo7bF0jVhHKyY4U3fyI5dgQfV3Meg7XPUCTbdq4snT27dEmkrGgHWo9V72HvcNB7nHW+NSckj
 EFmJ18U71C9PiCss=
X-Received: by 2002:a05:6214:400d:b0:5ef:5132:7ad7 with SMTP id
 kd13-20020a056214400d00b005ef51327ad7mr5818721qvb.2.1683060494638; 
 Tue, 02 May 2023 13:48:14 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4wmOI+fU6563SnpQ16ubNEsO2w2HYmpjjSVfAA+l1sx8nTSwlGqaBYZyIIjo6uYZwWkl88Gw==
X-Received: by 2002:a05:6214:400d:b0:5ef:5132:7ad7 with SMTP id
 kd13-20020a056214400d00b005ef51327ad7mr5818701qvb.2.1683060494371; 
 Tue, 02 May 2023 13:48:14 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 o8-20020a0ccb08000000b005f4964785b1sm9806890qvk.0.2023.05.02.13.48.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 13:48:13 -0700 (PDT)
Date: Tue, 2 May 2023 16:48:12 -0400
From: Peter Xu <peterx@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, lukasstraub2@web.de, quintela@redhat.com,
 chen.zhang@intel.com, Hailiang Zhang <zhanghailiang@xfusion.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v4 07/10] migration: split migration_incoming_co
Message-ID: <ZFF3DJ9BpFAYEVGV@x1n>
References: <20230428194928.1426370-1-vsementsov@yandex-team.ru>
 <20230428194928.1426370-8-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230428194928.1426370-8-vsementsov@yandex-team.ru>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Apr 28, 2023 at 10:49:25PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> Originally, migration_incoming_co was introduced by
> 25d0c16f625feb3b6
>    "migration: Switch to COLO process after finishing loadvm"
> to be able to enter from COLO code to one specific yield point, added
> by 25d0c16f625feb3b6.
> 
> Later in 923709896b1b0
>  "migration: poll the cm event for destination qemu"
> we reused this variable to wake the migration incoming coroutine from
> RDMA code.
> 
> That was doubtful idea. Entering coroutines is a very fragile thing:
> you should be absolutely sure which yield point you are going to enter.
> 
> I don't know how much is it safe to enter during qemu_loadvm_state()
> which I think what RDMA want to do. But for sure RDMA shouldn't enter
> the special COLO-related yield-point. As well, COLO code doesn't want
> to enter during qemu_loadvm_state(), it want to enter it's own specific
> yield-point.
> 
> As well, when in 8e48ac95865ac97d
>  "COLO: Add block replication into colo process" we added
> bdrv_invalidate_cache_all() call (now it's called activate_all())
> it became possible to enter the migration incoming coroutine during
> that call which is wrong too.
> 
> So, let't make these things separate and disjoint: loadvm_co for RDMA,
> non-NULL during qemu_loadvm_state(), and colo_incoming_co for COLO,
> non-NULL only around specific yield.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
>  migration/colo.c      | 4 ++--
>  migration/migration.c | 8 ++++++--
>  migration/migration.h | 9 ++++++++-
>  3 files changed, 16 insertions(+), 5 deletions(-)

The idea looks right to me, but I really know mostly nothing on coroutines
and also rdma+colo..

Is the other ref in rdma.c (rdma_cm_poll_handler()) still missing?

-- 
Peter Xu


