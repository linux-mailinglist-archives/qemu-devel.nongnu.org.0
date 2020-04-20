Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2E01B095C
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Apr 2020 14:33:15 +0200 (CEST)
Received: from localhost ([::1]:34758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jQVbu-00006x-A0
	for lists+qemu-devel@lfdr.de; Mon, 20 Apr 2020 08:33:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48452 helo=eggs1p.gnu.org)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1jQVam-00083c-Dg
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 08:32:04 -0400
Received: from Debian-exim by eggs1p.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1jQVal-0007kh-Jn
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 08:32:04 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:41771)
 by eggs1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jQVak-0007Pb-MT; Mon, 20 Apr 2020 08:32:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=UtLFWyORKoMhxI6ICzeZz6YgLEbVykwxg0+1RBNg/Yk=; 
 b=IuiAoBiov3waEGpA1s3q+xedBZhP2eqqTY0wlADT6+p0rgCeMlsHEgrFskJigkWWmWEHpvyzJg2teytkzDQBskn864u4cJsy6tHTY+6O6kLZrtTXyrAc8mf/vVshbcTT7q7bJXWHP7QnQxPNLXkbM6EJ/2nC/B0ykdFmRF8OBWRb7LZM0SU+VQBJeztCkzfhedMjlHR4/H0dhzfvkGl8T4uBfDRdaL8QdNNzTqZssAKQmCgZyiNFjlSYzUaXKvXWALLL+qDujZGkhNgS1TjQFclFXHhs/U1h0XATyLOnqmDcgK8LzSc2uR9MJ1z2j6vhPyNZlHyB9GFnHtmPp5+lVQ==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1jQVaL-0007XG-SK; Mon, 20 Apr 2020 14:31:37 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1jQVaL-0003FO-J4; Mon, 20 Apr 2020 14:31:37 +0200
From: Alberto Garcia <berto@igalia.com>
To: Denis Plotnikov <dplotnikov@virtuozzo.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v19 1/4] qcow2: introduce compression type feature
In-Reply-To: <20200420091757.14102-2-dplotnikov@virtuozzo.com>
References: <20200420091757.14102-1-dplotnikov@virtuozzo.com>
 <20200420091757.14102-2-dplotnikov@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Mon, 20 Apr 2020 14:31:37 +0200
Message-ID: <w51blnmqqxi.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs1p.gnu.org: First seen = 2020/04/20
 08:31:39
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-block@nongnu.org,
 armbru@redhat.com, mreitz@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon 20 Apr 2020 11:17:54 AM CEST, Denis Plotnikov wrote:
> The patch adds some preparation parts for incompatible compression type
> feature to qcow2 allowing the use different compression methods for
> image clusters (de)compressing.
>
> It is implied that the compression type is set on the image creation and
> can be changed only later by image conversion, thus compression type
> defines the only compression algorithm used for the image, and thus,
> for all image clusters.
>
> The goal of the feature is to add support of other compression methods
> to qcow2. For example, ZSTD which is more effective on compression than ZLIB.
>
> The default compression is ZLIB. Images created with ZLIB compression type
> are backward compatible with older qemu versions.
>
> Adding of the compression type breaks a number of tests because now the
> compression type is reported on image creation and there are some changes
> in the qcow2 header in size and offsets.
>
> The tests are fixed in the following ways:
>     * filter out compression_type for many tests
>     * fix header size, feature table size and backing file offset
>       affected tests: 031, 036, 061, 080
>       header_size +=8: 1 byte compression type
>                        7 bytes padding
>       feature_table += 48: incompatible feature compression type
>       backing_file_offset += 56 (8 + 48 -> header_change + feature_table_change)
>     * add "compression type" for test output matching when it isn't filtered
>       affected tests: 049, 060, 061, 065, 144, 182, 242, 255
>
> Signed-off-by: Denis Plotnikov <dplotnikov@virtuozzo.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> QAPI part:
> Acked-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

