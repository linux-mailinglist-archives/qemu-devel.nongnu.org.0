Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C43B418131
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 13:09:41 +0200 (CEST)
Received: from localhost ([::1]:46800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU5Yq-0003xV-HW
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 07:09:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mU5Uj-0007vP-Kp
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 07:05:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mU5Ub-0003Pp-5c
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 07:05:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632567916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dXMUQl70D5ts4Fj9BVisZTuik9Xk8CmOIsM3tY9uyGI=;
 b=inkIjUKZZjdCmbP68etoeeYbh39QSMm+HZkjvUaQUreLv1qisolJfzXDW783RgtBgRauXU
 Oh8HjWcf6vsK/vCNBMGGPj+wiejIJan2wI8pEMl0svKXzgO+O4McP4LVZtpZ9lDLK/XKxv
 of11gYPLnPO0mpmQjWkMp230Eop70EM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-zGTgjqO-P7qa2LP-CSeZjQ-1; Sat, 25 Sep 2021 07:05:13 -0400
X-MC-Unique: zGTgjqO-P7qa2LP-CSeZjQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 r9-20020a5d4989000000b0015d0fbb8823so10319488wrq.18
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 04:05:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dXMUQl70D5ts4Fj9BVisZTuik9Xk8CmOIsM3tY9uyGI=;
 b=vn0H3umnAh+H1a7f6Tyw9DdWAJCmrP9EV1dYDBNVHhMDs5m8oWMVA7V2gLzHIe0rmf
 TwQJMREFEDjN6LCihczcDlbLtcJEKvEWAzRXds+hzCcjzPO+lsLY/pIr8KhqiMe+la5G
 0iw/p1WoL2qeHc6VCHlCno1RzzrmSXqZkO22lzvr2Blt+Z7CCGZSwprZ+kzzU7//MR+0
 r66pG+vSBj/uBeqeptFIq2YYTRq9HoOdvJarpy4vNyduN7g/C/ffuguhjOsQDEnhzmGk
 CQ3A94i0Ln95BQBFgRAOZ/CffXdaPM9qKtrNSTN6efctfJQbelGtdsVgJyNLJSPO1nZ1
 WFuQ==
X-Gm-Message-State: AOAM533TeZ2giSBVcPBsiJgeLtqaNVdVxulp9SpHouoUw1Bc8u06M4Me
 lhcl21vi9Gl9F4NfqimzH2C7J7AfxEpKQ2I2EXQxHq5wXjKfHXetcITlpHAQcfkJGBwQS39kHiX
 yhMbyOaeYB/k96yM=
X-Received: by 2002:adf:b348:: with SMTP id k8mr16539831wrd.123.1632567912152; 
 Sat, 25 Sep 2021 04:05:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQsY6+UU+zXgztZvAcp3uFunYqnJtO2GS5nOMjU/r6GpuF/rGIkn6tJkz7HViQqi3nzlIlXQ==
X-Received: by 2002:adf:b348:: with SMTP id k8mr16539806wrd.123.1632567911980; 
 Sat, 25 Sep 2021 04:05:11 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id v17sm754119wro.34.2021.09.25.04.05.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Sep 2021 04:05:11 -0700 (PDT)
Message-ID: <a0ab87a3-cea2-b519-d232-721b2df1f845@redhat.com>
Date: Sat, 25 Sep 2021 13:05:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 3/3] tests/Makefile: add AVOCADO_TESTS option to make
 check-acceptance
To: Willian Rampazzo <willianr@redhat.com>, qemu-devel@nongnu.org
References: <20210923161141.232208-1-willianr@redhat.com>
 <20210923161141.232208-4-willianr@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210923161141.232208-4-willianr@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.482,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/23/21 18:11, Willian Rampazzo wrote:
> Add the possibility of running all the tests from a single file, or
> multiple files, running a single test within a file or multiple tests
> within multiple files using `make check-acceptance` and the
> AVOCADO_TESTS environment variable.
> 
> Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Willian Rampazzo <willianr@redhat.com>
> ---
>   docs/devel/testing.rst | 27 +++++++++++++++++++++++++++
>   tests/Makefile.include |  5 ++++-
>   2 files changed, 31 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


