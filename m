Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5EC5EC555
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 16:02:14 +0200 (CEST)
Received: from localhost ([::1]:51392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odBA4-0006MD-03
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 10:02:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1od9iH-000367-VR
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 08:29:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1od9iE-00040t-Jp
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 08:29:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664281761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qIAw5geZfXWGOhS/lZXMrAIxnza0FRnxoCN1AP8lq3M=;
 b=IK+3kI68NVHqrvp8BHJwE0ypRUbEUwj9RlwVwBCYdaviSJZDAKLahgx0ai7+Nn5tvB9TTu
 YJxCnW72jlzfkVbSzaPZleXQRaGMRxA5QFK+a+iaWM12HNNJUuF2UzA2BnQnfJsCWkbv1z
 OlijD0lRc2/x7R21CsIxCvwmVdHKurg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-231-jIJKQaszM9OmcTbJdgrzXw-1; Tue, 27 Sep 2022 08:29:18 -0400
X-MC-Unique: jIJKQaszM9OmcTbJdgrzXw-1
Received: by mail-wm1-f71.google.com with SMTP id
 v125-20020a1cac83000000b003b5359afd97so3417570wme.0
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 05:29:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=qIAw5geZfXWGOhS/lZXMrAIxnza0FRnxoCN1AP8lq3M=;
 b=IpTyJEqW9/cBxsrphJUg6SH5KKuPlIKnpiKMdo9BMtRCUBbgL4tkQbdYaaDYsXLfbs
 yoxobEZ2rFr6nnTSSkUDLzcLRx1FebEr3KkOC7KDzU5pNRo6GTn8wcH1ffStanzdLx58
 +KhQCiMQaxYpoHiYG5qH0qlbP0ZvRWH/9mTlE5NjWdPxtXTNU7JXMCya0STRyyo9zVOy
 SgNVpLhrc4wWHnmNDrhjNYe7rXnqNMyPqEu8P3jHyuYazHSP8RXUDX+TCknbf0QA34ka
 BCAiWVwdGMCxgMoMWfHtwKaqFc/yXe+6rBySewS08SvPdM/mVd2X0IGl2qmRiIasx/7n
 8Rbg==
X-Gm-Message-State: ACrzQf2Hj321uTqE5SqGGV7IPBc5U8O/0XLi18OVPzW71a4N8mDrBoZP
 9AzWEd/oURugNiRGsMlP2VYGLMHV5ReiK6f4tG2dldQnGQ2vmURM0XdkT9jg5TbHY4xHfjVc954
 3yfozlLnzQlrI85s=
X-Received: by 2002:a5d:4ac7:0:b0:22c:9539:28a9 with SMTP id
 y7-20020a5d4ac7000000b0022c953928a9mr10171217wrs.273.1664281757427; 
 Tue, 27 Sep 2022 05:29:17 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6/4sAaZOB+HyQj4asn1HmtTLhM14XNTAjoUJUDAHYoNo6KheywAlLYva6+bQaSCNWq2pJq7A==
X-Received: by 2002:a5d:4ac7:0:b0:22c:9539:28a9 with SMTP id
 y7-20020a5d4ac7000000b0022c953928a9mr10171200wrs.273.1664281757181; 
 Tue, 27 Sep 2022 05:29:17 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-179-30.web.vodafone.de.
 [109.43.179.30]) by smtp.gmail.com with ESMTPSA id
 k17-20020adfe3d1000000b0022af70874a1sm1953660wrm.36.2022.09.27.05.29.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Sep 2022 05:29:16 -0700 (PDT)
Message-ID: <b7685713-e058-60bd-8f38-2946ef64add7@redhat.com>
Date: Tue, 27 Sep 2022 14:29:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Michael Labiuk <michael.labiuk@virtuozzo.com>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, den@virtuozzo.com
References: <20220920104842.605530-1-michael.labiuk@virtuozzo.com>
 <20220920104842.605530-5-michael.labiuk@virtuozzo.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v4 4/7] tests/x86: Add 'q35' machine type to drive_del-test
In-Reply-To: <20220920104842.605530-5-michael.labiuk@virtuozzo.com>
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
> Configure pci bridge setting to run tests on 'q35' machine type.
> 
> Signed-off-by: Michael Labiuk <michael.labiuk@virtuozzo.com>
> ---
>   tests/qtest/drive_del-test.c | 111 +++++++++++++++++++++++++++++++++++
>   1 file changed, 111 insertions(+)
> 
> diff --git a/tests/qtest/drive_del-test.c b/tests/qtest/drive_del-test.c
> index 5e6d58b4dd..3a2ddecf22 100644
> --- a/tests/qtest/drive_del-test.c
> +++ b/tests/qtest/drive_del-test.c
...
> @@ -294,6 +315,45 @@ static void test_device_add_and_del(void)
>       qtest_quit(qts);
>   }
>   
> +static void device_add_q35(QTestState *qts)
> +{
> +    QDict *response;
> +    char driver[32];
> +    snprintf(driver, sizeof(driver), "virtio-blk-%s",
> +             qvirtio_get_dev_type());

array + snprintf is somewhat ugly, could you please either use

  g_autofree char *driver = g_strdup_printf(...)

instead or ...

> +    response = qtest_qmp(qts, "{'execute': 'device_add',"
> +                              " 'arguments': {"
> +                              "   'driver': %s,"

... simply use " 'driver': vrtio-blk-%s, " here?

> +                              "   'drive': 'drive0',"
> +                              "   'id': 'dev0',"
> +                              "   'bus': 'b1'"
> +                              "}}", driver);
> +    g_assert(response);
> +    g_assert(qdict_haskey(response, "return"));
> +    qobject_unref(response);
> +}
...
> @@ -342,8 +421,29 @@ static void test_blockdev_add_device_add_and_del(void)
>       qtest_quit(qts);
>   }
>   
> +static void test_blockdev_add_device_add_and_del_q35(void)
> +{
> +    QTestState *qts;
> +
> +    qts = qtest_init("-machine q35 -device pcie-root-port,id=p1 "
> +                     "-device pcie-pci-bridge,bus=p1,id=b1");
> +
> +    /*
> +     * blockdev_add/device_add and device_del.  The it drive is used by a

s/The it drive/The drive/

> +     * device that unplugs after reset, but it doesn't go away.
> +     */
> +    blockdev_add_with_media(qts);
> +    device_add_q35(qts);
> +    device_del(qts, true);
> +    g_assert(has_blockdev(qts));
> +
> +    qtest_quit(qts);
> +}
> +
>   int main(int argc, char **argv)
>   {
> +    const char *arch = qtest_get_arch();
> +
>       g_test_init(&argc, &argv, NULL);
>   
>       qtest_add_func("/drive_del/without-dev", test_drive_without_dev);
> @@ -363,6 +463,17 @@ int main(int argc, char **argv)
>                          test_empty_device_del);
>           qtest_add_func("/device_del/blockdev",
>                          test_blockdev_add_device_add_and_del);
> +
> +        if (!strcmp(arch, "x86_64")) {

Please use qtest_has_machine("q35") instead again.

> +            qtest_add_func("/device_del/drive/cli_device_q35",
> +                           test_cli_device_del_q35);
> +            qtest_add_func("/device_del/drive/device_add_q35",
> +                           test_device_add_and_del_q35);
> +            qtest_add_func("/device_del/drive/drive_add_device_add_q35",
> +                           test_drive_add_device_add_and_del_q35);
> +            qtest_add_func("/device_del/blockdev_q35",
> +                           test_blockdev_add_device_add_and_del_q35);
> +        }
>       }
>   
>       return g_test_run();

  Thomas


