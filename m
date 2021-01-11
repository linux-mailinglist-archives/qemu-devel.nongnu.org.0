Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D26762F1A8F
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 17:10:52 +0100 (CET)
Received: from localhost ([::1]:58124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyzmN-0001UN-Ur
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 11:10:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kyzkU-00086c-88; Mon, 11 Jan 2021 11:08:54 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:34453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kyzkQ-0003La-Sm; Mon, 11 Jan 2021 11:08:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=5c8ORO9BsFJAxJi6WrHez/rynr5rnw1EuMiVaGprAE8=; 
 b=VKFT8RgkvM+/BvIHztRMQiXj2KVSrVcNX9lO75zCz6fWhUiikMhllxtGaW8RmcFbSY2vKVpVwlKYLgwnGNO9fH62966bvyxRcK8Hl2USSz80+4AmLeyhVQIqYbq/rm5RV9dnv0OmGDiowXI2kOUdcWnvkxg2wHREUpCN362LDW5bHQat1CHzd9qL0/AMyGuSEe4sPhHl0BLA0w5cnLmzvKKgpmDdzNmi9zVhVRFxIww+6NU9I/+w6rWRuEZdBi5+usTBITSvd7XjlzSeFFRh1WQstMGMuVeuPVZz1IP7csKQ+URm6gM/AkflHkhXmc9jgZKL8NROfhosV6VStOYKPA==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1kyzk3-0000qj-A4; Mon, 11 Jan 2021 17:08:27 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1kyzk3-0000PJ-0X; Mon, 11 Jan 2021 17:08:27 +0100
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Subject: Re: [PATCH v5 14/14] block/qcow2: refactor
 qcow2_update_options_prepare error paths
In-Reply-To: <20210109125811.209870-15-vsementsov@virtuozzo.com>
References: <20210109125811.209870-1-vsementsov@virtuozzo.com>
 <20210109125811.209870-15-vsementsov@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Mon, 11 Jan 2021 17:08:27 +0100
Message-ID: <w51h7nnihhg.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, pavel.dovgaluk@ispras.ru,
 qemu-devel@nongnu.org, armbru@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com, mreitz@redhat.com, jsnow@redhat.com, ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat 09 Jan 2021 01:58:11 PM CET, Vladimir Sementsov-Ogievskiy wrote:
> Keep setting ret close to setting errp and don't merge different error
> paths into one. This way it's more obvious that we don't return
> error without setting errp.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

I get the idea, but I feel the code is getting innecessarily verbose.

One alternative would be to get rid of all -EINVAL inside the switch
block, take advantage of the existing local_err and follow the block
with:

    if (local_err) {
        error_propagate(errp, local_err);
        ret = -EINVAL;
        goto fail;
    }

But otherwise your solution is correct, so you can keep it if you
prefer:

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

