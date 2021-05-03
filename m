Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC86B371331
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 11:49:36 +0200 (CEST)
Received: from localhost ([::1]:49736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldVCp-0000B1-SD
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 05:49:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldVB7-0007kw-Mg
 for qemu-devel@nongnu.org; Mon, 03 May 2021 05:47:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldVB5-0000RD-Dm
 for qemu-devel@nongnu.org; Mon, 03 May 2021 05:47:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620035262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=udoouGZ72rRPNhNiqfoXR14m/7ZZNiw7odwJLKZXcj4=;
 b=WLxZBY8X4zctFT3hn2EJw3U7Uu93c1Dr7FsF1fvyxgj9Tx+0qODdOZW9V8JHI+IQ59WFBz
 U2IQWz30m/CxEA5JJOk2ZiQ81aauAzi74ZcGS4kZgUvGkQ57SUoUmwRlZfHxEnXootLsH2
 VugT8Aa6clheez8x4K2u2N2cw0dGdr0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-LoSpFFzpP0ukL_tP_5iLEA-1; Mon, 03 May 2021 05:47:41 -0400
X-MC-Unique: LoSpFFzpP0ukL_tP_5iLEA-1
Received: by mail-wr1-f70.google.com with SMTP id
 s7-20020adfc5470000b0290106eef17cbdso3591902wrf.11
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 02:47:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=udoouGZ72rRPNhNiqfoXR14m/7ZZNiw7odwJLKZXcj4=;
 b=R+1Si+EON3bceT7373O9eurrFd6iORNzozEPsK/radq/jeshXkJyoBxnfcEJ5Gpz0S
 7eoDwSGr6vaOI/u+iC8+BXsOD50KfN0ZsbO37a2pRBqYXxsgra7ypF5xElVA4JaPC17u
 lctgmfMQ8LaDOGMVbG4Ly3I3dW7N21/CK9tZuCsBeCsrWwEgzMGhz54ykW+mncjflouR
 aw7ozhJ8J7nmC3rEUJivcEejst5NK5CJX6mvTgy1YqdlmKeTwvj6CbXIhSiJTdf781kY
 teniesDV6+wCzT6Y17sk9sh8g4tTYNRpgxsrs0EDGbaughX/ySQmGXdMkbSXQ1pWFmaj
 Wt/w==
X-Gm-Message-State: AOAM531Fnjy5uGjT5Lr2PSxT4sgv4kHwiJgzOub3LutyxMOTMTmxchWq
 0iZknxO7uSlSTo4gHJxgfgSFz5FoETVXLX2C0oNE1WdJl1UOc1OiH5MO1lc11LotiGspXXvLeXD
 dSynU9SvHrFs/Lfk=
X-Received: by 2002:a7b:cf27:: with SMTP id m7mr31261516wmg.116.1620035260051; 
 Mon, 03 May 2021 02:47:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWO1WWsK525xzDBmU/U1DcGpXm4WFp5DiFlQhJBPfVpKX6pi7eP8l5u6HH8ZOGd5Xsq5vi6Q==
X-Received: by 2002:a7b:cf27:: with SMTP id m7mr31261507wmg.116.1620035259899; 
 Mon, 03 May 2021 02:47:39 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id j13sm11752956wrw.93.2021.05.03.02.47.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 02:47:39 -0700 (PDT)
Subject: Re: [PATCH 0/5] usb: fix some memory allocation issues.
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20210503091446.2137206-1-kraxel@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d6d35cd8-d13d-5cd5-9b60-86e5e89352a5@redhat.com>
Date: Mon, 3 May 2021 11:47:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210503091446.2137206-1-kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: mcascell@redhat.com, remy.noel@blade-group.com,
 Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/3/21 11:14 AM, Gerd Hoffmann wrote:
> 
> 
> Gerd Hoffmann (5):
>   usb/hid: avoid dynamic stack allocation
>   usb/redir: avoid dynamic stack allocation (CVE-2021-3527)
>   usb/mtp: avoid dynamic stack allocation
>   usb/xhci: sanity check packet size
>   usb: limit combined packets to 1 MiB

What about enabling -Wvla by default?

  -Wvla
        Warn if a variable-length array is used in the code.

Most of our variable-length stack alloc could use some
LENGTH_MAX definition or use the heap:

[2/1072] Compiling C object libqemuutil.a.p/util_iov.c.o
FAILED: libqemuutil.a.p/util_iov.c.o
util/iov.c: In function ‘qemu_iovec_clone’:
util/iov.c:626:5: error: ISO C90 forbids variable length array
‘sortelems’ [-Werror=vla]
  626 |     IOVectorSortElem sortelems[src->niov];
      |     ^~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
[125/1072] Compiling C object libio.fa.p/io_channel-websock.c.o
FAILED: libio.fa.p/io_channel-websock.c.o
io/channel-websock.c: In function
‘qio_channel_websock_handshake_send_res_ok’:
io/channel-websock.c:350:23: error: ISO C90 forbids array ‘combined_key’
whose size cannot be evaluated [-Werror=vla]
  350 |                       QIO_CHANNEL_WEBSOCK_GUID_LEN + 1];
      |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
