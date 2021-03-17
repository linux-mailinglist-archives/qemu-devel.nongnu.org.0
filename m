Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22ACB33F65A
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 18:14:01 +0100 (CET)
Received: from localhost ([::1]:51246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMZk8-0000zF-6e
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 13:14:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lMZNg-0000j2-QS; Wed, 17 Mar 2021 12:50:49 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:36803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lMZNV-0003Sc-ME; Wed, 17 Mar 2021 12:50:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=rb+OBIr0O1synTRfsh4kr/TB8jWve74ktcxHlo5pKXg=; 
 b=XHY5Rf5zs5Ac1SuixWnzBvLdwedisp7pZ2a1g1p3gZJ3nCHbTU2Az+4JUM+nJeUoG1EFANmWdiIMJk3YXgcn+56eZS06HESX4yxTeYlDD6cUkbWXJzV+VMU7G+VPBHJ8mxedk719xjcaqr4jgKlFNaifptqVf3dXMPLA7vd6o3cBCs2unrtFgUnAw6B5I4odQ2s8W53Dia/OsnPdkgMIXyOjlfQ2aw2n9hoJJCACvQ+dVpN8zcjI4Tjr68+TdJCEzgyIn0JQpusxO7vS1YpSo+7VqHllSNilXMfpdmiLm11KT4IzSTwi942fR4blTmTUEcjjsfMICnqyVhue6NHFlw==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1lMZN4-0007C3-EL; Wed, 17 Mar 2021 17:50:10 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1lMZN4-0005R3-4m; Wed, 17 Mar 2021 17:50:10 +0100
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Subject: Re: [PATCH v3 13/36] block: use topological sort for permission update
In-Reply-To: <20210317143529.615584-14-vsementsov@virtuozzo.com>
References: <20210317143529.615584-1-vsementsov@virtuozzo.com>
 <20210317143529.615584-14-vsementsov@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Wed, 17 Mar 2021 17:50:10 +0100
Message-ID: <w511rcdlo71.fsf@maestria.local.igalia.com>
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 qemu-devel@nongnu.org, armbru@redhat.com, stefanha@redhat.com,
 mreitz@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed 17 Mar 2021 03:35:06 PM CET, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> wrote:
> Rewrite bdrv_check_perm(), bdrv_abort_perm_update() and bdrv_set_perm()
> to update nodes in topological sort order instead of simple DFS. With
> topologically sorted nodes, we update a node only when all its parents
> already updated. With DFS it's not so.

This patch does not apply cleanly on the master branch, the branch from
your repository at https://src.openvz.org/scm/~vsementsov/qemu.git does
work fine, however.

Berto

