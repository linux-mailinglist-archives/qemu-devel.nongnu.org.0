Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC6D5A154
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jun 2019 18:49:03 +0200 (CEST)
Received: from localhost ([::1]:34272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hgu3Y-0007ea-H9
	for lists+qemu-devel@lfdr.de; Fri, 28 Jun 2019 12:49:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41653)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <berto@igalia.com>) id 1hgtnr-00062U-LV
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 12:32:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1hgtnq-0002Y0-Qy
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 12:32:47 -0400
Received: from fanzine.igalia.com ([91.117.99.155]:55999)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1hgtno-0002WC-Td; Fri, 28 Jun 2019 12:32:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=KiGIPx2JKpdzT3+Cza5Y3B1fkVeje5SHizisy1oipqM=; 
 b=KCAgDbPn1OhmhQ1b4DoeJK3Gu03kZFOgxW3YFDk0eEj8uKTGhM93e4mZ1XyQMScSorBeocEsyhgExAi81bOxhmEGJwyWGhJ0uvCFAkNZ4t5x3D0LmVqKL0/qL6Qjd+bbZ0tsrmkDqw8zZFFfw/faP7aFiMAzu/Y0v77jaf2AsHMq8J7v3CQSqseib7zMxdCNuS0Zs1o0qPSVeNEoXTzztO+VOhFV0lv+uY6aqBiZ5zl9qFx4TdNTo3cmYvNuM5hie2dIbmcRj+y5Eo9ocU2aGdFKbPcY1bT1miqQ92zIH6Q4APav1dUVAe6uoRAf8/q5MZPFk849tHYVd8fUpFWP/g==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1hgtnm-0006lV-7d; Fri, 28 Jun 2019 18:32:42 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1hgtnm-0005Gi-4j; Fri, 28 Jun 2019 18:32:42 +0200
From: Alberto Garcia <berto@igalia.com>
To: Denis Lunev <den@virtuozzo.com>, Kevin Wolf <kwolf@redhat.com>
In-Reply-To: <8ac8776c-f1d7-14eb-1a22-3db12fde7aef@virtuozzo.com>
References: <20190627135914.xlzohrdwr6mz2aq3@perseus.local>
 <20190627165434.GE5618@localhost.localdomain>
 <8ac8776c-f1d7-14eb-1a22-3db12fde7aef@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Fri, 28 Jun 2019 18:32:42 +0200
Message-ID: <w51k1d5k6vp.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic] [fuzzy]
X-Received-From: 91.117.99.155
Subject: Re: [Qemu-devel] [RFC] Re-evaluating subcluster allocation for
 qcow2 images
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
Cc: Anton Nefedov <anton.nefedov@virtuozzo.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu 27 Jun 2019 07:08:29 PM CEST, Denis Lunev wrote:
> But can we get a link to the repo with actual version of patches.

It's not in a state that can be published at the moment, but I'll try to
have something available soon.

Berto

