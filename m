Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A9C2F37B1
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 18:54:06 +0100 (CET)
Received: from localhost ([::1]:60560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzNrp-0005r1-CW
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 12:54:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kzNpz-0004Qn-NA; Tue, 12 Jan 2021 12:52:11 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:44006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kzNpx-0001Jz-9f; Tue, 12 Jan 2021 12:52:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=hJV9AZsmV5hu4rUAYVkLZ+ip+Q00kEo2ivLXMiq5k9c=; 
 b=O6cSzvHhNYoJeJfX6Mzq5GO9+ciUTdMPImc2beKQQkelLRU2monp+sUTF0xAIJ/tRrci+YdMR6kUpbRTmKSesz956lccPULGD2j0KSVWsA3rE6s64vT/+ak3QhEUFrQiwDWdon9+odrZbF47C0guRhM4/7NNZRjbqfEcGiuHgyy5eUYp8zt5SSDipqjqQuYX/gvJHn2hyZ17MninL2yQ2aUZtQlb1w8LkeHdTDP2ryjP+02kQZRrPOG158M7jFrwe+d0xqldfg5OOKJoUzVUTvU4eG+EnPCzmI6oRq64qsPUqj4Z3OGuZrVz5XHZe9sQ6PBQhPU/l6WHgoskUTkw6Q==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1kzNps-0007Yw-TA; Tue, 12 Jan 2021 18:52:04 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1kzNps-0003Sn-Jn; Tue, 12 Jan 2021 18:52:04 +0100
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Subject: Re: [PATCH v5 02/14] block: use return status of bdrv_append()
In-Reply-To: <20210109125811.209870-3-vsementsov@virtuozzo.com>
References: <20210109125811.209870-1-vsementsov@virtuozzo.com>
 <20210109125811.209870-3-vsementsov@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Tue, 12 Jan 2021 18:52:04 +0100
Message-ID: <w51v9c2ujp7.fsf@maestria.local.igalia.com>
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, pavel.dovgaluk@ispras.ru,
 qemu-devel@nongnu.org, armbru@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com, mreitz@redhat.com, jsnow@redhat.com, ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat 09 Jan 2021 01:57:59 PM CET, Vladimir Sementsov-Ogievskiy wrote:
> Now bdrv_append returns status and we can drop all the local_err things
> around it.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

