Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 272E41760AF
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Mar 2020 18:05:36 +0100 (CET)
Received: from localhost ([::1]:35572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8oVa-0005Ly-Vp
	for lists+qemu-devel@lfdr.de; Mon, 02 Mar 2020 12:05:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57734)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1j8oUl-0004ec-7v
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 12:04:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1j8oUk-0004Bb-CN
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 12:04:43 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:48041)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1j8oUf-00046D-JL; Mon, 02 Mar 2020 12:04:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=4oASizum70S2C2HvffjXDEQHcHSs7oof8OBplACEn/w=; 
 b=RHzZtpQUpWwDF/5eAwKf2H0OGMDW2YsHaR4TFOqPkIkRyM70byPfUIGpyxSrHLww8KonqxJsUi6oKCaXqBCrZSqNTNgELT8DvOFWwkNoQFRkYiY8dEVtxouobstwdQS5kto5Z+VFclJiH34HRjZE2ZQG+JQblIAL6WNSAFPBL0dtDhGs2bbdu9zLB/hq49QP+CA/tqvfb2SRR4DAeG8t5obETy81UDyL5coBlo+wMF9cJ/V5pWoFRD9gAvj/Gi0Zqx+DeqAdp5sPmptQaSaLsFQOVofFUonj6tm0zgdqMKUwl9sPbtfy9grvkULcAsmPWBN1qJ9VCKjN4ZVICdzcyg==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1j8oUL-0007r3-U3; Mon, 02 Mar 2020 18:04:17 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1j8oUL-0001i4-KX; Mon, 02 Mar 2020 18:04:17 +0100
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Subject: Re: [PATCH] block/qcow2-threads: fix qcow2_decompress
In-Reply-To: <20200302150930.16218-1-vsementsov@virtuozzo.com>
References: <20200302150930.16218-1-vsementsov@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Mon, 02 Mar 2020 18:04:17 +0100
Message-ID: <w51zhcyu1ri.fsf@maestria.local.igalia.com>
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
 qemu-stable@nongnu.org, mreitz@redhat.com, dplotnikov@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon 02 Mar 2020 04:09:30 PM CET, Vladimir Sementsov-Ogievskiy wrote:
> On success path we return what inflate() returns instead of 0. And it
> most probably works for Z_STREAM_END as it is positive, but is
> definitely broken for Z_BUF_ERROR.
>
> While being here, switch to errno return code, to be closer to
> qcow2_compress API (and usual expectations).
>
> Revert condition in if to be more positive. Drop dead initialization of
> ret.
>
> Cc: qemu-stable@nongnu.org # v4.0
> Fixes: 341926ab83e2b
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

