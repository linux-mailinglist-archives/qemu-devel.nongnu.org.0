Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1174EDAD0
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 15:46:22 +0200 (CEST)
Received: from localhost ([::1]:44142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZv81-0004mi-HY
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 09:46:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nZv6Q-0003nv-LN
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 09:44:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nZv6O-0003rI-60
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 09:44:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648734279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=frbwVWgOSGt6qsbSaM8YDbyq4KnNe3l+i42Q1ZdXyWY=;
 b=bCK/0DS2hgvBLroeFrHCPEwCGZHLnvmM64ezWBEqDouRLnFqPQxbr+VPfZjuzwEQtv273Q
 7xJnXp9hQyj2t6n3rhNOfmcynGCuW9Hjs4QkONw9D3G5p3UFRvgWtIgYc1ceUBtlvZsN+z
 fRf/SxCFT/ysLLc0CmvBSjTPEmFNlP8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-172-rYI3_xIvMn2w-bK5lW0PSA-1; Thu, 31 Mar 2022 09:44:35 -0400
X-MC-Unique: rYI3_xIvMn2w-bK5lW0PSA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 80354803CB8;
 Thu, 31 Mar 2022 13:44:35 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B53162166B26;
 Thu, 31 Mar 2022 13:44:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 456EB18000AA; Thu, 31 Mar 2022 15:44:23 +0200 (CEST)
Date: Thu, 31 Mar 2022 15:44:23 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH 3/3] i386: firmware parsing and sev setup for -bios
 loaded firmware
Message-ID: <20220331134423.gt6khbnwqevxlu3w@sirius.home.kraxel.org>
References: <20220331083549.749566-1-kraxel@redhat.com>
 <20220331083549.749566-4-kraxel@redhat.com>
 <YkWoLLt4pE0X/BnP@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YkWoLLt4pE0X/BnP@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, Xiaoyao Li <xiaoyao.li@intel.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 31, 2022 at 02:10:04PM +0100, Daniel P. Berrangé wrote:
> On Thu, Mar 31, 2022 at 10:35:49AM +0200, Gerd Hoffmann wrote:
> > Don't register firmware as rom, not needed (see comment).
> > Add x86_firmware_configure() call for proper sev initialization.
> > 
> > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> > Tested-by: Xiaoyao Li <xiaoyao.li@intel.com>
> > ---
> >  hw/i386/x86.c | 25 +++++++++++++++++++------
> >  1 file changed, 19 insertions(+), 6 deletions(-)
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> 
> I validated that I could validate the measurement of a SEV
> guest with -bios, and see the firmware start at least.
> 
> Tested-by: Daniel P. Berrangé <berrange@redhat.com>

Nice.

With that in place we should be pretty close to get sev going with
microvm.  Probably needs revert of edk2 commit 06fa1f1931e9
("OvmfPkg/Microvm: no sev"), with some luck direct kernel boot works
without that though.

take care,
  Gerd


