Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3AA5F1C0F
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 14:10:15 +0200 (CEST)
Received: from localhost ([::1]:60096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oebJu-0003QU-Cx
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 08:10:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oebIR-00023R-Dl
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 08:08:43 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:33949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oebIP-00026l-HH
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 08:08:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=UG0Kr4dvtJwliMo6l0xitIK677aQc3aTp0LPjjShFTI=; b=kOxYGj8Tj9+n2rvYM3/cLmLLSM
 8twylaQB1rzkKEMzyu96HdPU83ZVnBwxOAUm5yHWSNj9fNUwqKwNAs3EEtICW2CvMAWjheKUjjvHS
 q2+8JFrdOIbXQyh07KHlb/j2s7K8JxOexCc4+WwMDUnKWKWqsCzxODF6GmwA+17CAI7bM7yrLl/z8
 o0tWMbp0B/McYFUJyhqHerSW5sgW1keoBn+8WyhmBXURN9f5P5MQ1GfBn/aTkO/WPnwZiQaeigkuo
 yZ/pQTCTrmgSfQQOCMwNUSEhhpnFyLDg1f5apZ5JcEn0gtbB00GtEYNKzkSIrIlIXljR6+AqD8zr/
 C1sobKiujKnZSUnPcRDi452dR+CJ5klfrQRJfKt49pk2YcekhkbHoI3KNA4uSp3JHeKvDp15mDu7G
 FjVpPPdLrr8+IjoLBY4D2leLKFX2059bzF+EaqnxmQT6SmnoJvnkz4uv7VyA9LcKENVzhk7hkfNpi
 1cvTe7wom2wv+g2jnMCeHS05w8lPD0275OYXPtGZnGr/n43G71Kxz8YOHVzEh58vlVavC2xJj01+0
 p+oszOQlupu9GB0r8H+tkHy4Tqk9IeB3rZpBpnjC8EXBZBL4vwpOju3Vg/uH1RJyIpGpT9TTdzk7P
 rCZg6kIDYB6t/3JVp1lhZrwRIxzfUGXVxOmzgVEZI=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v2] tests/9p: split virtio-9p-test.c into tests and 9p
 client part
Date: Sat, 01 Oct 2022 14:08:38 +0200
Message-ID: <2066788.YC2TotVLx9@silver>
In-Reply-To: <E1odrya-0004Fv-97@lizzy.crudebyte.com>
References: <E1odrya-0004Fv-97@lizzy.crudebyte.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Donnerstag, 29. September 2022 13:41:06 CEST Christian Schoenebeck wrote:
> This patch is pure refactoring, it does not change behaviour.
> 
> virtio-9p-test.c grew to 1657 lines. Let's split this file up between
> actual 9p test cases vs. 9p test client, to make it easier to
> concentrate on the actual 9p tests.
> 
> Move the 9p test client code to a new unit virtio-9p-client.c, which
> are basically all functions and types prefixed with v9fs_* already.
> 
> Note that some client wrapper functions (do_*) are preserved in
> virtio-9p-test.c, simply because these wrapper functions are going to
> be wiped with subsequent patches anyway.
> 
> As the global QGuestAllocator variable is moved to virtio-9p-client.c,
> add a new function v9fs_set_allocator() to be used by virtio-9p-test.c
> instead of fiddling with a global variable across units and libraries.
> 
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> Reviewed-by: Greg Kurz <groug@kaod.org>
> ---

Queued on 9p.next:
https://github.com/cschoenebeck/qemu/commits/9p.next

Thanks!

Best regards,
Christian Schoenebeck

> 
> v1 -> v2:
>   - Move osdep.h include from virtio-9p-client.h to virtio-9p-client.c.
> 
>  tests/qtest/libqos/meson.build        |   1 +
>  tests/qtest/libqos/virtio-9p-client.c | 684 +++++++++++++++++++++++
>  tests/qtest/libqos/virtio-9p-client.h | 138 +++++
>  tests/qtest/virtio-9p-test.c          | 770 +-------------------------
>  4 files changed, 849 insertions(+), 744 deletions(-)
>  create mode 100644 tests/qtest/libqos/virtio-9p-client.c
>  create mode 100644 tests/qtest/libqos/virtio-9p-client.h




