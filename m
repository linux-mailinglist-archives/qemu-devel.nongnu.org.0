Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1F3115566
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Dec 2019 17:33:18 +0100 (CET)
Received: from localhost ([::1]:40932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1idGXd-0002F4-Sz
	for lists+qemu-devel@lfdr.de; Fri, 06 Dec 2019 11:33:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38357)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1idEzq-0001oH-Sc
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:54:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1idEzp-0007Ow-Su
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:54:18 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:56259)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1idEzp-0007NA-J5; Fri, 06 Dec 2019 09:54:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=Cxo/MHtH+nFMkb9v7RPW8Cgb4/W84HHMGrjuXZaT/+s=; 
 b=r19YYB6DbMsyfNioVIrTGiabn6B16pcLX/oIVMG5NLBoIKo1eq/dHjUXTV6KgipZAkyBR8JYCiblEOPanv6LCarK20K+a5z9Dz81wYT65mPxXlWX4e17bR0rofW94fF3Cg49k7UCNW5rYUQGnHBa2qCB0wnVM+eKGXNRmQ2Pd5z1HNIBo3xK/yn36AmCZ797ANMRFDM0dQs5qbXLzzMc8t4m9NmvSdLLqLiJd5SPOw6XwJ86B68WaMshAJKT4p4of0lx5+yy+vsPRLPAQ4zVsUWxALgvkyAPbuCuhBjtl3xAu1sSuvxShBuQ5haz1SopImC+qmQAa4bphS01jic4pQ==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1idB4F-0006WL-NG; Fri, 06 Dec 2019 11:42:35 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1idB4F-0005qy-Kc; Fri, 06 Dec 2019 11:42:35 +0100
From: Alberto Garcia <berto@igalia.com>
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH] qemu-img: fix info --backing-chain --image-opts
In-Reply-To: <20191205134646.445427-1-stefanha@redhat.com>
References: <20191205134646.445427-1-stefanha@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Fri, 06 Dec 2019 11:42:35 +0100
Message-ID: <w51muc5vip0.fsf@maestria.local.igalia.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu 05 Dec 2019 02:46:46 PM CET, Stefan Hajnoczi wrote:
> Only apply --image-opts to the topmost image when listing an entire
> backing chain.  It is incorrect to treat backing filenames as image
> options.  Assuming we have the backing chain t.IMGFMT.base <-
> t.IMGFMT.mid <- t.IMGFMT, qemu-img info fails as follows:
>
>   $ qemu-img info --backing-chain --image-opts \
>       driver=qcow2,file.driver=file,file.filename=t.IMGFMT
>   qemu-img: Could not open 'TEST_DIR/t.IMGFMT.mid': Cannot find device=TEST_DIR/t.IMGFMT.mid nor node_name=TEST_DIR/t.IMGFMT.mid
>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

