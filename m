Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5D06797F9
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 13:26:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKIMu-0007zx-3D; Tue, 24 Jan 2023 07:25:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKIMr-0007rA-HW
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 07:25:37 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKIMp-00082W-Uw
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 07:25:37 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 fl11-20020a05600c0b8b00b003daf72fc844so12726167wmb.0
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 04:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HOR7H3/LLXjX7DwwcUt1Sxaz8oQgPrc+kjqBicZUl7Q=;
 b=dHS1Ak+M4dBaYd2oO/rnv29OksE6EZ47Hs6PkdO+IzRn/9hxeEJ79x80W6t9vU3cdo
 q9Wg34FbUSMCuIjRfTcWjmappghmskTm/E8qRAA2Kv40WwLQEjme6aCsv14mF2Ja/a1L
 v/mI8puDz/PsOJ8xkeQi/yaZy+UZ7JYSIe8zXNwAJrRNM93GzjUBqxkjqkM+xkqm+u5c
 I6rrjRTRhBp5n4IwPg4709vtW8nZtqNMZqH0E0hZP4MYqzWqrqp46gBfCUU4Ji7I3YvN
 qHgSRJ7I7o2/qvuNHDZL8bvXmRUBaOdzKRrPSTbCrU1dKBgZSIwfY8Te3qlNDU1tpKLC
 H5Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HOR7H3/LLXjX7DwwcUt1Sxaz8oQgPrc+kjqBicZUl7Q=;
 b=Y7tP7pdNK01RecKbCVLjtjpjc6itu/r/v8S3dr5+RYOfF0kYmoJbP04x4W2CpLo1aO
 Gk995JGx8FZICUxWF30iJICpljutjVznu/88sGQTYC66ZkLrM3ziL8Lf8Myd4ZnE9Mkm
 mbv75hX9QimwMD8bJ8qiE3AzGbBsi7AyN87uQcStZNbCu5zAYHgEtWrJBj8ii1t9dzy7
 GOSq0773IoADuIljcf46yetgcmgfWp8LlLs9pZarTNnrWq0TTKai7uHQIpUTyNPNgXB6
 qaLoJ07hMECtcQYOOlTSRRc6kXIYpj9mXMjKB/lARIqVMdOCU/CBbjrutda7nh55oeCm
 pqPQ==
X-Gm-Message-State: AFqh2kqJokZY+7Y2zq+wYXM8sJlnWc7ziwFSJEyR7L4lLTnC4Szk2tOC
 WzyvVIjA9q5Qk6V5zA4EbYklog==
X-Google-Smtp-Source: AMrXdXswzOrGdguMvcq5asIwnDi7E/WFIm7TkA+KrTAQrLo+T4xAmdanTOE5seP7qe3j5cbcXRMyuw==
X-Received: by 2002:a05:600c:1c83:b0:3da:fbd8:59a0 with SMTP id
 k3-20020a05600c1c8300b003dafbd859a0mr27996445wms.11.1674563134506; 
 Tue, 24 Jan 2023 04:25:34 -0800 (PST)
Received: from [192.168.37.175] (173.red-88-29-178.dynamicip.rima-tde.net.
 [88.29.178.173]) by smtp.gmail.com with ESMTPSA id
 j25-20020a05600c1c1900b003c71358a42dsm18568513wms.18.2023.01.24.04.25.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 04:25:34 -0800 (PST)
Message-ID: <b16b69fd-a138-d444-55d3-5fd1cef357a1@linaro.org>
Date: Tue, 24 Jan 2023 13:25:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 24/32] acpi: Move the QMP command from monitor/ to hw/acpi/
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, kraxel@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, marcandre.lureau@redhat.com, dgilbert@redhat.com,
 mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com, jasowang@redhat.com,
 jiri@resnulli.us, berrange@redhat.com, thuth@redhat.com,
 quintela@redhat.com, stefanb@linux.vnet.ibm.com, stefanha@redhat.com,
 kvm@vger.kernel.org, qemu-block@nongnu.org
References: <20230124121946.1139465-1-armbru@redhat.com>
 <20230124121946.1139465-25-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230124121946.1139465-25-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

On 24/1/23 13:19, Markus Armbruster wrote:
> This moves the command from MAINTAINERS section "QMP" to section
> "ACPI/SMBIOS)".
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   hw/acpi/acpi-qmp-cmds.c | 30 ++++++++++++++++++++++++++++++
>   monitor/qmp-cmds.c      | 21 ---------------------
>   hw/acpi/meson.build     |  1 +
>   3 files changed, 31 insertions(+), 21 deletions(-)
>   create mode 100644 hw/acpi/acpi-qmp-cmds.c

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


