Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B5525C1D8
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 15:47:46 +0200 (CEST)
Received: from localhost ([::1]:56906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDpab-0003Ft-9s
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 09:47:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kDpYY-0000Us-Dx; Thu, 03 Sep 2020 09:45:38 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:50401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kDpYV-0001HF-Rf; Thu, 03 Sep 2020 09:45:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=7pIoZMluEev88/YnPH9xEwhij4qXIqgN02yDm2WS/Mk=; 
 b=h3gpRbXXN4VZG6coG0I+YI5ZxrloTDxiRG2Nc+KiZNRcevPfLwgcTQJMRC+mdfCibbvDFk79LfV0G3pzmFmtF6rKTzdjq2mwcrvehBOuhn6FMjCxkktn05Cm8C+vtOHkKHRMHG4gn79IaPKJjP5eWW/GOIn29aB7o6xdpVEVelBPsYQp7caH7NOR7pn4nZ6Bk0gtArItlXPbbLxN+h+EcBELLVY1X2ibPBJzLdtBPfnw8NVlAWhIO3N0k+yJIcXx3U6RRKY+gfMVLyOh1+jRV0vUYyDYm/ErcctmCdbi7Bp2e8uEto2icSgDssIHxlyqru5OJnlNgiQbdlA9ZsGCdg==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1kDpYS-0000BS-1c; Thu, 03 Sep 2020 15:45:32 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1kDpYR-0000BR-OV; Thu, 03 Sep 2020 15:45:31 +0200
From: Alberto Garcia <berto@igalia.com>
To: Max Reitz <mreitz@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH] qcow2: Fix removal of list members from
 BDRVQcow2State.cluster_allocs
In-Reply-To: <3a45705f-563d-d5f9-bb1c-b94309c07a20@redhat.com>
References: <20200902174230.12336-1-berto@igalia.com>
 <3a45705f-563d-d5f9-bb1c-b94309c07a20@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Thu, 03 Sep 2020 15:45:31 +0200
Message-ID: <w51pn73km84.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 09:45:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic] [fuzzy]
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu 03 Sep 2020 03:12:22 PM CEST, Max Reitz wrote:
> On my search for /(\.|->)nb_clusters/ to verify this, I noticed this
> comment for qcow2_alloc_cluster_offset():
>
>  * If the cluster was already allocated, m->nb_clusters is set to 0 and
>  * other fields in m are meaningless.
>
> Should that be dropped, too?

Actually the whole comment should be rewritten (the function does not
allocale just one cluster), I'll send v2 with that and the rest of your
proposed changes.

Berto

