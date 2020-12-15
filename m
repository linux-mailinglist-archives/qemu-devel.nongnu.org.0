Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E042DB2A7
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 18:32:59 +0100 (CET)
Received: from localhost ([::1]:37942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpEC2-0004Ss-Go
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 12:32:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kpE9N-0002gC-Ja; Tue, 15 Dec 2020 12:30:13 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:51629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kpE9K-00068u-GT; Tue, 15 Dec 2020 12:30:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=SviHAEMxPXMVUbN2USMyfA6UlBgZHhppteMWX/pCUVk=; 
 b=OEs4gCxfPU6iJb7NPU3pm131fwPsLeXg/gn8y0WUJcy+3irvxUkSHoyssl26BMfbpsPyKpopREOrTKxnqFpNd1lE30PkCZ8gLoVnOuHgpoVUwLRReyy3V2mJOiBuVFNkNU4eYrJTHYP5+2bGIPofiZL36nVimQo89dG18tj6SDD3BZON/aGqgXs0fM2zDeub1Yx/HSi93O65a/9jqlrIQPFhwrJVTqXFWJqpBteuxkFbq3N4lzwmIMJjdp7NaTSM7aGa289XJavUX9U24WX6cn0zDhbroG8tRkwW9uqZJfY2FPBAoHsct5ClFj9OT/mmntz2VCielV1nkd40BS1zMg==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1kpE9I-0002xN-1A; Tue, 15 Dec 2020 18:30:08 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1kpE9H-00089V-OS; Tue, 15 Dec 2020 18:30:07 +0100
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Subject: Re: [PATCH v2 09/36] block: return value from bdrv_replace_node()
In-Reply-To: <20201127144522.29991-10-vsementsov@virtuozzo.com>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
 <20201127144522.29991-10-vsementsov@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Tue, 15 Dec 2020 18:30:07 +0100
Message-ID: <w514kknt1sw.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, armbru@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri 27 Nov 2020 03:44:55 PM CET, Vladimir Sementsov-Ogievskiy wrote:
> Functions with errp argument are not recommened to be void-functions.
> Improve bdrv_replace_node().
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

