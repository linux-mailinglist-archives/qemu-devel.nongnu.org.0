Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E20409395
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 16:24:15 +0200 (CEST)
Received: from localhost ([::1]:58246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPmsY-0001jz-Ih
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 10:24:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mPmq9-0007Pc-Ke
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 10:21:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mPmq7-0005Yu-KB
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 10:21:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631542902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I/0TDFJ7ZNHQeklCwKTUaRjixx2i5AUx2biBMIW5VQg=;
 b=KV8DpLDxL2OLmG1zaXRN0ZEQlonZWuCY1BTCc3eDoMlEMOiFJ6vE2EBVDM94KeeIm8j7PQ
 vniErtuyUA+xzu6Y7H+LpfRYEPTH1aqAE/5HUyiFE1O1zxLNEuf+yhtHDpYsP8sR2tjNNm
 VStSU3jphh44L/ogfrdyL37YN84z6Ac=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-40fvNepRPCakCnTaU-CVeA-1; Mon, 13 Sep 2021 10:21:36 -0400
X-MC-Unique: 40fvNepRPCakCnTaU-CVeA-1
Received: by mail-ej1-f72.google.com with SMTP id
 ga42-20020a1709070c2a00b005dc8c1cc3a1so3726018ejc.17
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 07:21:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I/0TDFJ7ZNHQeklCwKTUaRjixx2i5AUx2biBMIW5VQg=;
 b=js40NoLRXdS4VwJraPTUDFbSirZiHMY3vJzTBVsLED5LbcuUMoVXGJVkQ/2yJ6YF46
 eLtGGRDhrWtQU5EK0EGLl9XNwAgZdSrAD7KF5rOZpcN+VDAJtKLJgNqJ47rpn5S2Gcp1
 Nx6z2cBGQueoBXSJhLZetTqzC1VOnGYum65lmPiSOSivRD/Vz8SxvIJOuvjEaIqJZH9J
 fepDUl/sYp8uWHbP4mtmoYhlSHeiZAVZe5RMDWP+0elPLEinza4YhuMk4OVAb3klBdq2
 rOFd6ZOB2xOmUWTExevesr+8nfxhc1x2B5DW9tdV5i00Ps9TgzcrZDfKbbFJy+f/UJ+V
 xPCA==
X-Gm-Message-State: AOAM531H9IpKGFYIf8WUmNcK04G2EtWHCMa3EV8BC/6N8kBXWhoZ+3B8
 jghfZO+PLlXMsInboIUHxPPCSGXPM+Vh859lzbQzrZ5EFLsAS7hn88w/cPDqRRCgT/e2aOTBFbH
 od5d7eW+SvF1R45c=
X-Received: by 2002:a17:906:f906:: with SMTP id
 lc6mr3760000ejb.487.1631542895612; 
 Mon, 13 Sep 2021 07:21:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBdYnlrxpqjsGk6wGMa4jJXVEZBVn1P/WAUwiCBFKFSTPPYFz4P3Af+ZbiUI1wJK+5ZTc+1g==
X-Received: by 2002:a17:906:f906:: with SMTP id
 lc6mr3759977ejb.487.1631542895405; 
 Mon, 13 Sep 2021 07:21:35 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c5sm4038436edx.81.2021.09.13.07.21.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 07:21:34 -0700 (PDT)
Subject: Re: [RFC v3 13/32] rust: use vendored-sources
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
 <20210907121943.3498701-14-marcandre.lureau@redhat.com>
 <CAFEAcA-=P+p7etUiLUzDxDzfe8N6TQyLC5=ExTSzgG4iOh0-dQ@mail.gmail.com>
 <CAJ+F1C+xL5_2c+7pSequokT-0yJ=pUT2V81iX_A_WLyVsWywEQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3c3b8ae0-97a5-cc17-d53c-672ccda5075f@redhat.com>
Date: Mon, 13 Sep 2021 16:21:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAJ+F1C+xL5_2c+7pSequokT-0yJ=pUT2V81iX_A_WLyVsWywEQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Ian Jackson <iwj@xenproject.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/09/21 18:29, Marc-André Lureau wrote:
> 
>       * C doesn't have a package manager, so if we need a dependency that
>         distros don't ship then we need to wrap it up and provide it
>     ourselves
> 
> Have we considered meson wrap? I never really looked at it in detail, 
> not sure if that would work for us. 
> https://mesonbuild.com/Wrap-dependency-system-manual.html 
> <https://mesonbuild.com/Wrap-dependency-system-manual.html>

Sure, it would be possible to use wrap with meson 0.56.x or newer (due 
to https://github.com/mesonbuild/meson/pull/7740).  It would all be 
hidden behind configure/Makefile, which would invoke "meson subprojects 
download" in addition to "git submodule update".

Paolo


