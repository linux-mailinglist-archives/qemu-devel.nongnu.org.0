Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69173261080
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Sep 2020 13:09:36 +0200 (CEST)
Received: from localhost ([::1]:33302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFbVH-0001Jb-Gq
	for lists+qemu-devel@lfdr.de; Tue, 08 Sep 2020 07:09:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kFbT0-0006X1-B9
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 07:07:14 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:50380
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kFbSy-0005gO-K6
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 07:07:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599563231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B2YFXAtYJPTXxZW9VyxBR5mpscba9PqGxdSijpkMk7E=;
 b=OJza2+gmugdiJm3hiWgE4a8EpuDzpWYETOQSn2JikF3ZlC91AtD+OMlmbWPRqrx2mt4xEe
 /810BHDaOnW8vQe2Jo/yPftPeW2gVhqfdO/bzPcpn+Q9wb5j0umszokaRSwdOC2l5Paeug
 NZDC6TkD2Ry8pJ6jHlmfdv/H3PdlI4Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-hF6ZzyEmP_i9-MoGRqESJg-1; Tue, 08 Sep 2020 07:07:08 -0400
X-MC-Unique: hF6ZzyEmP_i9-MoGRqESJg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C778E8030CD;
 Tue,  8 Sep 2020 11:07:07 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.171])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D1CC5C1BB;
 Tue,  8 Sep 2020 11:07:05 +0000 (UTC)
Date: Tue, 8 Sep 2020 13:07:03 +0200
From: Andrew Jones <drjones@redhat.com>
To: Haibo Xu <haibo.xu@linaro.org>
Subject: Re: [PATCH v2 08/12] hw/arm/virt: Move kvm pmu setup to
 virt_cpu_post_init
Message-ID: <20200908110703.6ozfos27iyq45bv5@kamzik.brq.redhat.com>
References: <cover.1599549462.git.haibo.xu@linaro.org>
 <7982854bb6cdb90390ea3f3c39c2801ef84fd2e5.1599549462.git.haibo.xu@linaro.org>
MIME-Version: 1.0
In-Reply-To: <7982854bb6cdb90390ea3f3c39c2801ef84fd2e5.1599549462.git.haibo.xu@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=drjones@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 02:10:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 08, 2020 at 08:13:26AM +0000, Haibo Xu wrote:
> From: Andrew Jones <drjones@redhat.com>
> 
> Move the KVM PMU setup part of fdt_add_pmu_nodes() to
> virt_cpu_post_init(), which is a more appropriate location. Now
> fdt_add_pmu_nodes() is also named more appropriately, because it
> no longer does anything but fdt node creation.
> 
> No functional change intended.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  hw/arm/virt.c | 34 ++++++++++++++++++----------------
>  1 file changed, 18 insertions(+), 16 deletions(-)
>

This looks like the correct version, but you could also pick up Peter's
r-b.

Thanks,
drew 


