Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0719C159330
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Feb 2020 16:32:47 +0100 (CET)
Received: from localhost ([::1]:51544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1XWn-0001dg-TI
	for lists+qemu-devel@lfdr.de; Tue, 11 Feb 2020 10:32:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44106)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1j1XVP-0000Vy-Bf
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 10:31:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1j1XVO-0002J6-7B
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 10:31:19 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:54758)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1j1XVI-0002Go-Mc; Tue, 11 Feb 2020 10:31:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=5KfZY/ifPyqYz/JAEA9s9mZTVkrxYVECExQ/jYW26Bw=; 
 b=XF+HzvP6SPrZlD/5dqQtZc4Gp2SIbT7sYcAhDRRX2Kd2/ZeK7eRxJKaBxzPGRwCBOXubZKs4s1fktWjgzNIXYtLq7GcXgY4MLOscXqDLYaGh4QZML+OzThCCSwvbadfdgvhtt6uBJ9LaUcv1RtyX45GJWZLdhuysGKJSII41sW5TrNC3tcYE+Fw6U5cIQecznOwtS8w0EZ8B28LqgikNwNi9F1Q9k7of34oDzUPVPmmDuqH5cwmRvaCYUk9IqQSNJ/eDur4koS7MEDP1ODDxbWzAXwiH96A1Q1QPzdIRlMlXoP5BCcIslW68qfeYSSPEOCRfl4VdY0WE9WMmECZZRg==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1j1XVG-0006KV-Qk; Tue, 11 Feb 2020 16:31:10 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1j1XVG-0008Pb-Gq; Tue, 11 Feb 2020 16:31:10 +0100
From: Alberto Garcia <berto@igalia.com>
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Subject: Re: [PATCH v2 02/33] block: Rename BdrvChildRole to BdrvChildClass
In-Reply-To: <20200204170848.614480-3-mreitz@redhat.com>
References: <20200204170848.614480-1-mreitz@redhat.com>
 <20200204170848.614480-3-mreitz@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Tue, 11 Feb 2020 16:31:10 +0100
Message-ID: <w51pnelb0ox.fsf@maestria.local.igalia.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue 04 Feb 2020 06:08:17 PM CET, Max Reitz wrote:
> This structure nearly only contains parent callbacks for child state
> changes.  It cannot really reflect a child's role, because different
> roles may overlap (as we will see when real roles are introduced), and
> because parents can have custom callbacks even when the child fulfills a
> standard role.
>
> Signed-off-by: Max Reitz <mreitz@redhat.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

