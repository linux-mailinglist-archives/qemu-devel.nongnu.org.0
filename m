Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B94044590A6
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 15:57:31 +0100 (CET)
Received: from localhost ([::1]:56460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpAl8-00033B-6j
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 09:57:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mpAio-0000Tm-ML
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 09:55:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mpAil-0006u2-Gd
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 09:55:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637592901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hdudmNrUP3qDcSxDmdPAFqNl0U/7WxgN31aB0x4iiWc=;
 b=gbUeSHGMqRqxtdxZnyrv6S0+CVZqTwre2+XuS2R8JT41kYqKcaJPzQM4J8fd7fdahT5ThP
 4cNHWC42nsuxcebk55/En+i8mrLMY3REzOTZykdYivz1HE2M1I9io9ame22j+LfM2tDFdi
 m3EJPl+wkgQJ5IKBDnqRl89/49Uu4UY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-331-pWKNgCwKP6yCjztU3XyOYA-1; Mon, 22 Nov 2021 09:55:00 -0500
X-MC-Unique: pWKNgCwKP6yCjztU3XyOYA-1
Received: by mail-wm1-f72.google.com with SMTP id
 g11-20020a1c200b000000b003320d092d08so6908738wmg.9
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 06:55:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hdudmNrUP3qDcSxDmdPAFqNl0U/7WxgN31aB0x4iiWc=;
 b=qXdZqUHdoXCeMkDlFiF+4kOOzUNjeKVDi0jcUSWHOede++4KBpkhMYpuSiKQcsYbOn
 icpIGOSLCWDlv7CLaa8pf1sltmMZqlCIX6/6voW13lpngR2bOn6vomuTUHFcrJXVZVmU
 LCSIqqq9XxCFMm8Hr5SLLluFinvMQ5Jv+v8RusUqE29/e/yPF4rQh4kzyWtrSjyMdtDO
 oLkglRep7LpfMShzMNU8YfKVldfj0TKxNz/GdHREW7osQuLrK53aNBkF8+iD8ZC5vV7V
 JXJr/zCnZ8ZY0EnFS+ZjtJ9r2zdP/NTty+H8g8SXPFVhKaVInCJW7VsTNHhH2a7y5YrK
 lXNA==
X-Gm-Message-State: AOAM531/0B4Bgi14RF1NFwOolnuyH1LXSCQ0vn7FYKHFXc8NXsCC7S/5
 q5+kg855oXHvY2RjJgpEkEjbnA376Wa9vt3J3fkar0apRZ5Fx33u0ZwoulsfkejuFi7lXvyvJgA
 DTOqLb5/4J/VgIHFtgtRs+X4bkvtEDKQjyTiB95YH9qTw+gVu+eB/3Z49j9spCypo
X-Received: by 2002:adf:f947:: with SMTP id q7mr37781801wrr.260.1637592898643; 
 Mon, 22 Nov 2021 06:54:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyM0RECJufpIOKuls+RlPR3/j2vsLTlO7jfWYa/B6V+02Eu3L35xgBvci1PDuUoSMpIr+qjSA==
X-Received: by 2002:adf:f947:: with SMTP id q7mr37781746wrr.260.1637592898311; 
 Mon, 22 Nov 2021 06:54:58 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id p12sm10773919wrr.10.2021.11.22.06.54.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 06:54:57 -0800 (PST)
Message-ID: <a67ccbe8-7701-ee38-5e5c-a65f60f33f20@redhat.com>
Date: Mon, 22 Nov 2021 15:54:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH-for-6.2 0/2] hw/block/fdc: Fix CVE-2021-3507
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <20211118115733.4038610-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211118115733.4038610-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Prasad J Pandit <pjp@fedoraproject.org>,
 qemu-block@nongnu.org, Darren Kenny <darren.kenny@oracle.com>,
 Alexander Bulekov <alxndr@bu.edu>, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping for 6.2?

On 11/18/21 12:57, Philippe Mathieu-Daudé wrote:
> Trivial fix for CVE-2021-3507.
> 
> Philippe Mathieu-Daudé (2):
>   hw/block/fdc: Prevent end-of-track overrun (CVE-2021-3507)
>   tests/qtest/fdc-test: Add a regression test for CVE-2021-3507
> 
>  hw/block/fdc.c         |  8 ++++++++
>  tests/qtest/fdc-test.c | 20 ++++++++++++++++++++
>  2 files changed, 28 insertions(+)
> 


