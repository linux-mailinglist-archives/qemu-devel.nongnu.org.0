Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F32E8544EC1
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 16:22:03 +0200 (CEST)
Received: from localhost ([::1]:35480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzJ2x-0000fS-0K
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 10:22:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nzIJ0-0004fS-6e
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 09:34:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nzIIx-0002nL-98
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 09:34:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654781670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GlQ8FBlP/drXQ8Lb3KbrrEPrF8f85P+9QjKCvTgg4Bg=;
 b=SoQq1hqmYoTelqT74XC2AnEdRLAkoHEM7/u2iUPB+wByBGGq8c/7Bx+QNlftbepnm79TsB
 1eU8I/pcwkaPWJc4DWiuK2TTWfhRij1OciIPDtRkGj+1s8yzJZSc7kYGEXCUH0ziYmROgi
 Eca9K9do5KZRwEJ6errmI4VHvwglRxQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-28-0J5iAZZSO5Cz0A05vvpusQ-1; Thu, 09 Jun 2022 09:34:25 -0400
X-MC-Unique: 0J5iAZZSO5Cz0A05vvpusQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8822E294EDE1;
 Thu,  9 Jun 2022 13:34:24 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 37038492C3B;
 Thu,  9 Jun 2022 13:34:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9A06F1800094; Thu,  9 Jun 2022 15:34:11 +0200 (CEST)
Date: Thu, 9 Jun 2022 15:34:11 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: qemu Developers <qemu-devel@nongnu.org>, xen-devel@lists.xenproject.org,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v3 2/3] ui: Deliver refresh rate via QemuUIInfo
Message-ID: <20220609133411.uneuazwmcczzap6i@sirius.home.kraxel.org>
References: <20220226115516.59830-1-akihiko.odaki@gmail.com>
 <20220226115516.59830-3-akihiko.odaki@gmail.com>
 <20220609102805.qz2xrnd6ms6cigir@sirius.home.kraxel.org>
 <19ae71a4-c988-3c9e-20d6-614098376524@gmail.com>
 <20220609120214.bay3cl24oays6x6d@sirius.home.kraxel.org>
 <c0c610b8-df0c-7e2a-385f-bcf70c987182@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c0c610b8-df0c-7e2a-385f-bcf70c987182@gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > > > (1) add refresh_rate
> > > > (2) update users one by one
> > > > (3) finally drop update_interval when no user is left.
> > > > 
> > > > thanks,
> > > >     Gerd
> > > > 
> > > 
> > > I think 1 and 3 should have to be done once since refresh_rate and
> > > update_interval would interfere with each other otherwise.
> > 
> > Well, between 1 and 3 both old and new API are active.  Shouldn't be
> > much of a problem because the GraphicHwOps implementations are using
> > only the one or the other.
> > 
> > take care,
> >    Gerd
> > 
> 
> The only GraphicHwOps implementation updated with this change is xenfb.
> xenfb can be switched to use refresh_rate in step 1 or 3.
> 
> Switching to use refresh_rate in step 1 would break the refresh rate
> propagation until all host displays are updated to set refresh_rate instead
> of calling update_interval.

Well, host display update would need splitting into two pieces too,
first add refresh_rate, then later drop update_interval, to make the
update scheme work without temporary breakage.

That sounds increasingly like over engineering it though, I guess I just
queue up the patches as-is.

thanks,
  Gerd


