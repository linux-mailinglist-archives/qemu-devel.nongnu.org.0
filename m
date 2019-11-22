Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA45A10740C
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Nov 2019 15:28:18 +0100 (CET)
Received: from localhost ([::1]:51690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iY9uz-0007fQ-PB
	for lists+qemu-devel@lfdr.de; Fri, 22 Nov 2019 09:28:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34544)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1iY9uC-0006yj-4a
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 09:27:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1iY9uB-0003Ww-3U
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 09:27:28 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:42625)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1iY9u7-0003S7-6Q; Fri, 22 Nov 2019 09:27:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=UedhE9B4b1djVcTm94383jELoZog+v64rdGSGhLyzEo=; 
 b=LGuXea8QsLODv4/6xtW+8TC/4WqlAclGNMrqCWtaIoyBfE7tgJym5/SuwGRLxfq8S3QFHwotvS+n2SGmeWgRIa9H6Gc1+KRD4jqHDFGq85+kMEaGzRxUV1Q3h6EW1qa5fHxmikP/aDC6Qm6q6TriL7sWRXHKKa9JNZTYvIxUPpUATfqfhkuB1+jEb7b0JPdbx7SjERhD/FV3DEMnm6KAeiCcdjCzHwp93deFS+aVXYk1jcikShB6YWQ2Y1WKJHTS5hc2tMtsCD/s9zl4ELVAZhsgc/OvbuG6z+rHCBDA8ZR5EER0dYvfKnfCbGcaiOhbsVwJFJlwCaQ5CD6FXaYmZA==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1iY9u3-0005Io-F5; Fri, 22 Nov 2019 15:27:19 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1iY9u3-0002HK-Bl; Fri, 22 Nov 2019 15:27:19 +0100
From: Alberto Garcia <berto@igalia.com>
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Subject: Re: [PATCH v2 2/6] block: truncate: Don't make backing file data
 visible
In-Reply-To: <20191120184501.28159-3-kwolf@redhat.com>
References: <20191120184501.28159-1-kwolf@redhat.com>
 <20191120184501.28159-3-kwolf@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Fri, 22 Nov 2019 15:27:19 +0100
Message-ID: <w51eey00ywo.fsf@maestria.local.igalia.com>
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 stefanha@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed 20 Nov 2019 07:44:57 PM CET, Kevin Wolf wrote:
> When extending the size of an image that has a backing file larger than
> its old size, make sure that the backing file data doesn't become
> visible in the guest, but the added area is properly zeroed out.
>
> Consider the following scenario where the overlay is shorter than its
> backing file:
>
>     base.qcow2:     AAAAAAAA
>     overlay.qcow2:  BBBB
>
> When resizing (extending) overlay.qcow2, the new blocks should not stay
> unallocated and make the additional As from base.qcow2 visible like
> before this patch, but zeros should be read.
>
> A similar case happens with the various variants of a commit job when an
> intermediate file is short (- for unallocated):
>
>     base.qcow2:     A-A-AAAA
>     mid.qcow2:      BB-B
>     top.qcow2:      C--C--C-
>
> After commit top.qcow2 to mid.qcow2, the following happens:
>
>     mid.qcow2:      CB-C00C0 (correct result)
>     mid.qcow2:      CB-C--C- (before this fix)
>
> Without the fix, blocks that previously read as zeros on top.qcow2
> suddenly turn into A.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

