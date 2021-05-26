Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEE9392101
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 21:38:11 +0200 (CEST)
Received: from localhost ([::1]:33330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llzM2-0003CH-VU
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 15:38:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1llzIO-0000n6-9l
 for qemu-devel@nongnu.org; Wed, 26 May 2021 15:34:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1llzIH-0002DN-JH
 for qemu-devel@nongnu.org; Wed, 26 May 2021 15:34:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622057654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pnNY5IhVJ+BAwU0Zb4tpWSMpmKZQJerD8lUBRiM+qUo=;
 b=FlZHyUirTTPWFu/vAruQbSJV6ooYp5MgwZ+j+JSiU+cSnHvv5/1mlePfTl2fmDQ2y2ZZ59
 eshfdF+ogHSiZwW1CeVSHJ/5rkKH+BvIVhD6bDesDakzLO/CeHIBdHcDFgXxUDF0Mv55IJ
 ITHgRd/L4r00YtGHx8vgUWGE6NIddKo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-Zml4wGWkOjeDgomUZP8lzA-1; Wed, 26 May 2021 15:34:13 -0400
X-MC-Unique: Zml4wGWkOjeDgomUZP8lzA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2D71107ACCA;
 Wed, 26 May 2021 19:34:11 +0000 (UTC)
Received: from localhost (ovpn-114-21.rdu2.redhat.com [10.10.114.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 64A3610074E0;
 Wed, 26 May 2021 19:34:08 +0000 (UTC)
Date: Wed, 26 May 2021 15:34:07 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH 2/2] i386: use better matching family/model/stepping for
 'max' CPU
Message-ID: <20210526193407.gjzkuotoqst5zgt3@habkost.net>
References: <20210507133650.645526-1-berrange@redhat.com>
 <20210507133650.645526-3-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210507133650.645526-3-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 07, 2021 at 02:36:50PM +0100, Daniel P. Berrangé wrote:
> The 'max' CPU under TCG currently reports a family/model/stepping that
> approximately corresponds to an AMD K7 vintage architecture.
> The K7 series predates the introduction of 64-bit support by AMD
> in the K8 series. This has been reported to lead to LLVM complaints
> about generating 64-bit code for a 32-bit CPU target
> 
>   LLVM ERROR: 64-bit code requested on a subtarget that doesn't support it!
> 
> It appears LLVM looks at the family/model/stepping, despite qemu64
> reporting it is 64-bit capable.
> 
> This patch changes 'max' to report a CPUID with the family, model
> and stepping taken from a
> 
>  AMD Athlon(tm) 64 X2 Dual Core Processor 4000+
> 
> which is one of the first 64-bit AMD CPUs.
> 
> Closes https://gitlab.com/qemu-project/qemu/-/issues/191
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

-- 
Eduardo


