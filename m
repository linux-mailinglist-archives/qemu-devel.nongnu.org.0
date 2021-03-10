Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B717F333A1B
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 11:35:53 +0100 (CET)
Received: from localhost ([::1]:48542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJwC0-0000tv-PC
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 05:35:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lJvxR-0000Cy-Eq; Wed, 10 Mar 2021 05:20:49 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:55837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lJvxP-0003X9-N4; Wed, 10 Mar 2021 05:20:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=n2pW/Th+PLzh29euhNkUYcR6ik+NQLpCYYtFwPmBmuQ=; 
 b=q/EzmvdK2j+BeM3phJXm+Yy6GBHVUcuh45UrGynTNm3IhPUNrjJrQ7X2y2dMomyXwNcQn0GMaO2nMYfzBdpy+qLKPiWPYlKUKzEFSaBRUx2s1EuqNmjPenzkHGXbGR9SE9xuwH+7OJGN56VzcGE93pYdeGspu+9uBkifiIq1BiYlyPXg2U6dPxSfLXhHcMHZlmKBb5dFh/Bkts5glDwCtV3VFQ4mt7wFxkZzU4sXHsWJFfw546mTiA3vxrWX9ACsKurkZ5CQJWHFWARYCihQL/KqQwKAdf+qjaPthAHCPXufnDrALn1je7DPJsmOpZTISZzbsm0ic+3jMicvlhUkKQ==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1lJvxL-0005QA-Qr; Wed, 10 Mar 2021 11:20:43 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1lJvxL-0001BN-Hq; Wed, 10 Mar 2021 11:20:43 +0100
From: Alberto Garcia <berto@igalia.com>
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Subject: Re: [PATCH] stream: Don't crash when node permission is denied
In-Reply-To: <20210309173451.45152-1-kwolf@redhat.com>
References: <20210309173451.45152-1-kwolf@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Wed, 10 Mar 2021 11:20:43 +0100
Message-ID: <w51im5z5mys.fsf@maestria.local.igalia.com>
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
Cc: kwolf@redhat.com, ngu@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue 09 Mar 2021 06:34:51 PM CET, Kevin Wolf <kwolf@redhat.com> wrote:
> The image streaming block job restricts shared permissions of the nodes
> it accesses. This can obviously fail when other users already got these
> permissions. &error_abort is therefore wrong and can crash. Handle these
> errors gracefully and just fail starting the block job.
>
> Reported-by: Nini Gu <ngu@redhat.com>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

