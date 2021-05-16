Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4460382021
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 19:09:16 +0200 (CEST)
Received: from localhost ([::1]:41480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liKGS-0005m1-1E
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 13:09:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1liKE9-00042i-Uu
 for qemu-devel@nongnu.org; Sun, 16 May 2021 13:06:53 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:56907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1liKE7-0006P0-8K
 for qemu-devel@nongnu.org; Sun, 16 May 2021 13:06:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:References:In-Reply-To:
 Content-ID:Content-Description;
 bh=675E+744/19V8vcoo45WgSTjhHk+fh2j/+jWIRItxWw=; b=Itp0eGW52clvkHr04mhFzVSbAQ
 YYWPrZs2kNzCAyKuFYzXK0TPO9pzTWZMGWA4jZkyYR25477Ru/M1AJTYrpIqSRgi4zFp7gYXIkLrz
 jExxVO0iJEn/KTOWEl7TdAJmF90SxSSfZbnwaC5NAFQFtL++9eWlj1VXA4vefWwynoExwOJjcrkoU
 AeEHGLGC2Bv5mmrNkpoOAZwfECY1vNBn6IFaSBcc9WKOANm0PPE2/1gbBEboPcCX5MHWQ6bjUmmXA
 xP/i7yE0Y/ULiQr3ICGPYD+xWzvj0aqDXG0k7Wl/R7P2L4kHwCnPs7lHwUY2Tm8cmkz0vugVZBfdf
 woiJ8FWI+tFEDVwbKqbWZXmkqzgL+VRH1HHI7ozx9sjV2kEV8kpRYCr8UiPj91A6H1LpbscXXrvJW
 m5o21dW2Qi2pAzWlAS5aNZkuHArOUq4mMNEctlWzK4x1gvIfpDCM8mpUC2tRoIBWnek8KEXrMsC2q
 OOxWC6rtrCpjfbS0jSaQkkQmoqV9aE78JkE9DZbxOllL+sAOd3GRTOR8EHVeHjayM2s6nJlYeS7HZ
 INo0fl1Qzz//PFu727BziedjEglVKlr46PwSNIpjAssDX4ce089iaeUz9LALTesdkjAwRH4NDa6NN
 Aqcp7zW6yFEllGJKJRCVi9C7Oh7fA0nXhyA3r/20o=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Subject: 9pfs: scope of rename_lock?
Date: Sun, 16 May 2021 19:06:44 +0200
Message-ID: <3386244.1hTsTelUFx@silver>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_05=-0.5, DKIM_SIGNED=0.1,
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

Hi Greg,

while reviewing the 9p code base for further optimizations, I stumbled over 
the 'rename_lock' introduced by 02cb7f3a2 and wondered about what exactly it 
shall protect?

As far as I understand it, the original intention at introduction 
(aforementioned 02cb7f3a2) was to protect

	1. fidp->path variable

	and

	2.  *ANY* filesystem path from being renamed during the *entire* duration
	    of some concurrent 9p operation.

So because of (2.) it was introduced as a global lock. But (2.) is a dead end 
approach anyway, isn't it?

Therefore my question: rename_lock is currently a global lock. Wouldn't it 
make more sense to transform it from a global lock from struct V9fsState -> 
struct V9fsFidState and just let it protect that fidp->path variable locally 
there?

Best regards,
Christian Schoenebeck



