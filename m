Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DB46AE575
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 16:54:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZZck-0003ck-9t; Tue, 07 Mar 2023 10:53:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@maciej.szmigiero.name>)
 id 1pZZci-0003cC-0R; Tue, 07 Mar 2023 10:53:08 -0500
Received: from vps-vb.mhejs.net ([37.28.154.113])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@maciej.szmigiero.name>)
 id 1pZZcg-0008HD-B0; Tue, 07 Mar 2023 10:53:07 -0500
Received: from MUA by vps-vb.mhejs.net with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <mail@maciej.szmigiero.name>)
 id 1pZZcO-0003o6-TM; Tue, 07 Mar 2023 16:52:48 +0100
Message-ID: <c5c82d88-df2a-e968-4d81-0da1cfa2ab09@maciej.szmigiero.name>
Date: Tue, 7 Mar 2023 16:52:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] pflash: Fix blk_pread_nonzeroes()
Content-Language: en-US, pl-PL
To: Kevin Wolf <kwolf@redhat.com>
Cc: clg@kaod.org, kraxel@redhat.com, berrange@redhat.com,
 zhengxiang9@huawei.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
References: <20230307140230.59158-1-kwolf@redhat.com>
From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
In-Reply-To: <20230307140230.59158-1-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.28.154.113;
 envelope-from=mail@maciej.szmigiero.name; helo=vps-vb.mhejs.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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

On 7.03.2023 15:02, Kevin Wolf wrote:
> Commit a4b15a8b introduced a new function blk_pread_nonzeroes(). Instead
> of reading directly from the root node of the BlockBackend, it reads
> from its 'file' child node. This can happen to mostly work for raw
> images (as long as the 'raw' format driver is in use, but not actually
> doing anything), but it breaks everything else.
> 
> Fix it to read from the root node instead.

Thanks for preparing the patch.

It seems to work fine, so:
Tested-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>

> Fixes: a4b15a8b9ef25b44fa92a4825312622600c1f37c

I think this should be:
Fixes: a4b15a8b9e ("pflash: Only read non-zero parts of backend image")

> Reported-by: Cédric Le Goater <clg@kaod.org>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---

Thanks,
Maciej


