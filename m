Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DDE6EDCF2
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 09:44:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prDL5-0004LR-J1; Tue, 25 Apr 2023 03:43:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1prDL2-0004JA-Uu
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:43:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1prDL1-0006Lv-Mc
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:43:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682408627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cE/PQezcLDy+h2SSkImfymZeOF7f6qAgYCUq65aUHe8=;
 b=S9b+OOJPwZfyjVSYKkmgSWz8iX7tf68YL0I2NuseDHQaHxRcBJdW05gbRB9COB2A6xIONa
 WZoAmdgC4YoZhAz/IpDG/1b1kRTT5+tvl+xw5/xO+hQbXT9vqHYsc5d7LNrX6W23CnO4Db
 +R0jvrj+uShVZiROOALbhR3sCzqjfmQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-315-p5ekV4ONO4iADKSvhT6OpA-1; Tue, 25 Apr 2023 03:43:45 -0400
X-MC-Unique: p5ekV4ONO4iADKSvhT6OpA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f195c06507so51423375e9.1
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 00:43:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682408624; x=1685000624;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cE/PQezcLDy+h2SSkImfymZeOF7f6qAgYCUq65aUHe8=;
 b=Jtb0f54V4U9W3zOfNEXM9WuROqa39/rfHGWZpVJlMUyuwWZyRUKEOmRYsiP3OcjAvB
 NND7N8LJOhsmDw5LtuWBgfQ/n0kgHDLcFPsL0wfqfHKbq0TU6MyWPKC3XXvJpCBdEmFZ
 AoQsXM4/Qt65kr/cphc4YR6d4NG/7gOsOLg4OfLfXqAeJJjjMVXcYTXOiohk2kbvb4hC
 G5mOdn75/PwGAzJraxtSUcbTATlvQ9kq9f/8vV8SqUweqlMNajIZTdFx+xEE63WMb+56
 6FtT/HQ54tBZTm0Yu4s1wy12KFvf/vb2pXEV29S2KV5tOrZRd4NsqA6YE2k+LuhGWokG
 jSMw==
X-Gm-Message-State: AAQBX9fQVM/eZvEm7RJezrAkGaq1WpCf2Vh9Q19cRg0ZlN/h7kAWdd50
 XgsTb6sEGKQODVjSimdKsI2FBaAAuNOH9jmEiZcGQHj24RsVx9isiPL+oN62+dotS4j6xddEGJT
 2v9C3LU3r4Cc73Wk=
X-Received: by 2002:a05:600c:b99:b0:3f1:7619:f0f6 with SMTP id
 fl25-20020a05600c0b9900b003f17619f0f6mr9717225wmb.9.1682408624604; 
 Tue, 25 Apr 2023 00:43:44 -0700 (PDT)
X-Google-Smtp-Source: AKy350YMnTQuidJ2wCq2wMO051Einj4O8C3zgDeBD/1Zg3U7mfbJYakc1SyO0LPHdl11iJ83nqQrEw==
X-Received: by 2002:a05:600c:b99:b0:3f1:7619:f0f6 with SMTP id
 fl25-20020a05600c0b9900b003f17619f0f6mr9717193wmb.9.1682408624344; 
 Tue, 25 Apr 2023 00:43:44 -0700 (PDT)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a7bce09000000b003f049a42689sm14136881wmc.25.2023.04.25.00.43.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Apr 2023 00:43:43 -0700 (PDT)
Message-ID: <d8b2321d-79a2-f562-fe21-dbd6a9d963c9@redhat.com>
Date: Tue, 25 Apr 2023 09:43:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v8 7/8] bcm2835_property: disable reentrancy detection for
 iomem
Content-Language: en-US
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Bandan Das <bsd@redhat.com>, "Edgar E . Iglesias"
 <edgar.iglesias@gmail.com>, Darren Kenny <darren.kenny@oracle.com>,
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:Raspberry Pi" <qemu-arm@nongnu.org>
References: <20230421142736.2817601-1-alxndr@bu.edu>
 <20230421142736.2817601-8-alxndr@bu.edu>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230421142736.2817601-8-alxndr@bu.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.194, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 21/04/2023 16.27, Alexander Bulekov wrote:
> As the code is designed for re-entrant calls from bcm2835_property to
> bcm2835_mbox and back into bcm2835_property, mark iomem as
> reentrancy-safe.
> 
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>   hw/misc/bcm2835_property.c | 7 +++++++
>   1 file changed, 7 insertions(+)

Reviewed-by: Thomas Huth <thuth@redhat.com>


