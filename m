Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8909917BB18
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Mar 2020 12:04:01 +0100 (CET)
Received: from localhost ([::1]:34466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jAAls-0001bk-4g
	for lists+qemu-devel@lfdr.de; Fri, 06 Mar 2020 06:04:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51780)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1jAAkQ-0000sE-IY
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 06:02:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1jAAkP-0002tR-7J
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 06:02:30 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:43086)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1jAAkO-0002gl-Ix; Fri, 06 Mar 2020 06:02:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=DeL0a7YjU2R9PbdSA9cay0PiC0uIWJp67ePHFkkGUpA=; 
 b=if5D5cksjzYicETnVSWnbWdBScQ7kqcsh1L1qAEa6/FQp+buTYYMKmjRQbm3CnZTUwRVC1XiQ2JA310ZeHYljXAnYfBfE6Gd6LziIB0VudPuwkP0NaiDfDDG5WvJdbBX0wGkKHxj/JC//iIhn2tsVtCtYGa+0zu+68uTQ9BAmVrxPh8DUWTlBIraewXw5q6AuLcxAry0vDShqHInbViwgSral/EHuzSxZkTeqHgiipGR5gAWWlsiIxP+Hbmj+dpWZthtVM0+RZZKcJx56jUSZPqYhCZYwOofE0Pyk/iuwOtp3v1P19+/5jgDmSH3PQGWWg7B9v2GXfq7DGVTAxDlQQ==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1jAAkI-0004u0-No; Fri, 06 Mar 2020 12:02:22 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1jAAkI-0005as-DF; Fri, 06 Mar 2020 12:02:22 +0100
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v8 01/10] error: auto propagated local_err
In-Reply-To: <20200306051536.27803-2-vsementsov@virtuozzo.com>
References: <20200306051536.27803-1-vsementsov@virtuozzo.com>
 <20200306051536.27803-2-vsementsov@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Fri, 06 Mar 2020 12:02:22 +0100
Message-ID: <w51mu8tsq4h.fsf@maestria.local.igalia.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, vsementsov@virtuozzo.com,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Laszlo Ersek <lersek@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 armbru@redhat.com, Stefano Stabellini <sstabellini@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Max Reitz <mreitz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri 06 Mar 2020 06:15:27 AM CET, Vladimir Sementsov-Ogievskiy wrote:

Sorry I just gave a quick look at these patches and noticed this:

> + * Function may use error system to return errors. In this case function
> + * defines Error **errp parameter, which should be the last one (except for
> + * functions which varidic argument list), which has the following API:

I don't think that "functions which varidic argument list" is correct
English. Perhaps something like "except for variadic functions" or
"except for functions with a variable number of arguments".

Berto

