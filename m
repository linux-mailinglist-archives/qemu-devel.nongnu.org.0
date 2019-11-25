Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 442D610907A
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Nov 2019 15:55:20 +0100 (CET)
Received: from localhost ([::1]:44928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iZFlm-0003L5-SV
	for lists+qemu-devel@lfdr.de; Mon, 25 Nov 2019 09:55:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55048)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1iZFkb-0002oz-Cu
 for qemu-devel@nongnu.org; Mon, 25 Nov 2019 09:54:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1iZFka-0005TF-GD
 for qemu-devel@nongnu.org; Mon, 25 Nov 2019 09:54:05 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:46063)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1iZFkW-0005Hv-6H; Mon, 25 Nov 2019 09:54:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=5iNGZpCh5XCYTmhdem00Fgqu1GTDvTuKUpZwTUAdKa8=; 
 b=pM+Ui1VoT/iDG7hWvot7eIr+u2/y2/FtOY+fR9nIUeHi8LmmLq604Wz7omTrgEH9CiJ/0o+o8priEz3Z2MAzGeo5Xh/W5xGFA1rMefSBpiVitdbfkDqC2cjmEYwGJ4dQU+U+U4vexqIV4VlvMqIPavYmMAUCTQWLaAHGdbM74Y/DzX2UybQR404ppM92eBSkjD92lx9kVdTxPdnSz4bJNteoQPfACjOG6iLJcpAVoMMIxlYSz6ltQFgaBMewtr0r7R3pEMVKaD2B166w3AXmmIZHSeS1upA5DR/HTZnRfiOs7mtviJK/a+rgBQIeQ08BoG958L0oZy0sGb/Ni+dpfQ==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1iZFkD-0005pb-ET; Mon, 25 Nov 2019 15:53:41 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1iZFkD-0000Oi-Bw; Mon, 25 Nov 2019 15:53:41 +0100
From: Alberto Garcia <berto@igalia.com>
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Subject: Re: [PATCH v3 3/8] qcow2: Declare BDRV_REQ_NO_FALLBACK supported
In-Reply-To: <20191122160511.8377-4-kwolf@redhat.com>
References: <20191122160511.8377-1-kwolf@redhat.com>
 <20191122160511.8377-4-kwolf@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Mon, 25 Nov 2019 15:53:41 +0100
Message-ID: <w51a78khuru.fsf@maestria.local.igalia.com>
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

On Fri 22 Nov 2019 05:05:06 PM CET, Kevin Wolf wrote:
> In the common case, qcow2_co_pwrite_zeroes() already only modifies
> metadata case, so we're fine with or without BDRV_REQ_NO_FALLBACK set.
>
> The only exception is when using an external data file, where the
> request is passed down to the block driver of the external data file. We
> are forwarding the BDRV_REQ_NO_FALLBACK flag there, though, so this is
> fine, too.
>
> Declare the flag supported therefore.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

