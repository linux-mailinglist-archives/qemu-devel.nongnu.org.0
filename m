Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B5B485566
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 16:06:28 +0100 (CET)
Received: from localhost ([::1]:54454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n57rv-0006am-T2
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 10:06:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1n57bV-000131-5r
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:49:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1n57bN-0004ej-Ct
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:49:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641394157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=203XPLtgu56Wjg/pexNuosqGyvEX0Oj8fnyh1FO6hQs=;
 b=Sldh0ICHncjoj3Rc3RRPZY+e3AGLtkoKoAhRNHRGfsQFUlZoedWojupio5SQZGQyqQ3eFe
 pW1BhAiLMTBPdJGH5cnQ995FFAhON+62ioKSdHY7UNVyXEA3a/XsJVjitcFyxSsXfxrE/Z
 c1rnHSrI1YLOzQniFBKQo21bldBMYRY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-93-ph7EqVz0MBO63xBDjhaPew-1; Wed, 05 Jan 2022 09:49:16 -0500
X-MC-Unique: ph7EqVz0MBO63xBDjhaPew-1
Received: by mail-wm1-f70.google.com with SMTP id
 83-20020a1c0256000000b00346a78f8fd7so1120376wmc.8
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 06:49:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=203XPLtgu56Wjg/pexNuosqGyvEX0Oj8fnyh1FO6hQs=;
 b=gIAGsC2dN3T7xkU8F7SLcQX2VlzLjuJGEjPctFYwkEy1YcSCBs5WKrBUc4AhA8N5Yt
 O0S5PxwADe8phAnEIGISjGFPZdCkUHVABNs9Ne3FolTzZH5A10pYzbXkI0JkIHoRTKIE
 LqLZFXHtwtssu/qwb1dG1J4Nz673nn3M0dSVIKxrciOx9U7hZ/zazBkPA3+SiVbpGOeM
 XRVU7VNI46G7xKDn9O7UHYXPtdpumr4GYVhMwF34toQf8jRwCK2zoFgR77YAhG1ScW14
 y9m+Jz8lJtu6V8G5OGL0gnV0RK6KdhUhJGGoztIg1Y6LnSYc2CigQR43JhyHYKhe+TUd
 47UQ==
X-Gm-Message-State: AOAM533Jlm/MfOxoGsJpOkMhyzTlL5s8gmevIBr0frDbUy33R7zh1375
 4u5o1VNxJ02fc4Rqg8/zNd/JiBhGZFd6MJlIsWLa4lxm+NAh0RmAg9Y7ZaO7trPnCowZXzf4u3G
 XJ+529ogLZXIAmWA=
X-Received: by 2002:a5d:64a2:: with SMTP id m2mr46927591wrp.102.1641394154830; 
 Wed, 05 Jan 2022 06:49:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwahZ+DzJ5fPoskDzLEEQDi+/sSgnhamrQhJaqm2b5sBpWlsehia9EHnc1E2KQ62RSD4894kg==
X-Received: by 2002:a5d:64a2:: with SMTP id m2mr46927567wrp.102.1641394154576; 
 Wed, 05 Jan 2022 06:49:14 -0800 (PST)
Received: from [192.168.100.42] ([82.142.12.178])
 by smtp.gmail.com with ESMTPSA id u14sm40459097wrf.39.2022.01.05.06.49.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jan 2022 06:49:14 -0800 (PST)
Message-ID: <a2a94c4c-190f-9be6-eadf-bd1404a2e272@redhat.com>
Date: Wed, 5 Jan 2022 15:49:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 1/1] softmmu: fix device deletion events with -device JSON
 syntax
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20220105123847.4047954-1-berrange@redhat.com>
 <20220105123847.4047954-2-berrange@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <20220105123847.4047954-2-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.057, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Thomas Huth <thuth@redhat.com>, Peter Krempa <pkrempa@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/01/2022 13:38, Daniel P. Berrangé wrote:
> The -device JSON syntax impl leaks a reference on the created
> DeviceState instance. As a result when you hot-unplug the
> device, the device_finalize method won't be called and thus
> it will fail to emit the required DEVICE_DELETED event.
> 
> A 'json-cli' feature was previously added against the
> 'device_add' QMP command QAPI schema to indicated to mgmt
> apps that -device supported JSON syntax. Given the hotplug
> bug that feature flag is no unusable for its purpose, so

