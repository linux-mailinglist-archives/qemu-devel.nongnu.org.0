Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE631C9027
	for <lists+qemu-devel@lfdr.de>; Thu,  7 May 2020 16:40:10 +0200 (CEST)
Received: from localhost ([::1]:57386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWhh3-0002iE-Je
	for lists+qemu-devel@lfdr.de; Thu, 07 May 2020 10:40:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jWhem-000102-A4; Thu, 07 May 2020 10:37:48 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:55897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jWhek-00028w-Qq; Thu, 07 May 2020 10:37:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=MN/YlR/ABv/N+Xv5Sj/GoyAwWzMhpPiqSuZzcTntz5I=; 
 b=T/tHdWzS5DpzG3YExeT8btUTQh3mjTfFY4F99C41O2gwO3QM5KGhW0cWNofA94nGEE1F/YwShIXpGwrJnYXap2a+uHZqwG6VeeA6puCSgGxGOccOFoVkx4w+/g7dO41/RyAe+yDW9526Vdnf7MWpDYBIIamUl2FBycogn4K1xfNQwGw1PpRi6Nvq8PiRoakwRCdgAkgxKjbqSwjoMGRKBAVIFhfIEIrcEnUvnZq64U9QY6JStIs0qY2AX2ZpLCs3l86tIQMo5j7kNmrt2VFki/lN4QnRStcrOVJ2LOOVavxkTyHXAUt3eTzHMViGS45OD/Iug4VIV80Wr87IFXTxOQ==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1jWheM-0000OL-Sb; Thu, 07 May 2020 16:37:22 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1jWheM-0003u9-Ix; Thu, 07 May 2020 16:37:22 +0200
From: Alberto Garcia <berto@igalia.com>
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v5 28/31] qcow2: Add the 'extended_l2' option and the
 QCOW2_INCOMPAT_EXTL2 bit
In-Reply-To: <926a34f4-c629-fe8e-ed5a-b655b68d1265@redhat.com>
References: <cover.1588699789.git.berto@igalia.com>
 <f8d2bb7d22fd228816e5caed6640af36a63cdddc.1588699789.git.berto@igalia.com>
 <926a34f4-c629-fe8e-ed5a-b655b68d1265@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Thu, 07 May 2020 16:37:22 +0200
Message-ID: <w51ftcbn74t.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/07 10:37:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed 06 May 2020 08:09:07 PM CEST, Eric Blake wrote:
> What you have looks good, but I didn't notice anything affecting
> amend.  The simplest option: amend can reject attempts to toggle the
> extended L2 option (the zstd compression patches take that path).

You're right, thanks! I think I'll just disable it, I'm not sure that
it's worth the complexity.

Berto

