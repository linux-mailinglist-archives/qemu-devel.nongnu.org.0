Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE985FB371
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 15:30:08 +0200 (CEST)
Received: from localhost ([::1]:57198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiFKh-0007HO-Hf
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 09:30:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oiDgc-0002Dd-6P
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 07:44:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oiDgW-0006ZH-Vo
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 07:44:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665488671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RKsDeSZzWNnmtMpZBzudK13BAxX5oNzwaTaGCNbTKRo=;
 b=VPssedoTMbUy97OxfqkUTCou8iNXupxrOvtRrBVo6RgOOmVIEAAgZjeMas1kzj48Zu7t2I
 DcHSLd3wf3YIqkxsGDRYc3ILV9bRs4hICaYb4tyRXO2dpNQzby/TT2zo/SSOOEsKndmF4M
 R3uk1PlNeQmg7vahJ7XnLtu8FNJ30pA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-427-wvUZvknIPSKZUTtcme_Mcw-1; Tue, 11 Oct 2022 07:44:30 -0400
X-MC-Unique: wvUZvknIPSKZUTtcme_Mcw-1
Received: by mail-wm1-f69.google.com with SMTP id
 r81-20020a1c4454000000b003c41e9ae97dso6008250wma.6
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 04:44:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RKsDeSZzWNnmtMpZBzudK13BAxX5oNzwaTaGCNbTKRo=;
 b=ptLCsjjkFmObb2DRVTn04osDbYZr9M45Y1NwwA9JkFy3cDqRBJtiR03zFdySWxYGjf
 94L35VWCh0AE/zHGJTJYELuY2m/+wTpYaD5MeNSSfRc3ZIpbAwBj0WibDLFgTzw6R54J
 HwoIIdq//PAzl5tK/RFZdIvBbXiSRbIrokchxJSyBLc+fg/yRU8NGU+wCZaaEH5J6NE3
 Ep6F2+U4aH8l3EHY/zkoVEv3GV2/IcFM0hYcmieJQvPFsP/FdLWEZk5lp59eah11wfsQ
 X9CQY7YSur90DE0HhVuQ4P6SmkhGbQPKjBqB0hulf8dDfl5x8Y0ZkIuOKdAkESeZP08G
 j92Q==
X-Gm-Message-State: ACrzQf1/4QfNVZf7PYlm3xQ9ETYQdMPTU6cZinS0r9GuPviTyr0211/M
 FC8aoP9ARMEDZFYOSasAaACPsLFNRaapxCMp972Kt176LP6PcnSpdG+Il/aVDWj/wLEoPkZ0Fkg
 7N4EYLZEyppofHzo=
X-Received: by 2002:a05:600c:3b99:b0:3c6:8b8e:a624 with SMTP id
 n25-20020a05600c3b9900b003c68b8ea624mr7519176wms.113.1665488669628; 
 Tue, 11 Oct 2022 04:44:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7Dt+BeA0sEOC5e9yGrHY42PqotzDjcvNDJEBh+ALpXe2xgJOY0owfUugG9PcWl2l/r44JfIA==
X-Received: by 2002:a05:600c:3b99:b0:3c6:8b8e:a624 with SMTP id
 n25-20020a05600c3b9900b003c68b8ea624mr7519158wms.113.1665488669405; 
 Tue, 11 Oct 2022 04:44:29 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-11.web.vodafone.de.
 [109.43.176.11]) by smtp.gmail.com with ESMTPSA id
 c190-20020a1c35c7000000b003b492338f45sm13103216wma.39.2022.10.11.04.44.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Oct 2022 04:44:28 -0700 (PDT)
Message-ID: <f09a029a-1025-4357-bcaa-ffdd0f102c84@redhat.com>
Date: Tue, 11 Oct 2022 13:44:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v5 8/9] tests/x86: Add 'q35' machine type to drive_del-test
Content-Language: en-US
To: Michael Labiuk <michael.labiuk@virtuozzo.com>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, den@virtuozzo.com,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Qemu-block <qemu-block@nongnu.org>
References: <20220929223547.1429580-1-michael.labiuk@virtuozzo.com>
 <20220929223547.1429580-9-michael.labiuk@virtuozzo.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220929223547.1429580-9-michael.labiuk@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.934, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 30/09/2022 00.35, Michael Labiuk via wrote:
