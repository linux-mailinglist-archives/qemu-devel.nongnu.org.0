Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA97530C7D
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 12:04:15 +0200 (CEST)
Received: from localhost ([::1]:55984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt4v8-0005WV-RP
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 06:04:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nt4XC-0001xy-7E
 for qemu-devel@nongnu.org; Mon, 23 May 2022 05:39:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nt4X9-0007Va-Am
 for qemu-devel@nongnu.org; Mon, 23 May 2022 05:39:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653298766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+TxRfMkI29EpV9M74qsZWsccffjGup9UXF5ZlzJ8zeo=;
 b=d4bqTLB+RXgQRrNDZIlCYMZW0gxy3lkfo1Z3NBkuyteScjt2oeFK+E9RhiXj35aYNO9enV
 I36tyzj8EE6ZO439yLMTCAHSpnTct2o9tLuAtwVpe8gaZ9Xl+P6TF3DbDeb7Jxy+a30vlO
 ftouE3wqOKf9FmEUxYl9dFLdurbLklo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-601-WfOSOmZxPpO2UKkF9D2zuw-1; Mon, 23 May 2022 05:39:22 -0400
X-MC-Unique: WfOSOmZxPpO2UKkF9D2zuw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 197753C1022A;
 Mon, 23 May 2022 09:39:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BFF322026D6A;
 Mon, 23 May 2022 09:39:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0A69E18000B4; Mon, 23 May 2022 11:39:20 +0200 (CEST)
Date: Mon, 23 May 2022 11:39:20 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>, isaku.yamahata@intel.com,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Eric Blake <eblake@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, erdemaktas@google.com,
 kvm@vger.kernel.org, qemu-devel@nongnu.org, seanjc@google.com
Subject: Re: [RFC PATCH v4 13/36] i386/tdx: Validate TD attributes
Message-ID: <20220523093920.o6pk5i7zig6enwnm@sirius.home.kraxel.org>
References: <20220512031803.3315890-1-xiaoyao.li@intel.com>
 <20220512031803.3315890-14-xiaoyao.li@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220512031803.3315890-14-xiaoyao.li@intel.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> Validate TD attributes with tdx_caps that fixed-0 bits must be zero and
> fixed-1 bits must be set.

> -static void setup_td_guest_attributes(X86CPU *x86cpu)
> +static int tdx_validate_attributes(TdxGuest *tdx)
> +{
> +    if (((tdx->attributes & tdx_caps->attrs_fixed0) | tdx_caps->attrs_fixed1) !=
> +        tdx->attributes) {
> +            error_report("Invalid attributes 0x%lx for TDX VM (fixed0 0x%llx, fixed1 0x%llx)",
> +                          tdx->attributes, tdx_caps->attrs_fixed0, tdx_caps->attrs_fixed1);
> +            return -EINVAL;
> +    }

So, how is this supposed to work?  Patch #2 introduces attributes as
user-settable property.  So do users have to manually figure and pass
the correct value, so the check passes?  Specifically the fixed1 check?

I think 'attributes' should not be user-settable in the first place.
Each feature-bit which is actually user-settable (and not already
covered by another option like pmu) should be a separate attribute for
tdx-object.  Then the tdx code can create attributes from hardware
capabilities and user settings.

When user-settable options might not be available depending on hardware
capabilities best practice is to create them as OnOffAuto properties.

  Auto == qemu can pick the value, typical behavior is to enable the
          feature if the hardware supports it.
  On == must enable, if it isn't possible throw an error and exit.
  Off == must disable, if it isn't possible throw an error and exit. 

take care,
  Gerd


