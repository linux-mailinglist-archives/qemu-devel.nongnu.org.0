Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4FC682BF7
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 12:55:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMpCv-0005yc-L0; Tue, 31 Jan 2023 06:53:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMpCs-0005u4-T4
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 06:53:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMpCr-0002Jc-3m
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 06:53:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675166024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UMtLtw4bZitRLpz4aB9ZadoTplKfC9R0HdmDuk5y61Q=;
 b=LmmHTBQ7rR8pIzoLjwRjnezJs3CoacvC1+XT7bdlKH2yAZSz7yyXRABN0Lfflqt1y9xxwp
 p7ZB1NsvoOHZKeyPWlpv0tPr1asZ0DKt6c0iYyGieiNJLG6bzHnSYQoBBb5kvy6+OiRtFu
 nV+n7mz+tzbl/q2j9iQwXgA4gkhOdMw=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-140-iRKfjxR3OKaiQAViptjVZA-1; Tue, 31 Jan 2023 06:53:43 -0500
X-MC-Unique: iRKfjxR3OKaiQAViptjVZA-1
Received: by mail-qt1-f200.google.com with SMTP id
 f2-20020ac80682000000b003b6364059d2so6378202qth.9
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 03:53:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UMtLtw4bZitRLpz4aB9ZadoTplKfC9R0HdmDuk5y61Q=;
 b=aI6+TrEMzSCGqkIY0z6uVbxPKaFu+cyvvPdQG0UC7pbxohvwKCFQPyIoMOBJMSnrSY
 uovjvnvIEDmroSLJpOIi4icIiWiN3U9vpOA6N/IzmcLyA/42N4uqFmehctAHw/mGE9vc
 Xsgfo/xxlh57UeCtN5mjbXB+v63YYlvyngmbQkfSIwnsQcoJGOzsK7W4RFfHrYEXOmfz
 TwdkYziT9tSVIKchw6rTGHBJ0FOTylrcjMG2cmR3ijB2HFIeSrhFNomB9tj2Bmp8HO8y
 cPM2h/0xobct8pi3rF97ijM3tvExQ+FYMGNwTr7Mrwn+xGuG8cL8ZCaOgFebyeb3ORTh
 WdNQ==
X-Gm-Message-State: AO0yUKWEoB05bHbqzBR5dlP5ci7Nbfnn3sDVSd6HzvwLM1unEyOIy+PH
 YC3e8tsgMTQD9qcoaYJlVM4+lQCjFQl434M/vw5TUtjsYnnTYT9k9Ft2m826h9ASWOFiTMi9qh5
 xHs6TbyLqTOpjq0Y=
X-Received: by 2002:a05:622a:1708:b0:3b8:1f30:f49d with SMTP id
 h8-20020a05622a170800b003b81f30f49dmr29793475qtk.66.1675166022629; 
 Tue, 31 Jan 2023 03:53:42 -0800 (PST)
X-Google-Smtp-Source: AK7set8qlpz1ycpif36I7E9I2hKH2C7DRKpV4Yv2BuMDRbo0UoGqaAg7Zsyb243YFBin93h6F9Rbrw==
X-Received: by 2002:a05:622a:1708:b0:3b8:1f30:f49d with SMTP id
 h8-20020a05622a170800b003b81f30f49dmr29793429qtk.66.1675166022374; 
 Tue, 31 Jan 2023 03:53:42 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-155.web.vodafone.de.
 [109.43.176.155]) by smtp.gmail.com with ESMTPSA id
 b2-20020a05620a0f8200b006f9f3c0c63csm701558qkn.32.2023.01.31.03.53.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 03:53:41 -0800 (PST)
Message-ID: <a5359977-a5cc-2a51-9d77-160c179b6218@redhat.com>
Date: Tue, 31 Jan 2023 12:53:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v5 5/9] tests/qtest/e1000e-test: Fabricate ethernet header
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
 <20230130140809.78262-6-akihiko.odaki@daynix.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230130140809.78262-6-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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
> e1000e understands ethernet header so fabricate something convincing.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   tests/qtest/e1000e-test.c   | 17 +++++++++++------
>   tests/qtest/libqos/e1000e.h |  2 ++
>   2 files changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/qtest/e1000e-test.c b/tests/qtest/e1000e-test.c
> index b63a4d3c91..98706355e3 100644
> --- a/tests/qtest/e1000e-test.c
> +++ b/tests/qtest/e1000e-test.c
> @@ -27,6 +27,7 @@
>   #include "qemu/osdep.h"
>   #include "libqtest-single.h"
>   #include "libqos/pci-pc.h"
> +#include "net/eth.h"
>   #include "qemu/sockets.h"
>   #include "qemu/iov.h"
>   #include "qemu/module.h"
> @@ -35,9 +36,13 @@
>   #include "libqos/e1000e.h"
>   #include "hw/net/e1000_regs.h"
>   
> +static const struct eth_header test = {

No need to respin, but in case you do it anyway: I'd suggest to use a 
different name here instead of "test". Maybe "testdata" or "test_hdr" or 
something like that?

Anyway:
Reviewed-by: Thomas Huth <thuth@redhat.com>


