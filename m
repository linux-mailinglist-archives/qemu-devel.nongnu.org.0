Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA92ADB8D
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Sep 2019 16:56:11 +0200 (CEST)
Received: from localhost ([::1]:57638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7L5O-00022d-H3
	for lists+qemu-devel@lfdr.de; Mon, 09 Sep 2019 10:56:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46093)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1i7L4M-0001Sd-JB
 for qemu-devel@nongnu.org; Mon, 09 Sep 2019 10:55:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1i7L4K-0004TG-Jl
 for qemu-devel@nongnu.org; Mon, 09 Sep 2019 10:55:06 -0400
Received: from fanzine.igalia.com ([91.117.99.155]:36374)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1i7L4C-0004Do-DR; Mon, 09 Sep 2019 10:54:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=G+FuhVNBdD8/BLUke8BQbWjoIrsjEl+0qAx+5SB2G4Q=; 
 b=mtaMrhOTuOggXmbKJkMY+CzMEFK++zmKs4yq7c7S54/E76Qp/QJB5rnm4y5+z5g9N1NByd98EGGwtkKQFEa07ZVSWsMc8SwfHswqm003H9iL+747hDDsZE5HgIDwALhnqd7Hbc74dAdDxC2fieg6ovei6rlAFm6SvpFGRslT/YF7jEV4C0u2JVek65tXdMF0sREwm6EJPkKIbtKBU2DNXrVUHxNn31EmjWsjjetVI/1/NNmepwUW+q24tiKNj4KMw8lQr2Apnzz+84UZNPVAFI0ho4grU75DYRhi1KmjvBIjgPeeDkXasVXcDBlye4WoPc6LnmfsBFaD6XbchCXFwA==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1i7L3t-0006ol-3d; Mon, 09 Sep 2019 16:54:37 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1i7L3t-0000kq-0u; Mon, 09 Sep 2019 16:54:37 +0200
From: Alberto Garcia <berto@igalia.com>
To: Anton Nefedov <anton.nefedov@virtuozzo.com>, qemu-block@nongnu.org
In-Reply-To: <20190906160120.70239-4-anton.nefedov@virtuozzo.com>
References: <20190906160120.70239-1-anton.nefedov@virtuozzo.com>
 <20190906160120.70239-4-anton.nefedov@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Mon, 09 Sep 2019 16:54:37 +0200
Message-ID: <w51k1ah8qqa.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic] [fuzzy]
X-Received-From: 91.117.99.155
Subject: Re: [Qemu-devel] [PATCH v9 3/9] block: add empty account cookie type
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, den@virtuozzo.com,
 qemu-devel@nongnu.org, mreitz@redhat.com,
 Anton Nefedov <anton.nefedov@virtuozzo.com>, pbonzini@redhat.com,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri 06 Sep 2019 06:01:14 PM CEST, Anton Nefedov wrote:
> This adds some protection from accounting uninitialized cookie.
> That is, block_acct_failed/done without previous block_acct_start;
> in that case, cookie probably holds values from previous operation.
>
> (Note: it might also be uninitialized holding garbage value and there
> is still "< BLOCK_MAX_IOTYPE" assertion for that.  So
> block_acct_failed/done without previous block_acct_start should be
> used with caution.)
>
> Currently this is particularly useful in ide code where it's hard to
> keep track whether the request started accounting or not. For example,
> trim requests do the accounting separately.

Sorry if I'm understanding it wrong, but it sounds like you know that
there's a bug in the ide code (where you call block_acct_done() without
having it initialized it first), and the purpose of the this patch is to
hide the bug ?

Berto

