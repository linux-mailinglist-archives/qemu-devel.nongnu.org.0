Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D156294161
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Oct 2020 19:25:12 +0200 (CEST)
Received: from localhost ([::1]:43898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUvNn-0005gI-B3
	for lists+qemu-devel@lfdr.de; Tue, 20 Oct 2020 13:25:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kUvM9-0004q7-Bp
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 13:23:29 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:49831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kUvM3-0007nR-RQ
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 13:23:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=S+ebZGtgrrOwDHlh6T3LuJRyiAPnJhthGnnkXfUVyHU=; b=D+OuPAeW082oVqZ5yMDasPfPkD
 Ljj4hiXRRTXeTPNju6oMRm8uS73Keqc0JDK53Y0NWC9iAgUgck15Nz6xDVLUgctt+59Q8qGq7VIKB
 u3rdSnUVnT+rXN7xbsyGGiYcK8F3weNMbyzPxrj80KvvsmbeOFc2xAuTG7oyyMAuumGHuedNgwff1
 EwC20KL+REnc3Lu9I7okBE55RCnbj9tKt/o1jiJxvc+UTYngpBJuxtVokT7nTLMAebpEiBDnHFHlJ
 3UOX9WLMsZypKMp1Jf/BcMbvZfAoseK+p6ZfTzDfSKQUQ0SrkTQu+ahUto13Ck2ZCrcGurOgO15n6
 U6UN2UwA==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v2 0/5] tests/9pfs: Code refactoring
Date: Tue, 20 Oct 2020 19:23:19 +0200
Message-ID: <2043652.ohusmZrI9R@silver>
In-Reply-To: <160320977352.266767.5622969302437522296.stgit@bahia.lan>
References: <160320977352.266767.5622969302437522296.stgit@bahia.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=91.194.90.13; envelope-from=qemu_oss@crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 07:54:35
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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

On Dienstag, 20. Oktober 2020 18:09:07 CEST Greg Kurz wrote:
> Some code refactoring to have a clear distinction between top level
> test functions and helper functions.
> 
> v2: - use "do_" prefix instead of "do_fs_"
> 
> ---
> 
> Greg Kurz (5):
>       tests/9pfs: Factor out do_version() helper
>       tests/9pfs: Turn fs_readdir_split() into a helper
>       tests/9pfs: Set alloc in fs_create_dir()
>       tests/9pfs: Factor out do_attach() helper
>       tests/9pfs: Turn fs_mkdir() into a helper
> 
> 
>  tests/qtest/virtio-9p-test.c |   62
> +++++++++++++++++++++++------------------- 1 file changed, 34
> insertions(+), 28 deletions(-)
> 
> --
> Greg

Queued on 9p.next:
https://github.com/cschoenebeck/qemu/commits/9p.next

I just tweaked the order of the patches to prevent intermediate compiler 
errors.

Thanks!

Best regards,
Christian Schoenebeck



