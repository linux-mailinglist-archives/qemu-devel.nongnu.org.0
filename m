Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B676105344
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Nov 2019 14:38:22 +0100 (CET)
Received: from localhost ([::1]:40500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXmf7-0000tl-DO
	for lists+qemu-devel@lfdr.de; Thu, 21 Nov 2019 08:38:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59487)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1iXmcF-0005yw-T0
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 08:35:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1iXmcE-0007HV-Tl
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 08:35:23 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:40605)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1iXmcC-0007Ex-NY; Thu, 21 Nov 2019 08:35:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=TAKuBdfQoWM1eG95nxpjrkTNCasvZIAamFu1R4drsmE=; 
 b=eaxPLhr3B2PNUiVByXmLdjE4eKwDdYEaumEoxIUADvpIM7mMl7aPl1nA7vUbhhyJfwIFrkC1HQAIThV5OKIIL/lpXiGoAJGq6mOD7uTN84JxPfXLrzOikIHfVnDyRPd9wQOHcB1qbkQXxoEBDwICSdbVTO8nWoXPGhreA04bGUXhCdDukxpn9rvDjobmoV+ALyNGu+GK5IH0GnDhC9loUd6QczSQEOvYlxtbZCLzBDwX9jfmAMvbr54ceKr1V3fnEmUuq/MxNI2tcYF1NIc1sfA4zbKSeeDFklZvS2qTtbD/e2cmUxWF2Lj+LIgrCwk31+tMf5lbATTc8j7EF3/Fbw==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1iXmcB-0001Jw-Ew; Thu, 21 Nov 2019 14:35:19 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1iXmcB-0003Iz-Bw; Thu, 21 Nov 2019 14:35:19 +0100
From: Alberto Garcia <berto@igalia.com>
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Subject: Re: [PATCH v2 5/6] iotests: Support job-complete in run_job()
In-Reply-To: <20191120184501.28159-6-kwolf@redhat.com>
References: <20191120184501.28159-1-kwolf@redhat.com>
 <20191120184501.28159-6-kwolf@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Thu, 21 Nov 2019 14:35:19 +0100
Message-ID: <w51v9rd4ajs.fsf@maestria.local.igalia.com>
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 stefanha@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed 20 Nov 2019 07:45:00 PM CET, Kevin Wolf wrote:
> Automatically complete jobs that have a 'ready' state and need an
> explicit job-complete. Without this, run_job() would hang for such
> jobs.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

