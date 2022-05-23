Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE24530C51
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 11:27:03 +0200 (CEST)
Received: from localhost ([::1]:39648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt4L8-0006RB-PX
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 05:27:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nt3we-0001oc-NI
 for qemu-devel@nongnu.org; Mon, 23 May 2022 05:01:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nt3wb-000253-Tz
 for qemu-devel@nongnu.org; Mon, 23 May 2022 05:01:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653296500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9TNnfIZ+DcTG6WScXMXF6bmDMYeYfeojwTqs68X24Rs=;
 b=VuiSXCFIQFPkbSMv84O+o6gkwFczuk6DipaSw+k2oXFjsQA3lRVFWoKT5/Bbby2qPeck6d
 aHQX9Dm8RFBmPQ2ADWY7DNCk/2d5k0ZvAzn2K2dKNs5pbBanq0Vik/vJttPTDgVzk+RJyk
 9ShiGFbOI1xARqdwlPRhqpdNob4veCs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-112-9Ou6MMAlNiWQa8BXya6mSA-1; Mon, 23 May 2022 05:01:36 -0400
X-MC-Unique: 9Ou6MMAlNiWQa8BXya6mSA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 834E280B712;
 Mon, 23 May 2022 09:01:35 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 466081121314;
 Mon, 23 May 2022 09:01:35 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D1AB918000B4; Mon, 23 May 2022 11:01:33 +0200 (CEST)
Date: Mon, 23 May 2022 11:01:33 +0200
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
Subject: Re: [RFC PATCH v4 08/36] i386/tdx: Adjust get_supported_cpuid() for
 TDX VM
Message-ID: <20220523090133.tdctqihkmwv7nlog@sirius.home.kraxel.org>
References: <20220512031803.3315890-1-xiaoyao.li@intel.com>
 <20220512031803.3315890-9-xiaoyao.li@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220512031803.3315890-9-xiaoyao.li@intel.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> - The supported XCR0 and XSS bits needs to be cap'ed by tdx_caps, because
>   KVM uses them to setup XFAM of TD.

> +    case 0xd:
> +        if (index == 0) {
> +            if (reg == R_EAX) {
> +                *ret &= (uint32_t)tdx_caps->xfam_fixed0 & XCR0_MASK;
> +                *ret |= (uint32_t)tdx_caps->xfam_fixed1 & XCR0_MASK;
> +            } else if (reg == R_EDX) {
> +                *ret &= (tdx_caps->xfam_fixed0 & XCR0_MASK) >> 32;
> +                *ret |= (tdx_caps->xfam_fixed1 & XCR0_MASK) >> 32;
> +            }
> +        } else if (index == 1) {
> +            /* TODO: Adjust XSS when it's supported. */
> +        }
> +        break;

> +    default:
> +        /* TODO: Use tdx_caps to adjust CPUID leafs. */
> +        break;

Hmm, that looks all a bit messy and incomplete, also the commit
message doesn't match the patch (describes XSS which isn't actually
implemented).

take care,
  Gerd


