Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC362F48AB
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 11:31:38 +0100 (CET)
Received: from localhost ([::1]:42620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzdRC-0008GJ-2i
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 05:31:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kzdPC-0007hr-7z
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 05:29:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kzdP9-0005J0-D7
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 05:29:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610533769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c/ls0Z+a+Ec7JAlHy5N534ojP9fA2VHRqXZDSvGfmmg=;
 b=KpSBNkmrFxJLFpHCFPUWxKXsG4jJYDLZHB+wfszGz0C59k5kCCbk6I+oC07NTtwA3DxshH
 yNSETG4t1MbzasA3bWOFcecUuSHcWu12xOAaXeszpAtsAgc4tdWANj5o2UJZ5M8qtOrqb0
 zyCN0s++3R8lx/f4TmnC02McO//Uj8I=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-KZ7q6KIDPmaYL6R1V_LkfQ-1; Wed, 13 Jan 2021 05:29:26 -0500
X-MC-Unique: KZ7q6KIDPmaYL6R1V_LkfQ-1
Received: by mail-wm1-f71.google.com with SMTP id r1so614179wmn.8
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 02:29:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c/ls0Z+a+Ec7JAlHy5N534ojP9fA2VHRqXZDSvGfmmg=;
 b=mELzICn44GeI68LTEXkg84wsARH2dPNgvn2DmKPiAn4dHBtur8upZO+2c8iQYEvm9A
 tME6ZRsZP8I1oRccoJLXwHSUwc6wQYWUni03WRKM9DPEQ3JBV2FJ5uVNkf+AWSTTKsJk
 +x8LTCMecob2SxuOq1B0aiMgIWjWpyRbPp+UfKuKuQXEmAPV2tt5DI3sqvgBVfCleffG
 IgT9aP019C7E7v2W3OryGuPQYLN1YbE2Oabrl3dhjDrkd7bfmB3qoMM0ff/uXHnXCF/O
 TEmR+kdDozBVYv+PNj1AEFtRSHfGvCeUTMYiKoifIFHUNiZS6eouNEX1kF/TeFM+QP/t
 VggQ==
X-Gm-Message-State: AOAM531voHYYx1pHM4bhPXViyFKGc9p5qcg2pGLTqnwsWwjCABkK49eX
 4tGl/yW52Ir9PjUKSl3AtY7KBwdKJbLCrHp6psO7QMsz8aO3IamxD5rhOYjgac27hFxxlmSbKf2
 UCak7GN556LD11mQ=
X-Received: by 2002:adf:e590:: with SMTP id l16mr1858531wrm.294.1610533765539; 
 Wed, 13 Jan 2021 02:29:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzJ3meH4epoyc5zCRAQTZhLqAmwrtRhnueF+l+ATaTN/PhXVMVYudlBFcfIYYS2asc6zZbJnA==
X-Received: by 2002:adf:e590:: with SMTP id l16mr1858509wrm.294.1610533765330; 
 Wed, 13 Jan 2021 02:29:25 -0800 (PST)
Received: from [192.168.1.36] (190.red-83-57-173.dynamicip.rima-tde.net.
 [83.57.173.190])
 by smtp.gmail.com with ESMTPSA id l8sm3111021wrb.73.2021.01.13.02.29.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jan 2021 02:29:24 -0800 (PST)
Subject: Re: minimal "zero conf" build dockerfiles for fedora:latest and
 alpine:latest
To: Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <a2f5077b-ae74-2b39-4fb8-70d29dd549eb@redhat.com>
 <a56f2df6-867e-2542-734c-95c1ae3acf88@redhat.com>
 <6a08e9f5-7cd7-c2c8-4b61-5466a4ffb2ec@redhat.com>
 <20210113100956.xuyvmxayh5xytja3@sirius.home.kraxel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f6157834-98d7-a49b-9cf9-87c2b15c2a81@redhat.com>
Date: Wed, 13 Jan 2021 11:29:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210113100956.xuyvmxayh5xytja3@sirius.home.kraxel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/13/21 11:09 AM, Gerd Hoffmann wrote:
>   Hi,
> 
>> I don't like Perl really, but there's a chicken-and-egg problem between
>> detecting Python and using it to print the configure help script.  For
>> configure-time tasks, Perl has the advantage that "#! /usr/bin/env perl"
>> just works.
> 
> Assuming perl is actually installed, the world seems to shift to python.
> On a minimal fedora install python is present but perl is not ...
> 
> On the other hand git depends on perl, so it is probably pretty hard to
> find a developer workstation without perl installed, so maybe that
> doesn't matter much for the time being.

There is also the new configure-parse-buildoptions.pl script Paolo
wants to add:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg770651.html


