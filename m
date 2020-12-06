Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B922D04AD
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Dec 2020 13:01:47 +0100 (CET)
Received: from localhost ([::1]:46902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klsjZ-0002Cu-F5
	for lists+qemu-devel@lfdr.de; Sun, 06 Dec 2020 07:01:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1klsZ8-0007tU-MG
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 06:50:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1klsZ6-00070G-Ln
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 06:50:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607255455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QXN11YjZ1vXjJBEYEKORWd+AxNil9vOhCUsNnGsnr90=;
 b=EBE+gLP1VnuZXkYYJXL5Tc1+GLAbpusfPwc0dNuTzw7ukVxINXFXPAqy+8ijESSE1m5UmA
 V6jE7nS8qPYnVABjwlIG5tvbXiVntISRAhVIdQ6BbnOMaHChg7qZoZo6EeSHlhnB4haDtQ
 Tb+BSyPxNxniUR9Lj2nUKOv1nvESOtI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-MqfTpoJhOEapxpM2LCbg-w-1; Sun, 06 Dec 2020 06:50:52 -0500
X-MC-Unique: MqfTpoJhOEapxpM2LCbg-w-1
Received: by mail-ej1-f72.google.com with SMTP id u25so3143542ejf.3
 for <qemu-devel@nongnu.org>; Sun, 06 Dec 2020 03:50:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QXN11YjZ1vXjJBEYEKORWd+AxNil9vOhCUsNnGsnr90=;
 b=CEZnaRhavhtsQDNBWcb3o8K3pugiVbj1z64gXoMYsFnWcXehT/gFDbIXFrrJHU5M0H
 73SLhqTfuO0pF1jwM0kSWGzdCYX5u7WXOx1QAW+Ibawd7wIUo/VhvdnrIuikqce0tKTL
 e8mQN70oLqKtL938c3hTZr0xSI1D5KjM/ce0GjzZlEDWn5zw8+dEG4SwJ9T0kjeHAy3D
 MiL8yVSYZiPUEg2F+4HVNG6vpvcihqsssTb+BhOGg04xe+QSm63I8tHjflSQD9/ReA+R
 m/bnkGi8U4rERS8fQLe2E1AE6+m8eukXY4I6YKWNlqvEzATf5ZsOVlME5f5wErkqWbQ6
 Wetw==
X-Gm-Message-State: AOAM5306A3eM20VrMb81A4G0OwrolxTWzMja8sONFrbIItp8fnR2KfSU
 UksigayxOl5ND0SyAoVFDEPaTKAmugM5qPWx/Jq0U67IhVoIKz6nV0rjk2KyYjtXVt0xvo3Bnj4
 eDEUKELWLcacqTQQ=
X-Received: by 2002:a17:907:3312:: with SMTP id
 ym18mr14924848ejb.437.1607255450973; 
 Sun, 06 Dec 2020 03:50:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzVzHdQ0gd9y0fPcxXvPsBOb9NLjGt7VCscZxHh6SgyV32IoDz5VTi23v/85YihGGm/4+5V7A==
X-Received: by 2002:a17:907:3312:: with SMTP id
 ym18mr14924825ejb.437.1607255450726; 
 Sun, 06 Dec 2020 03:50:50 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id m7sm7840045ejr.119.2020.12.06.03.50.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Dec 2020 03:50:49 -0800 (PST)
Subject: Re: [PATCH 3/3] net: checksum: Introduce fine control over checksum
 type
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
References: <1607220847-24096-1-git-send-email-bmeng.cn@gmail.com>
 <1607220847-24096-3-git-send-email-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9f8cdb69-7b74-4034-223f-bfa62cb4e440@redhat.com>
Date: Sun, 6 Dec 2020 12:50:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1607220847-24096-3-git-send-email-bmeng.cn@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Paul Durrant <paul@xen.org>,
 Zhang Chen <chen.zhang@intel.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Peter Chubb <peter.chubb@nicta.com.au>, Joel Stanley <joel@jms.id.au>,
 Beniamino Galvani <b.galvani@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Ben,

On 12/6/20 3:14 AM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> At present net_checksum_calculate() blindly calculates all types of
> checksums (IP, TCP, UDP). Some NICs may have a per type setting in
> their BDs to control what checksum should be offloaded. To support
> such hardware behavior, introduce a 'csum_flag' parameter to the
> net_checksum_calculate() API to allow fine control over what type
> checksum is calculated.
> 
> Existing users of this API are updated accordingly.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> 
> ---
> 
>  hw/net/allwinner-sun8i-emac.c |  2 +-
>  hw/net/cadence_gem.c          |  2 +-
>  hw/net/fsl_etsec/rings.c      |  8 +++-----
>  hw/net/ftgmac100.c            | 10 +++++++++-
>  hw/net/imx_fec.c              | 15 +++------------
>  hw/net/virtio-net.c           |  2 +-
>  hw/net/xen_nic.c              |  2 +-
>  include/net/checksum.h        |  7 ++++++-

When sending a such API refactor, patch is easier to
review if you setup the scripts/git.orderfile config.

>  net/checksum.c                | 18 ++++++++++++++----
>  net/filter-rewriter.c         |  4 ++--
>  10 files changed, 41 insertions(+), 29 deletions(-)
...
> diff --git a/include/net/checksum.h b/include/net/checksum.h
> index 05a0d27..7dec37e 100644
> --- a/include/net/checksum.h
> +++ b/include/net/checksum.h
> @@ -21,11 +21,16 @@
>  #include "qemu/bswap.h"
>  struct iovec;
>  
> +#define CSUM_IP     0x01

IMO this is IP_HEADER,

> +#define CSUM_TCP    0x02
> +#define CSUM_UDP    0x04

and these IP_PAYLOAD, regardless the payload protocol.

> +#define CSUM_ALL    (CSUM_IP | CSUM_TCP | CSUM_UDP)

Maybe CSUM_HEADER / CSUM_PAYLOAD / CSUM_FULL (aka RAW?).

> +
>  uint32_t net_checksum_add_cont(int len, uint8_t *buf, int seq);
>  uint16_t net_checksum_finish(uint32_t sum);
>  uint16_t net_checksum_tcpudp(uint16_t length, uint16_t proto,
>                               uint8_t *addrs, uint8_t *buf);
> -void net_checksum_calculate(uint8_t *data, int length);
> +void net_checksum_calculate(uint8_t *data, int length, int csum_flag);
>  
>  static inline uint32_t
>  net_checksum_add(int len, uint8_t *buf)
> diff --git a/net/checksum.c b/net/checksum.c
> index dabd290..70f4eae 100644
> --- a/net/checksum.c
> +++ b/net/checksum.c
> @@ -57,7 +57,7 @@ uint16_t net_checksum_tcpudp(uint16_t length, uint16_t proto,
>      return net_checksum_finish(sum);
>  }
>  
> -void net_checksum_calculate(uint8_t *data, int length)
> +void net_checksum_calculate(uint8_t *data, int length, int csum_flag)
>  {
>      int mac_hdr_len, ip_len;
>      struct ip_header *ip;
> @@ -108,9 +108,11 @@ void net_checksum_calculate(uint8_t *data, int length)
>      }
>  
>      /* Calculate IP checksum */
> -    stw_he_p(&ip->ip_sum, 0);
> -    csum = net_raw_checksum((uint8_t *)ip, IP_HDR_GET_LEN(ip));
> -    stw_be_p(&ip->ip_sum, csum);
> +    if (csum_flag & CSUM_IP) {
> +        stw_he_p(&ip->ip_sum, 0);
> +        csum = net_raw_checksum((uint8_t *)ip, IP_HDR_GET_LEN(ip));
> +        stw_be_p(&ip->ip_sum, csum);
> +    }
>  
>      if (IP4_IS_FRAGMENT(ip)) {
>          return; /* a fragmented IP packet */
> @@ -128,6 +130,10 @@ void net_checksum_calculate(uint8_t *data, int length)
>      switch (ip->ip_p) {
>      case IP_PROTO_TCP:
>      {
> +        if (!(csum_flag & CSUM_TCP)) {
> +            return;
> +        }
> +
>          tcp_header *tcp = (tcp_header *)(ip + 1);
>  
>          if (ip_len < sizeof(tcp_header)) {
> @@ -148,6 +154,10 @@ void net_checksum_calculate(uint8_t *data, int length)
>      }
>      case IP_PROTO_UDP:
>      {
> +        if (!(csum_flag & CSUM_UDP)) {
> +            return;
> +        }
> +
>          udp_header *udp = (udp_header *)(ip + 1);
>  
>          if (ip_len < sizeof(udp_header)) {
...


