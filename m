Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF704A7271
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 14:58:58 +0100 (CET)
Received: from localhost ([::1]:56600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFG9x-0007Om-M4
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 08:58:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nFFjI-0003Ct-SQ
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 08:31:26 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:60501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nFFjG-0007pD-0a
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 08:31:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=S5kyPzh1DQSBm7t4Uu8F6Ru/ZercJfFBLo4eZhTBQkg=; b=NboRnrqABjpi+pAiPMwFzlZ6sl
 3QmbFmBo2nVIb2RPOHLBCf1J5VvibeMJG2RzBpHTd0QyUz5cww5U7NF0WrLbunib5TmR7RzDag+2W
 PhkKU05zl5ltG9wlwotAw+5CwtDxRNmgU51Naqy+67zX0bD4Irl5qcSk4XuiS1TjawAbWcgNWZ1Ls
 cQshaf2Gk6SWxpBmZXuAW1fgJ+JVrWMbNN+Q76GeDm0ckkWJ2BP+GDZvukKVlMR/xNuxyNHB1mWPI
 ArZCnp3RaQfuEZgzDhf9liBmjLEpRtoZMu+9ZOlu+ALF4xQB6Z/wZWLU9/C66l6iswyCx9sjBHfvV
 Q+axzlfTnM0LUBzvinGlTD4OxCQ6laZ9tNPDCQ/3lPbqk6tXwMWcb7jocIXDcdUedXlUEwcZ9smcE
 c4rOXriSM0dBSDL89GFen9SBckLOlBfU4+qHxSWw4Ntkw/FyPCJqPM6RzwKyYMeoUUX4ty4HYJCN4
 hfRIDmLRxt4/Rn9JjnJ1VtM8vb57vKqH/JdY1rrgUm05w02QXB4RLsmtzYhF47jNsn4GBHeJwLYB0
 Efx062c5yA6MLgYKvQynGd+ONlleChHOgXprfZfQAka4AieLuVNfWIQiq2UMLQQm5JxNsPFLV24KC
 GaxLKE4hnNqJ5FrhBunswjJePOwlRuOS/fV0fIlCU=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v3 0/2] tests/9pfs: Fix leak and add some more g_auto*
 annotations
Date: Wed, 02 Feb 2022 14:31:08 +0100
Message-ID: <27398562.sBfFiq9GLZ@silver>
In-Reply-To: <20220201151508.190035-1-groug@kaod.org>
References: <20220201151508.190035-1-groug@kaod.org>
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
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Dienstag, 1. Februar 2022 16:15:06 CET Greg Kurz wrote:
> This is the continuation of:
> 
> https://lore.kernel.org/qemu-devel/20220201111137.732325b4@bahia/T/#t
> 
> v3: - fix leak in its own patch
> 
> Greg Kurz (2):
>   tests/9pfs: Fix leak of local_test_path
>   tests/9pfs: Use g_autofree and g_autoptr where possible
> 
>  tests/qtest/libqos/virtio-9p.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
> 
> -- 
> 2.34.1
> 

Queued on 9p.next:
https://github.com/cschoenebeck/qemu/commits/9p.next

Thanks!

Best regards,
Christian Schoenebeck



