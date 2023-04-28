Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F07246F210E
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Apr 2023 01:00:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psX3b-0006sx-Hm; Fri, 28 Apr 2023 18:59:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1psX3Z-0006sp-5g
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 18:59:13 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1psX3W-0002a4-Mh
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 18:59:12 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-2f917585b26so270589f8f.0
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 15:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682722748; x=1685314748;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uoq6uGtLgHpNzlFySvojZChVI82fwUk3gpTz3zuOHGc=;
 b=HYZvaxmPKYTt8FbHWm4BoogRhmHad1xTpziwwlUP5XK0nGeI8khshtf7sDU6ZWbBYs
 wlcy5nMEpV5S50JBE1gSNqSTCh0W2Lh3U7eW8hkfzRo6iY/mcV5huSnYg+2tRB+8Wb6h
 iWg1NqwueiTttxpDnpJJA+PxBnVDkvqySxPabtQrfCZUhoY6DBKemNRd0F7scsb6CRG3
 xw+5V+elnR5ArJo17wwEJf7esHia9inbzJPBQ2AFqjICsoB9Sqt5G+vcd0cLlIn+25IB
 yXbxtPsAFZ6xa2wKBOrG9pyeIsc9nYOwiBPileaL6E/QM3Zfvux+C2X9a+jNrApxuIQl
 Hk+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682722748; x=1685314748;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uoq6uGtLgHpNzlFySvojZChVI82fwUk3gpTz3zuOHGc=;
 b=LhSVule2YuhQ6UpOIdQVXh3K+BEcj1AUWCywnqzFJktK18Juy6j7MleTgXxGKaI/vg
 0jQhVeeHez11GuoGBifCQNlJ9bprM4y1ZDerTw1te8ZVFxAq83XSgoEYRXcdeFflzkks
 VoXHnGSBwCcyCHsctURPJk8+FpcjI4l+xk08NbN5jDh8MfcrImQ/RDvvyQYnuUkBI3p5
 30DlR5zn13aGKWkEtQe6FhWYqryB9O94FoBlV5aN/OT/CCSTsmJCoBMZWJs4GTySKrdX
 JoLCNU2HKC6GMjk9R+oiCk1c7z3ayHWVXRjI7CDqgTeWO46q7TvHcByAMS2PRjo6ubhO
 n0Bw==
X-Gm-Message-State: AC+VfDx201fTTYaKmG1XJH4NHxhNdGCvaGgcoZsags5XVZli1+jbMova
 pQj16l8qJTqgLRV8u2+8Zrt27w==
X-Google-Smtp-Source: ACHHUZ5YBErf7YLlrXkxD86ICB32u8njm8++XDohRTqB5rIdKxWeQebNsQy/F3Qw7ARa5vLRNhbvSA==
X-Received: by 2002:a05:6000:136a:b0:2ef:ae66:c0e3 with SMTP id
 q10-20020a056000136a00b002efae66c0e3mr4826145wrz.12.1682722748187; 
 Fri, 28 Apr 2023 15:59:08 -0700 (PDT)
Received: from [192.168.192.175] (47.red-88-28-19.dynamicip.rima-tde.net.
 [88.28.19.47]) by smtp.gmail.com with ESMTPSA id
 m9-20020a7bce09000000b003f049a42689sm25492335wmc.25.2023.04.28.15.59.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Apr 2023 15:59:07 -0700 (PDT)
Message-ID: <03741af0-5983-32c1-7649-7b879dd6f02b@linaro.org>
Date: Fri, 28 Apr 2023 23:59:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v4 3/3] Add a Hyper-V Dynamic Memory Protocol driver
 (hv-balloon)
Content-Language: en-US
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <cover.1682584770.git.maciej.szmigiero@oracle.com>
 <f6adc90d94f4ee6be8051c11b9f4a5ff507e7e49.1682584770.git.maciej.szmigiero@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <f6adc90d94f4ee6be8051c11b9f4a5ff507e7e49.1682584770.git.maciej.szmigiero@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 27/4/23 11:08, Maciej S. Szmigiero wrote:
