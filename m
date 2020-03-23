Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A23FF18F500
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Mar 2020 13:49:04 +0100 (CET)
Received: from localhost ([::1]:33362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGMVr-0003HK-NS
	for lists+qemu-devel@lfdr.de; Mon, 23 Mar 2020 08:49:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53057)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1jGMV4-0002o0-9V
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 08:48:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1jGMV1-0000GM-W6
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 08:48:13 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:57855)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1jGMV1-00009r-B6; Mon, 23 Mar 2020 08:48:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=f5G/42BnNrmc+dXiG454G1SV3/oVCs40INx8Qnf8V+w=; 
 b=jQM3TS4TUjPGRlUjycRjH6XOdpkCwepacB4+fXeOisKSDoANwEJy0/U8Fbc6XdSk9XtDxOQ1COZ7ylW9MLkyF5SEyv06/+cmpLCT7g9EBtXSX40oCTiOhOraG+/O0xRSbF8fH6Yi7DtnxbRP1NWOurwXzo1p9ot9+zXiD9zqcd/7CWtatjsUAjm2257lZk5kvz5oBPjz3TYjTwb1huKwESK8jLZfc/9pv1CbXtZJxUj/8ifu9QIN4toSoHjaiVTuGBYcNipB+8StphuV6JQee+TsCo5hvfh0kxWQUE+rH+vFtnM2COc6O8VCCd0FmDgUKXwPkJmztgZRJznp91rEuw==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1jGMUi-00075r-JK; Mon, 23 Mar 2020 13:47:52 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1jGMUi-0003k6-9I; Mon, 23 Mar 2020 13:47:52 +0100
From: Alberto Garcia <berto@igalia.com>
To: Denis Plotnikov <dplotnikov@virtuozzo.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v8 3/4] qcow2: add zstd cluster compression
In-Reply-To: <2914bee8-50b9-2759-7dda-8f5fd39e5fa5@virtuozzo.com>
References: <20200321143431.19629-1-dplotnikov@virtuozzo.com>
 <20200321143431.19629-4-dplotnikov@virtuozzo.com>
 <a1830b65-bd38-c458-d382-1f3981355d2e@virtuozzo.com>
 <2914bee8-50b9-2759-7dda-8f5fd39e5fa5@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Mon, 23 Mar 2020 13:47:52 +0100
Message-ID: <w51369z8cg7.fsf@maestria.local.igalia.com>
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
Cc: kwolf@redhat.com, den@openvz.org, armbru@redhat.com, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon 23 Mar 2020 11:20:42 AM CET, Denis Plotnikov wrote:
>> But consider corrupted image: it may contain any data. And we should
>> not crash because of it. So, we should return error here.
> If the image is corrupted we can't continue anyway. If we return -EIO
> on this condition, we need to do some work investigating what has
> happened.

Cannot you just mark the image as corrupted and return -EIO ? I also
don't think that we should crash QEMU because of malformed input data.

Berto

