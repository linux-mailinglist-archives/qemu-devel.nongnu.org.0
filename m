Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E421E50853E
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 11:53:44 +0200 (CEST)
Received: from localhost ([::1]:47362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh71r-0001jl-OW
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 05:53:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nh6yx-0008Rq-7V
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 05:50:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nh6yt-00009N-SU
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 05:50:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650448239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xv8402LDxor12nVki9nmsAHMSsUKPlh+18vYXDWtsYU=;
 b=jH76hF1XtPL8+62Lvx/NCCdZ313ulwxQS9RPOsTJLwDo74BJfZg+zdFOCuVg/904mVvRdZ
 1uWXuRGKViKyEYVJ2ZgyERHalduU0v9/zvbrw5yO9SdLzF6UiRXz8nOcbjaKTOnWgoQUOj
 frj9Y9oi+muZ43fw2Afn/lYKmnDzUj4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-344-hMueCPU6O3CFyeysq3ewZw-1; Wed, 20 Apr 2022 05:50:38 -0400
X-MC-Unique: hMueCPU6O3CFyeysq3ewZw-1
Received: by mail-wr1-f71.google.com with SMTP id
 m17-20020adfa3d1000000b0020aaff06d3bso242578wrb.22
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 02:50:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Xv8402LDxor12nVki9nmsAHMSsUKPlh+18vYXDWtsYU=;
 b=t40sZ6hdUzDNUqBnO35aK5IfJcsx5y1VR70bV7mN93Su1K2pW7d1VUdVP2I9dE3ngr
 wrO8AlesveD/WVgJiNATB2aqLhvkY3spmFT+pfkeKQXcNFbpNCta7NGDOrCHGet2xLHn
 R1hVALBm2eO03a6AlGMxrSG0ml+W0GI1fs0TSAqGD6QKU/ssxsNZibazSxFoc5KKGGSf
 BUHq634OX3bSQc6KgQrFVtnhhcHXYwLWNcyRIWl3FXYUdKJfchpkLd+U6y3tzo4PQ2yd
 WjkpK07v+ZHe3t8yxj5/81yq1mb1B038668at0+friYeXFoAxR0wRBWQ+9eeaq5yfLZc
 uxFg==
X-Gm-Message-State: AOAM53387655cetoHwBc9DZCZp+9NoX97db/+6ulOhqula+46ARkGqy6
 Lkq1XYr1BcRtX1owdCIY7zUPZD0ayPX+Yru1ptORV6mo9CkspFk51znBE+mw3bnEIL+tFHElJyJ
 9S0aI9SAtizKw+lo=
X-Received: by 2002:a05:6000:18f:b0:207:a3ea:4a42 with SMTP id
 p15-20020a056000018f00b00207a3ea4a42mr15188669wrx.147.1650448237048; 
 Wed, 20 Apr 2022 02:50:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYCHh1CkAF3x38eioKc/p2LL2EthimOIOJq+xmrw9XVnLRvQFqCRMw8xyKKfuS4UlE30gpKw==
X-Received: by 2002:a05:6000:18f:b0:207:a3ea:4a42 with SMTP id
 p15-20020a056000018f00b00207a3ea4a42mr15188643wrx.147.1650448236751; 
 Wed, 20 Apr 2022 02:50:36 -0700 (PDT)
Received: from [192.168.8.102]
 (dynamic-046-114-174-058.46.114.pool.telefonica.de. [46.114.174.58])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a7bcb84000000b00389efb7a5b4sm21661700wmi.17.2022.04.20.02.50.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 02:50:36 -0700 (PDT)
Message-ID: <9cc22799-e9d3-5bbb-180e-39e83e50101a@redhat.com>
Date: Wed, 20 Apr 2022 11:50:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4 3/3] tests/qtest: Add test for Aspeed HACE accumulative
 mode
Content-Language: en-US
To: Steven Lee <steven_lee@aspeedtech.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20220331074844.30065-1-steven_lee@aspeedtech.com>
 <20220331074844.30065-4-steven_lee@aspeedtech.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220331074844.30065-4-steven_lee@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: troy_lee@aspeedtech.com, jamin_lin@aspeedtech.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 31/03/2022 09.48, Steven Lee wrote:
> This add two addition test cases for accumulative mode under sg enabled.
> 
> The input vector was manually craft with "abc" + bit 1 + padding zeros + L.
> The padding length depends on algorithm, i.e. SHA512 (1024 bit),
> SHA256 (512 bit).
> 
> The result was calculated by command line sha512sum/sha256sum utilities
> without padding, i.e. only "abc" ascii text.
> 
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> ---
>   tests/qtest/aspeed_hace-test.c | 145 +++++++++++++++++++++++++++++++++
>   1 file changed, 145 insertions(+)

Acked-by: Thomas Huth <thuth@redhat.com>


