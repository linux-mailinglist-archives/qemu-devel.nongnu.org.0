Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D8A261046
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Sep 2020 12:52:15 +0200 (CEST)
Received: from localhost ([::1]:52478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFbEU-00023k-Nf
	for lists+qemu-devel@lfdr.de; Tue, 08 Sep 2020 06:52:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kFbDb-0001QN-Mn
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 06:51:19 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:31197
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kFbDZ-0003i5-OB
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 06:51:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599562276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QqMpAgav1bVUUr3YPLbf1QYlUXgPtpd8u+D/Xi9KOgg=;
 b=Nsjn4X4roCodRblPYqrk9XO29widIWuBKLk/0Kz3R6Etvh/jg7FKXzSqq7RTLk31+TJgKw
 idEvHTDC6TlN4PxNEnoWsc10T3nP8Q1JK8XKTn/Kt7XDbmjF47GMH/Rwlcxg62GlFAVvQN
 OOpegq95kwt629H4EPAE20NZGvLpyBU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-ivGPmimnPTm8GJYWleAU8Q-1; Tue, 08 Sep 2020 06:51:14 -0400
X-MC-Unique: ivGPmimnPTm8GJYWleAU8Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38F008030CD;
 Tue,  8 Sep 2020 10:51:13 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.171])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C80B7D8AE;
 Tue,  8 Sep 2020 10:51:11 +0000 (UTC)
Date: Tue, 8 Sep 2020 12:51:07 +0200
From: Andrew Jones <drjones@redhat.com>
To: Haibo Xu <haibo.xu@linaro.org>
Subject: Re: [PATCH v2 03/12] target/arm/cpu: spe: Add an option to turn
 on/off vSPE support
Message-ID: <20200908105107.igoc6ld7eoyu67qi@kamzik.brq.redhat.com>
References: <cover.1599549462.git.haibo.xu@linaro.org>
 <77b57f43d4fa6319cfa666d6c77e39ec76c44d88.1599549462.git.haibo.xu@linaro.org>
MIME-Version: 1.0
In-Reply-To: <77b57f43d4fa6319cfa666d6c77e39ec76c44d88.1599549462.git.haibo.xu@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 01:08:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: philmd@redhat.com, qemu-arm@nongnu.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 08, 2020 at 08:13:21AM +0000, Haibo Xu wrote:
> Adds a spe=[on/off] option to enable/disable vSPE support in
> guest vCPU.
> 
> Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
> ---
>  target/arm/cpu.c   |  6 ++++++
>  target/arm/cpu.h   | 13 ++++++++++++
>  target/arm/cpu64.c | 52 ++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 71 insertions(+)
>

Reviewed-by: Andrew Jones <drjones@redhat.com> 


