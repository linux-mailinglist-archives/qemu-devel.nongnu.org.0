Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1E668C1AB
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 16:33:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP3U8-0006dO-16; Mon, 06 Feb 2023 10:32:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP3TT-0006Yo-2s
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 10:32:24 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP3TR-0006Ef-DG
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 10:32:06 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so11060279wmb.2
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 07:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Dp+mT21yBQu4HGsD0lSSH+6Pj7kpSKIvRtNlMVPxhc8=;
 b=VESL6m4tF++sjFRR7hGbshOz6ZnYC7fSJsQV0O9hyfR9/CPJaDixe6eUbiGVUwwXg0
 eD4iVsYcsLRvUNT+OJU4EZVJWshfmdh0dTwu04VgLo7fm3mkFHu4NHEcs0+z/yHmWLuq
 oIxfgVqcP5qhvI9XzfMJlX8zUoTUEqOtBXxOCyxiy+3cB5498TVtLraQCtIxCLoSuw9X
 wWpDQHNk6tt4becFel1ITVPZekrcFBj6QOggR/ri/MDBZcbiMgsyjFCLdmRYJPjUcI6U
 y26tUI5Nl2th+LLyCifapXCVNBXNSw0zhhYVWE7A8O1X9Zm6qX1Vme48IPOg4MNLeQ9N
 hBMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Dp+mT21yBQu4HGsD0lSSH+6Pj7kpSKIvRtNlMVPxhc8=;
 b=iXH8Pro21ieRZ5175fE6XesawVZnrfo+ct6yCMaq06+qJBN8SaUjo1p7uwkxI7orzO
 TWeHhUAhFAXVKirRHVv4SBnv9VFvucjpc4Eaj6wti4dwIJ0xL68fe6ayw7ijhr61CEtr
 0pF4AJt9mGKNFIdR96Pt+7UAAcwZZlfqYF7/OHrjLlubP05Lu5zLtfMjFSLpcSAT6Oou
 G7f05Yxc/G1w8CLckcXikLQjSxCvhqVHWwfzLRAm8PK6AzNzUy0uzE8jkKrECrs4CFMt
 9UJf6z3fU/hPlGJpxWxDzQsv0pE+KlPh3t8gbrGgTkHett7F3mIDS0T/5LvGzEeNxNAZ
 rW7w==
X-Gm-Message-State: AO0yUKUpdHZCjz8XzSfW00PJUuMFpiXYUXw6Ijaqd8fU7jvf/yCd3leO
 CwknZNSwMM/VcSlwPxwN84ZPOg==
X-Google-Smtp-Source: AK7set+bXKAhzN+Vex2wxrTXpglim9msdcF0Ahrp3uLos2ThG4gOSjeFJbTwkRV9NB5lDOf1rFLqig==
X-Received: by 2002:a05:600c:1e8a:b0:3df:e57d:f4ba with SMTP id
 be10-20020a05600c1e8a00b003dfe57df4bamr190188wmb.7.1675697520967; 
 Mon, 06 Feb 2023 07:32:00 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 s13-20020a05600c45cd00b003dc42d48defsm11867382wmo.6.2023.02.06.07.31.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 07:32:00 -0800 (PST)
Message-ID: <4ea8eec3-1d4e-0d09-4bf4-eb2987238594@linaro.org>
Date: Mon, 6 Feb 2023 16:31:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 02/12] tests/qtest: Do not run lsi53c895a test if device
 is not present
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Laurent Vivier <lvivier@redhat.com>
References: <20230206150416.4604-1-farosas@suse.de>
 <20230206150416.4604-3-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230206150416.4604-3-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 6/2/23 16:04, Fabiano Rosas wrote:
> The tests are built once for all the targets, so as long as one QEMU
> binary is built with CONFIG_LSI_SCSI_PCI=y, this test will
> run. However some binaries might not include the device. So check this
> again in runtime.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   tests/qtest/fuzz-lsi53c895a-test.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/tests/qtest/fuzz-lsi53c895a-test.c b/tests/qtest/fuzz-lsi53c895a-test.c
> index 392a7ae7ed..a9254b455d 100644
> --- a/tests/qtest/fuzz-lsi53c895a-test.c
> +++ b/tests/qtest/fuzz-lsi53c895a-test.c
> @@ -112,6 +112,10 @@ static void test_lsi_do_dma_empty_queue(void)
>   
>   int main(int argc, char **argv)
>   {
> +    if (!qtest_has_device("lsi53c895a")) {
> +        return 0;
> +    }

Shouldn't we update Kconfig to now add the test unconditionally?
Squashing:

-- >8 --
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index e97616d327..498e49a1b2 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -66,7 +66,6 @@ qtests_i386 = \
    (config_all_devices.has_key('CONFIG_RTL8139_PCI') ? ['rtl8139-test'] 
: []) +              \
    (config_all_devices.has_key('CONFIG_E1000E_PCI_EXPRESS') ? 
['fuzz-e1000e-test'] : []) +   \
    (config_all_devices.has_key('CONFIG_MEGASAS_SCSI_PCI') ? 
['fuzz-megasas-test'] : []) +    \
-  (config_all_devices.has_key('CONFIG_LSI_SCSI_PCI') ? 
['fuzz-lsi53c895a-test'] : []) +     \
    (config_all_devices.has_key('CONFIG_VIRTIO_SCSI') ? 
['fuzz-virtio-scsi-test'] : []) +     \
    (config_all_devices.has_key('CONFIG_SB16') ? ['fuzz-sb16-test'] : 
[]) +                   \
    (config_all_devices.has_key('CONFIG_SDHCI_PCI') ? 
['fuzz-sdcard-test'] : []) +            \
@@ -87,6 +86,7 @@ qtests_i386 = \
     'rtc-test',
     'i440fx-test',
     'fw_cfg-test',
+   'fuzz-lsi53c895a-test',
     'device-plug-test',
     'drive_del-test',
     'tco-test',
---

