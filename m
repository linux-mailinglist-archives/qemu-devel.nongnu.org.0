Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A37AB103E2C
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Nov 2019 16:20:35 +0100 (CET)
Received: from localhost ([::1]:59222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXRmU-0002rJ-O4
	for lists+qemu-devel@lfdr.de; Wed, 20 Nov 2019 10:20:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32874)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1iXRkW-0001zj-O8
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 10:18:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1iXRkV-0006VM-PH
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 10:18:32 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:39279)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1iXRkV-0006Ux-5c; Wed, 20 Nov 2019 10:18:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=c5JGIGSRjaUAHrs3DCxQDhKeZYx0F+iKCX7m0/eHQj8=; 
 b=UQsXtBYk/lG1RhFHPs6m4VUWc3TVZTkmeDvXxRKAch5M05zlnJyLqqz1xSbCAupuyeVNbRELJZxnv906DxyAl9QQCIq0gNccJYScGpMxBJu+iTMoq1mWkayE8ZI58sFvU+UMLnQXPzlwk7dRtwg1d2vHQ3ObOjr0svWMHEv+2K3MsKV8J0ZUHvksx/sr8t4FgrF3iglkOiO2o/cehj/YwoCjoRV9HaYaoUYuwzuNkL6AgbbghxkswGs10wWYAf5Hph39J9yoEB5QXoZUPKmQ+AG94rm5JidJfXyWRa0EJOO5LkKax7DLS6NwthexaZtWtt0Rh6bNyVLGB+PR0mQxvA==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1iXRkR-0005Zp-PE; Wed, 20 Nov 2019 16:18:27 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1iXRkR-00015N-Md; Wed, 20 Nov 2019 16:18:27 +0100
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "qemu-devel\@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: qcow2 preallocation and backing files
In-Reply-To: <a1575e90-3fe4-e843-518c-714db4b621bc@virtuozzo.com>
References: <20191120120625.GA25497@igalia.com>
 <a1575e90-3fe4-e843-518c-714db4b621bc@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Wed, 20 Nov 2019 16:18:27 +0100
Message-ID: <w517e3u8tks.fsf@maestria.local.igalia.com>
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
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed 20 Nov 2019 01:27:53 PM CET, Vladimir Semeeausntsov-Ogievskiy wrote:

> 3. Also, the latter way is inconsistent with discard. Discarded
> regions returns zeroes, not clusters from backing. I think discard and
> truncate should behave in the same safe zero way.

But then PREALLOC_MODE_OFF implies that the L2 metadata should be
preallocated (all clusters should be QCOW2_CLUSTER_ZERO_PLAIN), at least
when there is a backing file.

Or maybe we just forbid PREALLOC_MODE_OFF during resize if there is a
backing file ?

Berto

