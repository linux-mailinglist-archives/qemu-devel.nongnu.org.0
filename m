Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B833EEE24
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 16:08:33 +0200 (CEST)
Received: from localhost ([::1]:41746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFzlX-0005V3-Vd
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 10:08:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <b51670d2a39399535a035f6bc77c3cbeed85edae@lizzy.crudebyte.com>)
 id 1mFzip-0000ns-Uk
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 10:05:45 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:51329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <b51670d2a39399535a035f6bc77c3cbeed85edae@lizzy.crudebyte.com>)
 id 1mFzin-0006WE-LU
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 10:05:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Content-ID:
 Content-Description; bh=psZ9sNtbH1drUl2ct/UhvoIYIT9BX2QMci6kFt+Ljzo=; b=OkSwI
 fCTybCM+AMzcsLwE8PEjvXbuj5Si4I6qJ/X4R+jwLEcqstymqq9/LSJBIS+acABIm3CNv5+AK5+v+
 eop/2FK5Q5sXUwcUDRACVtSadTl6fnWsrJnzhU5g8YZF0SfHNd/ev3TZgYEH9uTErM3CWI+MlEGN6
 uMqtUr0A0RlSno++PBeRjH8AcLyg+aoPhFkFbUJ3nbxHwvLUe8d+7mae4clFVxqToWki51RT5ysxj
 u6Sk5qpZN5CxHVx9fVBaxnI37uVoDv/7D4AHCCALNAtm93skML/If4VL174VacYG9A4XOO5HgzXF4
 JlWkDId80xknliwuxF43DtbAYeE3Q==;
Message-Id: <cover.1629208359.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Tue, 17 Aug 2021 15:52:39 +0200
Subject: [PATCH 0/2] 9pfs: v9fs_walk() cleanup
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=b51670d2a39399535a035f6bc77c3cbeed85edae@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Few cleanup patches for function v9fs_walk() as discussed last month.

In patch 2 array variables 'wnames' and 'pathes' are omitted because they
contain dynamically allocated memory per array element which need to be
freed individually before freeing the array.

Christian Schoenebeck (2):
  hw/9pfs: avoid 'path' copy in v9fs_walk()
  hw/9pfs: use g_autofree in v9fs_walk() where possible

 hw/9pfs/9p.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

-- 
2.20.1


