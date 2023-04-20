Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A35C66E9C73
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 21:26:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppZuz-0006eC-Bk; Thu, 20 Apr 2023 15:26:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1ppZuv-0006dI-Oh; Thu, 20 Apr 2023 15:26:05 -0400
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1ppZup-0006Gz-Oy; Thu, 20 Apr 2023 15:26:05 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2243E218E2;
 Thu, 20 Apr 2023 19:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1682018758; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lshavpPj6CI+A68cfJ+I6+HHidNvjLWPEbQu6ALmPz8=;
 b=068iUcxv4aEQLgML5W1hYKAtVpSRcqxxOUmFuy08K3MYrkgYkcIU3mQO6pPo7DAh1r3kjk
 L237JzXEZayYxeUWeoBqAY3KGxnWHHH08pedZsWC304JZti0KDpl+9aoUjQVH5utPrbkfJ
 zGsUHHwD4QWc9qeReidnZZCuK3xo3L4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1682018758;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lshavpPj6CI+A68cfJ+I6+HHidNvjLWPEbQu6ALmPz8=;
 b=BWmdIEmFbWXY94qU1VRLcmw67d3/141EyBLgOAkgCs3ALrZT0N1v2Mh5hjxPtFaBjCTu99
 QF8eyp0kDhwCXSDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9F13C1333C;
 Thu, 20 Apr 2023 19:25:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yK/YGcWRQWQKTQAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 20 Apr 2023 19:25:57 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>, David Hildenbrand <david@redhat.com>, John
 Snow <jsnow@redhat.com>, Fam Zheng <fam@euphon.net>, Hailiang Zhang
 <zhanghailiang@xfusion.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-block@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, Vladimir
 Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, Leonardo Bras
 <leobras@redhat.com>, Markus Armbruster <armbru@redhat.com>, Stefan
 Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>, Eric
 Blake <eblake@redhat.com>
Subject: Re: [PATCH v2 29/43] migration: Move migrate_postcopy() to options.c
In-Reply-To: <20230420134002.29531-30-quintela@redhat.com>
References: <20230420134002.29531-1-quintela@redhat.com>
 <20230420134002.29531-30-quintela@redhat.com>
Date: Thu, 20 Apr 2023 16:25:55 -0300
Message-ID: <87sfcu73uk.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=195.135.220.28; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Juan Quintela <quintela@redhat.com> writes:

> Signed-off-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: Fabiano Rosas <farosas@suse.de>

