Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B99A14D3155
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 15:57:50 +0100 (CET)
Received: from localhost ([::1]:38778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRxl7-0001aC-7S
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 09:57:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nRxjq-0000hA-C6
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 09:56:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nRxjm-0002wX-Nt
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 09:56:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646837785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V9ZdWyX26tCAuPR80TNpSa8PTMYAyIqEcyE0pjazQ2c=;
 b=On9PAdqNmyhwy3mh2g7bli6o/7CtZL10WNI3h9o+pU/mqmVZTwDC2drhzLUK8vuBedwK42
 lWInbaK09LtytBay3ZqECSCS2YYDI59MSd9tCWxlplclyh+U1BQ9ggC4HjgVJpjpATbxUG
 TTIEOeGeMerPrRCofZ25hNVjhDAz76g=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-19-9vzKy1n0Mzex4aAXZTYglQ-1; Wed, 09 Mar 2022 09:56:23 -0500
X-MC-Unique: 9vzKy1n0Mzex4aAXZTYglQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 b24-20020a50e798000000b0041631767675so1384763edn.23
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 06:56:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=V9ZdWyX26tCAuPR80TNpSa8PTMYAyIqEcyE0pjazQ2c=;
 b=w721s1xnsXKKO1EjS2TFuDJJ8DLbXUuqcmrdVYEC3jd4FeyxFhCMtS09tIwp1UkYTJ
 JCFDuJIUuHrk18usno3Ox+DPMt5CbyC/gpBOHYrAFUiUu7bun/deZltURJRrAaa4HQZz
 iyp3O2JnOnynczPtcs9EePDM+ODDNzaLOQv6RGhvHQAW3HjEl6wxDfGoGHMcBGLVPuHR
 MSJMvueWkSxh8cW9WqtuXC8o4lKtiIhgnMcDtGCncs1CMlq0tzfUQo+AILGMUfsvfYdf
 uXVgrVMXqaBcAb83w6EB8OakD7jToiMzdVTb5xpJG0CiP4Tch9IRQUmsfHHiJJOAW7Fd
 Q9lg==
X-Gm-Message-State: AOAM531gteGYTKjvOd/X751L8XrpUuq6XINHc12vujBcK7f3i3VtjqU1
 Qc6FTrM8LxeFDQaXJfr+Wr85/fTKnUoWgDh9iGyyaprNN3TDv7PF5nAgt39goA6iXCJ5ggvHszm
 3b0vjM+gu5+p5jxI=
X-Received: by 2002:a05:6402:7cb:b0:415:f059:c817 with SMTP id
 u11-20020a05640207cb00b00415f059c817mr21494085edy.364.1646837782433; 
 Wed, 09 Mar 2022 06:56:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxswt9jt+Tef3jrUND70a8RvgcVkqUDCzSr+IOL2u4RW8XfEMMLA9LfRO1pchMo3mzmIiHxmQ==
X-Received: by 2002:a05:6402:7cb:b0:415:f059:c817 with SMTP id
 u11-20020a05640207cb00b00415f059c817mr21494064edy.364.1646837782248; 
 Wed, 09 Mar 2022 06:56:22 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 g22-20020a170906395600b006cec40b9cf0sm818506eje.92.2022.03.09.06.56.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 06:56:21 -0800 (PST)
Message-ID: <5ff007ca-863a-81f9-4f99-3a1edc4106e0@redhat.com>
Date: Wed, 9 Mar 2022 15:56:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] tests: add (riscv virt) machine mapping to testenv
To: laokz <laokz@foxmail.com>, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <35ea2e99-8049-9b72-b639-744afcdde726@redhat.com>
 <tencent_E4219E870165A978DB5BBE50BD53D33D2E06@qq.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <tencent_E4219E870165A978DB5BBE50BD53D33D2E06@qq.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: kwolf@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08.03.22 05:33, laokz wrote:
> Some qemu-iotests(040 etc) use PCI disk to do test. Without the
> mapping, RISC-V flavor use spike as default machine which has no
> PCI bus, causing test failure.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/894
>
> Signed-off-by: Kai Zhang <laokz@foxmail.com>
> ---
> Thanks for the detailed info. Corrected S-o-b tag.
>
>   tests/qemu-iotests/testenv.py | 2 ++
>   1 file changed, 2 insertions(+)

Thanks!

I’ve applied this patch to my block branch:

https://gitlab.com/hreitz/qemu/-/commits/block


