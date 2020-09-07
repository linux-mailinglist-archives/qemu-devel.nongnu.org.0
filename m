Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9482225F9FB
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Sep 2020 13:56:44 +0200 (CEST)
Received: from localhost ([::1]:60698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFFlL-0000NG-MN
	for lists+qemu-devel@lfdr.de; Mon, 07 Sep 2020 07:56:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kFFkd-0008Nz-Il
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 07:55:59 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:60845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kFFkb-00056F-PX
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 07:55:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=sy46r6N/qldJM0oiTrG3457funHCL0XsA6nfl3DcEjs=; b=VGFAVYYnp6fCx9X1KUuHsYeNvg
 pNuNPpexxH0lVw3ZSB/1lVwYXldeoqMQY807nxWNNzgSOwhbcAmJ5LOHnOTWqlS8bZL6sAxermlZE
 umoztamwFKJR/f5KZrLoV8gBbHaaYG6ghys+ISrGFv/iZWoWRP7npN84KrUxCRixy+AaZCvxQQNqj
 p+W4e+Vd/agEUqa9lsyQhG4hAr1OQejROWfB0qaYw7luHQRWq8Ij5EuN8TTXEwryKxBVpsU9Bfi2c
 2Tn2U3EKef5rbh+G8vuwFpDu8dXm2AaXxXft/f0kjLOz6+IeS1bxe3KAqmUfd7sIlM0h3bmsfdbSz
 vQiOFS2w==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] 9pfs: disable msize warning for synth driver
Date: Mon, 07 Sep 2020 13:55:52 +0200
Message-ID: <1773061.9aR6DczYlW@silver>
In-Reply-To: <20200907115758.70366924@bahia.lan>
References: <E1kEyDy-0006nN-5A@lizzy.crudebyte.com>
 <20200907115758.70366924@bahia.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=91.194.90.13; envelope-from=qemu_oss@crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/07 07:55:54
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Montag, 7. September 2020 11:57:58 CEST Greg Kurz wrote:
> On Sun, 6 Sep 2020 18:50:32 +0200
> 
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > Previous patch introduced a performance warning being logged on host
> > side if client connected with an 'msize' <= 8192. Disable this
> > performance warning for the synth driver to prevent that warning from
> > being printed whenever the 9pfs (qtest) test cases are running.
> > 
> > Introduce a new export flag V9FS_NO_PERF_WARN for that purpose, which
> > might also be used to disable such warnings from the CLI in future.
> > 
> > We could have also prevented the warning by simply raising P9_MAX_SIZE
> > in virtio-9p-test.c to any value larger than 8192, however in the
> > context of test cases it makes sense running for edge cases, which
> > includes the lowest 'msize' value supported by the server which is
> > 4096, hence we want to preserve an msize of 4096 for the test client.
> > 
> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > ---
> 
> Heh, yes I guess it makes sense :)
> 
> I guess you could maybe queue this patch before the other one.
> 
> Reviewed-by: Greg Kurz <groug@kaod.org>

Thanks!

BTW, have you ever tried dealing with patchwork client's 'state' feature for 
already transmited patches on the list (new, rejected, etc.)?

Not that there were many 9p patches for actually needing that; just curious if 
that's an LKML only feature.

Best regards,
Christian Schoenebeck



