Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5EE4EDA8E
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 15:30:27 +0200 (CEST)
Received: from localhost ([::1]:45822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZusb-0002kD-PP
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 09:30:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nZuqI-0001Uf-Vf
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 09:28:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nZuqG-0000MO-1Q
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 09:28:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648733277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p++JMNaq2MJjut9lMGnicPXLY3C+s5MJZN4itBW9gyU=;
 b=aFaaRT8cfFwlYgPLEEY2dIWwjWWru71s7vy70n84iNRfRVhMDlpkd9sXz0nyTIPHcR9TR/
 cYYbn3a6s/a1CEWE01GYD9yfjp5S5qJR5qfI6BxJruBGPU286dFCFOuBoz0ucTGhqMB1Og
 3ZFaAWrK2y+xaZr/R2QoVic6SqfgeGc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-372-JnpCSWZePOWs8MMUYZSfRg-1; Thu, 31 Mar 2022 09:27:51 -0400
X-MC-Unique: JnpCSWZePOWs8MMUYZSfRg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F3C66100BAA4;
 Thu, 31 Mar 2022 13:27:50 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C5DCA40FF708;
 Thu, 31 Mar 2022 13:27:50 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6119518000AA; Thu, 31 Mar 2022 15:27:49 +0200 (CEST)
Date: Thu, 31 Mar 2022 15:27:49 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH 2/3] i386: factor out x86_firmware_configure()
Message-ID: <20220331132749.5bgmmlhskvqb4klf@sirius.home.kraxel.org>
References: <20220331083549.749566-1-kraxel@redhat.com>
 <20220331083549.749566-3-kraxel@redhat.com>
 <YkWnmCErUMYietFV@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YkWnmCErUMYietFV@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

  Hi,

> > +void x86_firmware_configure(void *ptr, int size)
> > +{
> > +    int ret;
> > +
> > +    /*
> > +     * OVMF places a GUIDed structures in the flash, so
> > +     * search for them
> > +     */
> > +    pc_system_parse_ovmf_flash(ptr, size);
> 
> Any reason you chose to put this outside the sev_enabled()
> check when you moved it, as that is a functional change ?

Well, we probably get a 'if (tdx_enabled())' branch soon, and
pc_system_parse_ovmf_flash() will be needed for both sev and tdx.

> It ought to be harmless in theory, unless someone figures
> out a way to break pc_system_parse_ovmf_flash code with
> unexpected input.

Yes, strictly speaking this is a functional change.  Without
sev the pc_system_parse_ovmf_flash() results will be ignored
though, so there should be no change in qemu behavior ...

take care,
  Gerd


