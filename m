Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 450F6F4E32
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Nov 2019 15:34:58 +0100 (CET)
Received: from localhost ([::1]:55266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iT5Lk-0006XV-J6
	for lists+qemu-devel@lfdr.de; Fri, 08 Nov 2019 09:34:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38887)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1iT5Hr-0004cl-Ed
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 09:30:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1iT5Hq-0003Pp-Av
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 09:30:55 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:56016)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1iT5Hn-0003On-9N; Fri, 08 Nov 2019 09:30:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=uIPFosBhz/DB5jQIdcZlX6z0UVVJJ8QLSBRn8sT8S7Y=; 
 b=DvV2w9w40zOlgnVf4kFtK4hNWDFBNMWG0pJbb4FfbxydeOaB5JS67K6RlQN04w8cpn4ZyPpgmEdFC/YD5qIS/WNZlE9sZaHaHy9Z8yITgszAoU0H/AwO79mNE0tuaQo3XM4L1a2/a9J6wWBBe21c7n5dZm9VTL9+IfwUXETVD3oZaTxtt8c3tdoPd1QqAUEFQwzBcEWlUpBAUfkFVjLYa5pz3P1d3QAo4vUirFRZQq03O63+K7j9azdeTSESCTdnOJCRBAHp+iO3mxUxCbJVjqOOlqcfvkRMGDgWKIYDFj/EUtpPyb0POAmVla4sb3tvX00tSSf/9FWaYvtgMmw38A==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1iT5Hl-0003q1-1h; Fri, 08 Nov 2019 15:30:49 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1iT5Hk-00045n-Ve; Fri, 08 Nov 2019 15:30:48 +0100
From: Alberto Garcia <berto@igalia.com>
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Subject: Re: [PATCH 1/2] block: Remove 'backing': null from bs->{explicit_,
 }options
In-Reply-To: <20191108085312.27049-2-kwolf@redhat.com>
References: <20191108085312.27049-1-kwolf@redhat.com>
 <20191108085312.27049-2-kwolf@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Fri, 08 Nov 2019 15:30:48 +0100
Message-ID: <w51o8xmsanb.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic] [fuzzy]
X-Received-From: 178.60.130.6
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri 08 Nov 2019 09:53:11 AM CET, Kevin Wolf wrote:
> bs->options and bs->explicit_options shouldn't contain any options for
> child nodes. bdrv_open_inherited() takes care to remove any options that
> match a child name after opening the image and the same is done when
> reopening.
>
> However, we miss the case of 'backing': null, which is a child option,
> but results in no child being created. This means that a 'backing': null
> remains in bs->options and bs->explicit_options.
>
> A typical use for 'backing': null is in live snapshots: blockdev-add for
> the qcow2 overlay makes sure not to open the backing file (because it is
> already opened and blockdev-snapshot will attach it). After doing a
> blockdev-snapshot, bs->options and bs->explicit_options become
> inconsistent with the actual state (bs has a backing file now, but the
> options still say null). On the next occasion that the image is
> reopened, e.g. switching it from read-write to read-only when another
> snapshot is taken, the option will take effect again and the node
> incorrectly loses its backing file.
>
> Fix bdrv_open_inherited() to remove the 'backing' option from
> bs->options and bs->explicit_options even for the case where it
> specifies that no backing file is wanted.
>
> Reported-by: Peter Krempa <pkrempa@redhat.com>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

