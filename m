Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D751528136
	for <lists+qemu-devel@lfdr.de>; Thu, 23 May 2019 17:31:28 +0200 (CEST)
Received: from localhost ([127.0.0.1]:38923 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTpgm-0000lj-10
	for lists+qemu-devel@lfdr.de; Thu, 23 May 2019 11:31:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45737)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1hTpdS-00075t-Qt
	for qemu-devel@nongnu.org; Thu, 23 May 2019 11:28:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1hTpdO-00015i-W3
	for qemu-devel@nongnu.org; Thu, 23 May 2019 11:28:01 -0400
Received: from fanzine.igalia.com ([91.117.99.155]:60673)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <berto@igalia.com>)
	id 1hTpdM-0000un-Kq; Thu, 23 May 2019 11:27:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
	bh=j7fgk4JmVc7RqQsbm7DlGqg+EkYAmCeVCXq7NGvuvWs=; 
	b=aNN5jcuyzzrjynxPu1dDaiEA3EVvECYNWT9MT+JbhwoTt4bG5lHlGZgd16rP2zRS0+5G+FGbRz8Yck1qRQ6RgYJgn2VuLwfZ9SBAXfmMpd7ExwFVy8uHaZd8WWrzKHeI/OMb4e0RuINAvWJzABu0ymdGu3Uvze3Z7BSPSLFVDJ3xnm2MZa5ycHzzpERZVZoNDu91mqIqdZvDbyjKG7ksEhXZuUcIkGtxUCINUbD85kljtt7op0+Atm4k9ULhl9mZQyQfuyVcLq2Dk5SWzoQfFjOQzB77OrAvmpQ3dsb/uX+p/YAM9jPG/8Q4lk166qV273WmtF9+mhJ+TkpEUia5gg==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1hTpd3-0002I6-Au; Thu, 23 May 2019 17:27:37 +0200
Received: from berto by mail.igalia.com with local (Exim)
	id 1hTpd3-0000NO-80; Thu, 23 May 2019 17:27:37 +0200
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
In-Reply-To: <6d1d5feaa53aa1ab127adb73d605dc4503e3abd5.1557754872.git.berto@igalia.com>
References: <cover.1557754872.git.berto@igalia.com>
	<6d1d5feaa53aa1ab127adb73d605dc4503e3abd5.1557754872.git.berto@igalia.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
	(i586-pc-linux-gnu)
Date: Thu, 23 May 2019 17:27:37 +0200
Message-ID: <w51ftp51992.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic] [fuzzy]
X-Received-From: 91.117.99.155
Subject: Re: [Qemu-devel] [PATCH v3 1/2] block: Use bdrv_unref_child() for
 all children in bdrv_close()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
	Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon 13 May 2019 03:46:17 PM CEST, Alberto Garcia wrote:
> Now bdrv_close() unrefs all children (before this patch it was only
> bs->file and bs->backing). As a result, none of the callers of
> brvd_attach_child() should remove their reference to child_bs (because
> this function effectively steals that reference). This patch updates a
> couple of tests that where doing their own bdrv_unref().

s/that where doing/that were doing/

Max, if it's not too late can you fix that in your block branch?

Berto

