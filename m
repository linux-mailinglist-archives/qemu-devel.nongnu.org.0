Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F07E1B0DE0
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Apr 2020 16:06:19 +0200 (CEST)
Received: from localhost ([::1]:36470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jQX3y-0001ek-7U
	for lists+qemu-devel@lfdr.de; Mon, 20 Apr 2020 10:06:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41096 helo=eggs1p.gnu.org)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1jQX13-0007K0-27
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 10:03:17 -0400
Received: from Debian-exim by eggs1p.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1jQX12-000374-OJ
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 10:03:16 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:45757)
 by eggs1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jQX0p-0002is-FH; Mon, 20 Apr 2020 10:03:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=Ko/b9zJ3gjYzhhu04mFpzyeivbv4s+iA2JN3+0sFkDo=; 
 b=H1KHr2t3EFf7zsVrOxYb+edQYoEPSYugzdr2bNr8myZ+APcIW3B6kNf1I2h/Ie9hU23VSg3x0/oR5/xXrLavbE6io1/BZ5DRoXBa/2jxg5hJhTkGHl98j2+FtsHG+ejrzemtpIOWMO/cDtGU6NGpOMVCNotRHthEGuGR3BOBwrzfCoLN12FRz2xst2Qde5D4Iizkk4blcIDgbqJXZJbY0NChGkSmfD4Vx8P6Fvb2mB1Ez1+UJRCEKdZXQV5T5UA0hLDEcKGi4INJwlb3ZnrUfZO0GqruBItlY4t7J87SR78y8TVPInnSLFJTaPUAQ+4FI4WVlWk43PzKUNzl4xjSYQ==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1jQX0n-00088U-50; Mon, 20 Apr 2020 16:03:01 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1jQX0m-00011r-RI; Mon, 20 Apr 2020 16:03:00 +0200
From: Alberto Garcia <berto@igalia.com>
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Subject: Re: [PATCH v4 5/9] raw-format: Support BDRV_REQ_ZERO_WRITE for
 truncate
In-Reply-To: <20200420133214.28921-6-kwolf@redhat.com>
References: <20200420133214.28921-1-kwolf@redhat.com>
 <20200420133214.28921-6-kwolf@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Mon, 20 Apr 2020 16:03:00 +0200
Message-ID: <w51wo6ap84r.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs1p.gnu.org: First seen = 2020/04/20
 08:31:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic] [fuzzy]
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
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon 20 Apr 2020 03:32:10 PM CEST, Kevin Wolf wrote:
> The raw format driver can simply forward the flag and let its bs->file
> child take care of actually providing the zeros.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

