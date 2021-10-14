Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA1342D8D8
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 14:07:00 +0200 (CEST)
Received: from localhost ([::1]:40038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mazVj-0002kt-Le
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 08:06:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mazMu-0001oa-WC
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 07:57:53 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:55309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mazMt-0006Zf-58
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 07:57:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=+xSOAYN/HHTrVG8VxfQJpPZzBlWd9ZMwcaYillQCYbE=; b=ufhsrFtPXmp0UKHphAGWGl5LNP
 4sXpytVoBpS3DP5risCw3VyMGOD9F0vTn9tUWXx9nsg+YF6LUkhGxH7zniOkJLyxh8Lm83jHl3poa
 6KCh/ssPws27mtiUyzCQWlGuF1cQGrO5kX+knFfK4e/BMnC887wY4m3XprrPhVk2BUCmtrDmNRBO4
 26KuVjeOUR+LudphCBG/jTXqTv80z1ah94MlTvYSXcFpNt5Ib2VITcOCKAX2ZykrUCELIRuWBFUuB
 NLBxttNfv/naB8BL88FbuzVzdJkzdJg/VUDFY/0yM4cH3mC4ez2Uj07O/1Rt07Dh2LbHPkfPwJO14
 d9wfeV4/krBet9hL7RkYXQpky+mY9k0z50K3IvSRb74K3cMXZvoisTF5f+bDSmjBjglAOcZQOubEd
 WPqVyU/j+6BHYx1xIyRmw8sI7Vawt8bH/i+WOtBAsvEuiYnDX0Yvb+JN2p61Twnj/ElUx3GgIhEMW
 yVzXvKuI+chxr68kCwGEx/6iApkoRee7QJrvdrFAjN6vV3unisq7S4C9uRTCmhn/GKRpkmqCGwAhN
 6oLXI70u57K+pUj00wQWPOtDQStHi94RrRidHPJIix/V6vbF0SLSDcBdDluN/v7o/lLnAzM87Um3H
 Kzv9D1F2wvjDf+oJVFabyPKl5Guc4gA5CNAkt3RPQ=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Will Cohen <wwcohen@gmail.com>, Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 00/11] 9p: Add support for Darwin
Date: Thu, 14 Oct 2021 13:57:46 +0200
Message-ID: <7858538.Xg4lN0sot7@silver>
In-Reply-To: <CAB26zV1pHqEChqUd6UXMhGyhZbtHOo3DM=v_S0Vc3496xF4byg@mail.gmail.com>
References: <20211013230405.32170-1-wwcohen@gmail.com>
 <20211014090359.0c0f7b4f@bahia.huguette>
 <CAB26zV1pHqEChqUd6UXMhGyhZbtHOo3DM=v_S0Vc3496xF4byg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
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

On Donnerstag, 14. Oktober 2021 12:48:55 CEST Will Cohen wrote:
> Many thanks for all the clarifications =E2=80=94 it=E2=80=99s my first ti=
me using
> git-send-email and first time with mailing-list-based devel workflows. Wi=
ll
> adjust accordingly, work through gitlab, and eventually resend via
> git-publish as v2.

So the intended use case is macOS being host.

Has this been tested, and if yes, using which 9p client and which macOS=20
version?

Best regards,
Christian Schoenebeck



