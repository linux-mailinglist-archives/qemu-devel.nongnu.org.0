Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 589F821542C
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jul 2020 10:48:15 +0200 (CEST)
Received: from localhost ([::1]:60482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsMnO-00078S-FK
	for lists+qemu-devel@lfdr.de; Mon, 06 Jul 2020 04:48:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jsMmd-0006iO-21
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 04:47:27 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:45477
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jsMmb-000106-0S
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 04:47:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594025243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=P8h/HhrsmeetZ3WpwezM5OiaGGfhKuZoeymCllUho4Q=;
 b=glJ2BMQN0EuuaNxtnfjZc5nHIh0R00Q6KwzfY0cc8Wtwk4iUOLj38UFFZC6RRYGDUsmvLy
 KlGOtRCK5fjSgV0YLr2bCFAQjMhvpEM+S1VMVmlnzdrVSymyqr7pYU9eb/2gn74brBD5OV
 187eFqYMyUi8SLD21mTBQk8pqYTCo5k=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-y93b1kihPHOYxZIy5EQt5w-1; Mon, 06 Jul 2020 04:47:21 -0400
X-MC-Unique: y93b1kihPHOYxZIy5EQt5w-1
Received: by mail-wr1-f71.google.com with SMTP id c6so22219732wru.7
 for <qemu-devel@nongnu.org>; Mon, 06 Jul 2020 01:47:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=P8h/HhrsmeetZ3WpwezM5OiaGGfhKuZoeymCllUho4Q=;
 b=ixcEk2kb/LnUuuUUh2LbRyoW3UiRRIHn7b+CL+4FbLc5p29qDPm4qf3XXR39jKN9KE
 9UXx1tF71UJrv457OJLN/9gUXpN6RdW4aqFsKRBf1ieqbkaisf/29+bjoB6LdNl1HdFt
 MmYuRiFvwv2p4UavKz9g8olZaaOMNwfbZiDoGiqwVXs60BwpsSbwRyET/fiCoZFWMlTa
 L7eLkJDcQZCUwNAtcRwORrT0/j8FR3D7GwV/6DM5pFBAXswznzCVF1wERlqW89imc0bt
 esT8y4+II33HKYpfLOdKWi62U/0KeCHVdUnLHsaLCcTmr77kBIZ3cVwk2V5yhrQcAjyl
 gDBg==
X-Gm-Message-State: AOAM533kCeFzmMOhWpLKTXDt1TbHaoqcntHPKJtc3M1iiRaeAjStC4Lv
 lBqH2/3pv/o42I9HdyFbiOznPSFmC1xoDWIvHSxrL5NXJkUGd1t4SC5IgaSQQT8T8rJaCBFMBsr
 1greFL1fsxXIY2r0=
X-Received: by 2002:adf:ee0b:: with SMTP id y11mr25309015wrn.360.1594025240741; 
 Mon, 06 Jul 2020 01:47:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbwrw0SfccJvJqf/jKH7KBE2CP4qMFTFkqonDCinNSh7NRyEvGchiC1YMsnyISbM/q04nMqA==
X-Received: by 2002:adf:ee0b:: with SMTP id y11mr25308994wrn.360.1594025240449; 
 Mon, 06 Jul 2020 01:47:20 -0700 (PDT)
Received: from [192.168.1.37] (138.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id g14sm23046579wrm.93.2020.07.06.01.47.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jul 2020 01:47:19 -0700 (PDT)
Subject: Re: [PATCH v3 2/2] net: detect errors from probing vnet hdr flag for
 TAP devices
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20200701193951.36248-1-lvivier@redhat.com>
 <20200701193951.36248-3-lvivier@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <28315bc8-ee70-3fb0-8f19-4a02437258be@redhat.com>
Date: Mon, 6 Jul 2020 10:47:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200701193951.36248-3-lvivier@redhat.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/06 01:39:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Jason Wang <jasowang@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/1/20 9:39 PM, Laurent Vivier wrote:
> From: "Daniel P. Berrange" <berrange@redhat.com>
> 
> When QEMU sets up a tap based network device backend, it mostly ignores errors
> reported from various ioctl() calls it makes, assuming the TAP file descriptor
> is valid. This assumption can easily be violated when the user is passing in a
> pre-opened file descriptor. At best, the ioctls may fail with a -EBADF, but if
> the user passes in a bogus FD number that happens to clash with a FD number that
> QEMU has opened internally for another reason, a wide variety of errnos may
> result, as the TUNGETIFF ioctl number may map to a completely different command
> on a different type of file.
> 
> By ignoring all these errors, QEMU sets up a zombie network backend that will
> never pass any data. Even worse, when QEMU shuts down, or that network backend
> is hot-removed, it will close this bogus file descriptor, which could belong to
> another QEMU device backend.
> 
> There's no obvious guaranteed reliable way to detect that a FD genuinely is a
> TAP device, as opposed to a UNIX socket, or pipe, or something else. Checking
> the errno from probing vnet hdr flag though, does catch the big common cases.
> ie calling TUNGETIFF will return EBADF for an invalid FD, and ENOTTY when FD is
> a UNIX socket, or pipe which catches accidental collisions with FDs used for
> stdio, or monitor socket.
> 
> Previously the example below where bogus fd 9 collides with the FD used for the
> chardev saw:
> 
> $ ./x86_64-softmmu/qemu-system-x86_64 -netdev tap,id=hostnet0,fd=9 \
>   -chardev socket,id=charchannel0,path=/tmp/qga,server,nowait \
>   -monitor stdio -vnc :0
> qemu-system-x86_64: -netdev tap,id=hostnet0,fd=9: TUNGETIFF ioctl() failed: Inappropriate ioctl for device
> TUNSETOFFLOAD ioctl() failed: Bad address
> QEMU 2.9.1 monitor - type 'help' for more information
> (qemu) Warning: netdev hostnet0 has no peer
> 
> which gives a running QEMU with a zombie network backend.
> 
> With this change applied we get an error message and QEMU immediately exits
> before carrying on and making a bigger disaster:
> 
> $ ./x86_64-softmmu/qemu-system-x86_64 -netdev tap,id=hostnet0,fd=9 \
>   -chardev socket,id=charchannel0,path=/tmp/qga,server,nowait \
>   -monitor stdio -vnc :0
> qemu-system-x86_64: -netdev tap,id=hostnet0,vhost=on,fd=9: Unable to query TUNGETIFF on FD 9: Inappropriate ioctl for device
> 
> Reported-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
> Tested-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Message-id: 20171027085548.3472-1-berrange@redhat.com
> [lv: to simplify, don't check on EINVAL with TUNGETIFF as it exists since v2.6.27]
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  net/tap-bsd.c     |  2 +-
>  net/tap-linux.c   |  8 +++++---
>  net/tap-solaris.c |  2 +-
>  net/tap-stub.c    |  2 +-
>  net/tap.c         | 25 ++++++++++++++++++++-----
>  net/tap_int.h     |  2 +-
>  6 files changed, 29 insertions(+), 12 deletions(-)
> 
> diff --git a/net/tap-bsd.c b/net/tap-bsd.c
> index a5c3707f806d..77aaf674b19d 100644
> --- a/net/tap-bsd.c
> +++ b/net/tap-bsd.c
> @@ -211,7 +211,7 @@ void tap_set_sndbuf(int fd, const NetdevTapOptions *tap, Error **errp)
>  {
>  }
>  
> -int tap_probe_vnet_hdr(int fd)
> +int tap_probe_vnet_hdr(int fd, Error **errp)
>  {
>      return 0;
>  }
> diff --git a/net/tap-linux.c b/net/tap-linux.c
> index e0dd442ee34f..b0635e9e32ce 100644
> --- a/net/tap-linux.c
> +++ b/net/tap-linux.c
> @@ -147,13 +147,15 @@ void tap_set_sndbuf(int fd, const NetdevTapOptions *tap, Error **errp)
>      }
>  }
>  
> -int tap_probe_vnet_hdr(int fd)
> +int tap_probe_vnet_hdr(int fd, Error **errp)
>  {
>      struct ifreq ifr;
>  
>      if (ioctl(fd, TUNGETIFF, &ifr) != 0) {
> -        error_report("TUNGETIFF ioctl() failed: %s", strerror(errno));
> -        return 0;
> +        /* TUNGETIFF is available since kernel v2.6.27 */
> +        error_setg_errno(errp, errno,
> +                         "Unable to query TUNGETIFF on FD %d", fd);
> +        return -1;
>      }
>  
>      return ifr.ifr_flags & IFF_VNET_HDR;
> diff --git a/net/tap-solaris.c b/net/tap-solaris.c
> index 4725d2314eef..ae2ba6828415 100644
> --- a/net/tap-solaris.c
> +++ b/net/tap-solaris.c
> @@ -206,7 +206,7 @@ void tap_set_sndbuf(int fd, const NetdevTapOptions *tap, Error **errp)
>  {
>  }
>  
> -int tap_probe_vnet_hdr(int fd)
> +int tap_probe_vnet_hdr(int fd, Error **errp)
>  {
>      return 0;
>  }
> diff --git a/net/tap-stub.c b/net/tap-stub.c
> index a9ab8f829362..de525a2e69d4 100644
> --- a/net/tap-stub.c
> +++ b/net/tap-stub.c
> @@ -37,7 +37,7 @@ void tap_set_sndbuf(int fd, const NetdevTapOptions *tap, Error **errp)
>  {
>  }
>  
> -int tap_probe_vnet_hdr(int fd)
> +int tap_probe_vnet_hdr(int fd, Error **errp)
>  {
>      return 0;
>  }
> diff --git a/net/tap.c b/net/tap.c
> index fb04c9044ce2..208d9c0f8d35 100644
> --- a/net/tap.c
> +++ b/net/tap.c
> @@ -597,7 +597,11 @@ int net_init_bridge(const Netdev *netdev, const char *name,
>      }
>  
>      qemu_set_nonblock(fd);
> -    vnet_hdr = tap_probe_vnet_hdr(fd);
> +    vnet_hdr = tap_probe_vnet_hdr(fd, errp);
> +    if (vnet_hdr < 0) {
> +        close(fd);
> +        return -1;
> +    }
>      s = net_tap_fd_init(peer, "bridge", name, fd, vnet_hdr);
>  
>      snprintf(s->nc.info_str, sizeof(s->nc.info_str), "helper=%s,br=%s", helper,
> @@ -803,7 +807,11 @@ int net_init_tap(const Netdev *netdev, const char *name,
>              return -1;
>          }
>  
> -        vnet_hdr = tap_probe_vnet_hdr(fd);
> +        vnet_hdr = tap_probe_vnet_hdr(fd, errp);
> +        if (vnet_hdr < 0) {
> +            close(fd);
> +            return -1;
> +        }
>  
>          net_init_tap_one(tap, peer, "tap", name, NULL,
>                           script, downscript,
> @@ -856,8 +864,11 @@ int net_init_tap(const Netdev *netdev, const char *name,
>              }
>  
>              if (i == 0) {
> -                vnet_hdr = tap_probe_vnet_hdr(fd);
> -            } else if (vnet_hdr != tap_probe_vnet_hdr(fd)) {
> +                vnet_hdr = tap_probe_vnet_hdr(fd, errp);
> +                if (vnet_hdr < 0) {
> +                    goto free_fail;
> +                }
> +            } else if (vnet_hdr != tap_probe_vnet_hdr(fd, NULL)) {
>                  error_setg(errp,
>                             "vnet_hdr not consistent across given tap fds");
>                  ret = -1;
> @@ -902,7 +913,11 @@ free_fail:
>          }
>  
>          qemu_set_nonblock(fd);
> -        vnet_hdr = tap_probe_vnet_hdr(fd);
> +        vnet_hdr = tap_probe_vnet_hdr(fd, errp);
> +        if (vnet_hdr < 0) {
> +            close(fd);
> +            return -1;
> +        }
>  
>          net_init_tap_one(tap, peer, "bridge", name, ifname,
>                           script, downscript, vhostfdname,
> diff --git a/net/tap_int.h b/net/tap_int.h
> index e3194b23f47d..225a49ea4843 100644
> --- a/net/tap_int.h
> +++ b/net/tap_int.h
> @@ -34,7 +34,7 @@ int tap_open(char *ifname, int ifname_size, int *vnet_hdr,
>  ssize_t tap_read_packet(int tapfd, uint8_t *buf, int maxlen);
>  
>  void tap_set_sndbuf(int fd, const NetdevTapOptions *tap, Error **errp);
> -int tap_probe_vnet_hdr(int fd);
> +int tap_probe_vnet_hdr(int fd, Error **errp);

Missing documentation (can be added on top), otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

>  int tap_probe_vnet_hdr_len(int fd, int len);
>  int tap_probe_has_ufo(int fd);
>  void tap_fd_set_offload(int fd, int csum, int tso4, int tso6, int ecn, int ufo);
> 


