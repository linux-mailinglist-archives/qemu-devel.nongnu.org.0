Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE5E44AAAA
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 10:38:09 +0100 (CET)
Received: from localhost ([::1]:57638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkNZv-0004EW-Ps
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 04:38:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mkNYk-0003TW-1r
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 04:36:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mkNYg-0002Yq-Tf
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 04:36:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636450609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4rnHG3pp4pUrZkzdU8W7tcOsS3g//MrACbqZtCJjog8=;
 b=HAMOf+HXY9plPuh7CTxptcC6xwTRdVZcvowF+deUcN6AB8KQ1N29GkO7oLm0aO1ypquAPx
 4MDVmef8FxDtJsdMWEotahMW00IC+6TlWrbHUqnepTwb9GMfKTgJ/plUQhXAv5IZGi0n6/
 nkKlgAJFkNzX1VgFddhtKYBP7QAJhrw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-576-1HSYzV4DOfOI2oiXfPz0mg-1; Tue, 09 Nov 2021 04:36:48 -0500
X-MC-Unique: 1HSYzV4DOfOI2oiXfPz0mg-1
Received: by mail-wm1-f72.google.com with SMTP id
 k5-20020a7bc3050000b02901e081f69d80so7421563wmj.8
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 01:36:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4rnHG3pp4pUrZkzdU8W7tcOsS3g//MrACbqZtCJjog8=;
 b=Dv/stisnyeyT1ghrrCD/XIMQMcjQAzi8g8qwmeQD8fSx36s1kpbJcff4MdfH8vuBN0
 lgvPKAYA/xFVQlslAlkODpPv41BINywlGzfQe2dR4AJor856XthjXliLI8lZBBvoIW2j
 XRFpUMVzq0KXnSdnjuK4pdLFgVT/BBWgX5LqozvKfz/WXackJ1CHHM92lWqH1ySzpQyN
 uh5pV7W6CPtQgJ3Nh6E+cVHXYsrpexGLNnEJBkpQsfN0W1YoeX8e5iWM02FRw4wXJXWH
 IvIm3qKruOnaCpttKiyxo0DwVn+JSfHMiyF+tqCbbkGJWolu3xXx4WTInZmeBVwJrhpK
 paVA==
X-Gm-Message-State: AOAM531flAQpzTM5JjWfR5sirIlab166D8+P2hvlm3U5V/QKnoXCyigi
 UkTuDmrI4sLAnX9YabXw41qpykawTAXCLjAFxhx/dh9yGA2jucquHkNElXstCBdmFKWJJ5Jamzf
 cXsJmTXUZYoV4EQVWB4B0QAM+VaAvcMil8chmjBLNzN/UcYoSejgJ6jZzABp0V8yl
X-Received: by 2002:a1c:20cc:: with SMTP id g195mr5565207wmg.42.1636450606832; 
 Tue, 09 Nov 2021 01:36:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxQ8RDpR3pSRxt4ZVxmrQJA78tFIRnNlcDL1VBK1ui7E1EBm3nGVv7YJsPwOCRII5rydXBteA==
X-Received: by 2002:a1c:20cc:: with SMTP id g195mr5565169wmg.42.1636450606511; 
 Tue, 09 Nov 2021 01:36:46 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id o9sm19463329wrs.4.2021.11.09.01.36.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 01:36:46 -0800 (PST)
Message-ID: <cb4307b9-e4b1-da06-3f69-556e8f074a88@redhat.com>
Date: Tue, 9 Nov 2021 10:36:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 2/2] tests/unit: Add an unit test for smp parsing
To: qemu-devel@nongnu.org
References: <20211028150913.1975305-1-philmd@redhat.com>
 <20211028150913.1975305-3-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211028150913.1975305-3-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.364, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Yanan Wang <wangyanan55@huawei.com>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 10/28/21 17:09, Philippe Mathieu-Daudé wrote:
> From: Yanan Wang <wangyanan55@huawei.com>
> 
> Now that we have a generic parser smp_parse(), let's add an unit
> test for the code. All possible valid/invalid SMP configurations
> that the user can specify are covered.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Message-Id: <20211026034659.22040-3-wangyanan55@huawei.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  tests/unit/test-smp-parse.c | 594 ++++++++++++++++++++++++++++++++++++
>  MAINTAINERS                 |   1 +
>  tests/unit/meson.build      |   1 +
>  3 files changed, 596 insertions(+)
>  create mode 100644 tests/unit/test-smp-parse.c

Could you have a look at this test failure please?
https://cirrus-ci.com/task/5823855357853696

MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
G_TEST_SRCDIR=C:/Users/ContainerAdministrator/AppData/Local/Temp/cirrus-ci-build/tests/unit
G_TEST_BUILDDIR=C:/Users/ContainerAdministrator/AppData/Local/Temp/cirrus-ci-build/build/tests/unit
tests/unit/test-smp-parse.exe --tap -k
Test smp_parse failed!
Input configuration: (SMPConfiguration) {
    .has_cpus    =  true, cpus    = 1,
    .has_sockets = false, sockets = 0,
    .has_dies    = false, dies    = 0,
    .has_cores   = false, cores   = 0,
    .has_threads = false, threads = 0,
    .has_maxcpus = false, maxcpus = 0,
}
Should be valid: no
Expected error report: Invalid SMP CPUs 1. The min CPUs supported by
machine '(null)' is 2
Result is valid: no
Output error report: Invalid SMP CPUs 1. The min CPUs supported by
machine '(NULL)' is 2
ERROR test-smp-parse - too few tests run (expected 2, got 0)
make: *** [Makefile.mtest:576: run-test-70] Error 1


