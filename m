Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AD9623DAE
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 09:41:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot37V-0006Cz-Fz; Thu, 10 Nov 2022 03:41:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ot377-00067x-Vj
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 03:40:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ot36w-0002OK-Og
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 03:40:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668069633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+LNe6IR2yt8w7VLI/K/uzfjuOwS4WZNb6EcrK/fyJzo=;
 b=YUUJgcaRzCKkeqtq98Z0iYKBoaI5VIcHlNSYZrYVJSqkQn9GlPEVAFD5RARLSoUQEuOepE
 YCNEwFQsCJTHCTgw4sCy7fhv3TAHZ5EQkiHVrlCWxzjwrfrIPP9MACER6ibHOaF6XKVKfR
 Y6ECwuhXUgMPeULHn+n7dYCdMZ7iJJA=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-593-745Ra3pAP6mGymlvCz1TrQ-1; Thu, 10 Nov 2022 03:40:32 -0500
X-MC-Unique: 745Ra3pAP6mGymlvCz1TrQ-1
Received: by mail-pj1-f72.google.com with SMTP id
 x14-20020a17090a2b0e00b002134b1401ddso763601pjc.8
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 00:40:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+LNe6IR2yt8w7VLI/K/uzfjuOwS4WZNb6EcrK/fyJzo=;
 b=gFmZKF3gWxe+Fn4KM8P3vrHRx+DBl/j1K6HoVerH9aE6eFnMqKcoMetPcHecIWdf11
 /tn+qL44bIRiM0fduMggbEG3fulvksB9P8JCRxAOp8bg8Gx1sExaIEIGlv9jrHY4iR13
 54/QuGS/ji7q5WUxDxJuDQwixsJoZuWCogumyzNeF8H2AS26G9KvdQn92G6/ITDPmq1K
 i4KtE8EVgomXNwlvRLXHKQFR7NrZi0YihhimbWO9X02LqQKAr31NjLSLXOczOtmF9BRy
 FDYbdfKizUXXAPivM2jwPSHTwrXBOKPQq0iC/xkYRHH35h+9SFPV6KNesMGFAHkFmaH9
 svHA==
X-Gm-Message-State: ACrzQf1xMAr9obtS6dfA/IhSPbiF1zgULm6D5xBBrfV36rR1SCriYo0X
 79XjHkEkBwuFJWitRi0CMh/MajZJ1WAAa/7dTW73icVyhgDkTKLcUKs1vZs4bslNWKqAXQn0z0z
 2qB3LTNOaEXvEpf4=
X-Received: by 2002:a17:902:7283:b0:188:612b:1d31 with SMTP id
 d3-20020a170902728300b00188612b1d31mr33668104pll.81.1668069631626; 
 Thu, 10 Nov 2022 00:40:31 -0800 (PST)
X-Google-Smtp-Source: AMsMyM798lz+pGjmGtM3mWxeM1gWjciXK81f5vKAkgcAi1IIM5N1Cm8c9fRNxTvedrEQqjlkaoeuZw==
X-Received: by 2002:a17:902:7283:b0:188:612b:1d31 with SMTP id
 d3-20020a170902728300b00188612b1d31mr33668089pll.81.1668069631352; 
 Thu, 10 Nov 2022 00:40:31 -0800 (PST)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 x4-20020a170902a38400b00186cf82717fsm10634228pla.165.2022.11.10.00.40.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Nov 2022 00:40:30 -0800 (PST)
Message-ID: <034e43ec-614e-28cb-36fd-2ebd4d6a09c8@redhat.com>
Date: Thu, 10 Nov 2022 09:40:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/4] rtl8139: Remove unused variable
Content-Language: en-US
To: mrezanin@redhat.com, qemu-devel@nongnu.org
References: <cover.1668009030.git.mrezanin@redhat.com>
 <15a32dd06c492216cbf27cd3ddcbe1e9afb8d8f5.1668009030.git.mrezanin@redhat.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Jason Wang <jasowang@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <15a32dd06c492216cbf27cd3ddcbe1e9afb8d8f5.1668009030.git.mrezanin@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On 09/11/2022 16.57, mrezanin@redhat.com wrote:
> From: Miroslav Rezanina <mrezanin@redhat.com>
> 
> Variable send_count used in rtl8139_cplus_transmit_one function is only
> incremented but never read. This causes 'Unused but set variable' warning
> on Clang 15.0.1 compiler.
> 
> Removing the variable to prevent the warning.
> 
> Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
> ---
>   hw/net/rtl8139.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
> index 6b65823b4b..e6643e3c9d 100644
> --- a/hw/net/rtl8139.c
> +++ b/hw/net/rtl8139.c
> @@ -2156,7 +2156,6 @@ static int rtl8139_cplus_transmit_one(RTL8139State *s)
>                       ip_data_len, saved_size - ETH_HLEN, large_send_mss);
>   
>                   int tcp_send_offset = 0;
> -                int send_count = 0;
>   
>                   /* maximum IP header length is 60 bytes */
>                   uint8_t saved_ip_header[60];
> @@ -2261,7 +2260,6 @@ static int rtl8139_cplus_transmit_one(RTL8139State *s)
>                       /* add transferred count to TCP sequence number */
>                       stl_be_p(&p_tcp_hdr->th_seq,
>                                chunk_size + ldl_be_p(&p_tcp_hdr->th_seq));
> -                    ++send_count;
>                   }
>   
>                   /* Stop sending this frame */

Reviewed-by: Thomas Huth <thuth@redhat.com>


