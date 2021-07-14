Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A866F3C8360
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 13:02:52 +0200 (CEST)
Received: from localhost ([::1]:41424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3cfD-0005Dx-Nr
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 07:02:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m3cdT-0003ca-6h
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 07:01:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m3cdP-0003ZL-UK
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 07:01:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626260458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gJnIoNN1XMRcuu66GsFyuQjNlW4ixFppOGLfd4tm/lY=;
 b=VyqHhHhiSBqKBCElfru6K7N7IUR1VX9yohXpubl+GbnSVzeh/Yx7bHFyF+qgDM18ZXueFZ
 vgQz2vxmn3ZLmAEr2Oj0uL1vuGqhmQSpUsVGxzKHkarXhjFMbB4D1/EDdKLcmnBI8Hc0d3
 D6XbrMjc9hnYYj3np+lwxBPEAGB2rxY=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-VSPb2mAVMf-byfaGiz8EvQ-1; Wed, 14 Jul 2021 07:00:57 -0400
X-MC-Unique: VSPb2mAVMf-byfaGiz8EvQ-1
Received: by mail-pj1-f71.google.com with SMTP id
 x2-20020a17090ab002b029016e8b858193so1284958pjq.3
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 04:00:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gJnIoNN1XMRcuu66GsFyuQjNlW4ixFppOGLfd4tm/lY=;
 b=iB0HVEnI+XAwJBdPGLY7jYxkImtt8i/yt1C57ygSq9BV/k/ZFlmlWYd9v0NndQe4UT
 o+4cqWCSkWvIG+vzDReG8/dTk/W2QIlUnNqoa9+nOwp5nR+8dldpUkrz1wRk1B+h+eSj
 282/nfzsyhzHlRby59zaSWPwRbSUtNy6xuFbkZkBbtKGshJRLPNUBoSutddydDpwNAjS
 Oc7t0W2M3mSsY+kVyBIbS6at0pjANyOWI2DKbDz4hCm3yeexlyIiN8G9PjPUbb4ji7r6
 xZXz1tClTSZ81Y0NgivG6wdLRXCQZZESixUtn1nqDYcFVGS33cNdLdGua9RxyfOSXH3P
 Rv1g==
X-Gm-Message-State: AOAM531T5rpW0A07eF2i5+rDUxi+vp2oFeCmZZOlWR2RT2FkGK/JDNcT
 Jpxvsk9HHLH7WOfWEvmBFE9l+WkebZkbnVNjfRSYCaymOkI9zPI79p472FBXxTcZkWm4wB95Oxs
 DywjnW4Ql8lNNXgT88o6MNUUAEZKs1xw=
X-Received: by 2002:a17:902:b409:b029:129:a9a6:fc76 with SMTP id
 x9-20020a170902b409b0290129a9a6fc76mr7246482plr.68.1626260456479; 
 Wed, 14 Jul 2021 04:00:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1XCGlIZUfst+LxPT2Yl2X30JJWMLNsMuh3gNbYvGYrzKCw37MeHxaLRxWe+xhP1tbpVO7OzxdSHL38A98hkw=
X-Received: by 2002:a17:902:b409:b029:129:a9a6:fc76 with SMTP id
 x9-20020a170902b409b0290129a9a6fc76mr7246458plr.68.1626260456212; Wed, 14 Jul
 2021 04:00:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210714101536.16016-1-alex.bennee@linaro.org>
In-Reply-To: <20210714101536.16016-1-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 14 Jul 2021 13:00:45 +0200
Message-ID: <CABgObfaSR04Z8Ys4MF=WFdTP3DyF4EowRcu9=d-mV46=DJ1a7A@mail.gmail.com>
Subject: Re: [PATCH for 6.1] meson.build: relax the libdl test to one for the
 function dlopen
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: minyihh@uci.edu, qemu-devel <qemu-devel@nongnu.org>, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com,
 "Emilio G. Cota" <cota@braap.org>, kuhn.chenqun@huawei.com,
 Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> -  libdl = cc.find_library('dl', required: true)
> +  libdl = cc.find_library('dl', required: false)
> +  if not cc.has_function('dlopen', dependencies: libdl)
> +    error('dlopen not found')
> +  endif

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


