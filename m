Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5787F675229
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 11:15:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIoPT-0001mD-7U; Fri, 20 Jan 2023 05:14:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pIoPR-0001l6-7W
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 05:14:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pIoPP-0007pI-OS
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 05:14:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674209647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ganEYfTx0epMSRmvc27vudc0WF68SCSzWUuncl3k3Ew=;
 b=KpfAwJHXAjDXJaMjZajlkL0KhaaHlrbSaDy3eAW2N3I70mXvQ5cFsi72cs/gtF8vE78Cod
 4KEvyOvsLDYBVCTAsAnhYgJh9GufGvOz9cmQpPEGSt2RdCzCbAaL+/H54C+AbeDiDTEKkX
 mNBylVKTFs73ZDPwJN0V88/XZsS2btI=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-451-rZgRqhucMpWjXLxoN5Qrdg-1; Fri, 20 Jan 2023 05:14:05 -0500
X-MC-Unique: rZgRqhucMpWjXLxoN5Qrdg-1
Received: by mail-qk1-f197.google.com with SMTP id
 bq15-20020a05620a468f00b00706ae242abcso3177388qkb.7
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 02:14:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ganEYfTx0epMSRmvc27vudc0WF68SCSzWUuncl3k3Ew=;
 b=R73k4JunmhdBsmgexwjwtNWzIM3WT2SDkKHdii+vsxIm8LrACcKy9OolKhPnXoxmwq
 fgFjct9Ngg3LQbjVr7fZ2Ni/HeaNbEskDgieH9nfoKFVFhT/4wTRjpQirwBNapEt+zhK
 stmJaN5HY3wheX8/vF+oViq2pf3nViN9RdwYjZ8xq8khV8jGJSGx2UMa0tdlsu7q0lqW
 d9yB4btq2jbDcmmXq8VgIQnNbqWz5NKI25zCRe6v0qtSRTSqPd00M7q7NqEJ/hFtz1Pz
 HYAoyYLn2MgtuVGe3uGmfGYhh0RH+BhQ5tgDlZxvZNkZS2hqbL9RMFtW898kmbBjqbX9
 AHkg==
X-Gm-Message-State: AFqh2kpuoZNZqoehcW0huzYUDKj9eHK36QvgKJCoOiBWuKh5hFKFUpmu
 ucftGUUzF7cPN2LsWrT+eXNa45bxy8/6C5ZL+AMAWAEbxsZAhQZKmDkIQRPa6lrBMbNv6JGuL4A
 m32YV76egB0Il6CA=
X-Received: by 2002:a0c:c3ce:0:b0:532:23a5:8271 with SMTP id
 p14-20020a0cc3ce000000b0053223a58271mr20514559qvi.8.1674209645351; 
 Fri, 20 Jan 2023 02:14:05 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvub8dtUXp9SRoYZqiVsggOPDjRq7GiVUQMjLhiIjIktbExucotY9Kq1c38GqRhMPpMmr3RpQ==
X-Received: by 2002:a0c:c3ce:0:b0:532:23a5:8271 with SMTP id
 p14-20020a0cc3ce000000b0053223a58271mr20514534qvi.8.1674209645129; 
 Fri, 20 Jan 2023 02:14:05 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-118.web.vodafone.de.
 [109.43.177.118]) by smtp.gmail.com with ESMTPSA id
 bi26-20020a05620a319a00b00706a1551408sm6386423qkb.4.2023.01.20.02.14.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jan 2023 02:14:04 -0800 (PST)
Message-ID: <295984f3-1086-1b25-b378-6a1c9c6bf258@redhat.com>
Date: Fri, 20 Jan 2023 11:14:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC PATCH v4 05/15] tests/qtest: Restrict
 tpm-tis-devices-{swtpm}-test to CONFIG_TCG
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <lvivier@redhat.com>
References: <20230119135424.5417-1-farosas@suse.de>
 <20230119135424.5417-6-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230119135424.5417-6-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 19/01/2023 14.54, Fabiano Rosas wrote:
> These tests set -accel tcg, so restrict them to when TCG is present.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   tests/qtest/meson.build | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 1af63f8bd2..9dd5c2de6e 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -204,8 +204,8 @@ qtests_arm = \
>   # TODO: once aarch64 TCG is fixed on ARM 32 bit host, make bios-tables-test unconditional
>   qtests_aarch64 = \
>     (cpu != 'arm' and unpack_edk2_blobs ? ['bios-tables-test'] : []) +                            \
> -  (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-test'] : []) +        \
> -  (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-swtpm-test'] : []) +  \
> +  (config_all_devices.has_key('CONFIG_TCG') and config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ?   \
> +    ['tpm-tis-device-test', 'tpm-tis-device-swtpm-test'] : []) +                                         \
>     (config_all_devices.has_key('CONFIG_XLNX_ZYNQMP_ARM') ? ['xlnx-can-test', 'fuzz-xlnx-dp-test'] : []) + \
>     (config_all_devices.has_key('CONFIG_RASPI') ? ['bcm2835-dma-test'] : []) +  \
>     ['arm-cpu-features',
> @@ -295,11 +295,15 @@ qtests = {
>     'tpm-crb-test': [io, tpmemu_files],
>     'tpm-tis-swtpm-test': [io, tpmemu_files, 'tpm-tis-util.c'],
>     'tpm-tis-test': [io, tpmemu_files, 'tpm-tis-util.c'],
> -  'tpm-tis-device-swtpm-test': [io, tpmemu_files, 'tpm-tis-util.c'],
> -  'tpm-tis-device-test': [io, tpmemu_files, 'tpm-tis-util.c'],
>     'vmgenid-test': files('boot-sector.c', 'acpi-utils.c'),
>   }
>   
> +if config_all_devices.has_key('CONFIG_TCG')
> +   qtests += { 'tpm-tis-device-swtpm-test': [io, tpmemu_files, 'tpm-tis-util.c'],
> +               'tpm-tis-device-test': [io, tpmemu_files, 'tpm-tis-util.c'], }
> +endif
> +
> +
>   gvnc = dependency('gvnc-1.0', required: false)
>   if gvnc.found()
>     qtests += {'vnc-display-test': [gvnc]}

Reviewed-by: Thomas Huth <thuth@redhat.com>


