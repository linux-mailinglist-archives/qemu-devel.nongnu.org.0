Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A956340B73
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 18:13:43 +0100 (CET)
Received: from localhost ([::1]:37984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMwDO-0003Vt-GE
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 13:13:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lMvfP-00027u-Kj
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 12:38:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lMvfA-00033v-8G
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 12:38:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616085487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZqAoAcfY1BNOOUTxWyIh03nNqNYFwle/PuZjAweoNtI=;
 b=Ji2/RhsGBJp5b9yz98U3/hgtdemkfDL0uvlG1EXKX3EV5Bgd70mPyaCZNwTzhgS/AkPakj
 ElODl78OHNa1tFPXYAunsXcW8s60SAd7kKrG1gL4QUQ/g1BNMB8k3BqEnp7jwbmoZsPBo9
 CXKYrgc3ECRGLYsXkgs1LI4knj1qQYs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-xPcwDFxaPJCEcuGiqHYSiw-1; Thu, 18 Mar 2021 12:38:02 -0400
X-MC-Unique: xPcwDFxaPJCEcuGiqHYSiw-1
Received: by mail-ed1-f72.google.com with SMTP id o15so21555052edv.7
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 09:38:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=ZqAoAcfY1BNOOUTxWyIh03nNqNYFwle/PuZjAweoNtI=;
 b=sYNgn0qE2X+3BEI8HbR4En0RrxwvJSjjEp+mAoz0Z271pkaq065LH0/xshLqmcDNYv
 4U/1hNUh65hQZyE2+a8AZOKTu/08mE0qEdi+kIMVEQvFWoaX36CeInU1ej+P2n9Bq/cq
 fd7uTh84FSK3FkhPhmwXXaAfy/M3fFEOV1XNuBvdcI3HqPG0BwiMGUo0FD8fHvHs818G
 chP1P4GYCz3SfSDCQgCHepPTysE0YmepEKRKSrWUj4Dd4L6/jcrpTd0H2R2mk37B2aov
 OLe24lFT+QEU5o5UHQkBIZN1478SEqaqGkdFYVSIRR/Qz0+zdanKx2ee8YUPPmgfVgE7
 ZCmg==
X-Gm-Message-State: AOAM531qzDrlZdgi0bU/YuYOgjQVYywRlPakGFIeSbAC/XqF6b69Aulh
 qHexn8kiEffU5LPRev5x7MSGlIkhNrKzejhLgCCwKZvefdMGBRorEvjPOnCMkyPPxR9JUKqXaI6
 PDjm1grDBUfm2reg=
X-Received: by 2002:a17:906:2c0c:: with SMTP id
 e12mr42069526ejh.408.1616085481352; 
 Thu, 18 Mar 2021 09:38:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+FxlysklBpWH18qgx2o0TiyiCQTFKWwR2nkn1s/hHHw3kLu8I1z+I7vuejYntw+6ol2tq/g==
X-Received: by 2002:a17:906:2c0c:: with SMTP id
 e12mr42069504ejh.408.1616085481141; 
 Thu, 18 Mar 2021 09:38:01 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id l18sm2203828ejk.86.2021.03.18.09.38.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 09:38:00 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 3/3] i386: Make sure kvm_arch_set_tsc_khz() succeeds on
 migration when 'hv-reenlightenment' was exposed
In-Reply-To: <2f377397-0427-95dc-6617-5dedf6533bc4@redhat.com>
References: <20210318160249.1084178-1-vkuznets@redhat.com>
 <20210318160249.1084178-4-vkuznets@redhat.com>
 <2f377397-0427-95dc-6617-5dedf6533bc4@redhat.com>
Date: Thu, 18 Mar 2021 17:38:00 +0100
Message-ID: <87wnu45sev.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 18/03/21 17:02, Vitaly Kuznetsov wrote:
>> KVM doesn't fully support Hyper-V reenlightenment notifications on
>> migration. In particular, it doesn't support emulating TSC frequency
>> of the source host by trapping all TSC accesses so unless TSC scaling
>> is supported on the destination host and KVM_SET_TSC_KHZ succeeds, it
>> is unsafe to proceed with migration.
>> 
>> Normally, we only require KVM_SET_TSC_KHZ to succeed when 'user_tsc_khz'
>> was set and just 'try' KVM_SET_TSC_KHZ without otherwise.
>> 
>> Introduce a new vmstate section (which is added when the guest has
>> reenlightenment feature enabled) and add env.tsc_khz to it. We already
>> have env.tsc_khz packed in 'cpu/tsc_khz' but we don't want to be dependent
>> on the section order.
>> 
>> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
>
> Could we instead fail to load the reenlightenment section if 
> user_tsc_khz was not set?  This seems to be user (well, management) 
> error really, since reenlightenment has to be enabled manually (or with 
> hv-passthrough which blocks migration too).

Yes, we certainly could do that but what's the added value of
user_tsc_khz which upper layer will have to set explicitly (probably to
the tsc frequency of the source host anyway)? In case we just want to
avoid calling KVM_SET_TSC_KHZ twice, we can probably achieve that by
adding a CPU flag or something.

-- 
Vitaly


