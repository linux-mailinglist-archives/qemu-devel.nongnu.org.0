Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D70693F2E22
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 16:33:23 +0200 (CEST)
Received: from localhost ([::1]:38172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH5a9-0002rt-KQ
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 10:33:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mH5Xb-0008RA-3I
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 10:30:39 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:37163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mH5XZ-00055T-5n
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 10:30:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=u+w6oY9M7+MmxO/bm1hE2D+CbSaexaXAgK7+BBEe5vM=; b=qXlSxdZh327F2xqeAGHVHNbiBJ
 HHDi2mbBcgjd2h+CQUxS+feCeWdSiS3n9Hvsj5G3swmkZWyEMpNtYGJeipb+zvE+Xd7sci05tS+4h
 gpSK4Y06TPRRBtTP6ClRGSuXeZcYgFPff073Z7bWspGpEOnXJcl5hMlayCn0rlhnEY8Sn+4Aja86B
 xqphWz5IqfZaI7O+r/MIwJ68PCTTBipOKBDY4zUpcBEO6gPlLufAyd1sKWyULzAzFSCbet313W13a
 6rYEBuju2qAWypSwlSc+k7/8YztI5aSPPugr//lQTOMO8fGlB2yeqBacK3ghcS15+V70cizjPY1aB
 SzUbCvolUzKLvX9VZTsvEy25QJgCmSixtV91me1FX8/2nAl4toRdOAbwwQs6IwvILwZd6Iu+n16hy
 qK/Oap2ri27mhJQotSS4OIG6LHWoVgyao2dl8pcrXE3vUXYHtjT3px3vQwODgLeoMFQCrrzJGGoxW
 0c2z5cFqEY8dYePHuyUHVO6vh3XtW6rg+wsi97cMl6wjRm+F/tio2xuy8z7850lffr7CPbkScA50E
 CIPCvGzS1sdeUM/1PVG30UBIkGx32x4c6lq13nPaD70u7KQ/qawus5W5KVcC8Jv+/mWYJg3w39IBi
 wUnxmb+T6P5+vPlXnr5PCQmSa+siocIHui7sWASMY=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 0/2] 9pfs: v9fs_walk() cleanup
Date: Fri, 20 Aug 2021 16:30:33 +0200
Message-ID: <2485678.SSUqDfrsUB@silver>
In-Reply-To: <cover.1629208359.git.qemu_oss@crudebyte.com>
References: <cover.1629208359.git.qemu_oss@crudebyte.com>
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

On Dienstag, 17. August 2021 15:52:39 CEST Christian Schoenebeck wrote:
> Few cleanup patches for function v9fs_walk() as discussed last month.
> 
> In patch 2 array variables 'wnames' and 'pathes' are omitted because they
> contain dynamically allocated memory per array element which need to be
> freed individually before freeing the array.
> 
> Christian Schoenebeck (2):
>   hw/9pfs: avoid 'path' copy in v9fs_walk()
>   hw/9pfs: use g_autofree in v9fs_walk() where possible
> 
>  hw/9pfs/9p.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)

Queued on 9p.next:
https://github.com/cschoenebeck/qemu/commits/9p.next

Thanks!

Best regards,
Christian Schoenebeck



