Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 370183BC8B5
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 11:54:07 +0200 (CEST)
Received: from localhost ([::1]:33542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0hmI-0005ef-71
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 05:54:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m0hYG-0004ty-3f
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 05:39:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m0hYC-0004Fc-O3
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 05:39:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625564372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6yn8NBnoTp48GiUBzuxIxqEffY6VK6AGtnNvpxSzrZ4=;
 b=F2c/H6yh+na9u3EjFq0Bf4d2b6KTKz+ykaZPLuMA7/hsPPVANO11+ILtO3nUfGMtsrCh5X
 Cs/h55GavsnOQKeD6N6LnUu24PK6iRewsTGFa2wb+IiaQE4esaqY4a/OJ8G18/L8X54d+L
 +/2awmAAw4RBHf2pParvrq4SWWoUt1g=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-wHC7cJ3COtSGGicrxJOqMA-1; Tue, 06 Jul 2021 05:39:31 -0400
X-MC-Unique: wHC7cJ3COtSGGicrxJOqMA-1
Received: by mail-wr1-f70.google.com with SMTP id
 j1-20020adfb3010000b02901232ed22e14so6986083wrd.5
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 02:39:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6yn8NBnoTp48GiUBzuxIxqEffY6VK6AGtnNvpxSzrZ4=;
 b=akQVl1KDwnPIWyMHgGiMomMI1RBJg16nSeXY7lTE26IuKG+MXfHQ8vJoE0Vgr5hY7K
 kekAJBos2Znex31FGecBksYnAj4jfmeAOMy2JI7Pm5cqo1hw9PsbrBag6Ijux4YAZEkT
 GiE/j9dzPxoa7Hx2qG5tK/5EwsQt3+04jSOTeMPhlcIjrkbFfFgAX2b4qXS7hYIn51+1
 GuzCdXoZ5+YX7v+ivHYIgs6xTM2wHOxL5KkBBsSmyBhE4ZAzTHi3uOl9uBDHy5MVikIa
 g+2JGGhoeE9EnjBwehDjWMroBxDBMbXGtW12VcvhxJswthCeJqcIYke70MquKya3sKpw
 IiCA==
X-Gm-Message-State: AOAM530GWvkTjtEL3Qyn3e7W2Z6O9fUxO1f8meI1nAC9P1kMjprDz84j
 Zpl9qIlQexFSQbrKfm2kSv/5zk1DacAtg5uaFRPJA/KSn2IoI4pC4quoMve/D4SA60CnMEtH7li
 beZ4PEP2mkkH3Tj8=
X-Received: by 2002:a1c:e207:: with SMTP id z7mr3781574wmg.92.1625564369890;
 Tue, 06 Jul 2021 02:39:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwM81A9I01q5BNMJ2fauO3SclkQFemmz0vJet7YaYyD/3nxLpmA99baTN3GgdrcZ7Yp3mDYVw==
X-Received: by 2002:a1c:e207:: with SMTP id z7mr3781548wmg.92.1625564369682;
 Tue, 06 Jul 2021 02:39:29 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id p5sm16470152wrd.25.2021.07.06.02.39.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 02:39:29 -0700 (PDT)
Subject: Re: [PATCH v4 1/4] s390x/css: Introduce an ESW struct
To: Eric Farman <farman@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, qemu-s390x@nongnu.org
References: <20210617232537.1337506-1-farman@linux.ibm.com>
 <20210617232537.1337506-2-farman@linux.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b89e80d0-5b2b-6ef0-b94d-cd69ad0192b0@redhat.com>
Date: Tue, 6 Jul 2021 11:39:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210617232537.1337506-2-farman@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Eric,

On 6/18/21 1:25 AM, Eric Farman wrote:
> The Interrupt Response Block is comprised of several other
> structures concatenated together, but only the 12-byte
> Subchannel-Status Word (SCSW) is defined as a proper struct.
> Everything else is a simple array of 32-bit words.
> 
> Let's define a proper struct for the 20-byte Extended-Status
> Word (ESW) so that we can make good decisions about the sense
> data that would go into the ECW area for virtual vs
> passthrough devices.
> 
> Signed-off-by: Eric Farman <farman@linux.ibm.com>
> ---
>  hw/s390x/css.c            | 19 +++++++++++++------
>  include/hw/s390x/ioinst.h | 12 +++++++++++-
>  2 files changed, 24 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/s390x/css.c b/hw/s390x/css.c
> index bed46f5ec3..59d935570e 100644
> --- a/hw/s390x/css.c
> +++ b/hw/s390x/css.c
> @@ -1335,6 +1335,14 @@ static void copy_schib_to_guest(SCHIB *dest, const SCHIB *src)
>      }
>  }
>  
> +static void copy_esw_to_guest(ESW *dest, const ESW *src)
> +{
> +    dest->word0 = cpu_to_be32(src->word0);
> +    dest->erw = cpu_to_be32(src->erw);
> +    dest->f_addr = cpu_to_be64(src->f_addr);

FYI you fixed an endianess bug, thanks.

Conny told me it was not a problem because f_addr was not used.

> +    dest->s_addr = cpu_to_be32(src->s_addr);
> +}
> +
>  IOInstEnding css_do_stsch(SubchDev *sch, SCHIB *schib)
>  {
>      int ret;
> @@ -1604,9 +1612,8 @@ static void copy_irb_to_guest(IRB *dest, const IRB *src, const PMCW *pmcw,
>  
>      copy_scsw_to_guest(&dest->scsw, &src->scsw);
>  
> -    for (i = 0; i < ARRAY_SIZE(dest->esw); i++) {
> -        dest->esw[i] = cpu_to_be32(src->esw[i]);
> -    }
> +    copy_esw_to_guest(&dest->esw, &src->esw);
> +
>      for (i = 0; i < ARRAY_SIZE(dest->ecw); i++) {
>          dest->ecw[i] = cpu_to_be32(src->ecw[i]);
>      }
> @@ -1655,9 +1662,9 @@ int css_do_tsch_get_irb(SubchDev *sch, IRB *target_irb, int *irb_len)
>                          SCSW_CSTAT_CHN_CTRL_CHK |
>                          SCSW_CSTAT_INTF_CTRL_CHK)) {
>              irb.scsw.flags |= SCSW_FLAGS_MASK_ESWF;
> -            irb.esw[0] = 0x04804000;
> +            irb.esw.word0 = 0x04804000;
>          } else {
> -            irb.esw[0] = 0x00800000;
> +            irb.esw.word0 = 0x00800000;
>          }
>          /* If a unit check is pending, copy sense data. */
>          if ((schib->scsw.dstat & SCSW_DSTAT_UNIT_CHECK) &&
> @@ -1670,7 +1677,7 @@ int css_do_tsch_get_irb(SubchDev *sch, IRB *target_irb, int *irb_len)
>              for (i = 0; i < ARRAY_SIZE(irb.ecw); i++) {
>                  irb.ecw[i] = be32_to_cpu(irb.ecw[i]);
>              }
> -            irb.esw[1] = 0x01000000 | (sizeof(sch->sense_data) << 8);
> +            irb.esw.erw = ESW_ERW_SENSE | (sizeof(sch->sense_data) << 8);
>          }
>      }
>      /* Store the irb to the guest. */
> diff --git a/include/hw/s390x/ioinst.h b/include/hw/s390x/ioinst.h
> index c6737a30d4..e7ab401781 100644
> --- a/include/hw/s390x/ioinst.h
> +++ b/include/hw/s390x/ioinst.h
> @@ -123,10 +123,20 @@ typedef struct SCHIB {
>      uint8_t mda[4];
>  } QEMU_PACKED SCHIB;
>  
> +/* format-0 extended-status word */
> +typedef struct ESW {
> +   uint32_t word0;
> +   uint32_t erw;
> +   uint64_t f_addr;     /* Zeros for other ESW formats */
> +   uint32_t s_addr;     /* Zeros for other ESW formats */
> +} QEMU_PACKED ESW;
> +
> +#define ESW_ERW_SENSE 0x01000000
> +
>  /* interruption response block */
>  typedef struct IRB {
>      SCSW scsw;
> -    uint32_t esw[5];
> +    ESW esw;
>      uint32_t ecw[8];
>      uint32_t emw[8];
>  } IRB;
> 