[177/1072] Compiling C object libblock.fa.p/block_vpc.c.o
FAILED: libblock.fa.p/block_vpc.c.o
block/vpc.c: In function ‘get_image_offset’:
block/vpc.c:512:9: error: ISO C90 forbids variable length array ‘bitmap’
[-Werror=vla]
  512 |         uint8_t bitmap[s->bitmap_size];
      |         ^~~~~~~
block/vpc.c: In function ‘alloc_block’:
block/vpc.c:559:5: error: ISO C90 forbids variable length array ‘bitmap’
[-Werror=vla]
  559 |     uint8_t bitmap[s->bitmap_size];
      |     ^~~~~~~
cc1: all warnings being treated as errors
[278/1072] Compiling C object libcommon.fa.p/ui_vnc-enc-hextile.c.o
FAILED: libcommon.fa.p/ui_vnc-enc-hextile.c.o
In file included from ui/vnc-enc-hextile.c:37:
ui/vnc-enc-hextile-template.h: In function ‘send_hextile_tile_32’:
ui/vnc-enc-hextile-template.h:28:5: error: ISO C90 forbids variable
length array ‘data’ [-Werror=vla]
   28 |     uint8_t data[(vs->client_pf.bytes_per_pixel + 2) * 16 * 16];
      |     ^~~~~~~
In file included from ui/vnc-enc-hextile.c:42:
ui/vnc-enc-hextile-template.h: In function ‘send_hextile_tile_generic_32’:
ui/vnc-enc-hextile-template.h:28:5: error: ISO C90 forbids variable
length array ‘data’ [-Werror=vla]
   28 |     uint8_t data[(vs->client_pf.bytes_per_pixel + 2) * 16 * 16];
      |     ^~~~~~~
cc1: all warnings being treated as errors
[283/1072] Compiling C object libcommon.fa.p/ui_vnc-enc-tight.c.o
FAILED: libcommon.fa.p/ui_vnc-enc-tight.c.o
ui/vnc-enc-tight.c: In function ‘send_palette_rect’:
ui/vnc-enc-tight.c:1101:9: error: ISO C90 forbids variable length array
‘header’ [-Werror=vla]
 1101 |         uint32_t header[palette_size(palette)];
      |         ^~~~~~~~
ui/vnc-enc-tight.c:1118:9: error: ISO C90 forbids variable length array
‘header’ [-Werror=vla]
 1118 |         uint16_t header[palette_size(palette)];
      |         ^~~~~~~~
cc1: all warnings being treated as errors
[353/1072] Compiling C object libcommon.fa.p/net_dump.c.o
FAILED: libcommon.fa.p/net_dump.c.o
net/dump.c: In function ‘dump_receive_iov’:
net/dump.c:71:12: error: ISO C90 forbids variable length array ‘dumpiov’
[-Werror=vla]
   71 |     struct iovec dumpiov[cnt + 1];
      |            ^~~~~
cc1: all warnings being treated as errors
[375/1072] Compiling C object libcommon.fa.p/net_tap.c.o
FAILED: libcommon.fa.p/net_tap.c.o
net/tap.c: In function ‘tap_receive_iov’:
net/tap.c:123:12: error: ISO C90 forbids variable length array
‘iov_copy’ [-Werror=vla]
  123 |     struct iovec iov_copy[iovcnt + 1];
      |            ^~~~~
