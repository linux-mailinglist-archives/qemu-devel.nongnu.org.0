Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AAB6EF774
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 17:06:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prghz-0003Ir-H7; Wed, 26 Apr 2023 11:05:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1prghw-0003IY-6p
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 11:05:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1prghu-0007Yc-LS
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 11:05:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682521520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uKN9p0J0nonP3lDMX+GLu8mYr1PTdFV9gH3GUjpJ0FQ=;
 b=dtxeEGSgui/sfnrePMM6/CPWOpbzefRoAlB4VsFBUNHRtRG+47p9ESzpDslzvDQlwNyP0h
 5VbCkBK0K8aMpuv9+N6L/BVBb8DO9P2RWSX3uTj2abqmyz8m3pRKtFT8g/fxRPFpUSwcIF
 QT4qvhP3DbLd2vslep5blR5+91uekc8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-570-6rEXnfiYNrq778g2vYzeOw-1; Wed, 26 Apr 2023 11:05:18 -0400
X-MC-Unique: 6rEXnfiYNrq778g2vYzeOw-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f17b8d24bbso45307105e9.2
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 08:05:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682521517; x=1685113517;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uKN9p0J0nonP3lDMX+GLu8mYr1PTdFV9gH3GUjpJ0FQ=;
 b=LzDwhCFGBQ7mgrD1YaMgtEPqXromoSMwdDrwkp5/X4sVtQUX0KlCNZOpE1OaNv62MN
 IVcli+heFUmAab3qt6C1zyRXeycx1ODNckmcpRutRJWA3Cma15Z/DO0mke+UUljQLZ3T
 9bSrBfWXbIN5ApggygnZo+YwynRTnG7GZ9cW2iEbebn6pY/8L0Zu35drFQ6zpwx1PXwz
 Ob0w6MYe5Xegn6FWFz3Z6zA3u0TDTDp4+zspw1Znx+nKyWZ5DzIsN2zxop/FkgD9EQse
 mdBRdzTzu2NKlsp8MhDNh+WYbuttU4xxGkiLnNPz2M4JZCSx+D8nEn83Z2eFWZnNGepS
 n8sQ==
X-Gm-Message-State: AAQBX9d4wVWrTOQDGr5bk4oaKhCMeIIIl24DSkhuqbr5HN6izUwnmduR
 ZBWZVAJdMdsYj7vuPSkegZ9E+KydXqko7CMntkvHpAwWGU322xOyo+rmhz0ZZaIsWr3YlfXGW+n
 JOPIboKz1liP2F7A=
X-Received: by 2002:a1c:7902:0:b0:3ed:fc8c:f197 with SMTP id
 l2-20020a1c7902000000b003edfc8cf197mr12591891wme.29.1682521517298; 
 Wed, 26 Apr 2023 08:05:17 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZHjcUGKV0IHDgRX9aKJ2qYBBG5YHTzZV2wrm7pufj58d76JeH3ISjvsBnLf4ytvupK6xNT9g==
X-Received: by 2002:a1c:7902:0:b0:3ed:fc8c:f197 with SMTP id
 l2-20020a1c7902000000b003edfc8cf197mr12591877wme.29.1682521516992; 
 Wed, 26 Apr 2023 08:05:16 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-131.web.vodafone.de.
 [109.43.176.131]) by smtp.gmail.com with ESMTPSA id
 k36-20020a05600c1ca400b003f1733feb3dsm21968361wms.0.2023.04.26.08.05.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Apr 2023 08:05:16 -0700 (PDT)
Message-ID: <0b417bc6-8f49-54c6-1d23-9884ce45b792@redhat.com>
Date: Wed, 26 Apr 2023 17:05:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Hyman Huang <huangy81@chinatelecom.cn>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20230413054509.54421-1-thuth@redhat.com>
 <8177194c-853e-de0b-fe06-0ae82bbc127f@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] softmmu: Move dirtylimit.c into the target independent
 source set
In-Reply-To: <8177194c-853e-de0b-fe06-0ae82bbc127f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 13/04/2023 12.31, Richard Henderson wrote:
> On 4/13/23 07:45, Thomas Huth wrote:
>>       uint32_t dirty_ring_size = kvm_dirty_ring_size();
>>       uint64_t dirty_ring_size_meory_MB =
>> -        dirty_ring_size * TARGET_PAGE_SIZE >> 20;
>> +        dirty_ring_size * qemu_target_page_size() >> 20;
> 
> Existing problem, the types here are suspicious: dirty_ring_size is 
> uint32_t, dirty_ring_size_meory (typo) is uint64_t.
> 
> I wonder if this is better computed as
> 
>      uint32_t dirty_ring_size_MB = dirty_ring_size >> (20 - 
> qemu_target_page_bits());

qemu_target_page_size() returns a "size_t", so I think it should be fine for 
64-bit hosts. But for 32-bit hosts, this looks error prone, indeed, so I 
think your suggestion is a good idea. Care to send a patch?

  Thomas


