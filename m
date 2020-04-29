Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 751031BDC5E
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Apr 2020 14:34:55 +0200 (CEST)
Received: from localhost ([::1]:53388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jTlvS-0005tF-0I
	for lists+qemu-devel@lfdr.de; Wed, 29 Apr 2020 08:34:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55874)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1jTlt1-0003Z7-LU
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 08:32:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1jTlt1-0006LM-8o
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 08:32:23 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:46211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jTlsJ-0005RL-Ak; Wed, 29 Apr 2020 08:31:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=CbxEA2bP1xCRixx8tmZIHBIL3c1bwrbEsE5ER1QspXc=; 
 b=qXakW3sOIdXUVPPmayUvNyFluR6tgHZ2RK19ExZdJciF2syrjc/Cy5pPk09Db938W+ruP0umQZ3dLIEHe09NGQG2ISOJhHsiXZREK4yA7+SP6ScqioOPMh3dAJun1Eb9XWjUSTSvhmycFwK3vhETwfVS3nzWR/Izf4K4erj/LLLotgM+iVuln9mtczAvmxZmZolIEFr0oVQmD5nwWWHbdFJSI/uAgQYjQK5wptvXVyzu/saO6KLcw2zdiwDTxaUF+N16NqFoUW3JDyBlWurgpqDKrllILQBsRxCJ+jFRqil14uBa+WOUEtAcqdAJrnGJWI4Az5Hkgya1eLWDdZvfHg==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1jTlsG-0001r7-B9; Wed, 29 Apr 2020 14:31:36 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1jTlsG-0007r7-0f; Wed, 29 Apr 2020 14:31:36 +0200
From: Alberto Garcia <berto@igalia.com>
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Subject: Re: [PATCH 1/3] backup: Improve error for bdrv_getlength() failure
In-Reply-To: <20200429111539.42103-2-kwolf@redhat.com>
References: <20200429111539.42103-1-kwolf@redhat.com>
 <20200429111539.42103-2-kwolf@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Wed, 29 Apr 2020 14:31:36 +0200
Message-ID: <w51o8rascbb.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/29 08:31:36
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

On Wed 29 Apr 2020 01:15:37 PM CEST, Kevin Wolf wrote:
> bdrv_get_device_name() will be an empty string with modern management
> tools that don't use -drive. Use bdrv_get_device_or_node_name() instead
> so that the node name is used if the BlockBackend is anonymous.
>
> While at it, start with upper case to make the message consistent with
> the rest of the function.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

