Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F6E4FBB9D
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 14:04:03 +0200 (CEST)
Received: from localhost ([::1]:53750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndsm2-000427-B3
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 08:04:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1ndskU-00034f-Cp
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 08:02:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1ndskQ-0008Ti-UR
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 08:02:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649678541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XhA+f87wI2fd8zZjv+4N6AkZIuO9/rqvTg4W0ZVs0rk=;
 b=dFXKAE+fuW5NLaWELPg9EQxa7ut14S22MkS1TcI833sRom7yzTWOMVreO1CrFLRdKj3kGz
 ooCl1LFgR4N60USN7p0fv/4WKtypiJ5vD/u1DZIbIkEzYUvnX6sypWObPNZIjuBNHnwFUL
 En7WEetiJMuJh06ssNG4WqKzitP+TXM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-f2RlBKnwPHuxmsu-Mmg9Cw-1; Mon, 11 Apr 2022 08:02:20 -0400
X-MC-Unique: f2RlBKnwPHuxmsu-Mmg9Cw-1
Received: by mail-ed1-f72.google.com with SMTP id
 cb11-20020a0564020b6b00b0041d870f7b3aso411614edb.11
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 05:02:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XhA+f87wI2fd8zZjv+4N6AkZIuO9/rqvTg4W0ZVs0rk=;
 b=mjuIBiyPa4eELUy7VN1/ioNeYSRC2I2LNf+EeL5WjPfJihGRrzuHRTEnyh/rnK1Y5b
 A263yN/9ozim+p3QBoGGTvrrj0cnIoFamq58VlBVRTYojNl2UiHP/OPQNu/qufZRtGN+
 iHeub34gWeT8UX5SeYZ5tdM0UTAfixHDYgQpmxeQf19E2XWXmXEP2EzK7NBDe7kymluP
 OQJDUGQ3v8sCp4vEujaanVOwYKHfDAwtUQKiScORrhW0OP9cEQ1AUFZHdZrJXbfLNoJB
 5BPcc4jZaHteiIk3EapuWzmlcykROnfthWAUdGNwk+XleB83Je2lu9hOx0VqsiTdByFe
 QCrg==
X-Gm-Message-State: AOAM5333kFWsetPRFMR30XVrJnaoOiV/Ie6t0ITOrRV4KUIQqypIoPoK
 NjmrrsKTz+XirhVug+QoNrXuPI+TEJoX6llXaUJxCGycA3QCcDd9hbnk8yuclhXiePg0Xe7q8Ac
 p8e6hK3cGPK/JcrU=
X-Received: by 2002:a50:c099:0:b0:415:f5c7:700e with SMTP id
 k25-20020a50c099000000b00415f5c7700emr32745181edf.205.1649678539334; 
 Mon, 11 Apr 2022 05:02:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpvinL4a+8Rb3xW6OdrZcvuTLhSHAttqLKRZFWj1XqEzjPO0kUK/h7qUF2a0k2u9U4VN++2w==
X-Received: by 2002:a50:c099:0:b0:415:f5c7:700e with SMTP id
 k25-20020a50c099000000b00415f5c7700emr32745147edf.205.1649678539087; 
 Mon, 11 Apr 2022 05:02:19 -0700 (PDT)
Received: from gator (cst2-173-70.cust.vodafone.cz. [31.30.173.70])
 by smtp.gmail.com with ESMTPSA id
 22-20020a17090600d600b006dfbc46efabsm11942783eji.126.2022.04.11.05.02.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 05:02:18 -0700 (PDT)
Date: Mon, 11 Apr 2022 14:02:16 +0200
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 0/5] target/arm: Support variable sized coprocessor
 registers
Message-ID: <20220411120216.63r7ggy43y7ttvhp@gator>
References: <20220411065842.63880-1-gshan@redhat.com>
 <CAFEAcA-Tig6PAE4suFnERMN0f_Wco=0UVE7SrWy-Rb7gDheP_Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-Tig6PAE4suFnERMN0f_Wco=0UVE7SrWy-Rb7gDheP_Q@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Gavin Shan <gshan@redhat.com>, agraf@csgraf.de,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, eric.auger@redhat.com,
 qemu-arm@nongnu.org, shan.gavin@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 11, 2022 at 10:22:59AM +0100, Peter Maydell wrote:
> On Mon, 11 Apr 2022 at 07:59, Gavin Shan <gshan@redhat.com> wrote:
> >
> > There are two arrays for each CPU, to store the indexes and values of the
> > coprocessor registers. Currently, 8 bytes fixed storage space is reserved
> > for each coprocessor register. However, larger coprocessor registers have
> > been defined and exposed by KVM. Except SVE registers, no coprocessor
> > register exceeds 8 bytes in size. It doesn't mean large coprocessor registers
> > won't be exploited in future. For example, I'm looking into SDEI virtualization
> > support, which isn't merged into Linux upstream yet. I have plan to add
> > several coprocessor ("firmware pseudo") registers to assist the migration.
> 
> So, can you give an example of coprocessor registers which are
> not 8 bytes in size? How are they accessed by the guest?
> If we need to support them then we need to support them, but this
> cover letter/series doesn't seem to me to provide enough detail
> to make the case that they really are necessary.
> 
> Also, we support SVE today, and we don't have variable size
> coprocessor registers. Is there a bug here that we would be
> fixing ?

SVE registers are KVM_REG_SIZE_U2048 and KVM_REG_SIZE_U256 sized
registers. They work fine (just like the VFP registers which are
KVM_REG_SIZE_U128 sized). They work because they don't get stored in the
cpreg list. SVE and CORE (which includes VFP) registers are filtered
out by kvm_arm_reg_syncs_via_cpreg_list(). Since they're filtered
out they need to be handled specifically by kvm_arch_get/put_registers()

I asked Gavin to check if following the SVE pattern made sense for his
use case prior to sending this series, but I don't see the rationale for
not following the SVE pattern in this cover letter. Gavin, can you please
explain why following the SVE pattern doesn't work? Or, are you trying to
avoid adding an additional special case?

Thanks,
drew


