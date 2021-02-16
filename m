Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E817531CA5D
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 13:07:53 +0100 (CET)
Received: from localhost ([::1]:55658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBz8z-00069d-0q
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 07:07:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lBz7d-0004nr-7v; Tue, 16 Feb 2021 07:06:29 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:47817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lBz7a-0007iK-Kp; Tue, 16 Feb 2021 07:06:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=AyM3HgKOyGPwfKAnZ4p6FtWBSVYO4l1mJGMmCCM9kXw=; 
 b=nxD68yOLjX0ADQpgAoptUAq1UQrry6SAtyQAtLu7URg+xKEWUwsF8RB44ykUCZ2x2hCg/8Ki11CzN2d3Jb9E9/x7xaVNKaeXZHg0TNpFhPkfvCETqPUD2FiM9Kyq4snoPyDjW5CsjuTsRyva4rIiFC83IO4WsWqkWVtBOr8uSKeEzbuB6Ept4P0uAnKCQ+9huONOCEJNpKsARBKeD5lYTkVzhVyV5oMfpBjVbu6lo+YvJTZwAVG7HDC8LHU3iG/Jy9zCgSbukPOB8MUiG+dZMB7u91xucy7zdiSyqVjfSdVZrAy7XTd4DOBqiQ9WvAf+ENzk/9EXkriDqFCNEffkfA==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1lBz7B-0000bd-9N; Tue, 16 Feb 2021 13:06:01 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1lBz7A-0004F9-VV; Tue, 16 Feb 2021 13:06:00 +0100
From: Alberto Garcia <berto@igalia.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [RFC PATCH v2 1/4] block: Allow changing bs->file on reopen
In-Reply-To: <20210210165247.GH5144@merkur.fritz.box>
References: <cover.1612809837.git.berto@igalia.com>
 <670613fb7829ae2bf1329fca2e13bd51bd357024.1612809837.git.berto@igalia.com>
 <20210210165247.GH5144@merkur.fritz.box>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Tue, 16 Feb 2021 13:06:00 +0100
Message-ID: <w51pn102p5j.fsf@maestria.local.igalia.com>
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed 10 Feb 2021 05:52:47 PM CET, Kevin Wolf wrote:
>> +    /* The 'file' option only allows strings */
>> +    assert(qobject_type(value) == QTYPE_QSTRING);
>
> This is true, but not entirely obvious: The QAPI schema has
> BlockdevRef, which can be either a string or a dict. However, we're
> dealing with a flattened options dict here, so no more nested dicts.

You're right, I'll update the comment.

Berto

