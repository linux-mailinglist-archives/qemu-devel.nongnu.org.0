Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 832C51B2461
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Apr 2020 12:51:51 +0200 (CEST)
Received: from localhost ([::1]:55630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jQqVK-0002mV-34
	for lists+qemu-devel@lfdr.de; Tue, 21 Apr 2020 06:51:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48116)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1jQqTz-0001yL-5y
 for qemu-devel@nongnu.org; Tue, 21 Apr 2020 06:50:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1jQqTy-0005dm-HH
 for qemu-devel@nongnu.org; Tue, 21 Apr 2020 06:50:26 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:38923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jQqTv-0005Ug-OF; Tue, 21 Apr 2020 06:50:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=/XBj2ERbCA3wEWvpzBXjprmAoIXTR8B9G0muKlXdN4w=; 
 b=kTK+01z8gG1OZF3sJMBIaKBf2V/HfATbpb/5CwLw8amEVuzrWXZjhjIhi6VnJNQQPQA5zVvEUxAPKM5oluT59/bgPqiK7BkvVJslyB3jmDUlwWooCyqRCVPn5xhhZohC1vmP8zc8M8SvQTFtQu780ks71HEbsEkWrAsaOupQwgEtqbifR0rjiFIgOsOIJyEMo1DowRkZXJONRdO+AqTK1yR1AYJtPXd/ahDHviYTUQwpHWsjSZezvYUXpQyz0WYXz0t6FfBxjK5TXIJtw8YxoAnV2Fk24ZjhA8lPr3EYy8jCiehI/7AAsvHRT6aakBe0ISvnnCZ+Z0DhKmNwhweJoQ==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1jQqTo-0002k5-Rj; Tue, 21 Apr 2020 12:50:16 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1jQqTo-00036k-Hx; Tue, 21 Apr 2020 12:50:16 +0200
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Subject: Re: [PATCH v4 4/9] qcow2: Support BDRV_REQ_ZERO_WRITE for truncate
In-Reply-To: <59085a98-338c-fb6c-db2b-0636a03d3190@virtuozzo.com>
References: <20200420133214.28921-1-kwolf@redhat.com>
 <20200420133214.28921-5-kwolf@redhat.com>
 <59085a98-338c-fb6c-db2b-0636a03d3190@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Tue, 21 Apr 2020 12:50:16 +0200
Message-ID: <w51wo699kpj.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/21 06:35:55
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
Cc: qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue 21 Apr 2020 10:47:17 AM CEST, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> wrote:
>> +    if ((flags & BDRV_REQ_ZERO_WRITE) && offset > old_length) {
>> +        ret = qcow2_cluster_zeroize(bs, old_length, offset - old_length, 0);
>
> Hmm. As I understand, qcow2_cluster_zeroize is unprepared to
> cluster-unaligned offset/size. I think we should handle it somehow.

You're right, it actually hits an assertion :-/

I suppose you can simply round the size up to the next cluster.

Berto