Not sure to understand: do you mean "now unusable"?

> we add a new 'json-cli-hotplug' feature to indicate the
> -device supports JSON without breaking hotplug.
> 
> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/802
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   qapi/qdev.json                 |  5 ++++-
>   softmmu/vl.c                   |  4 +++-
>   tests/qtest/device-plug-test.c | 19 +++++++++++++++++++
>   3 files changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/qapi/qdev.json b/qapi/qdev.json
> index 69656b14df..26cd10106b 100644
> --- a/qapi/qdev.json
> +++ b/qapi/qdev.json
> @@ -44,6 +44,9 @@
>   # @json-cli: If present, the "-device" command line option supports JSON
>   #            syntax with a structure identical to the arguments of this
>   #            command.
> +# @json-cli-hotplug: If present, the "-device" command line option supports JSON
> +#                    syntax without the reference counting leak that broke
> +#                    hot-unplug
>   #
>   # Notes:
>   #
> @@ -74,7 +77,7 @@
>   { 'command': 'device_add',
>     'data': {'driver': 'str', '*bus': 'str', '*id': 'str'},
>     'gen': false, # so we can get the additional arguments
> -  'features': ['json-cli'] }
> +  'features': ['json-cli', 'json-cli-hotplug'] }
>   
>   ##
>   # @device_del:
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index d9e4c619d3..b1fc7da104 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -2684,6 +2684,7 @@ static void qemu_create_cli_devices(void)
>       qemu_opts_foreach(qemu_find_opts("device"),
>                         device_init_func, NULL, &error_fatal);
>       QTAILQ_FOREACH(opt, &device_opts, next) {
> +        DeviceState *dev;
>           loc_push_restore(&opt->loc);
>           /*
>            * TODO Eventually we should call qmp_device_add() here to make sure it
> @@ -2692,7 +2693,8 @@ static void qemu_create_cli_devices(void)
>            * from the start, so call qdev_device_add_from_qdict() directly for
>            * now.
>            */
> -        qdev_device_add_from_qdict(opt->opts, true, &error_fatal);
> +        dev = qdev_device_add_from_qdict(opt->opts, true, &error_fatal);
> +        object_unref(OBJECT(dev));
>           loc_pop(&opt->loc);
>       }
>       rom_reset_order_override();
> diff --git a/tests/qtest/device-plug-test.c b/tests/qtest/device-plug-test.c
> index 559d47727a..ad79bd4c14 100644
> --- a/tests/qtest/device-plug-test.c
> +++ b/tests/qtest/device-plug-test.c
> @@ -77,6 +77,23 @@ static void test_pci_unplug_request(void)
>       qtest_quit(qtest);
>   }
>   
> +static void test_pci_unplug_json_request(void)
> +{
> +    QTestState *qtest = qtest_initf(
> +        "-device '{\"driver\": \"virtio-mouse-pci\", \"id\": \"dev0\"}'");
> +
> +    /*
> +     * Request device removal. As the guest is not running, the request won't
> +     * be processed. However during system reset, the removal will be
> +     * handled, removing the device.
> +     */
> +    device_del(qtest, "dev0");
> +    system_reset(qtest);

You can use qpci_unplug_acpi_device_test() to process the request... but I see this is 
done like that too in test_pci_unplug_request()

> +    wait_device_deleted_event(qtest, "dev0");
> +
> +    qtest_quit(qtest);
> +}
> +
>   static void test_ccw_unplug(void)
>   {
>       QTestState *qtest = qtest_initf("-device virtio-balloon-ccw,id=dev0");
> @@ -145,6 +162,8 @@ int main(int argc, char **argv)
>        */
>       qtest_add_func("/device-plug/pci-unplug-request",
>                      test_pci_unplug_request);
> +    qtest_add_func("/device-plug/pci-unplug-json-request",
> +                   test_pci_unplug_json_request);
>   
>       if (!strcmp(arch, "s390x")) {
>           qtest_add_func("/device-plug/ccw-unplug",

Reviewed-by: Laurent Vivier <lvivier@redhat.com>


