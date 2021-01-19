Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8942FC1D4
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 22:06:39 +0100 (CET)
Received: from localhost ([::1]:40738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1yCz-00057j-RM
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 16:06:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1y8Y-0003SX-Rb
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 16:02:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1y8V-0004hv-4q
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 16:02:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611090117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q3TOorZld1vpG3qwNGfJUXbHs17Zed26zGgAfB3mWpc=;
 b=MstdSmobgtfVkuHw3GGiq7UqsZKcxneSF0UHdG9KQjF2AsrwU97NmSc9nLp3ikQZvcJt34
 FUeb6J3svS6Uvf0g40X3DAeFmF+eBkbI6AtE3QeEljygc2BeGOA6/hYF0s65sMcOaXG03K
 JuxEQwUII9voTt3YeqwNjB2ybRTvRyg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-iSufSrqhM4aojuWvmHIGHg-1; Tue, 19 Jan 2021 16:01:55 -0500
X-MC-Unique: iSufSrqhM4aojuWvmHIGHg-1
Received: by mail-ed1-f70.google.com with SMTP id f4so4154873eds.5
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 13:01:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q3TOorZld1vpG3qwNGfJUXbHs17Zed26zGgAfB3mWpc=;
 b=QwfTgzchta067RmOhMDzN9f+HeIevYkNUxyPKCX+xT3U9k5JMLYwDpfnpVvwhzoNaX
 6XQ/VLG11fojpbRv2VGGEH0Pizmo3cK9WqKuf21+KOBgRPJ8jVJgqDx2TGUgYPLtEKeI
 43/ROQ3g4XcgLDfIP924O2eG9P7hGGeJH/cTyXf5kuuThXa25yjz3zDAsdJsO9PVBKTf
 Uk2SYmR1ANhGRU4xoG84YlyEH8KS15JIxrYoxBvMn2JqinsnzfN6ZpHSxQ0CH9ATyXXo
 PYzFtNwQnF6QpLLFfUNJT/JAmA7lf5wIUIWwfP94YG2deVFBE9x0jCsetAPcziAydoVF
 +TTQ==
X-Gm-Message-State: AOAM532jSu3FTioSWho6PUwf/oubahLvg5egzLlVl0dYpLpSaurnaQ8t
 8I7AVVF9ocsbjSXxje293LV/EMS2ePyMIP2kTsNq5w3ijFOcbvtoJIppPrzQra374fT0UZiNBog
 rWvrTyG4jTT78tzKiXZsOsy/gZj38LYuKmsIbrqY5q5AL6R89PjzJZ6Dv/sdoedTw
X-Received: by 2002:a17:906:6b08:: with SMTP id
 q8mr4173781ejr.391.1611090113438; 
 Tue, 19 Jan 2021 13:01:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwFLMWASfzQQJlqvIUyjvteDT420pCgHJRIbWQPWy4l6qgvLsRESvpgzbNot89WXTRAiAcOww==
X-Received: by 2002:a17:906:6b08:: with SMTP id
 q8mr4173769ejr.391.1611090113220; 
 Tue, 19 Jan 2021 13:01:53 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id x17sm2526edd.76.2021.01.19.13.01.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jan 2021 13:01:52 -0800 (PST)
Subject: Re: [PATCH] usb: add pcap support.
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20210119194452.2148048-1-kraxel@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <97b56d63-870c-2c41-b20c-96411301dc62@redhat.com>
Date: Tue, 19 Jan 2021 22:01:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210119194452.2148048-1-kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/19/21 8:44 PM, Gerd Hoffmann wrote:
> Log all traffic of a specific usb device to a pcap file for later
> inspection.  File format is compatible with linux usb monitor.
> 
> Usage:
>   qemu -device usb-${somedevice},pcap=file.pcap
>   wireshark file.pcap

Great!

> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  include/hw/usb.h   |   8 ++
>  hw/usb/bus.c       |  16 +++
>  hw/usb/core.c      |  17 ++++
>  hw/usb/pcap.c      | 242 +++++++++++++++++++++++++++++++++++++++++++++
>  hw/usb/meson.build |   1 +
>  5 files changed, 284 insertions(+)
>  create mode 100644 hw/usb/pcap.c
...

> diff --git a/hw/usb/pcap.c b/hw/usb/pcap.c
> new file mode 100644
> index 000000000000..d3162d65e5fe
> --- /dev/null
> +++ b/hw/usb/pcap.c
> @@ -0,0 +1,242 @@

Missing license.

> +#include "qemu/osdep.h"
> +#include "hw/usb.h"
> +
> +#define PCAP_MAGIC                   0xa1b2c3d4
> +#define PCAP_MAJOR                   2
> +#define PCAP_MINOR                   4
> +
> +/* https://wiki.wireshark.org/Development/LibpcapFileFormat */
> +
> +struct pcap_hdr {
> +    uint32_t magic_number;   /* magic number */
> +    uint16_t version_major;  /* major version number */
> +    uint16_t version_minor;  /* minor version number */
> +    int32_t  thiszone;       /* GMT to local correction */
> +    uint32_t sigfigs;        /* accuracy of timestamps */
> +    uint32_t snaplen;        /* max length of captured packets, in octets */
> +    uint32_t network;        /* data link type */
> +};

QEMU_PACKED?

> +
> +struct pcaprec_hdr {
> +    uint32_t ts_sec;         /* timestamp seconds */
> +    uint32_t ts_usec;        /* timestamp microseconds */
> +    uint32_t incl_len;       /* number of octets of packet saved in file */
> +    uint32_t orig_len;       /* actual length of packet */
> +};

QEMU_PACKED?

> +
> +/* https://www.tcpdump.org/linktypes.html */
> +/* linux: Documentation/usb/usbmon.rst */
> +/* linux: drivers/usb/mon/mon_bin.c */
> +
> +#define LINKTYPE_USB_LINUX           189  /* first 48 bytes only */
> +#define LINKTYPE_USB_LINUX_MMAPPED   220  /* full 64 byte header */
> +
> +struct usbmon_packet {
> +    uint64_t id;             /*  0: URB ID - from submission to callback */
> +    unsigned char type;      /*  8: Same as text; extensible. */
> +    unsigned char xfer_type; /*     ISO (0), Intr, Control, Bulk (3) */
> +    unsigned char epnum;     /*     Endpoint number and transfer direction */
> +    unsigned char devnum;    /*     Device address */
> +    uint16_t busnum;         /* 12: Bus number */
> +    char flag_setup;         /* 14: Same as text */
> +    char flag_data;          /* 15: Same as text; Binary zero is OK. */
> +    int64_t ts_sec;          /* 16: gettimeofday */
> +    int32_t ts_usec;         /* 24: gettimeofday */
> +    int32_t status;          /* 28: */
> +    unsigned int length;     /* 32: Length of data (submitted or actual) */
> +    unsigned int len_cap;    /* 36: Delivered length */
> +    union {                  /* 40: */
> +        unsigned char setup[8];         /* Only for Control S-type */
> +        struct iso_rec {                /* Only for ISO */
> +            int32_t error_count;
> +            int32_t numdesc;
> +        } iso;
> +    } s;
> +    int32_t interval;        /* 48: Only for Interrupt and ISO */
> +    int32_t start_frame;     /* 52: For ISO */
> +    uint32_t xfer_flags;     /* 56: copy of URB's transfer_flags */
> +    uint32_t ndesc;          /* 60: Actual number of ISO descriptors */
> +};                           /* 64 total length */

QEMU_PACKED?

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


