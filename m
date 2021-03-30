Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9405E34E73E
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 14:13:19 +0200 (CEST)
Received: from localhost ([::1]:51372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRDFG-0007bE-LA
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 08:13:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lRDCV-0006YJ-Or
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 08:10:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lRDCJ-0003bx-0v
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 08:10:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617106213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hKagbKOxP5oaTqz+Vs8R6T/pDkAumw5vSVCgysNW1Mk=;
 b=aqF768p0fIwPckh4anTGpsVHaQBxuqXS0Q1TLPgcxx0l79lt5UaHmqVioMDcuCkURHbWvB
 v4q0YWhyKo9vZSJhE1eWENnMr2ga52e9zNcWgjXQlzRmSMqRaPKwROyhZ23JJsb26EiJyn
 syK2P3iP6djbzLugncclgmX9qp8Hq/A=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-S4zwVBWYPz2e42xT7ukXlg-1; Tue, 30 Mar 2021 08:10:11 -0400
X-MC-Unique: S4zwVBWYPz2e42xT7ukXlg-1
Received: by mail-ed1-f70.google.com with SMTP id f9so10079044edd.13
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 05:10:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hKagbKOxP5oaTqz+Vs8R6T/pDkAumw5vSVCgysNW1Mk=;
 b=TIR2ao7AqKXM1re0QqgP6ND5K7H42EdP2kXYsLgSQSa8m4zvtMrZk9P4+tTRdDiwdh
 Lqdlznks/AXaxHXBBikh41U5OhNltiBIo4NwSxP9dqbNdKIl4whbB4AUsrnzSTBgN12U
 Y7MMJZxL1DRCayeUwjSgWptT3yTMoLYx5m09dxzu1pMsUGyLp4kXEq9SghIJhHWnCwca
 WwgIOTvm0mN+XwSh5wz7yMJjIaHqiEvoQqL8C3UViwCIxfNN+NjYdSendZLyQuTcgZPw
 DFtJ3OesY6LXylUiO81tcAoDGGH1ftqsMbua8cAi+uHxIpE72TN2CVN+ABpsDyon8Bwo
 9xOw==
X-Gm-Message-State: AOAM532ZOV2Tx1McjZ+iGP08FfDdlGQ5y82FRI5zrVhk441i4t+RpuXL
 Xqi955iISIQ/VwZv8M0rh94iQE7QwJjRm4SECVIUy8L4AG0/vOcykssblFc+tEWUJBE8DhoIm8a
 umxxEXuyKj4uUOkM=
X-Received: by 2002:aa7:d492:: with SMTP id b18mr33135516edr.381.1617106210415; 
 Tue, 30 Mar 2021 05:10:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrChG7VTHSDsk6BZk2qLJonqXaY5aoOhjy3ufnHoWGaeW0Go2awE8GxPWKzH30/vs1g3ZGdQ==
X-Received: by 2002:aa7:d492:: with SMTP id b18mr33135482edr.381.1617106210236; 
 Tue, 30 Mar 2021 05:10:10 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id q16sm11307188edv.61.2021.03.30.05.09.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Mar 2021 05:09:59 -0700 (PDT)
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
Message-ID: <f1541cc0-0fdb-cbe0-2505-9ade88c061c0@redhat.com>
Date: Tue, 30 Mar 2021 14:09:57 +0200
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
probably can go, though at least libfdt may be more useful on Windows.

Paolo


