Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76805351933
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 19:55:10 +0200 (CEST)
Received: from localhost ([::1]:39872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lS1XA-0001QC-DY
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 13:55:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1lS1Vz-0000bQ-Fg
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 13:53:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1lS1Vv-0000do-Ax
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 13:53:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617299629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tCVuFGx6htuo6vh9EcFAsRLD5r0NdZVC9QNpsmxAQSA=;
 b=EuyPU9oFf1qJvf1Kx+iNfZx88WNXb7fNCzOpQAzbZFeMojDUiOYku4V9Bq3j9HM6isFIML
 vhrHmML7Qg61YmK1xGUmx07SQE6eiiilkH+ZrYV2Br70Lkxefg6n4Ox0aCZBveCFd955/j
 mSgpG3ELLtMSB2mOMmoAHwRbuu8gmXU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-7O-KI34UMe-lPIH5HEj_4g-1; Thu, 01 Apr 2021 13:53:47 -0400
X-MC-Unique: 7O-KI34UMe-lPIH5HEj_4g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5448C501F8;
 Thu,  1 Apr 2021 17:53:46 +0000 (UTC)
Received: from harajuku.usersys.redhat.com (unknown [10.40.193.50])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DA0D359468;
 Thu,  1 Apr 2021 17:53:43 +0000 (UTC)
Message-ID: <7f8146ebba9234d8d21beaa8a1ab8996ae5c63d4.camel@redhat.com>
Subject: Re: [PATCH RESEND v2 0/6] target/arm: Add nested virtualization
 support
From: Andrea Bolognani <abologna@redhat.com>
To: Haibo Xu <haibo.xu@linaro.org>, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Thu, 01 Apr 2021 19:53:40 +0200
In-Reply-To: <cover.1617281290.git.haibo.xu@linaro.org>
References: <cover.1617281290.git.haibo.xu@linaro.org>
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=abologna@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2021-04-01 at 12:55 +0000, Haibo Xu wrote:
> v2:
>   - Move the NV to a CPU feature flag(Andrea&Andrew)
>   - Add CPU feature 'el2' test(Andrew)
> 
> Many thanks to Andrea and Andrew for their comments!
> 
> This series add support for ARMv8.3/8.4 nested virtualization support
> in KVM mode. It's based on Marc Zyngier's kernel KVM patches[1], and 
> has been tested on a FVP model to run a L2 guest with Qemu. Now the 
> feature can be enabled by "-M virt,accel=kvm -cpu host,el2=on" when
> starting a VM. 

This looks good from the user interface point of view, thanks for
addressing the concerns that were raised!

I'll leave Drew to review the actual code changes :)

-- 
Andrea Bolognani / Red Hat / Virtualization


