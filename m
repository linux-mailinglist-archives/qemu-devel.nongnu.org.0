Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E35B750E27F
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 15:57:38 +0200 (CEST)
Received: from localhost ([::1]:32848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nizDe-0006Jy-32
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 09:57:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nizCW-0005am-Vd
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 09:56:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nizCU-0008Ta-4n
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 09:56:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650894985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tytt1LGX1MBQdciU7+N3+Gw1KQ9ZqhLCIiRaN+ltVuA=;
 b=TiGg9APSmhxKPWOnLzbCARbEF0AmCHU1+jzrfk2vGOt1niLFwp8WgPAS3h3v50V7FhmmJ4
 jSDyK4ujt1U+ZJ+otGgnJLddtP0Gu95RfojRuwctCX8BGb+qajTJ9n/ogIgbC1NYbWNq6c
 FoNdL+rZrTyEMCeE4Uh62cWYpaWmdf8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-290-rt8nGxzfNX-MlJ7-tck-7w-1; Mon, 25 Apr 2022 09:56:22 -0400
X-MC-Unique: rt8nGxzfNX-MlJ7-tck-7w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BEE8B80B710;
 Mon, 25 Apr 2022 13:56:21 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C9FB40CF8F5;
 Mon, 25 Apr 2022 13:56:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A954F18003A7; Mon, 25 Apr 2022 15:56:16 +0200 (CEST)
Date: Mon, 25 Apr 2022 15:56:16 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 0/3] i386: firmware parsing and sev setup for -bios
 loaded firmware
Message-ID: <20220425135616.awf4in2gsmdb4diq@sirius.home.kraxel.org>
References: <20220331083549.749566-1-kraxel@redhat.com>
 <20220331162404-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220331162404-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 31, 2022 at 04:24:28PM -0400, Michael S. Tsirkin wrote:
> On Thu, Mar 31, 2022 at 10:35:46AM +0200, Gerd Hoffmann wrote:
> > 
> 
> 
> Looks good.
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> 
> 
> Who's merging this? Yourself?

Just posted v2 with all the reviews, tests and acks added.

Will probably send a pull request in a week or so.  But I don't have
anything else pending right now, so I wouldn't mind if someone else
picks this up ...

take care,
  Gerd


