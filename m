Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C57326008
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 10:29:19 +0100 (CET)
Received: from localhost ([::1]:54368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFZR0-0003Gv-PM
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 04:29:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lFZPz-0002l3-Gq; Fri, 26 Feb 2021 04:28:16 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:51327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lFZPw-0000iI-Cc; Fri, 26 Feb 2021 04:28:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:To:From;
 bh=+AKBJZXNoGdfycvf8DFyQvKtxvGjdmXaNNqJfkyTav4=; 
 b=JWrjKhBLvNuc4oQRlKRL3t8Z9EkEZ1rIkpV9gKAawS5vxq5TDON4UhqWEa0tAllcoW9o9em7Ln6R0I+0HAFI5f/JGteY1YISAGk056Cg/xrb0KnNiiT4W/om3smSslLRqCrFyylc01v2QdGgXRUDxdUcA5HecBdTDRA1CgXsYALUdlc1STJ3m0q0BjYuzgX0IbGtpU17JwdIF1oj3bGJ/siVofJ+BF+C0VekUdlPiRcoN3C996mcvI+fHpq6gECCQ9JkzWrLTy9U9ndV3pRQbfedF5piLgcNlnYY9GgXVvdQ7dHTkUgpRiwEWAYsoCYFedrQx0LPcW29w00sM3IjNA==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1lFZPY-00075P-Bm; Fri, 26 Feb 2021 10:27:48 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1lFZPY-0006Tj-1y; Fri, 26 Feb 2021 10:27:48 +0100
From: Alberto Garcia <berto@igalia.com>
To: Peter Lieven <pl@kamp.de>, "qemu-devel\@nongnu.org" <qemu-devel@nongnu.org>,
 qemu block <qemu-block@nongnu.org>
Subject: Re: block/throttle and burst bucket
In-Reply-To: <efe8ee1c-e12f-b739-b9dd-9bd6d80527cb@kamp.de>
References: <efe8ee1c-e12f-b739-b9dd-9bd6d80527cb@kamp.de>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Fri, 26 Feb 2021 10:27:48 +0100
Message-ID: <w51blc7ji0b.fsf@maestria.local.igalia.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu 25 Feb 2021 06:34:48 PM CET, Peter Lieven <pl@kamp.de> wrote:
> I was wondering if there is a way to check from outside (qmp etc.) if
> a throttled block device has exceeded the iops_max_length seconds of
> time bursting up to iops_max and is now hard limited to the iops limit
> that is supplied?
>
> Would it be also a good idea to exetend the accounting to account for
> requests that must have waited before being sent out to the backend
> device?

No, there's no such interface as far as I'm aware. I think one problem
is that throttling is now done using a filter, that can be inserted
anywhere in the node graph, and accounting is done at the BlockBackend
level.

We don't even have a query-block-throttle function. I actually started
to write one six years ago but it was never finished.

Berto

