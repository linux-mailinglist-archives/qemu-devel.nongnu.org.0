Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DAB31CE8E
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 18:01:21 +0100 (CET)
Received: from localhost ([::1]:52634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC3iy-0005D5-Da
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 12:01:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lC3LE-0003vZ-DO; Tue, 16 Feb 2021 11:36:48 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:60006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lC3L8-0005aE-LU; Tue, 16 Feb 2021 11:36:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=xvCwVff2POEh7uH+jYbrBkQWoLzfq7Sx+ebiFo/PvvQ=; 
 b=L4k7DmGz1Z7eLcoO5PZiXxf/h/yyUnVQgn0l7PdoMTzhjnem5NhgKcjPEHPK0W5RgcdQIc0JkiZ1aatLnBWomGE0si9jBzIqZpFS8RxK3CBT98uM9tRjdfJndXaFCXa6aRoVfJWj0E0s2kpjLgAc4Xx5lBkVAW4nTzwyDj0+mI19Tb1SBayyzQE3tIFaqHGyHYMLWxonRProi5Oe6MTaV5j3VnNttex0buWgCICphIMtEn/7E06RPrnXQvYwbjGY9hHdaNaVG9V95uG8O9ghWqKsi4dM3DBLuIStCEI1K9YG6ys+BPpk24iWUEuFxZuvJblDpiGBgYJqGqX3Ox/5QA==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1lC3L6-00010y-LI; Tue, 16 Feb 2021 17:36:40 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1lC3L6-0002si-Bg; Tue, 16 Feb 2021 17:36:40 +0100
From: Alberto Garcia <berto@igalia.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [RFC PATCH v2 0/4] Allow changing bs->file on reopen
In-Reply-To: <20210210172657.GJ5144@merkur.fritz.box>
References: <cover.1612809837.git.berto@igalia.com>
 <20210210172657.GJ5144@merkur.fritz.box>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Tue, 16 Feb 2021 17:36:40 +0100
Message-ID: <w514kic2cmf.fsf@maestria.local.igalia.com>
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, pkrempa@redhat.com,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed 10 Feb 2021 06:26:57 PM CET, Kevin Wolf wrote:

> You have a test case for adding a throttling filter. Can we also
> remove it again or is there still a problem with that? I seem to
> remember that that was a bit trickier, though I'm not sure what it
> was. Was it that we can't have the throttle node without a file, so it
> would possibly still have permission conflicts?

There is no problem with removing the filter anymore. See here for a
description of the original problem:

https://lists.gnu.org/archive/html/qemu-block/2020-12/msg00090.html

But this series is based on Vladimir's branch ("update graph permissions
update") which reworks how the permissions are calculated on reopen and
solves the issue.

Berto

