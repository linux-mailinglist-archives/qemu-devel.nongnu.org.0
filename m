Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 034375EC003
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 12:43:34 +0200 (CEST)
Received: from localhost ([::1]:45336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od83p-0000fG-1H
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 06:43:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1od80e-0003PU-87
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:40:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1od80b-0007kT-9U
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:40:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664275212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BBRTE8CuleMUf9T7ofONthOtHGcyvTbet9O2OWsawbc=;
 b=ccb8z+DM/vlqgi8//00zym25BHPN9Tq0KTSdMu+rVmNUstTHtbw3WVPT17RlikwqDU4Wp8
 u1F5t+7yq5VtXDFMl8/VtfTlZrrKH143DTs2zn5bjrA2T0v5/V9ipNXa9pzhUDBKGLX8AS
 S4bYThxCU412G5GlSkM0Gcqr4fw6XFY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-343-jMVdAubeO3CfWJ1KtOB0IQ-1; Tue, 27 Sep 2022 06:40:11 -0400
X-MC-Unique: jMVdAubeO3CfWJ1KtOB0IQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 m29-20020adfa3dd000000b00224f577fad1so2009935wrb.4
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 03:40:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=BBRTE8CuleMUf9T7ofONthOtHGcyvTbet9O2OWsawbc=;
 b=Fe7Fa/gall8qavdQGFDZXgKtqkuW2XtUCc2v4SmhH41/ra0zT3W6A+Z0XXiaCQNMDb
 usu3CyBgvwV3di/y0xtOmm6r+PucUsZ+lqZ67wutIMcb4gJZXao5yBrMafLGJkELglJs
 CrfJkn32cOaY8bIPrKfNXmGyU/UsOmOvlhXjHpqSTNCHviq8FzjrgglwQVAAbvMxHqpW
 RYlNNkBJcaHsNXPes7JFNJyQwuYniGLnAaQuZ3r3EWLQi2fQ6brfw3i68JMTqpG9/ZSt
 hbyPKbYejTflFeHXu1jrUduUn9IKu780SR803ruAGETd2KN61O2+1gcD7AGn4HSoTnWY
 lnug==
X-Gm-Message-State: ACrzQf3JP1voM+HOWlqy+VStNT6TCerYKJOgkduktWgPiQoA863LfO3v
 Bq1kjBCOxm9fgj1cBLZqISxkoE8eKGuGs3OSBgOQKDLuFcRfP9pwK/d9wBu+dsA7LEcB/Ye175s
 JXv4YGXu68Qok048=
X-Received: by 2002:a1c:7c04:0:b0:3b4:aaa4:9ec8 with SMTP id
 x4-20020a1c7c04000000b003b4aaa49ec8mr2088956wmc.44.1664275210178; 
 Tue, 27 Sep 2022 03:40:10 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6+i9dO1fANGtJVlyXoJ7Odj0eKxt3+Pd7uhvm/0PwfoUk3GdbPOV/2nODq4DvpBTi5hvgnDA==
X-Received: by 2002:a1c:7c04:0:b0:3b4:aaa4:9ec8 with SMTP id
 x4-20020a1c7c04000000b003b4aaa49ec8mr2088932wmc.44.1664275209921; 
 Tue, 27 Sep 2022 03:40:09 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-179-30.web.vodafone.de.
 [109.43.179.30]) by smtp.gmail.com with ESMTPSA id
 h4-20020a05600c498400b003b4935f04a4sm1620980wmp.5.2022.09.27.03.40.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Sep 2022 03:40:09 -0700 (PDT)
Message-ID: <965d60c1-09a0-1b70-31dd-f8935996e743@redhat.com>
Date: Tue, 27 Sep 2022 12:40:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 2/7] tests/x86: Add subtest with 'q35' machine type to
 device-plug-test
Content-Language: en-US
To: Michael Labiuk <michael.labiuk@virtuozzo.com>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, den@virtuozzo.com,
 Juan Quintela <quintela@redhat.com>
References: <20220920104842.605530-1-michael.labiuk@virtuozzo.com>
 <20220920104842.605530-3-michael.labiuk@virtuozzo.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220920104842.605530-3-michael.labiuk@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/09/2022 12.48, Michael Labiuk wrote:
> Configure pci bridge setting to plug pci device and unplug.
> 
> Signed-off-by: Michael Labiuk <michael.labiuk@virtuozzo.com>
> ---
>   tests/qtest/device-plug-test.c | 41 ++++++++++++++++++++++++++++++++++
>   1 file changed, 41 insertions(+)
> 
> diff --git a/tests/qtest/device-plug-test.c b/tests/qtest/device-plug-test.c
> index e595b45b66..d66c386ef4 100644
> --- a/tests/qtest/device-plug-test.c
> +++ b/tests/qtest/device-plug-test.c
> @@ -90,6 +90,19 @@ static void test_pci_unplug_request(void)
>       qtest_quit(qtest);
>   }
>   
> +static void test_q35_pci_unplug_request(void)
> +{
> +
> +    QTestState *qtest = qtest_initf("-machine q35 "
> +                                    "-device pcie-root-port,id=p1 "
> +                                    "-device pcie-pci-bridge,bus=p1,id=b1 "
> +                                    "-device virtio-mouse-pci,bus=b1,id=dev0");
> +
> +    process_device_remove(qtest, "dev0");
> +
> +    qtest_quit(qtest);
> +}
> +
>   static void test_pci_unplug_json_request(void)
>   {
>       const char *arch = qtest_get_arch();
> @@ -108,6 +121,27 @@ static void test_pci_unplug_json_request(void)
>       qtest_quit(qtest);
>   }
>   
> +static void test_q35_pci_unplug_json_request(void)
> +{
> +    const char *port = "-device '{\"driver\": \"pcie-root-port\", "
> +                                      "\"id\": \"p1\"}'";
> +
> +    const char *bridge = "-device '{\"driver\": \"pcie-pci-bridge\", "
> +                                   "\"id\": \"b1\", "
> +                                   "\"bus\": \"p1\"}'";
> +
> +    const char *device = "-device '{\"driver\": \"virtio-mouse-pci\", "
> +                                   "\"bus\": \"b1\", "
> +                                   "\"id\": \"dev0\"}'";
> +
> +    QTestState *qtest = qtest_initf("-machine q35 %s %s %s",
> +                                    port, bridge, device);
> +
> +    process_device_remove(qtest, "dev0");
> +
> +    qtest_quit(qtest);
> +}
> +
>   static void test_ccw_unplug(void)
>   {
>       QTestState *qtest = qtest_initf("-device virtio-balloon-ccw,id=dev0");
> @@ -187,5 +221,12 @@ int main(int argc, char **argv)
>                          test_spapr_phb_unplug_request);
>       }
>   
> +    if (!strcmp(arch, "x86_64")) {

We should maybe also add a qtest_has_machine("q35") after the strcmp here 
(there have recently been some efforts to make the qtests also run right if 
one of the x86 machines has been disabled in the build)

  Thomas


> +        qtest_add_func("/device-plug/q35-pci-unplug-request",
> +                   test_q35_pci_unplug_request);
> +        qtest_add_func("/device-plug/q35-pci-unplug-json-request",
> +                   test_q35_pci_unplug_json_request);
> +    }
> +
>       return g_test_run();
>   }


