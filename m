Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA6E682ED8
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 15:08:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMqlT-0002Ny-7W; Tue, 31 Jan 2023 08:33:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMqlN-0002Nf-Ox
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 08:33:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMqjM-0003LJ-Ty
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 08:33:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675171862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0rcboJX1LLyLwocjNY3NMOsvRKfcY9kjAvaL20dmuyQ=;
 b=akPrRy3HkC3oTnhvAUAIB+LYdo9eZSshPagke6GBv9sBiNtCnneta8TvG+Sy3kCI5MEpwa
 c4SRD2AuCDoZUty4InF66fBoeHxObhO8AQwsrKiBF7RG7N/mPlZbLTHxr8H2Rer6/FVxMr
 1cYjZAKJym9YEEeuHiS9PuFnmCfHiE8=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-222-FWFuglaMM0mKyqaaUL_ObA-1; Tue, 31 Jan 2023 08:04:53 -0500
X-MC-Unique: FWFuglaMM0mKyqaaUL_ObA-1
Received: by mail-yb1-f198.google.com with SMTP id
 i17-20020a25bc11000000b007b59a5b74aaso15989440ybh.7
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 05:04:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0rcboJX1LLyLwocjNY3NMOsvRKfcY9kjAvaL20dmuyQ=;
 b=n4d2zRSZ5ewFERGRiB3WM/25ppS735CQAAPF+3ykyfdTeN0WCTGRaOHJbv7zxAPj77
 D51bnhxBuNi3KyqiwlkE0Mzc47FHY83J5Gp+JaKXZ7vz0RdFhfQO5LCryM/C3vWVtIQY
 ipuMrdC0BALG5HowacztDtVg42xpMkc1V1v6Guz/2hriSMwz2GSE396fqeTfuKdbSMz3
 fX7qHsGOxCAogpeU1SHIqkO9y3Bb7rQYRHJoK6uJVS/8vUSPijkgByIhXRmaTVZsLM5f
 Qg+gyXxScyPp4FKVrwWiheyqeTTObqx1uL4rosfU5Jf7GmWpEnXNnv5t2Q3HhtUqZNxM
 xhRA==
X-Gm-Message-State: AO0yUKUxs1NF+I0aEtM/s2HPATas7oD5Aa1QbFY983uGCR29kuJcu07C
 Y714tArA7SVb1T/abzcqAJ0QAtaqfH+0hM/jEeCF9040UbaGrEdiLUx/t8IzvCaFrlSTxf0mmW8
 pygopJfwNjMteVf0=
X-Received: by 2002:a81:9c4f:0:b0:51d:efdc:ff5f with SMTP id
 n15-20020a819c4f000000b0051defdcff5fmr531160ywa.11.1675170293280; 
 Tue, 31 Jan 2023 05:04:53 -0800 (PST)
X-Google-Smtp-Source: AK7set85XJK1196FG0htFOQlpJtScobjZiuMZQ0hWsyyzrj0AmkKtQSN6PvP67QBc8gVis12kZjNGA==
X-Received: by 2002:a81:9c4f:0:b0:51d:efdc:ff5f with SMTP id
 n15-20020a819c4f000000b0051defdcff5fmr530785ywa.11.1675170288123; 
 Tue, 31 Jan 2023 05:04:48 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-155.web.vodafone.de.
 [109.43.176.155]) by smtp.gmail.com with ESMTPSA id
 b6-20020a37b206000000b00718e853f83csm8128836qkf.106.2023.01.31.05.04.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 05:04:47 -0800 (PST)
Message-ID: <56c0e734-ae48-f98d-2d1b-4957f4de243b@redhat.com>
Date: Tue, 31 Jan 2023 14:04:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Darren Kenny
 <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, devel@daynix.com,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Gal Hammer <gal.hammer@sap.com>
References: <20230130140809.78262-1-akihiko.odaki@daynix.com>
 <20230130140809.78262-8-akihiko.odaki@daynix.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v5 7/9] igb: Introduce qtest for igb device
In-Reply-To: <20230130140809.78262-8-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 30/01/2023 15.08, Akihiko Odaki wrote:
> This change is derived from qtest for e1000e device.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   MAINTAINERS                             |   2 +
>   tests/qtest/fuzz/generic_fuzz_configs.h |   5 +
>   tests/qtest/igb-test.c                  | 243 ++++++++++++++++++++++++
>   tests/qtest/libqos/igb.c                | 185 ++++++++++++++++++
>   tests/qtest/libqos/meson.build          |   1 +
>   tests/qtest/meson.build                 |   1 +
>   6 files changed, 437 insertions(+)
>   create mode 100644 tests/qtest/igb-test.c
>   create mode 100644 tests/qtest/libqos/igb.c

The igb test code still looks very, very similar to the e1000e test code ... 
would it be feasible to extend the e1000e code to support the igb device 
instead of duplicating the code base here?

  Thomas


