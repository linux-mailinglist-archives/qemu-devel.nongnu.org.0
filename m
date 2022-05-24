Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D178853243D
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 09:39:11 +0200 (CEST)
Received: from localhost ([::1]:40510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntP8I-00043f-Dw
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 03:39:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ntP6q-0003KS-Jd
 for qemu-devel@nongnu.org; Tue, 24 May 2022 03:37:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ntP6n-0003qD-SY
 for qemu-devel@nongnu.org; Tue, 24 May 2022 03:37:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653377856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QSn0eq4Bvs2xTbrxH6SjZqtwFwJqFEDca7NJAzrGl1g=;
 b=iG2CyS0CIwWxWhils1i0F3bLkRBCz3Qr0LNc0Gj6bklMDmb1bmXdR5qppoTeyP/Jm+LPpB
 cK5dZPyRY/3Q2ZuCq1XBY+cEba0TUiquiZc922VkT4qZ54iuWbmYuNzgD5/vpTE99mZA77
 9rA8S8/ESwNpmEGv1uucXnXPdT6MmNk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-09kSuQVyOh-UYVNkFCeBAQ-1; Tue, 24 May 2022 03:37:33 -0400
X-MC-Unique: 09kSuQVyOh-UYVNkFCeBAQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BDA04801E80;
 Tue, 24 May 2022 07:37:32 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 976A91410DD5;
 Tue, 24 May 2022 07:37:31 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E8EEA1800393; Tue, 24 May 2022 09:37:29 +0200 (CEST)
Date: Tue, 24 May 2022 09:37:29 +0200
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
Subject: Re: [RFC PATCH v4 22/36] i386/tdx: Track RAM entries for TDX VM
Message-ID: <20220524073729.xkk6s4tjkzm77wwz@sirius.home.kraxel.org>
References: <20220512031803.3315890-1-xiaoyao.li@intel.com>
 <20220512031803.3315890-23-xiaoyao.li@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220512031803.3315890-23-xiaoyao.li@intel.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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

> +static int tdx_accept_ram_range(uint64_t address, uint64_t length)
> +{
> +    TdxRamEntry *e;
> +    int i;
> +
> +    for (i = 0; i < tdx_guest->nr_ram_entries; i++) {
> +        e = &tdx_guest->ram_entries[i];
> +
> +        if (address + length < e->address ||
> +            e->address + e->length < address) {
> +                continue;
> +        }
> +
> +        if (e->address > address ||
> +            e->address + e->length < address + length) {
> +            return -EINVAL;
> +        }

if (e->type == TDX_RAM_ADDED)
	return -EINVAL

> +        if (e->address == address && e->length == length) {
> +            e->type = TDX_RAM_ADDED;
> +        } else if (e->address == address) {
> +            e->address += length;
> +            e->length -= length;
> +            tdx_add_ram_entry(address, length, TDX_RAM_ADDED);
> +        } else if (e->address + e->length == address + length) {
> +            e->length -= length;
> +            tdx_add_ram_entry(address, length, TDX_RAM_ADDED);
> +        } else {
> +            TdxRamEntry tmp = {
> +                .address = e->address,
> +                .length = e->length,
> +            };
> +            e->length = address - tmp.address;
> +
> +            tdx_add_ram_entry(address, length, TDX_RAM_ADDED);
> +            tdx_add_ram_entry(address + length,
> +                              tmp.address + tmp.length - (address + length),
> +                              TDX_RAM_UNACCEPTED);
> +        }

I think all this can be simplified, by
  (1) Change the existing entry to cover the accepted ram range.
  (2) If there is room before the accepted ram range add a
      TDX_RAM_UNACCEPTED entry for that.
  (3) If there is room after the accepted ram range add a
      TDX_RAM_UNACCEPTED entry for that.

take care,
  Gerd


