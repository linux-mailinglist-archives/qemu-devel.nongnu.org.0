Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B71105340
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Nov 2019 14:37:21 +0100 (CET)
Received: from localhost ([::1]:40484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXme8-0008FZ-2f
	for lists+qemu-devel@lfdr.de; Thu, 21 Nov 2019 08:37:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59560)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1iXmch-0006vI-IH
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 08:35:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1iXmcg-0007gR-Ju
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 08:35:51 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:42270)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1iXmce-0007ck-Df; Thu, 21 Nov 2019 08:35:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=wjIyvJf8yY6CIdGsK7qVuodPMrL/cOVphjzvdv2b94g=; 
 b=OaushjDYB2fQ+hQtA4i0MvyNCt1gMiiSTSJs82x1EuS3XAV39/11Gowi1UobFkbxn8jkN7hGVPzdkP39aYH4FenAQ6fNoiUsxjtR1kxOl1vpZC8ssTWFFZT1oSB5ULzKe5n4hmXS2F3kVe8olrYw+xtuXJ1cabkwRJUKo8eYV4IEnEDHmX/EwiiBcv9YT7HSLNpixnARFqISsQBkM1v0LCR8Q9PznHj3c4lvTLIxSc5sDL4jSwtl2BpjgQ9UkPGjGu7mBC95lCy/rWAQLtY5SjZpUxLi+OYXUmIaayqySxoc7JfUMqDjFRhhfAEbHWmg3YTn85amF84LkBcDJOzTgw==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1iXmcd-0001ML-6n; Thu, 21 Nov 2019 14:35:47 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1iXmcd-0003LJ-4D; Thu, 21 Nov 2019 14:35:47 +0100
From: Alberto Garcia <berto@igalia.com>
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Subject: Re: [PATCH v2 3/6] iotests: Add qemu_io_log()
In-Reply-To: <20191120184501.28159-4-kwolf@redhat.com>
References: <20191120184501.28159-1-kwolf@redhat.com>
 <20191120184501.28159-4-kwolf@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Thu, 21 Nov 2019 14:35:47 +0100
Message-ID: <w51sgmh4aj0.fsf@maestria.local.igalia.com>
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

On Wed 20 Nov 2019 07:44:58 PM CET, Kevin Wolf wrote:
> Add a function that runs qemu-io and logs the output with the
> appropriate filters applied.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