cc1: all warnings being treated as errors
[451/1072] Compiling C object libcommon.fa.p/hw_block_nvme.c.o
FAILED: libcommon.fa.p/hw_block_nvme.c.o
hw/block/nvme.c: In function ‘nvme_map_prp’:
hw/block/nvme.c:655:13: error: ISO C90 forbids variable length array
‘prp_list’ [-Werror=vla]
  655 |             uint64_t prp_list[n->max_prp_ents];
      |             ^~~~~~~~
hw/block/nvme.c: In function ‘nvme_map_sgl’:
hw/block/nvme.c:817:5: error: ISO C90 forbids variable length array
‘segment’ [-Werror=vla]
  817 |     NvmeSglDescriptor segment[SEG_CHUNK_SIZE], *sgld, *last_sgld;
      |     ^~~~~~~~~~~~~~~~~
hw/block/nvme.c: In function ‘nvme_dsm’:
hw/block/nvme.c:2513:9: error: ISO C90 forbids variable length array
‘range’ [-Werror=vla]
 2513 |         NvmeDsmRange range[nr];
      |         ^~~~~~~~~~~~
cc1: all warnings being treated as errors
[653/1072] Compiling C object libcommon.fa.p/hw_net_e1000e_core.c.o
FAILED: libcommon.fa.p/hw_net_e1000e_core.c.o
hw/net/e1000e_core.c: In function ‘e1000e_receive_iov’:
hw/net/e1000e_core.c:1632:5: error: ISO C90 forbids variable length
array ‘min_buf’ [-Werror=vla]
 1632 |     uint8_t min_buf[min_buf_size];
      |     ^~~~~~~
cc1: all warnings being treated as errors
[663/1072] Compiling C object libcommon.fa.p/hw_net_rocker_rocker_of_dpa.c.o
FAILED: libcommon.fa.p/hw_net_rocker_rocker_of_dpa.c.o
hw/net/rocker/rocker_of_dpa.c: In function ‘of_dpa_ig’:
hw/net/rocker/rocker_of_dpa.c:1046:12: error: ISO C90 forbids variable
length array ‘iov_copy’ [-Werror=vla]
 1046 |     struct iovec iov_copy[iovcnt + 2];
      |            ^~~~~
cc1: all warnings being treated as errors
[778/1072] Compiling C object libcommon.fa.p/hw_usb_hcd-ohci.c.o
FAILED: libcommon.fa.p/hw_usb_hcd-ohci.c.o
hw/usb/hcd-ohci.c: In function ‘ohci_td_pkt’:
hw/usb/hcd-ohci.c:903:5: error: ISO C90 forbids variable length array
‘tmp’ [-Werror=vla]
  903 |     char tmp[3 * width + 1];
      |     ^~~~
cc1: all warnings being treated as errors
[787/1072] Compiling C object libcommon.fa.p/hw_usb_hcd-xhci.c.o
FAILED: libcommon.fa.p/hw_usb_hcd-xhci.c.o
hw/usb/hcd-xhci.c: In function ‘xhci_get_port_bandwidth’:
hw/usb/hcd-xhci.c:2385:5: error: ISO C90 forbids variable length array
‘bw_ctx’ [-Werror=vla]
 2385 |     uint8_t bw_ctx[xhci->numports+1];
      |     ^~~~~~~
cc1: all warnings being treated as errors
[791/1072] Compiling C object libcommon.fa.p/hw_usb_dev-hid.c.o
FAILED: libcommon.fa.p/hw_usb_dev-hid.c.o
hw/usb/dev-hid.c: In function ‘usb_hid_handle_data’:
hw/usb/dev-hid.c:659:5: error: ISO C90 forbids variable length array
‘buf’ [-Werror=vla]
  659 |     uint8_t buf[p->iov.size];
      |     ^~~~~~~
cc1: all warnings being treated as errors
[794/1072] Compiling C object libcommon.fa.p/hw_usb_dev-wacom.c.o
FAILED: libcommon.fa.p/hw_usb_dev-wacom.c.o
hw/usb/dev-wacom.c: In function ‘usb_wacom_handle_data’:
hw/usb/dev-wacom.c:304:5: error: ISO C90 forbids variable length array
‘buf’ [-Werror=vla]
  304 |     uint8_t buf[p->iov.size];
      |     ^~~~~~~
