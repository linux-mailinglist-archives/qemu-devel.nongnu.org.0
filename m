Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 839CA323E6E
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 14:39:54 +0100 (CET)
Received: from localhost ([::1]:52258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEuOP-0002AI-HY
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 08:39:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lEuBm-000544-8M
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 08:26:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lEuBk-000218-Bw
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 08:26:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614173207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JdbNfjCj7fVBmOlRBW0Kq1tYijpVn/Hg1I18yV0OahI=;
 b=D/mi8oSc7A3aC4DFS7doffawKg6zIZaJm3q4bIi/0vNuVqxaxDJLEeYDM9kYIpbckhS/YU
 ZZFcHZ/rc9skHT2z3ohOq/nPBxcoPw38ypfo6XYT3tycx2OrkV3D1IM5nobLKX6aHRVDZA
 +hrrEFv0C0hvP+1S2uCvT7bEZUL5k/0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-ya6aUfmbNmm-tcnsKMKpqQ-1; Wed, 24 Feb 2021 08:25:51 -0500
X-MC-Unique: ya6aUfmbNmm-tcnsKMKpqQ-1
Received: by mail-ej1-f71.google.com with SMTP id ml13so810884ejb.2
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 05:25:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JdbNfjCj7fVBmOlRBW0Kq1tYijpVn/Hg1I18yV0OahI=;
 b=bPRLxton/fcuCnd4CigHHHX6Kr/ioOYkY0XLxTt4lFrOG2vdgTN5yFIJGqNQKE0Ds6
 kfNv3GkVpdHLvVs8OHC34ZdHcNPZNNJfOUcvx7KCSdZoYvkZIta3HZJ4JQMPaT5vVN5A
 qrKq2SaO4FRvFDZysyOk9cvcroI61uYYC1f1hnda7nGeh44o76KbThV6yHyUgS8WLcC5
 Fp5+HsNVXrMJH/UCLnQZ0WotxQ2O5z6reZXg+xxnbDBARtxjZm4JLhusjUXoYsy05rIe
 zENp3rbZnjrCguLH/qITvYxWcoyS1CxnNPFf0Z3Zf8QUXhN5A5fwr7tTPeUW61+UAgPb
 1Z+w==
X-Gm-Message-State: AOAM530NXZ3dvCShvRs51I1hQ83D8QIQK3NG4zHmcnEekGuZ506nxhhc
 c0/gttdm3m5Mqs7y3fQxCUlsOmsznQQXEAPv7nOX295pieVrZ5HfZxqY91RetwV8ASj0MEUOxPw
 BkV/RQ1IE4oGjI6s=
X-Received: by 2002:a17:906:cf8f:: with SMTP id
 um15mr15921770ejb.455.1614173149999; 
 Wed, 24 Feb 2021 05:25:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxSmc+7J0tahxfmV0/gg5XkVKlZF+dP1AW39P+a/gocFGKukIUefbp+ruNZkZ5e4oGrlk4BYA==
X-Received: by 2002:a17:906:cf8f:: with SMTP id
 um15mr15921734ejb.455.1614173149790; 
 Wed, 24 Feb 2021 05:25:49 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u17sm1590113edr.0.2021.02.24.05.25.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Feb 2021 05:25:48 -0800 (PST)
Subject: Re: [PATCH 04/14] softmmu: remove '-usbdevice' command line option
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210224131142.1952027-1-berrange@redhat.com>
 <20210224131142.1952027-5-berrange@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <18b76a19-6f69-890e-8bb5-54d90aa132c1@redhat.com>
Date: Wed, 24 Feb 2021 14:25:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210224131142.1952027-5-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/02/21 14:11, Daniel P. Berrangé wrote:
> This was replaced by the '-device usb-DEV' option.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

This is probably used in many tutorial as "-usbdevice tablet" (for 
example https://wiki.gentoo.org/wiki/QEMU/Options).

Paolo

> ---
>   docs/system/deprecated.rst       |  9 -------
>   docs/system/removed-features.rst |  9 +++++++
>   softmmu/vl.c                     | 42 --------------------------------
>   3 files changed, 9 insertions(+), 51 deletions(-)
> 
> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> index 611adf60f7..c577cc97c4 100644
> --- a/docs/system/deprecated.rst
> +++ b/docs/system/deprecated.rst
> @@ -21,15 +21,6 @@ deprecated.
>   System emulator command line arguments
>   --------------------------------------
>   
> -``-usbdevice`` (since 2.10.0)
> -'''''''''''''''''''''''''''''
> -
> -The ``-usbdevice DEV`` argument is now a synonym for setting
> -the ``-device usb-DEV`` argument instead. The deprecated syntax
> -would automatically enable USB support on the machine type.
> -If using the new syntax, USB support must be explicitly
> -enabled via the ``-machine usb=on`` argument.
> -
>   ``-drive file=json:{...{'driver':'file'}}`` (since 3.0)
>   '''''''''''''''''''''''''''''''''''''''''''''''''''''''
>   
> diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
> index dc63581fe5..74d022babf 100644
> --- a/docs/system/removed-features.rst
> +++ b/docs/system/removed-features.rst
> @@ -50,6 +50,15 @@ by the ``tls-authz`` and ``sasl-authz`` options.
>   The ``pretty=on|off`` switch has no effect for HMP monitors and
>   its use is rejected.
>   
> +``-usbdevice`` (removed in 6.0)
> +'''''''''''''''''''''''''''''''
> +
> +The ``-usbdevice DEV`` argument was now a synonym for setting
> +the ``-device usb-DEV`` argument instead. The removed syntax
> +would automatically enable USB support on the machine type.
> +When using the new syntax, USB support must be explicitly
> +enabled via the ``-machine usb=on`` argument.
> +
>   QEMU Machine Protocol (QMP) commands
>   ------------------------------------
>   
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index b219ce1f35..c31061cc09 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -743,34 +743,6 @@ static void configure_msg(QemuOpts *opts)
>   }
>   
>   
> -/***********************************************************/
> -/* USB devices */
> -
> -static int usb_device_add(const char *devname)
> -{
> -    USBDevice *dev = NULL;
> -
> -    if (!machine_usb(current_machine)) {
> -        return -1;
> -    }
> -
> -    dev = usbdevice_create(devname);
> -    if (!dev)
> -        return -1;
> -
> -    return 0;
> -}
> -
> -static int usb_parse(const char *cmdline)
> -{
> -    int r;
> -    r = usb_device_add(cmdline);
> -    if (r < 0) {
> -        error_report("could not add USB device '%s'", cmdline);
> -    }
> -    return r;
> -}
> -
>   /***********************************************************/
>   /* machine registration */
>   
> @@ -1267,7 +1239,6 @@ static void monitor_parse(const char *optarg, const char *mode, bool pretty)
>   
>   struct device_config {
>       enum {
> -        DEV_USB,       /* -usbdevice     */
>           DEV_SERIAL,    /* -serial        */
>           DEV_PARALLEL,  /* -parallel      */
>           DEV_DEBUGCON,  /* -debugcon */
> @@ -2484,12 +2455,6 @@ static void qemu_create_cli_devices(void)
>       qemu_opts_foreach(qemu_find_opts("fw_cfg"),
>                         parse_fw_cfg, fw_cfg_find(), &error_fatal);
>   
> -    /* init USB devices */
> -    if (machine_usb(current_machine)) {
> -        if (foreach_device_config(DEV_USB, usb_parse) < 0)
> -            exit(1);
> -    }
> -
>       /* init generic devices */
>       rom_set_order_override(FW_CFG_ORDER_OVERRIDE_DEVICE);
>       qemu_opts_foreach(qemu_find_opts("device"),
> @@ -3182,13 +3147,6 @@ void qemu_init(int argc, char **argv, char **envp)
>                   olist = qemu_find_opts("machine");
>                   qemu_opts_parse_noisily(olist, "usb=on", false);
>                   break;
> -            case QEMU_OPTION_usbdevice:
> -                error_report("'-usbdevice' is deprecated, please use "
> -                             "'-device usb-...' instead");
> -                olist = qemu_find_opts("machine");
> -                qemu_opts_parse_noisily(olist, "usb=on", false);
> -                add_device_config(DEV_USB, optarg);
> -                break;
>               case QEMU_OPTION_device:
>                   if (!qemu_opts_parse_noisily(qemu_find_opts("device"),
>                                                optarg, true)) {
> 


