Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1152F0EAA
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 10:03:07 +0100 (CET)
Received: from localhost ([::1]:57944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyt6P-0003vq-Qx
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 04:03:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kyt5D-0003SR-1u
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 04:01:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kyt5A-0004cf-NE
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 04:01:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610355707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8sd793Nmvm5Kbui6ZNKFNACfdcbytpDFpNSeW8IBnwk=;
 b=BAggT1ywhgIL3wj+yySkALWBN5rEOe0mGvG6krdw1LAobLcu5/0nNhenIZeJKodhaIdvCj
 HpA1FARAMAyfeHKUvIVVkdLVOVoNHyWgZqGZ5NXz/OV8QyyYZ8IGR0E2FVfTkglB8qD//6
 6rGy9hSkxuhghkfgn8hmXVuSxU6nL0U=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-xIbVyUYqMuizAFUsXVPRyA-1; Mon, 11 Jan 2021 04:01:41 -0500
X-MC-Unique: xIbVyUYqMuizAFUsXVPRyA-1
Received: by mail-ed1-f70.google.com with SMTP id x13so8019414edi.7
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 01:01:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8sd793Nmvm5Kbui6ZNKFNACfdcbytpDFpNSeW8IBnwk=;
 b=P0/di0incA4tiBIvhXJ8VagxTnCBh5WCsQ7BMvbFoM9RhN1VSQlLcFtHOtJ8tmR9O/
 y5iGyxGWEaUkqT2PRSfKXNh/k02mOVKF1cVM/3pG7djFtd3M+cSo7QXcbF7MZM3zcYqQ
 eBdjCIX/utV4Fep9tQH3DUYmiQBmMLaSb1+feegVsReEnh1WOq2jOaa4F7idSyE/fg2K
 7jgGq1pC88zRRyPakQAh7fy+cyZsnhE9rkyEHtmJqrT8Zum3YNpSimBz0x0pu4NLHQtt
 UjxLLGZSINp6lixmhBCyfDMHAF4/b0el3rl5wdO687w5zw7nd4n6sl2YZyU3FURWqdX/
 mJMA==
X-Gm-Message-State: AOAM5322XRwNBwI7WaR4cdUriQ07I+v/bHKBQYo3o2QXfx4kQ2sDohQo
 h/R3gd1XY5nYkyT5Dqw5cVXvYhhMzoNXkrWLYc23482cGlAdLlatOsNyVB8Ej+FDgZKx66L+dok
 CpmqdvJRuwK1P0XE=
X-Received: by 2002:a50:9f4a:: with SMTP id b68mr13199309edf.296.1610355700266; 
 Mon, 11 Jan 2021 01:01:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy1USijj+klIXRDdcNg32AOB7oGnOryccpBElHyNp1qNS9mQZG28IvLkGhvnpo6r3/O3uoJrQ==
X-Received: by 2002:a50:9f4a:: with SMTP id b68mr13199295edf.296.1610355700087; 
 Mon, 11 Jan 2021 01:01:40 -0800 (PST)
Received: from [192.168.1.36] (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id m7sm6816352eji.118.2021.01.11.01.01.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 01:01:39 -0800 (PST)
Subject: Re: [PATCH v8 5/7] fuzz: set bits in operand of write/out to zero
To: Qiuhao Li <Qiuhao.Li@outlook.com>, qemu-devel@nongnu.org
References: <SYCPR01MB3502FA4DB12C240DD3CFF1E0FCAB0@SYCPR01MB3502.ausprd01.prod.outlook.com>
 <SYCPR01MB3502C84B6346A3E3DE708C7BFCAB0@SYCPR01MB3502.ausprd01.prod.outlook.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d3294c04-28c5-470a-d011-80dc975c7a62@redhat.com>
Date: Mon, 11 Jan 2021 10:01:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <SYCPR01MB3502C84B6346A3E3DE708C7BFCAB0@SYCPR01MB3502.ausprd01.prod.outlook.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.012, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: thuth@redhat.com, alxndr@bu.edu, darren.kenny@oracle.com, bsd@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/11/21 7:11 AM, Qiuhao Li wrote:
> Simplifying the crash cases by opportunistically setting bits in operands of
> out/write to zero may help to debug, since usually bit one means turn on or
> trigger a function while zero is the default turn-off setting.
> 
> Tested Bug 1908062.

Please use the full link as reference:
https://bugs.launchpad.net/qemu/+bug/1908062

(since this series is fully reviewed, can the
maintainer applying the series do the change
in place?)

Thanks,

Phil.

> 
> Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
> Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
> Tested-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>  scripts/oss-fuzz/minimize_qtest_trace.py | 39 ++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)