> From: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>
> 
> This driver is like virtio-balloon on steroids: it allows both changing the
> guest memory allocation via ballooning and inserting pieces of extra RAM
> into it on demand from a provided memory backend.
> 
> One of advantages of these over ACPI-based PC DIMM hotplug is that such
> memory can be hotplugged in much smaller granularity because the ACPI DIMM
> slot limit does not apply.
> 
> In order to enable hot-adding additional memory a new memory backend needs
> to be created and provided to the driver via the "memdev" parameter.
> This can be achieved by, for example, adding
> "-object memory-backend-ram,id=mem1,size=32G" to the QEMU command line and
> then instantiating the driver with "memdev=mem1" parameter.
> 
> In contrast with ACPI DIMM hotplug where one can only request to unplug a
> whole DIMM stick this driver allows removing memory from guest in single
> page (4k) units via ballooning.
> 
> The actual resizing is done via ballooning interface (for example, via
> the "balloon" HMP command)
> This includes resizing the guest past its boot size - that is, hot-adding
> additional memory in granularity limited only by the guest alignment
> requirements.
> 
> After a VM reboot the guest is back to its original (boot) size.
> 
> In the future, the guest boot memory size might be changed on reboot
> instead, taking into account the effective size that VM had before that
> reboot (much like Hyper-V does).
> 
> For performance reasons, the guest-released memory is tracked in a few
> range trees, as a series of (start, count) ranges.
> Each time a new page range is inserted into such tree its neighbors are
> checked as candidates for possible merging with it.
> 
> Besides performance reasons, the Dynamic Memory protocol itself uses page
> ranges as the data structure in its messages, so relevant pages need to be
> merged into such ranges anyway.
> 
> One has to be careful when tracking the guest-released pages, since the
> guest can maliciously report returning pages outside its current address
> space, which later clash with the address range of newly added memory.
> Similarly, the guest can report freeing the same page twice.
> 
> The above design results in much better ballooning performance than when
> using virtio-balloon with the same guest: 230 GB / minute with this driver
> versus 70 GB / minute with virtio-balloon.
> 
> During a ballooning operation most of time is spent waiting for the guest
> to come up with newly freed page ranges, processing the received ranges on
> the host side (in QEMU and KVM) is nearly instantaneous.
> 
> The unballoon operation is also pretty much instantaneous:
> thanks to the merging of the ballooned out page ranges 200 GB of memory can
> be returned to the guest in about 1 second.
> With virtio-balloon this operation takes about 2.5 minutes.
> 
> These tests were done against a Windows Server 2019 guest running on a
> Xeon E5-2699, after dirtying the whole memory inside guest before each
> balloon operation.
> 
> Using a range tree instead of a bitmap to track the removed memory also
> means that the solution scales well with the guest size: even a 1 TB range
> takes just a few bytes of such metadata.
> 
> Since the required GTree operations aren't present in every Glib version
> a check for them was added to "configure" script, together with new
> "--enable-hv-balloon" and "--disable-hv-balloon" arguments.
> If these GTree operations are missing in the system's Glib version this
> driver will be skipped during QEMU build.
> 
> An optional "status-report=on" device parameter requests memory status
> events from the guest (typically sent every second), which allow the host
> to learn both the guest memory available and the guest memory in use
> counts.
> They are emitted externally as "HV_BALLOON_STATUS_REPORT" QMP events.
> 
> The driver is named hv-balloon since the Linux kernel client driver for
> the Dynamic Memory Protocol is named as such and to follow the naming
> pattern established by the virtio-balloon driver.
> The whole protocol runs over Hyper-V VMBus.
> 
> The driver was tested against Windows Server 2012 R2, Windows Server 2016
> and Windows Server 2019 guests and obeys the guest alignment requirements
> reported to the host via DM_CAPABILITIES_REPORT message.
> 
> Signed-off-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
> ---
>   Kconfig.host           |    3 +
>   configure              |   36 +
>   hw/hyperv/Kconfig      |    5 +
>   hw/hyperv/hv-balloon.c | 2040 ++++++++++++++++++++++++++++++++++++++++
>   hw/hyperv/meson.build  |    1 +
>   hw/hyperv/trace-events |   16 +
>   meson.build            |    4 +-
>   qapi/machine.json      |   25 +
>   8 files changed, 2129 insertions(+), 1 deletion(-)
>   create mode 100644 hw/hyperv/hv-balloon.c
> 
> diff --git a/Kconfig.host b/Kconfig.host
> index d763d89269..2ee71578f3 100644
> --- a/Kconfig.host
> +++ b/Kconfig.host
> @@ -46,3 +46,6 @@ config FUZZ
>   config VFIO_USER_SERVER_ALLOWED
>       bool
>       imply VFIO_USER_SERVER
> +
> +config HV_BALLOON_POSSIBLE
> +    bool

Should this be restricted to little-endian hosts?

