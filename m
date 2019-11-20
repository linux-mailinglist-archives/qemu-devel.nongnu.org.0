Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E191040EA
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Nov 2019 17:37:04 +0100 (CET)
Received: from localhost ([::1]:60402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXSyV-0002Xz-Dl
	for lists+qemu-devel@lfdr.de; Wed, 20 Nov 2019 11:37:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46309)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1iXSxO-0001U1-8u
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 11:35:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1iXSxN-0006uX-6D
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 11:35:54 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:46447)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1iXSxM-0006sI-Tu; Wed, 20 Nov 2019 11:35:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=FjpFyz/1m/BQa2ilBqcsi3LvqIrEnJ1BpgCl33xzDFU=; 
 b=nrNANougn6lhA0S8/agc5G67P6/oH/Q8gVYsVy1+3+XOeZ0ckbAI3JlOqU9LrsoXSwvucae+YywiCVNpQgxzNvQOlXwSPXL4FmRmihG9dF+ikRimjID6PoZFMphI7sdN30STlWlAC7gmacgaAOJRjnuZ1BQdfcsuG8VGr/QS3mzpWs1932cDs11PI9YYRADbAkFWMkezrfG1krEzlGvq59eL2i9PCHglptFfvVJOSdqIs24hfMPqPNymBxDNsZ62hBFN4tov+rzRpEcnSSScJP4P26o+UXV5txcxMK52ZScgCbjFrOo160YXccY7pGsg+RZTWcSmBonLu5+s0okz9A==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1iXSxK-0003AR-3H; Wed, 20 Nov 2019 17:35:50 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1iXSxK-0006Ns-0M; Wed, 20 Nov 2019 17:35:50 +0100
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "qemu-devel\@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: qcow2 preallocation and backing files
In-Reply-To: <5b57fb5b-4480-2b39-9c60-bbd63f13f1cb@virtuozzo.com>
References: <20191120120625.GA25497@igalia.com>
 <a1575e90-3fe4-e843-518c-714db4b621bc@virtuozzo.com>
 <w517e3u8tks.fsf@maestria.local.igalia.com>
 <5b57fb5b-4480-2b39-9c60-bbd63f13f1cb@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Wed, 20 Nov 2019 17:35:49 +0100
Message-ID: <w51zhgq7bfe.fsf@maestria.local.igalia.com>
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

On Wed 20 Nov 2019 04:58:38 PM CET, Vladimir Sementsov-Ogievskiy wrote:
>> But then PREALLOC_MODE_OFF implies that the L2 metadata should be
>> preallocated (all clusters should be QCOW2_CLUSTER_ZERO_PLAIN), at
>> least when there is a backing file.
>
> Kevin proposed a fix that alters PREALLOC_MODE_OFF behavior if there
> is a backing file, to allocate L2 metadata with ZERO clusters..

Right, I just saw :)

Berto

