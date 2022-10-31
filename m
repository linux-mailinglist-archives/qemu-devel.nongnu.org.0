Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6CA6130DA
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 08:01:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opOnP-0001YH-5k; Mon, 31 Oct 2022 03:01:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1opOnN-0001Y7-As
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 03:01:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1opOnL-0002xD-QB
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 03:01:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667199674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kcMRxGyWta8lIhR51bOPxM+w6kvjq3N/6uFw7MppqIg=;
 b=dXV3NqtsF9VlVX+lzVRFSxaUvJMsk4kZ/bUcCVIl/euEXFEapbwvtr5shj/tkv273K4ocb
 IUkrnM4FvlZ6cHKkHIggVg2lvch1GFtk9/M1WxWUC0z5POu7/P7WkXZoiDDkgfD/fnUhAB
 banxdEdWMb8PmJcTFI5VgWjPk5WFS8Q=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-614-ShxAxXyZNICGBGRfXXuXQQ-1; Mon, 31 Oct 2022 03:01:13 -0400
X-MC-Unique: ShxAxXyZNICGBGRfXXuXQQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 bj1-20020a05620a190100b006fa12a05188so4590645qkb.4
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 00:01:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kcMRxGyWta8lIhR51bOPxM+w6kvjq3N/6uFw7MppqIg=;
 b=c2waZZ9e8I9H2CXAHr/rs5sEOCTpUwUl5kATI/d//MfW8NoZzD1EkpOsVBx3BsVNPG
 jTvKbhoqDXYSz++Y6+FKOh/cPH51gI2C/70Y/Gl2aqWjsWKpDuZTeXOX02q8bqvLL0oC
 Z7UHHmSHgLdDCS0tGnPeSiL78JxPWZ5ul+00c7g+RgE53P/sIjPaMg3p0QK1xnWJVsy0
 o5YVt9Ca/v/Y3VRMUYype4yu5XxH+clVcdLLVWZqgZng/p5sb+GC4+hqCfYtsgtJtA3w
 3TDIrSFc5XQ13w7RWmq0HSlZ+ZJOzTBQR1ylZ07So8MM22uH8avXvbG9mQMHkitARM7l
 tl3Q==
X-Gm-Message-State: ACrzQf32Lofe1zaFfpdBSF7eX50c7drOGgZ6/KwGxO4Wa1emITnNw9fB
 4LuosnN39cQBeEtUnJCwanDzbYlLifiHDd0Lza1tylBK7fI1SBMRO7a6adzlWryCmQP1YnsW3Ar
 RVrSJIrgiRflrETE=
X-Received: by 2002:a05:620a:a82:b0:6fa:2713:741a with SMTP id
 v2-20020a05620a0a8200b006fa2713741amr3309692qkg.654.1667199672788; 
 Mon, 31 Oct 2022 00:01:12 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4hbjo9dnzfooGUHM9tUAHwe2ZTaXZSI13w3k/rDvC7RyUcHCXqwtatQiqejGLx+k4K+5BGGQ==
X-Received: by 2002:a05:620a:a82:b0:6fa:2713:741a with SMTP id
 v2-20020a05620a0a8200b006fa2713741amr3309671qkg.654.1667199672565; 
 Mon, 31 Oct 2022 00:01:12 -0700 (PDT)
Received: from [192.168.8.104] (tmo-097-47.customers.d1-online.com.
 [80.187.97.47]) by smtp.gmail.com with ESMTPSA id
 g23-20020ac870d7000000b0039d02911555sm3262015qtp.78.2022.10.31.00.01.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 00:01:12 -0700 (PDT)
Message-ID: <3fb7ebfe-15b1-6af4-2834-27f7dfdbe0d7@redhat.com>
Date: Mon, 31 Oct 2022 08:01:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 7/7] .gitlab-ci.d/windows.yml: Test 'make installer' in
 the CI
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, Stefan Weil <sw@weilnetz.de>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20220908132817.1831008-1-bmeng.cn@gmail.com>
 <20220908132817.1831008-8-bmeng.cn@gmail.com>
 <ae19df77-a7b2-5ad6-710b-bc3c2d226978@weilnetz.de>
 <CAEUhbmXiGOu6KT8vUAzXc92XQa9WiaUi7=ac5pDcDBC3Cs16cQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAEUhbmXiGOu6KT8vUAzXc92XQa9WiaUi7=ac5pDcDBC3Cs16cQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.055,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 30/10/2022 04.21, Bin Meng wrote:
> On Sun, Oct 30, 2022 at 12:39 AM Stefan Weil <sw@weilnetz.de> wrote:
...
>> Maybe it is sufficient to build only a 64 bit installer. Is there still
>> need for QEMU on 32 bit Windows? For CI, most parts of the NSIS process
>> (which requires a lot of resources) are covered by either 32 or 64 bit
>> builds, so running both might be unnecessary.
> 
> I see no need to support QEMU on 32-bit Windows as it is less common.

If you feel confident that QEMU on 32-bit Windows is not worth to support 
anymore, could you please send a patch for docs/about/build-platforms.rst to 
state there that only 64-bit Windows versions are supported?

We could then also drop the 32-bit CI Windows jobs to save some precious CI 
minutes (since they are very limited nowadays on gitlab).

  Thomas


