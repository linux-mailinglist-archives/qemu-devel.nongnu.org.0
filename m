Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E292099C7
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jun 2020 08:20:40 +0200 (CEST)
Received: from localhost ([::1]:47758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joLFW-00054s-Ju
	for lists+qemu-devel@lfdr.de; Thu, 25 Jun 2020 02:20:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1joLEQ-0004dV-5a
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 02:19:30 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:50335
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1joLEN-0000Gy-2n
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 02:19:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593065965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=XV/e0haN4wqQMSd3aj7LVyxrFsRsoycv4IQLEItdz7Y=;
 b=N1ykyiIDmPCj+4eh5c4qLjsfahIRWYOcdfmpU2icviC5+UOK0C7GkCQvB+tPVtoREkjuc7
 sxyh2KHTPgEPyxYrYFq6EjmXeCxbOMecob5YPotcFN4qDjUBgKk391hGcWbqxWDrOfXCOv
 3+KnrnZNp7nidJDT3v5k6kRpEQPu6SU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-gxy02EudOXGCfoAlg8GwbQ-1; Thu, 25 Jun 2020 02:19:23 -0400
X-MC-Unique: gxy02EudOXGCfoAlg8GwbQ-1
Received: by mail-wm1-f70.google.com with SMTP id v24so6363409wmh.3
 for <qemu-devel@nongnu.org>; Wed, 24 Jun 2020 23:19:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=XV/e0haN4wqQMSd3aj7LVyxrFsRsoycv4IQLEItdz7Y=;
 b=J1bCkHCW0DTBbi+u6+u73cRrM7AEnXkc8Ms/paHXa+XmVD6goVuN8NPo3mVK1nSLhE
 kQYheq4iyTAQSSHm5TwRpjd9guUWa0d2zTmEq99bwonA+4OKFrt8a5ypNfjh7/4uKQHy
 SyBiIydO9W8syDyAXDU+l9nvRDy80+ZXxA/F4u9ssZ4hoau9mICgdi445rw7llXUJiZq
 7qGNXlaSXT3sFiDZ/vH5HGVl3qf9qKUrqTDfDwiQARdOqYpb4W4+SGC65z7ijvHC/LVM
 Zldw4RyLO3UeUCWbHpSHNt0afsbARfDSYmg6sPyyRxR2CvlI/j2ingMFt0DcuV8aGn8I
 mQMw==
X-Gm-Message-State: AOAM531A4COGAKZJpbi035C+pz+EQlArOxPKl0KNucBtp9NW5jcObYw6
 35tUSFSZlfqa+HQxwf6Mn+rdxvTSFEtCHqs6zobZHGfHASpGJFEs/7n9k545OGxy1DfAtc1Pe2U
 L3uwSxcCIUQdj8aw=
X-Received: by 2002:a1c:e18a:: with SMTP id y132mr1561899wmg.27.1593065962574; 
 Wed, 24 Jun 2020 23:19:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhBnbXKok3vSPUI7gzwdMeLDYdfoO8s60jXibuZBEHHcZ5HKrJzv3q8H5hrS+QdBOZA9YKkA==
X-Received: by 2002:a1c:e18a:: with SMTP id y132mr1561880wmg.27.1593065962259; 
 Wed, 24 Jun 2020 23:19:22 -0700 (PDT)
Received: from [192.168.1.40] (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id 185sm10980612wmz.22.2020.06.24.23.19.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2020 23:19:21 -0700 (PDT)
Subject: Re: [PATCH] net: tap: check if the file descriptor is valid before
 using it
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20200624190009.300069-1-lvivier@redhat.com>
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
Message-ID: <b64d114d-061e-268d-cc48-1680e6188404@redhat.com>
Date: Thu, 25 Jun 2020 08:19:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200624190009.300069-1-lvivier@redhat.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/25 01:47:53
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
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/24/20 9:00 PM, Laurent Vivier wrote:
> qemu_set_nonblock() checks that the file descriptor can be used and, if
> not, crashes QEMU. An assert() is used for that. The use of assert() is
> used to detect programming error and the coredump will allow to debug
> the problem.
> 
> But in the case of the tap device, this assert() can be triggered by
> a misconfiguration by the user. At startup, it's not a real problem, but it
> can also happen during the hot-plug of a new device, and here it's a
> problem because we can crash a perfectly healthy system.
> 
> For instance:
>  # ip link add link virbr0 name macvtap0 type macvtap mode bridge
>  # ip link set macvtap0 up
>  # TAP=/dev/tap$(ip -o link show macvtap0 | cut -d: -f1)
>  # qemu-system-x86_64 -machine q35 -device pcie-root-port,id=pcie-root-port-0 -monitor stdio 9<> $TAP
>  (qemu) netdev_add type=tap,id=hostnet0,vhost=on,fd=9
>  (qemu) device_add driver=virtio-net-pci,netdev=hostnet0,id=net0,bus=pcie-root-port-0
>  (qemu) device_del net0
>  (qemu) netdev_del hostnet0
>  (qemu) netdev_add type=tap,id=hostnet1,vhost=on,fd=9
>  qemu-system-x86_64: .../util/oslib-posix.c:247: qemu_set_nonblock: Assertion `f != -1' failed.
>  Aborted (core dumped)
> 
> To avoid that, check the file descriptor is valid before passing it to qemu_set_non_block() for
> "fd=" and "fds=" parameters.
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  include/qemu/sockets.h |  1 +
>  net/tap.c              | 13 +++++++++++++
>  util/oslib-posix.c     |  5 +++++
>  util/oslib-win32.c     |  6 ++++++
>  4 files changed, 25 insertions(+)
> 
> diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
> index 57cd049d6edd..5b0c2d77ddad 100644
> --- a/include/qemu/sockets.h
> +++ b/include/qemu/sockets.h
> @@ -17,6 +17,7 @@ int qemu_socket(int domain, int type, int protocol);
>  int qemu_accept(int s, struct sockaddr *addr, socklen_t *addrlen);
>  int socket_set_cork(int fd, int v);
>  int socket_set_nodelay(int fd);
> +bool qemu_fd_is_valid(int fd);
>  void qemu_set_block(int fd);
>  void qemu_set_nonblock(int fd);
>  int socket_set_fast_reuse(int fd);
> diff --git a/net/tap.c b/net/tap.c
> index 6207f61f84ab..f65966aaccd8 100644
> --- a/net/tap.c
> +++ b/net/tap.c
> @@ -795,6 +795,12 @@ int net_init_tap(const Netdev *netdev, const char *name,
>              return -1;
>          }
>  
> +        /* Check if fd is valid */
> +        if (!qemu_fd_is_valid(fd)) {
> +            error_setg(errp, "Invalid file descriptor %d", fd);
> +            return -1;
> +        }
> +
>          qemu_set_nonblock(fd);
>  
>          vnet_hdr = tap_probe_vnet_hdr(fd);
> @@ -843,6 +849,13 @@ int net_init_tap(const Netdev *netdev, const char *name,
>                  goto free_fail;
>              }
>  
> +            /* Check if fd is valid */
> +            if (!qemu_fd_is_valid(fd)) {
> +                error_setg(errp, "Invalid file descriptor %d", fd);
> +                ret = -1;
> +                goto free_fail;
> +            }
> +
>              qemu_set_nonblock(fd);
>  
>              if (i == 0) {
> diff --git a/util/oslib-posix.c b/util/oslib-posix.c
> index 916f1be2243a..8d5705f598d3 100644
> --- a/util/oslib-posix.c
> +++ b/util/oslib-posix.c
> @@ -244,6 +244,11 @@ void qemu_anon_ram_free(void *ptr, size_t size)
>      qemu_ram_munmap(-1, ptr, size);
>  }
>  
> +bool qemu_fd_is_valid(int fd)
> +{
> +    return fcntl(fd, F_GETFL) != -1;
> +}
> +
>  void qemu_set_block(int fd)
>  {
>      int f;
> diff --git a/util/oslib-win32.c b/util/oslib-win32.c
> index e9b14ab17847..a6be9445cfdb 100644
> --- a/util/oslib-win32.c
> +++ b/util/oslib-win32.c
> @@ -132,6 +132,12 @@ struct tm *localtime_r(const time_t *timep, struct tm *result)
>  }
>  #endif /* CONFIG_LOCALTIME_R */
>  
> +bool qemu_fd_is_valid(int fd)
> +{
> +    /* FIXME: how to check if fd is valid? */
> +    return true;
> +}

Maybe:

  bool qemu_fd_is_valid(int fd)
  {
      unsigned long res; /* ignored */

      return ioctlsocket(fd, FIONREAD, &res) == NO_ERROR;
  }

See:

https://docs.microsoft.com/en-us/windows/win32/winsock/winsock-ioctls

> +
>  void qemu_set_block(int fd)
>  {
>      unsigned long opt = 0;
> 


