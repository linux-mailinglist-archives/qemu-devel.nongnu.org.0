Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 756D71040B4
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Nov 2019 17:25:06 +0100 (CET)
Received: from localhost ([::1]:60202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXSmv-0006it-CH
	for lists+qemu-devel@lfdr.de; Wed, 20 Nov 2019 11:25:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43096)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1iXSh3-0000UV-FL
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 11:19:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1iXSh2-00025u-Jv
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 11:19:01 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:56951)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1iXSgz-00024n-DF; Wed, 20 Nov 2019 11:18:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=RDbLWINIUNs/BedytAE5jk7AyBfR2BGbMiQv5SFV6gk=; 
 b=UAG09kmy+DNd4ApflSxZTZ1PQagYj5TqNR90KCj5kTPHhnyCel8BdCBwGb9PkemQxU+VAWwVfrEcaA2QBxVv8FL3O3CS1HOeaXd4C12X3ZA++JRoUBcqoz3XWV83tNvxbAfdS1cDRsfDPbhZix4/CXiheCtv19eIMxUdIyB8T3NZaXTJvsOFlHbsiLIrSOmTIxCsinreGj8lvX+Y/g91a7x7qHmCYRIEnMNsvFr7/DOpfmZXFgIEAQOt9wxlcI5o7oxdb2VDd8odq1gp46sW5WdBZ+K1N+IH0BCAB6/F/dNbtxyNQGuEj04lE551gN36/q/U00KPSJpz7CTjOuwbmA==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1iXSgu-0001yw-4O; Wed, 20 Nov 2019 17:18:52 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1iXSgu-00011c-1V; Wed, 20 Nov 2019 17:18:52 +0100
From: Alberto Garcia <berto@igalia.com>
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Subject: Re: [PATCH 1/6] block: bdrv_co_do_pwrite_zeroes: 64 bit 'bytes'
 parameter
In-Reply-To: <20191120140319.1505-2-kwolf@redhat.com>
References: <20191120140319.1505-1-kwolf@redhat.com>
 <20191120140319.1505-2-kwolf@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Wed, 20 Nov 2019 17:18:52 +0100
Message-ID: <w514kyy8qs3.fsf@maestria.local.igalia.com>
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

On Wed 20 Nov 2019 03:03:14 PM CET, Kevin Wolf wrote:
> bdrv_co_do_pwrite_zeroes() can already cope with maximum request sizes
> by calling the driver in a loop until everything is done. Make the small
> remaining change that is necessary to let it accept a 64 bit byte count.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

