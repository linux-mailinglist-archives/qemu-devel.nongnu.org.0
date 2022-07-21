Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4355857C5DE
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 10:11:14 +0200 (CEST)
Received: from localhost ([::1]:40524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oERH6-00010A-3L
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 04:11:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oER7t-0004Cv-T1
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 04:01:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oER7m-00023u-Aj
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 04:01:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658390492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/IW71wUrfZLXnMRjULL1TwmzPEm4imjPPRGNu0hePH4=;
 b=Ft1u+fbnuD38dX8qlr0+kGMJIcOmEegSJNxS12QtRYi5ckruMEYVB2xLiDgwEirtOJ1UJ/
 xupu+wjFE4YneBXXTtnAVzuFquXmE896MiSrzi347l41IerPifdR9tXmKy9h8PvZsj1x9K
 8daMZ9ReqgkZByPyC5N3Id36ZywHHKs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-122-7OhCcaCXMxOSaV6eCgQs1Q-1; Thu, 21 Jul 2022 04:01:31 -0400
X-MC-Unique: 7OhCcaCXMxOSaV6eCgQs1Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 v123-20020a1cac81000000b003a02a3f0beeso2465977wme.3
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 01:01:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=/IW71wUrfZLXnMRjULL1TwmzPEm4imjPPRGNu0hePH4=;
 b=EFJKtLydgo0UsFkz58KvHQ50V0S+OkBnCgn2BK6iv9/zpmZhb4drdDX92PrZfLkrbD
 c5e5cOwVm+ul0kEB+ljrXarXW2DCwu6fNaXYSbYHZB3q7M9Bbs6VCkYc86KLkRrbIJbz
 Bq11OT9GAiBkgcY+yKb8ytlIfZO6PsxPqJglTskmGaKa4nF7InjaO6smh2bizRdIMtrR
 RSM3X8s+BJo6r4x0QRKTC6RIsTt/2cOy6NMIwkPWItO9fM8W9922QH8iPbrwQXcM4gk9
 Lwu6hsTllVAGWpMtiy58N2CeiBblWQEsnqfDNlhcgA7vuIYfmC2/3eMxIJeOH9X4yzck
 A65A==
X-Gm-Message-State: AJIora+8XPvii+eispq5Y0VZ727qohBgKeVW1l+m1JHFPjUu+Q8B5Q8n
 VUiAvSaHtnvIhWrVNWjZqNnHETJMxhGZI38mPbtgSZY8Z2icxENsr4HFDOLQYq2arbVQFDX2BdJ
 FeYCpGMY0b7kNrlk=
X-Received: by 2002:a05:600c:3ac4:b0:3a3:19c5:7cb2 with SMTP id
 d4-20020a05600c3ac400b003a319c57cb2mr7091873wms.63.1658390489928; 
 Thu, 21 Jul 2022 01:01:29 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vT3r3YkntiCFjHpd032Zg9RYHxl2LMfE5s/VrskYFE9QvBa14Uam7CJ94NC259BVA6KtJqxw==
X-Received: by 2002:a05:600c:3ac4:b0:3a3:19c5:7cb2 with SMTP id
 d4-20020a05600c3ac400b003a319c57cb2mr7091855wms.63.1658390489631; 
 Thu, 21 Jul 2022 01:01:29 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-179-217.web.vodafone.de.
 [109.43.179.217]) by smtp.gmail.com with ESMTPSA id
 q13-20020adff78d000000b0021d69860b66sm1406104wrp.9.2022.07.21.01.01.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jul 2022 01:01:29 -0700 (PDT)
Message-ID: <44dbc8f7-0216-c92d-95e4-98ae73216427@redhat.com>
Date: Thu, 21 Jul 2022 10:01:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Ed Maste <emaste@freebsd.org>
References: <20220720165159.2036205-1-berrange@redhat.com>
 <20220720165159.2036205-2-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 1/3] tests: refresh to latest libvirt-ci module
In-Reply-To: <20220720165159.2036205-2-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/07/2022 18.51, Daniel P. Berrangé wrote:
> Notable changes:
> 
>    - libvirt-ci source tree was re-arranged, so script we must
>      run now lives in a bin/ sub-dir

Sentence hard to parse for non-native like me. Maybe better:
"... so the script that we must run lives now in a bin/ sub-dir" ?

>    - opensuse 15.2 is replaced by opensuse 15.3
> 
>    - libslirp is temporarily dropped on opensuse as the
>      libslirp-version.h is broken
> 
>       https://bugzilla.opensuse.org/show_bug.cgi?id=1201551
> 
>    - The incorrectly named python3-virtualenv module was
>      changed to python3-venv

I can see that e.g.  py39-virtualenv is dropped from the freebsd.vars files 
now ... but no py39-venv package is installed instead? Is python3-venv 
installed there by other means (dependencies)?

>    - glibc-static was renamed to libc-static, to reflect
>      fact that it isn't going to be glibc on all distros
> 
>    - The cmocka/json-c deps that were manually added to
>      the centos dockerfile and now consistently added
>      to all targets

s/and now/are now/ ?

Apart from the nits:
Acked-by: Thomas Huth <thuth@redhat.com>


