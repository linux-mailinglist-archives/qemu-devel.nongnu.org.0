Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E14DF1B617F
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Apr 2020 19:01:43 +0200 (CEST)
Received: from localhost ([::1]:45952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRe51-0004lZ-R9
	for lists+qemu-devel@lfdr.de; Thu, 23 Apr 2020 11:47:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57342)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1jRe32-0002vR-Mx
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 11:45:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1jRe31-0006qS-ST
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 11:45:56 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:40917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jRe30-0006bN-WD; Thu, 23 Apr 2020 11:45:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=ThxkYpu0m025sAoAV+c74k1GqC7O9yRA28t0Rb56NTQ=; 
 b=Wf+CkQgFaH9amzvgmBQz/BXB/vnZrejnE1UQSZ6tZ2tKMdWtOEI8dMhRQU5t1P4e2cbXnkq61Ru8sLIMQhPVuab8Gq8tbIq1mv6YBrP+R539lCXO0uN5rUnXaf9O0lQvDBIt6IfqqG+3Uwh920Wt/NVjAW2UolIf0ZQAs8ddKmbhyAIT2vskmCZayY6xGUPChIusmt4ll0GFQtocBtlK+xiSerAIrAkVX0Xglb/sSMetWACylh/lQXnkfvmq52a3LGidqSjJpb0Rlk57eMdXrpzMAewuZ+icCuNZJXsZHOwlJKI2RwEmboeIDaeQWyxuoWq54U0ONa7SlBWc51AalA==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1jRe2v-00087I-4K; Thu, 23 Apr 2020 17:45:49 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1jRe2u-0005tH-RF; Thu, 23 Apr 2020 17:45:48 +0200
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v4 21/30] qcow2: Add subcluster support to
 check_refcounts_l2()
In-Reply-To: <9972aadc-dcc8-9fce-019b-e23d2b7dcad8@virtuozzo.com>
References: <cover.1584468723.git.berto@igalia.com>
 <ef2a1699095c04e954665aba591dd055c3bddb63.1584468723.git.berto@igalia.com>
 <9972aadc-dcc8-9fce-019b-e23d2b7dcad8@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Thu, 23 Apr 2020 17:45:48 +0200
Message-ID: <w51y2qm5hoz.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/23 10:18:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic] [fuzzy]
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
Cc: Kevin Wolf <kwolf@redhat.com>, Anton Nefedov <anton.nefedov@virtuozzo.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 "Denis V . Lunev" <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed 22 Apr 2020 02:06:56 PM CEST, Vladimir Sementsov-Ogievskiy wrote:
> 17.03.2020 21:16, Alberto Garcia wrote:
>> Setting the QCOW_OFLAG_ZERO bit of the L2 entry is forbidden if an
>> image has subclusters. Instead, the individual 'all zeroes' bits must
>> be used.
>> 
>> Signed-off-by: Alberto Garcia <berto@igalia.com>
>> Reviewed-by: Max Reitz <mreitz@redhat.com>
>
> Patch itself seems correct.. Still, would be good also to check, is
> QCOW_OFLAG_ZERO set in subclustres case and add corresponding
> corruptions++, and may be even fix (by using
> QCOW_L2_BITMAP_ALL_ZEROES instead)

I'll add it to my TODO list for a later patch.

Berto

