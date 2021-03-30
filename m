Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A10934E741
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 14:14:26 +0200 (CEST)
Received: from localhost ([::1]:52658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRDGL-00088h-IY
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 08:14:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lRDBr-0006MF-Ju
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 08:09:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lRDBp-0003Nz-80
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 08:09:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617106184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gGm5x14kbjTrkBr+ftKMeYeM+MNs+N7Fj/NbcEqpZzk=;
 b=DQ9OxmBCjw3stRXXYa0cZRUqTHjXY960qvBv6i2JpFjY2ERMhzeTe0ZiQ0q/H4RDveBX5R
 lbPK5j6BJutmVo4cRTx9EAaBANzU/6lkNY+Np9SlHdSU1T1kUCI+Ae3sX7+u2Md2B390TI
 ppzva9NVITanpAMi31Lf5XTBbTt/b9s=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-1L2HhQNbPmKzU2ZCCQgzag-1; Tue, 30 Mar 2021 08:09:42 -0400
X-MC-Unique: 1L2HhQNbPmKzU2ZCCQgzag-1
Received: by mail-ed1-f72.google.com with SMTP id cq11so10071992edb.14
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 05:09:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gGm5x14kbjTrkBr+ftKMeYeM+MNs+N7Fj/NbcEqpZzk=;
 b=k5BA/LI0zA/FHCf0wjqVxIIFoNdt9uSnxq5rnUUumA26KuCPnv10yEe3AN3Y8oGYb5
 7nXrv4M1EukIDau/BtDLF3hCr4682IFunGNC4o9Zya2YP1ey0hh1xPEaCA+85VN2XGxo
 jlHz+64loqwmXOkc5cicGyyWTzML7hK8H2pj10GkdjOubcXiB2v/ciqArSuWHt8jLlbz
 QR53kCo5COOuZGN/OawkhLSHqo3TdSRGtxrJDjiwl9gC+TtpDe2o+ZsvOmaCnWXSjAEq
 kT9Sp0BxS5EDjg8LDett37eOfkb2+HwDYe5D0PwRn4WD1KRxJUmN7LCYvYM8wR+rpaEP
 cT7A==
X-Gm-Message-State: AOAM5316zvVBgmKJv3yYtw30sjOoxncCqETcodCvBp2z5LZPL3lrnVE0
 EhtbVIcc+JNURlGAMsNA0qv2tN+iFReYN7NRXoW5MS/SGmgDma6RnJ0+R6RI8o9HEr4IHlZUdh3
 GemOmY4o6DH+iUc8=
X-Received: by 2002:aa7:d4d6:: with SMTP id t22mr34028798edr.376.1617106181385; 
 Tue, 30 Mar 2021 05:09:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBLk8aVfD+av8pse9LeC26hjd8eJHlNSw0ybTO4dIbizc+ejXUskGxxuRIvJrM24KSh7FY2Q==
X-Received: by 2002:aa7:d4d6:: with SMTP id t22mr34028780edr.376.1617106181200; 
 Tue, 30 Mar 2021 05:09:41 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id v8sm10989307edc.30.2021.03.30.05.09.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Mar 2021 05:09:39 -0700 (PDT)
Subject: Re: Serious doubts about Gitlab CI
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <cb9d0504-aba5-3114-d121-694a5247764c@amsat.org>
 <YFOt+R77HfpNEYFc@stefanha-x1.localdomain>
 <2d1e40c6-5fa4-271f-5ecc-74da7c04ffea@redhat.com>
 <YFRv9zMvBXtpfN3t@stefanha-x1.localdomain>
 <20210319101848.ebdwkfttay73jajr@kamzik.brq.redhat.com>
 <cad173cb-7715-1286-eba2-75e9816e6177@redhat.com>
 <b351f107-a9fd-f7cf-1f27-2d435cea612a@amsat.org>
 <d05a40b2-ff80-d9c8-8dfe-5dfce2e57d3d@redhat.com>
 <YGHf3HjYTRJwktbf@stefanha-x1.localdomain> <YGMJSoIGa5VoVDB1@redhat.com>
 <04e5e251-7a09-dcf6-82ad-31bf696bc248@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <902a93ca-bd71-504b-fcf5-fec2480f9ec0@redhat.com>
Date: Tue, 30 Mar 2021 14:09:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <04e5e251-7a09-dcf6-82ad-31bf696bc248@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/03/21 13:55, Thomas Huth wrote:
> 
> Since the build system has been converted to meson, I think the 
> configure script prefers to use the submodules instead of the distro 
> packages. I've tried to remedy this a little bit here:
> 
> https://gitlab.com/qemu-project/qemu/-/commit/db0108d5d846e9a8
> 
> ... but new jobs of course will use the submodules again if the author 
> is not careful.

Hmm... it should be the same (or if not it's a bug).

> Also I wonder whether we could maybe even get rid of the capstone and slirp submodules in QEMU now

At least for slirp, we probably want to stay more on the bleeding edge 
which implies having to keep the submodule.  Capstone and libfdt 
probably can go.

Paolo