> Configure pci bridge setting to run tests on 'q35' machine type.
> 
> Signed-off-by: Michael Labiuk <michael.labiuk@virtuozzo.com>
> ---
>   tests/qtest/drive_del-test.c | 107 +++++++++++++++++++++++++++++++++++
>   1 file changed, 107 insertions(+)
> 
> diff --git a/tests/qtest/drive_del-test.c b/tests/qtest/drive_del-test.c
> index 106c613f4f..9a750395a9 100644
> --- a/tests/qtest/drive_del-test.c
> +++ b/tests/qtest/drive_del-test.c
> @@ -252,6 +252,27 @@ static void test_cli_device_del(void)
>       qtest_quit(qts);
>   }
>   
> +static void test_cli_device_del_q35(void)
> +{
> +    QTestState *qts;
> +
> +    /*
> +     * -drive/-device and device_del.  Start with a drive used by a
> +     * device that unplugs after reset.
> +     */
> +    qts = qtest_initf("-drive if=none,id=drive0,file=null-co://,"
> +                      "file.read-zeroes=on,format=raw "
> +                      "-machine q35 -device pcie-root-port,id=p1 "
> +                      "-device pcie-pci-bridge,bus=p1,id=b1 "
> +                      "-device virtio-blk-%s,drive=drive0,bus=b1,id=dev0",
> +                      qvirtio_get_dev_type());
> +
> +    device_del(qts, true);
> +    g_assert(!has_drive(qts));
> +
> +    qtest_quit(qts);
> +}
> +
>   static void test_empty_device_del(void)
>   {
>       QTestState *qts;
> @@ -288,6 +309,43 @@ static void test_device_add_and_del(void)
>       qtest_quit(qts);
>   }
>   
> +static void device_add_q35(QTestState *qts)
> +{
> +    g_autofree char *driver = g_strdup_printf("virtio-blk-%s",
> +                                              qvirtio_get_dev_type());
> +    QDict *response =
> +               qtest_qmp(qts, "{'execute': 'device_add',"
> +                              " 'arguments': {"
> +                              "   'driver': %s,"
> +                              "   'drive': 'drive0',"
> +                              "   'id': 'dev0',"
> +                              "   'bus': 'b1'"
> +                              "}}", driver);
> +    g_assert(response);
> +    g_assert(qdict_haskey(response, "return"));
> +    qobject_unref(response);
> +}
> +
> +static void test_device_add_and_del_q35(void)
> +{
> +    QTestState *qts;
> +
> +    /*
> +     * -drive/device_add and device_del.  Start with a drive used by a
> +     * device that unplugs after reset.
> +     */
> +    qts = qtest_initf("-machine q35 -device pcie-root-port,id=p1 "
> +                     "-device pcie-pci-bridge,bus=p1,id=b1 "
> +                     "-drive if=none,id=drive0,file=null-co://,"
> +                     "file.read-zeroes=on,format=raw");
> +
> +    device_add_q35(qts);
> +    device_del(qts, true);
> +    g_assert(!has_drive(qts));
> +
> +    qtest_quit(qts);
> +}
> +
>   static void test_drive_add_device_add_and_del(void)
>   {
>       QTestState *qts;
> @@ -312,6 +370,25 @@ static void test_drive_add_device_add_and_del(void)
>       qtest_quit(qts);
>   }
>   
> +static void test_drive_add_device_add_and_del_q35(void)
> +{
> +    QTestState *qts;
> +
> +    qts = qtest_init("-machine q35 -device pcie-root-port,id=p1 "
> +                     "-device pcie-pci-bridge,bus=p1,id=b1");
> +
> +    /*
> +     * drive_add/device_add and device_del.  The drive is used by a
> +     * device that unplugs after reset.
> +     */
> +    drive_add_with_media(qts);
> +    device_add_q35(qts);
> +    device_del(qts, true);
> +    g_assert(!has_drive(qts));
> +
> +    qtest_quit(qts);
> +}
> +
>   static void test_blockdev_add_device_add_and_del(void)
>   {
>       QTestState *qts;
> @@ -336,6 +413,25 @@ static void test_blockdev_add_device_add_and_del(void)
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
> +     * blockdev_add/device_add and device_del. The drive is used by a
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
>       g_test_init(&argc, &argv, NULL);
> @@ -357,6 +453,17 @@ int main(int argc, char **argv)
>                          test_empty_device_del);
>           qtest_add_func("/device_del/blockdev",
>                          test_blockdev_add_device_add_and_del);
> +
> +        if (qtest_has_machine("q35")) {
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

Reviewed-by: Thomas Huth <thuth@redhat.com>


