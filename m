Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D7169DDBE
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 11:19:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUPiQ-0004dy-Ab; Tue, 21 Feb 2023 05:17:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pUPiN-0004dZ-Li
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 05:17:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pUPiM-0003Ll-1b
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 05:17:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676974657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4iEFF/b/QbvZzC3DBwRXJReUoO2iqpzmbxAm+CoJOHE=;
 b=OqRMDfHj4+QujBUPqukqNNbA8GXRTj+5iV62E4r93ljLdvQPgeFH5xY+exbGA2gUwPaVHq
 ETO28ItuW4JDRkGvXIxRxAw7GrvOkhFo7HA4CX5tjvpRkpFGDK9FwSAP7g2Vn4cSAVdunr
 AFNsDM61T+m7m7GvrmxfhsJ1+FHAA70=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-136-b62RnZyVNJe4N1OmDugnnQ-1; Tue, 21 Feb 2023 05:17:35 -0500
X-MC-Unique: b62RnZyVNJe4N1OmDugnnQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 j9-20020a5d4529000000b002c5588d962fso865285wra.10
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 02:17:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4iEFF/b/QbvZzC3DBwRXJReUoO2iqpzmbxAm+CoJOHE=;
 b=UvV5f3cEc4xZG/BaSvtGWy/zyo58BEmcykY3nfyqDDIqv9dtUqa85chVYpJBgjPVj3
 mlldl6Iz3JqE/nU+MkmFpSd03W5CiIy8GwtOnEEONO2ICK8oE4Rdi+qM/kFRhGBwsF67
 XDBo2fNnZ60S4WzEEfNKSiYJNcwlvSPeK1rrrhWIH/nq2mR28HwqPXgUpLMxVmcs75Qg
 cw14afcTmaA1yfhEucuip1C6uCmE/BbTnW4/IeoStqoBIFD5Le6OJ6YxnCmZtpzku/e4
 mjbC9GcsfJS09diNeuHcpMg+xVTMYMUvOll8NCrP3FLbn3dn5WxtDhnHR7xFmdzMnokr
 L1gQ==
X-Gm-Message-State: AO0yUKUJjIVmTNDqEN+Kg2v886t6XTL2jhqlwQuiA95cEZ41i0zqOa3C
 WRBbVHoo9BO25DqkguzRiD25+t4X/nWo3vwW/Hm5/xQuyJ7bj87KJrqjFJRACqhGiS47IMtsLDh
 qIcERoN9ipXy0eJA=
X-Received: by 2002:adf:e9c7:0:b0:2c5:7c26:c2cc with SMTP id
 l7-20020adfe9c7000000b002c57c26c2ccmr3706315wrn.29.1676974654849; 
 Tue, 21 Feb 2023 02:17:34 -0800 (PST)
X-Google-Smtp-Source: AK7set91qCJs2zDi3xPVKtpJL0qgHInahEIsyiPW0A4nifm/1cFEoNyx4M/3YLnKWIHfpvwhHFp9SQ==
X-Received: by 2002:adf:e9c7:0:b0:2c5:7c26:c2cc with SMTP id
 l7-20020adfe9c7000000b002c57c26c2ccmr3706290wrn.29.1676974654589; 
 Tue, 21 Feb 2023 02:17:34 -0800 (PST)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 u5-20020a05600c210500b003e00c453447sm3928799wml.48.2023.02.21.02.17.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 02:17:32 -0800 (PST)
Message-ID: <a182b11b-3f65-9daf-c3fd-f98cb335917a@redhat.com>
Date: Tue, 21 Feb 2023 11:17:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Bandan Das <bsd@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, qemu-block@nongnu.org,
 Beraldo Leal <bleal@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-arm@nongnu.org, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Alexander Bulekov
 <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Anders Roxell <anders.roxell@linaro.org>
References: <20230221094558.2864616-1-alex.bennee@linaro.org>
 <20230221094558.2864616-12-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 11/14] tests: add tuxrun baseline test to avocado
In-Reply-To: <20230221094558.2864616-12-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 21/02/2023 10.45, Alex Bennée wrote:
> The TuxRun project (www.tuxrun.org) uses QEMU to run tests on a wide
> variety of kernel configurations on wide range of our emulated
> platforms. They publish a known good set of images at:
> 
>    https://storage.tuxboot.com/
> 
> to help with bisecting regressions in either the kernel, firmware or
> QEMU itself. The tests are pretty lightweight as they contain just a
> kernel with a minimal rootfs which boots a lot faster than most of the
> distros. In time they might be persuaded to version there known good

"*their* known good baselines" ?

> baselines and we can then enable proper checksums.
> 
> For a couple of tests we currently skip:
> 
>    - mips64, a regression against previous stable release
>    - sh4, very unstable with intermittent oops
> 
> Total run time: 340s (default) -> 890s (debug)
> 
> Overall coverage rate (tested targets + disabled tests):
>    lines......: 16.1% (126894 of 789848 lines)
>    functions..: 20.6% (15954 of 77489 functions)
>    branches...: 9.3% (40727 of 439365 branches)

Acked-by: Thomas Huth <thuth@redhat.com>


