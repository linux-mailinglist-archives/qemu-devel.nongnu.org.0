Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1F44B73D7
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 17:44:54 +0100 (CET)
Received: from localhost ([::1]:55256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK0wf-0005uJ-68
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 11:44:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nK0qX-0000bt-P4
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 11:38:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nK0qR-0003Vv-75
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 11:38:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644943105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f8fiR3Fz28sHX5HyltlIXpClWiCTAMufZbT/MGbuDic=;
 b=P3dI046W4vRQ0/fMuED0e7bRevDHA8U/HlSVCdE7LgwXfy1s1JQYGM7Vy8fi7OO+s2ysVh
 JnflfaoS02PGIjtCTbccehgMorLEwDnTiaI8RRzdd3MR6TYR1hgrFl1LH6ohIMulSa+tFv
 1MZApR0PwO735YHJSgKdUBRid6L/Lzw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-500-R31SgL9MNjWXnPo0vr2Teg-1; Tue, 15 Feb 2022 11:38:23 -0500
X-MC-Unique: R31SgL9MNjWXnPo0vr2Teg-1
Received: by mail-wm1-f72.google.com with SMTP id
 h82-20020a1c2155000000b003552c13626cso1677854wmh.3
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 08:38:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=f8fiR3Fz28sHX5HyltlIXpClWiCTAMufZbT/MGbuDic=;
 b=fGml93xKVdOEc5ukyfDdk7MrfA+mWE5Ndy0oZRijvgkVO/BP1owlejb2Sp7x5TfouR
 lb3J6l5g0oUzW5GyzOJr4glICO2xr73C3MlSnAIG6RAo8wjBkahaW6/HBvdzwPjDMymP
 /K1lPg9tDpFzZSphrkdtGGIUnKE8I6w58ESra1MvgzJzgtsI2UsAtw8cIRWiPEku1wgV
 wrGJtdUfLjOHHnzjwqRb4jVvCjn/KSL1b6E6l0fgEFrunyw89RmizzdvFqRNjFuR6oBv
 ITqhNcukntAz4RYIoeMz25L+JhBE3c6xGBgNQsZocc6S5u6ncYH+Dlgk5KmGoQr5RaWZ
 vKxA==
X-Gm-Message-State: AOAM533Kj/H4aBx5gJg9sG97iLUiUkbWvTmpgiYeCaiaHpijSvP5ZM0M
 YPSDdqVUl4Miynesii92X5zqr8YjJ0tYhIxjGd9g/5UChBIo5WVvXzmEQfK2smpRPNrmIp7zQk5
 s83RawdjZx/evu08=
X-Received: by 2002:a05:600c:692:b0:37b:c64f:a66d with SMTP id
 a18-20020a05600c069200b0037bc64fa66dmr3761448wmn.165.1644943101981; 
 Tue, 15 Feb 2022 08:38:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwJY66NZ2bMbcjxlW1R5IUfON7nBnLk42UEN/+ic3YEDOz3tPT3coywbU753vDnfkQE25NJ3w==
X-Received: by 2002:a05:600c:692:b0:37b:c64f:a66d with SMTP id
 a18-20020a05600c069200b0037bc64fa66dmr3761428wmn.165.1644943101727; 
 Tue, 15 Feb 2022 08:38:21 -0800 (PST)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218])
 by smtp.gmail.com with ESMTPSA id d7sm18895050wmb.18.2022.02.15.08.38.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Feb 2022 08:38:21 -0800 (PST)
Message-ID: <ca589020-564d-18d1-6526-8a624c4fe154@redhat.com>
Date: Tue, 15 Feb 2022 17:38:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Possible end of Ubuntu LTS 18.04 as a build target in 7.1 ?
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <Yguz2GtTm+oEN0rI@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <Yguz2GtTm+oEN0rI@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Samuel Thibault <samuel.thibault@ens-lyon.org>,
 David Gibson <dgibson@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/02/2022 15.08, Daniel P. Berrangé wrote:
> Per our platform support policy
> 
>    https://www.qemu.org/docs/master/about/build-platforms.html
> 
>    "The project aims to support the most recent major version at all
>     times. Support for the previous major version will be dropped 2
>     years after the new major version is released or when the vendor
>     itself drops support, whichever comes first."
> 
> In April this year, Ubuntu LTS 22.04 will arrive, which means the
> "previous" release will then be considered to be "LTS 20.04" and
> thus "18.04" will no longer be in scope for what we aim to support.
> 
> It is possible that this might enable us to assume newer versions
> of some software we depend on, but I've not analysed the situation
> yet. This would apply from start of 7.1 development cycle if any
> min version bumps do appear relevant.

What I really would like to see: Could we get rid of some of the git 
submodules, since they keep being a pain from time to time. Could we get rid 
of the capstone submodule? libslirp? dtc? ... but this needs some careful 
checking first, of course.

> When we previously had 16.04 fall out of scope for support, we had
> a roadblock in bumping min versions. IIRC this was due to various
> machines in the compile farm Peter used for merge testing not
> supporting anything newer.
> 
> I don't have a good understanding of what machines are used for
> testing now, so I'm wondering if we're going to hit any kind of
> similar issue if we try to drop 18.04 support ?  If so we might
> want to start thinking about our options now.

I think the most difficult part are maybe the custom runners in 
.gitlab-ci.d/custom-runners/ubuntu-18.04-s390x.yml ... who has access to 
that system and could try to get these updated?

We've got some more few occurances, e.g. in .gitlab-ci.d/opensbi/Dockerfile 
and in .gitlab-ci.d/containers.yml ... but that can be done by anybody who 
knows how to use the gitlab-CI.

And there are still some jobs on bionic in .travis.yml - but I can take care 
of those.

  Thomas