cc1: all warnings being treated as errors
[807/1072] Compiling C object libcommon.fa.p/hw_usb_dev-mtp.c.o
FAILED: libcommon.fa.p/hw_usb_dev-mtp.c.o
hw/usb/dev-mtp.c: In function ‘usb_mtp_get_object_handles’:
hw/usb/dev-mtp.c:910:5: error: ISO C90 forbids variable length array
‘handles’ [-Werror=vla]
  910 |     uint32_t i = 0, handles[o->nchildren];
      |     ^~~~~~~~
cc1: all warnings being treated as errors
[818/1072] Compiling C object libcommon.fa.p/chardev_baum.c.o
FAILED: libcommon.fa.p/chardev_baum.c.o
chardev/baum.c: In function ‘baum_write_packet’:
chardev/baum.c:299:5: error: ISO C90 forbids variable length array
‘io_buf’ [-Werror=vla]
  299 |     uint8_t io_buf[1 + 2 * len], *cur = io_buf;
      |     ^~~~~~~
chardev/baum.c: In function ‘baum_eat_packet’:
chardev/baum.c:383:9: error: ISO C90 forbids variable length array
‘cells’ [-Werror=vla]
  383 |         uint8_t cells[baum->x * baum->y], c;
      |         ^~~~~~~
chardev/baum.c:384:9: error: ISO C90 forbids variable length array
‘text’ [-Werror=vla]
  384 |         uint8_t text[baum->x * baum->y];
      |         ^~~~~~~
chardev/baum.c:385:9: error: ISO C90 forbids variable length array
‘zero’ [-Werror=vla]
  385 |         uint8_t zero[baum->x * baum->y];
      |         ^~~~~~~
cc1: all warnings being treated as errors
[825/1072] Compiling C object libcommon.fa.p/hw_usb_redirect.c.o
FAILED: libcommon.fa.p/hw_usb_redirect.c.o
hw/usb/redirect.c: In function ‘usbredir_handle_iso_data’:
hw/usb/redirect.c:623:13: error: ISO C90 forbids variable length array
‘buf’ [-Werror=vla]
  623 |             uint8_t buf[p->iov.size];
      |             ^~~~~~~
hw/usb/redirect.c: In function ‘usbredir_handle_bulk_data’:
hw/usb/redirect.c:821:9: error: ISO C90 forbids variable length array
‘buf’ [-Werror=vla]
  821 |         uint8_t buf[size];
      |         ^~~~~~~
hw/usb/redirect.c: In function ‘usbredir_handle_interrupt_out_data’:
hw/usb/redirect.c:926:5: error: ISO C90 forbids variable length array
‘buf’ [-Werror=vla]
  926 |     uint8_t buf[p->iov.size];
      |     ^~~~~~~
cc1: all warnings being treated as errors
[830/1072] Compiling C object libcommon.fa.p/ui_curses.c.o
FAILED: libcommon.fa.p/ui_curses.c.o
ui/curses.c: In function ‘curses_update’:
ui/curses.c:68:5: error: ISO C90 forbids variable length array
‘curses_line’ [-Werror=vla]
   68 |     cchar_t curses_line[width];
      |     ^~~~~~~
cc1: all warnings being treated as errors
[852/1072] Compiling C object libcommon.fa.p/ui_spice-display.c.o
FAILED: libcommon.fa.p/ui_spice-display.c.o
ui/spice-display.c: In function ‘qemu_spice_create_update’:
ui/spice-display.c:191:5: error: ISO C90 forbids variable length array
‘dirty_top’ [-Werror=vla]
  191 |     int dirty_top[blocks];
      |     ^~~
cc1: all warnings being treated as errors
[987/1072] Compiling C object
libqemu-arm-softmmu.fa.p/hw_block_dataplane_virtio-blk.c.o
FAILED: libqemu-arm-softmmu.fa.p/hw_block_dataplane_virtio-blk.c.o
hw/block/dataplane/virtio-blk.c: In function ‘notify_guest_bh’:
hw/block/dataplane/virtio-blk.c:63:5: error: ISO C90 forbids variable
length array ‘bitmap’ [-Werror=vla]
   63 |     unsigned long bitmap[BITS_TO_LONGS(nvqs)];
      |     ^~~~~~~~
cc1: all warnings being treated as errors
[1066/1072] Compiling C object
libqemu-arm-softmmu.fa.p/accel_tcg_translate-all.c.o
ninja: build stopped: cannot make progress due to previous errors.


