Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C02105F1A64
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 08:57:57 +0200 (CEST)
Received: from localhost ([::1]:59802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeWRg-0003pB-BN
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 02:57:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oeWOh-0002Er-ID
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 02:54:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oeWOd-0008TW-Vx
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 02:54:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664607286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MlUhRfX7PEsRQqtF5h1SDkfGr7MPa+v0kkjQCxl+mug=;
 b=Fim/AgpkMJrhbsUEQnp1Otya5fnvx9h53i2dHbJO8ng6S+/sc6knKePKTjX0WIGplTvpXb
 hnEtmIVQ6S9eBVwODiVcGbtITF3AgcTpOZDT3G8GQKvQ8Ox+epVJfI9SbD28Wd7ZO1hBjq
 1aTV6KozL3UH2/rWWggsOnj+eXQ3lVA=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-35-J7goDBKVPqqqqDXf2zsgBg-1; Sat, 01 Oct 2022 02:54:45 -0400
X-MC-Unique: J7goDBKVPqqqqDXf2zsgBg-1
Received: by mail-vs1-f69.google.com with SMTP id
 d184-20020a671dc1000000b0039b46979cb9so1078047vsd.4
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 23:54:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=MlUhRfX7PEsRQqtF5h1SDkfGr7MPa+v0kkjQCxl+mug=;
 b=fa3D+op1QIE57VAkIn8rsOVSoMoPBAco3GWUVAXuxzRikyFqsh+Oh08I6g9BQlkkRS
 4hKoBTcIAIgPJOuK4IvpwOd/oAgDYe/l0SPSJQc0KWJexMNU1M8Y7GeKsE751aS5IQel
 vlKNDyHnGzZFLbSCAe5JUtI2KmzwVMGnnsfFt7UQ8Cbaux2DH8Zs7B1bgaTWS047D3/W
 3fn13L2VZa0S9GSQvJ4ZltFDEkJYKhDgd7vWCIECqmxRivhOemvGDigiSe9EGqI7uEMy
 idMHY/5mmSBoUOiFGgVOcEnZ8LhDqZCXKKtTC7psjJt/QFlllpOwXf3gDlsCdV4Wv4C1
 sFXA==
X-Gm-Message-State: ACrzQf1N87T3Z0ItHhUateOFZLbXOwKvzLA8r5Q2nJrmHrEWGOtsVMGo
 xisq6QwAPOj/FSbdo6KnQChyxDoja/EX0pVMj3W+wxWluj7nuOTS2Je8grQBaDOgVgaAmjCy/Ts
 9AdY7p0YS0naSpi4hvpPHBOYIYCtNqMg=
X-Received: by 2002:ab0:60c9:0:b0:3c3:b626:6f4 with SMTP id
 g9-20020ab060c9000000b003c3b62606f4mr6175490uam.57.1664607284946; 
 Fri, 30 Sep 2022 23:54:44 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM46yTJXEksjjXNwiJsTEa0+08s1nWOq4it3+EFhCMg0TkQJUqEqMZ7fhcFLN2Ey4MS2gvDAE3d4qerQuHYl4+4=
X-Received: by 2002:ab0:60c9:0:b0:3c3:b626:6f4 with SMTP id
 g9-20020ab060c9000000b003c3b62606f4mr6175489uam.57.1664607284700; Fri, 30 Sep
 2022 23:54:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220906100932.343523-1-richard.henderson@linaro.org>
 <20220906100932.343523-18-richard.henderson@linaro.org>
 <CABgObfaZ648tE9VNZ6Lis-m_oXBHApfMUE=K=7VAvjYray52gg@mail.gmail.com>
 <e35b8951-8ce1-13a2-a3b7-651ea6060af5@linaro.org>
In-Reply-To: <e35b8951-8ce1-13a2-a3b7-651ea6060af5@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sat, 1 Oct 2022 08:54:32 +0200
Message-ID: <CABgObfYwNuhzbah2k++khF7wP+8-xQXsi5sN2EmvxBA7DwcXbA@mail.gmail.com>
Subject: Re: [PATCH v2 17/23] target/i386: Create gen_jmp_rel
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Sat, Oct 1, 2022 at 2:53 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
> I believe it really should be s->dflag, which makes all users of the function pass dflag
> (the manual consistently talks about "operand size").  At which point this parameter goes
> away and gen_jmp_rel grabs the operand size from DisasContext.
>
> Also, pre-existing bug vs CODE64 here -- operand size is always 64-bits for near jumps.

Yes, sounds good.

Paolo


