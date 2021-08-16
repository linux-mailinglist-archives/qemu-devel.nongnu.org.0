Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7C43ED95B
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 17:00:06 +0200 (CEST)
Received: from localhost ([::1]:53966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFe5t-0008IE-Rj
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 11:00:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mFe42-0006aO-NE
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 10:58:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mFe3z-0003rJ-TS
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 10:58:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629125887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7ioeiNnp8tClwq5SGhpQi9ejqmj1i1k7xbprFS2Msh8=;
 b=AIYksPRzKbEp5oeB6U8nPSbCrkKqHUfmhLkOVnzP7jGYKHjZAc13qsAkPSvwr9Ogeu5gTf
 P4FJou1OlX0K+UIVc3cGvo/GXQ1IB+5yMvMw4YH4gAK4F++gfwFSDEl0Vf8NhjPzxieqtn
 ZcdxKhFwE+y47rcPxdUkXq5fIln9UsY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-FM-CBTFYOrGX5tjq_FdJHg-1; Mon, 16 Aug 2021 10:58:06 -0400
X-MC-Unique: FM-CBTFYOrGX5tjq_FdJHg-1
Received: by mail-wm1-f70.google.com with SMTP id
 q71-20020a1ca74a000000b002e6f02b267aso56152wme.8
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 07:58:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7ioeiNnp8tClwq5SGhpQi9ejqmj1i1k7xbprFS2Msh8=;
 b=rk6cnXknNNphIGzc/4gKsmmKMG01F31TzIVBP8htGmzYcGmRkFWoL1v5wWfb5CtNsi
 8h8kDV11fPVRuQTxQQ4uhwrEJChQQIGjREO/81XQshcbyHPDWE/mX9/pokklc0SW4Re4
 Y+I1OomAckM1EODokhB0mWmKXKOW95RV/8Z/Axt1uT3MHpP6QgQVlbZpP0ppe248cnM2
 ynoQImvhbI0krLOtvxLuu9/pt7ZJ/PVtFJuTkF8ix9d7kf2QKRldGjc0viE/vMisU5qO
 +GZzGzT0cRP5EHgjZwwS96XTE5AZiWroGGY3xIR0AUrzMRWuxhVCiOVY4mgCCcfBRLpe
 gymQ==
X-Gm-Message-State: AOAM531bRcyKLrKZprJjpp0h/utKv88DprdF+OM5zF0a/z/cnYHZqIcw
 ss9FK+J3HFHV+FK0OuiHdW7aV5+Y15cXu9gaxx51yUAw39IWMzxN13b5f5wcJEXlBZklTxmj5x9
 jGiFc/IS3WrnLN1g=
X-Received: by 2002:a5d:42c9:: with SMTP id t9mr19031955wrr.356.1629125884797; 
 Mon, 16 Aug 2021 07:58:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmZmFLMNwCgWpunBMWfLzO2EV47hCpJpp+zBxS6t3ApfzdeOZSeEc/IYgsFGdxI5iuYNWfnw==
X-Received: by 2002:a5d:42c9:: with SMTP id t9mr19031927wrr.356.1629125884570; 
 Mon, 16 Aug 2021 07:58:04 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id z1sm11798056wrv.22.2021.08.16.07.58.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 07:58:04 -0700 (PDT)
Subject: Re: [RFC PATCH 00/13] Add support for Mirror VM.
To: Ashish Kalra <ashish.kalra@amd.com>
References: <cover.1629118207.git.ashish.kalra@amd.com>
 <fb737cf0-3d96-173f-333b-876dfd59d32b@redhat.com>
 <20210816144413.GA29881@ashkalra_ubuntu_server>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <b25a1cf9-5675-99da-7dd6-302b04cc7bbc@redhat.com>
Date: Mon, 16 Aug 2021 16:58:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210816144413.GA29881@ashkalra_ubuntu_server>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.71, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: thomas.lendacky@amd.com, brijesh.singh@amd.com, ehabkost@redhat.com,
 kvm@vger.kernel.org, mst@redhat.com, tobin@ibm.com, jejb@linux.ibm.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, dgilbert@redhat.com,
 frankeh@us.ibm.com, dovmurik@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/08/21 16:44, Ashish Kalra wrote:
> I think that once the mirror VM starts booting and running the UEFI
> code, it might be only during the PEI or DXE phase where it will
> start actually running the MH code, so mirror VM probably still need
> to handles KVM_EXIT_IO when SEC phase does I/O, I can see PIC
> accesses and Debug Agent initialization stuff in SEC startup code.

That may be a design of the migration helper code that you were working
with, but it's not necessary.

The migration helper can be just some code that the guest "donates" to
the host.  The entry point need not be the usual 0xfffffff0; it can be
booted directly in 64-bit mode with a CR3 and EIP that the guest
provides to the guest---for example with a UEFI GUIDed structure.

In fact, the migration helper can run even before the guest has booted
and while the guest is paused, so I don't think that it is possible to
make use of any device emulation code in it.

Paolo


