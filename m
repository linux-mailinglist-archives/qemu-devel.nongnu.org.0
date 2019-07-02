Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 819A85D46C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 18:39:21 +0200 (CEST)
Received: from localhost ([::1]:55098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiLoO-0005P8-Mm
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 12:39:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37655)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <berto@igalia.com>) id 1hiKpb-00086R-O1
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 11:36:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1hiKpY-0006Bj-TQ
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 11:36:30 -0400
Received: from fanzine.igalia.com ([91.117.99.155]:34422)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1hiKpO-0005xX-Gp; Tue, 02 Jul 2019 11:36:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=YgjhZIEsoUfrW02s5LlAehFAQe3o7GLta0V6EKhMNyc=; 
 b=CokrgVxjgs+gfYvNDSbs4vbA1J6mx7tVdzoojA6kc3/W292KIhFAw32oVxcmOXFVolxSgj+Uz0nKbNK5fMvcjirFc2cJRYmwKgVncMhDQSeyz5UV/2ndn6G8fnRnH+2MmHb06XXyFFR55KnMXn3cFbGjWEyPz51v4BdS7F7lp/eEs15zcxrcJ64VJ6tmG4r18T5/g8qXhmOlWbH3bzWD8IpUEp/mK+/QnWG/iVFCl1VEuic74cL3aTISTJxJlHYJ1SSHQNCjK4/bT6xYjdeD1htslL/brlP5c2kWIybeQXh6rN5kQ77vNUCayLYV542x+8QND+0eJ0AJjq83KZ/RGw==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1hiKpH-0005Oj-Cu; Tue, 02 Jul 2019 17:36:11 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1hiKpH-0000Gn-AK; Tue, 02 Jul 2019 17:36:11 +0200
From: Alberto Garcia <berto@igalia.com>
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
In-Reply-To: <20190627223255.3789-2-mreitz@redhat.com>
References: <20190627223255.3789-1-mreitz@redhat.com>
 <20190627223255.3789-2-mreitz@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Tue, 02 Jul 2019 17:36:11 +0200
Message-ID: <w51k1d05tzo.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic] [fuzzy]
X-Received-From: 91.117.99.155
Subject: Re: [Qemu-devel] [PATCH 1/5] block: Add BDS.never_freeze
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
 Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri 28 Jun 2019 12:32:51 AM CEST, Max Reitz wrote:
> The commit and the mirror block job must be able to drop their filter
> node at any point.  However, this will not be possible if any of the
> BdrvChild links to them is frozen.  Therefore, we need to prevent them
> from ever becoming frozen.
>
> Signed-off-by: Max Reitz <mreitz@redhat.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

