Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5CE357253
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 18:44:21 +0200 (CEST)
Received: from localhost ([::1]:34480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUBHw-0003nO-6h
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 12:44:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lUB8c-0007Dm-DN; Wed, 07 Apr 2021 12:34:42 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:53168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lUB8Y-00084k-JN; Wed, 07 Apr 2021 12:34:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=/+rZfe5L8OARELROWuO6D9W4J8GDert7MJ/Qzt439h0=; 
 b=C+yfrpXaSOaR0+ToRI+sDqOlwXHg1jYkSYMaLI3bWaouJJ9yDwPc8QOi9a245FMOBHVPSfJy95msuMpZalROmx26Jws4GMIFhZP6UTxCyQs6/j32OWO8Qh4C4oUC5rjLmY4eBCFiXdtbciIKpzzxYSBiOtIZIHSRBh5xda3AwMMxpFhadoG6wJmSYz0y0D2lMM9dAHvpj8pcwF5UPNmCpLPaZt1VQ9dbGi/qejZ5DNfiUnjxOrs1nMYtkh5CAZHWdZj1QXW7LNh3MlAfMCOM2zJDp8CRgSCWRUU4DUUc56LgoroxrFFvyJhQ4bEtsHXNXxcYUQNFLKVLrt60NjQxjA==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1lUB8C-0000e8-MD; Wed, 07 Apr 2021 18:34:16 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1lUB8C-0007ht-Co; Wed, 07 Apr 2021 18:34:16 +0200
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Subject: Re: [PATCH v5 2/6] qcow2: fix cache discarding in update_refcount()
In-Reply-To: <20210326200045.363290-3-vsementsov@virtuozzo.com>
References: <20210326200045.363290-1-vsementsov@virtuozzo.com>
 <20210326200045.363290-3-vsementsov@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Wed, 07 Apr 2021 18:34:16 +0200
Message-ID: <w51r1jmawaf.fsf@maestria.local.igalia.com>
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
Cc: kwolf@redhat.com, den@openvz.org, vsementsov@virtuozzo.com,
 qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri 26 Mar 2021 09:00:41 PM CET, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> wrote:
> Here refcount of cluster at @cluster_offset reached 0, so we "free"
> that cluster. Not a cluster at @offset. The thing that save us from the
> bug is that L2 tables and refblocks are discarded one by one. Still,
> let's be precise.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

