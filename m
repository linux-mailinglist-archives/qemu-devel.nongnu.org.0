Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EC7FCABD
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Nov 2019 17:29:29 +0100 (CET)
Received: from localhost ([::1]:59512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iVHzs-0001fS-5o
	for lists+qemu-devel@lfdr.de; Thu, 14 Nov 2019 11:29:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45475)
 by lists.gnu.org with esmtp (Exim 4.90_1) (envelope-from
 <BATV+8b5ce803d49b55f6f817+5926+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1iVHyT-00015F-8d
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 11:28:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from
 <BATV+8b5ce803d49b55f6f817+5926+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1iVHyS-0007gS-8z
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 11:28:01 -0500
Received: from bombadil.infradead.org ([2607:7c80:54:e::133]:41156)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from
 <BATV+8b5ce803d49b55f6f817+5926+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1iVHyN-0007ff-V4; Thu, 14 Nov 2019 11:27:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WWu+wEg4w0nzy/sbweOFWdxSYY/TkiMTJL70/76I1A0=; b=flFfE3Dq+JJgZxp6NjMw265HR
 WQoPKptzI8MBeJNNTzA1GFayPw3+DEAerbuZugbLtkNz29YsL09+Jldypv4EUVDWO04VSRdAB804c
 j2NiUuUqfwmIUnURuCYQUDaAAeOfbCzrxMGEAm2PvAjrEoSD0LCSnR79W6VRQ6S2uUhm6J3jS08tP
 oE5ilLn0AAL2ZBX0n1dVqDllZ118YZqdiTq58yscFLC22ky0ogQqjp5KXaW8cOyoa19K+MjCIDnWX
 J3VaUGeBq+OQCdkiwdWugeCr9t7b2nzUFsRbuzoiD5SO9UuEkrF//Gv/uddu5gAY3qeL7oody9RVP
 mLJjuewug==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1iVHyJ-0008UN-Rc; Thu, 14 Nov 2019 16:27:51 +0000
Date: Thu, 14 Nov 2019 08:27:51 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH for-4.2 v2 3/3] block/file-posix: Let post-EOF fallocate
 serialize
Message-ID: <20191114162751.GA29976@infradead.org>
References: <20191101152510.11719-1-mreitz@redhat.com>
 <20191101152510.11719-4-mreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191101152510.11719-4-mreitz@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:7c80:54:e::133
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
Cc: Kevin Wolf <kwolf@redhat.com>, Anton Nefedov <anton.nefedov@virtuozzo.com>,
 qemu-block@nongnu.org, qemu-stable@nongnu.org, qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Denis V . Lunev" <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 01, 2019 at 04:25:10PM +0100, Max Reitz wrote:
> The XFS kernel driver has a bug that may cause data corruption for qcow2
> images as of qemu commit c8bb23cbdbe32f.  We can work around it by
> treating post-EOF fallocates as serializing up until infinity (INT64_MAX
> in practice).

This has been fixed in the kernel a while ago.  I don't think it makes
sense to work around it in qemu.

