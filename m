Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0976A4121
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 12:48:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWbxs-0005AC-HL; Mon, 27 Feb 2023 06:46:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWbxp-000597-6x
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:46:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWbxn-0007lX-F2
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:46:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677498398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1X+sytCbcnBB0dpwB9T5MA49ayoRI/cKMaQQmUpYaAQ=;
 b=CNs/CEO117jhBrEMjwf/EgtXejlpHqsHfYdm6+Busxieaf9MTIgyskM+ABjLHe4r6MmHkx
 guQxDGUjK/yGAnJLxCORL6GW5YfgXUMcvW0Iifqjk+Cm5ujpWCAt7y6GIWDc72D8W2aao2
 ydX6kuZl/CXIPLSsp07SaDlLkV/kjn0=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-164-_AwM6IUENQuNbQ0TNLl7Ww-1; Mon, 27 Feb 2023 06:46:37 -0500
X-MC-Unique: _AwM6IUENQuNbQ0TNLl7Ww-1
Received: by mail-qv1-f70.google.com with SMTP id
 e9-20020a0cf749000000b00571f1377451so3251777qvo.2
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 03:46:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1X+sytCbcnBB0dpwB9T5MA49ayoRI/cKMaQQmUpYaAQ=;
 b=zg6qzgp44dqtamRVaF4oaRvvmrBd2vBa++fpKoqHDPNDpBOqGD2CgTaEjoDp6acnp3
 5gHUNfReephSoyv2Cyknv+1eneiOPiMSmzYuv1TOUYLxfbljEr7dt/BgkqZ5V5xQoKu3
 Mg+2rxJuSDrmVdTBRMpXh5qLPKp0r4AvGVJE5LI0bYz77UW63SyCCjnobJk2sA6L/HSo
 37c0Iob2lWnXmrXDRwCNH/98Y42r81vPgPOo55KrYVer/z57I5hzf5N2LVBEkUPfmkHS
 ie/ULH3hW2mJKW4r8af4qavtrFfzavWP8+pWxMscast91GwS4TMxsEpD5GALSHQL3U6X
 Z2LQ==
X-Gm-Message-State: AO0yUKXcACBhfeldOF2lX5hZhw93MeacIGJZHsBwGsxrGQMxCOhYjGk7
 mOEiHk7H2NxE081e4nbumRuPE8AYGqksQLTIovEgQrAbD/g3Pwqvhy7L9lplI+mh9OSWzGeUi64
 P1DydKQ/7tMVjaqk=
X-Received: by 2002:a05:622a:13cf:b0:3bf:c86b:3d2f with SMTP id
 p15-20020a05622a13cf00b003bfc86b3d2fmr13042953qtk.51.1677498396796; 
 Mon, 27 Feb 2023 03:46:36 -0800 (PST)
X-Google-Smtp-Source: AK7set+qwqRoaJwaE9jwrN7BfuVLaJn/sClCRx4cFZsumUyF3mB5SVvj8ZwyaUj8KEUFTuK0Ym1IRA==
X-Received: by 2002:a05:622a:13cf:b0:3bf:c86b:3d2f with SMTP id
 p15-20020a05622a13cf00b003bfc86b3d2fmr13042936qtk.51.1677498396566; 
 Mon, 27 Feb 2023 03:46:36 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-150.web.vodafone.de.
 [109.43.176.150]) by smtp.gmail.com with ESMTPSA id
 n76-20020a37404f000000b0071aacb2c76asm4644437qka.132.2023.02.27.03.46.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 03:46:36 -0800 (PST)
Message-ID: <34cacdc8-ee20-7dfe-52f4-a68cc29fbfb2@redhat.com>
Date: Mon, 27 Feb 2023 12:46:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 0/6] hw/vfio/ccw: hw: Use QOM macros and remove
 DO_UPCAST() uses
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>
Cc: Eric Farman <farman@linux.ibm.com>, Eduardo Habkost
 <eduardo@habkost.net>, Richard Henderson <richard.henderson@linaro.org>,
 qemu-s390x@nongnu.org, David Hildenbrand <david@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230213170145.45666-1-philmd@linaro.org>
 <ba7cefe1-7fb7-7b6e-e22c-867eb4f0b3ad@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <ba7cefe1-7fb7-7b6e-e22c-867eb4f0b3ad@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 27/02/2023 12.15, Philippe Mathieu-Daudé wrote:
> Hi Alex,
> 
> On 13/2/23 18:01, Philippe Mathieu-Daudé wrote:
>> QOM housekeeping series which replace the DO_UPCAST() macro
>> uses by equivalent QOM ones (and few more trivial cleanups).
>>
>> Since v2:
>> - Split of bigger series
>> - Split in simpler patches
>> - Added Eric R-b tags
>>
>> v2:
>> https://lore.kernel.org/qemu-devel/20230213070820.76881-17-philmd@linaro.org/
>>
>> Philippe Mathieu-Daudé (6):
>>    hw/s390x/event-facility: Replace DO_UPCAST(SCLPEvent) by SCLP_EVENT()
> 
> Thomas took the first patch,
> 
>>    hw/vfio/ccw: Simplify using DEVICE() macro
>>    hw/vfio/ccw: Use intermediate S390CCWDevice variable
>>    hw/vfio/ccw: Replace DO_UPCAST(S390CCWDevice) by S390_CCW_DEVICE()
>>    hw/vfio/ccw: Remove pointless S390CCWDevice variable
>>    hw/vfio/ccw: Replace DO_UPCAST(VFIOCCWDevice) by VFIO_CCW()
> 
> Could you take the other ones via your VFIO tree?
> (all patches reviewed).

I've picked the other patches now, too (since they've got a Reviewed-by by 
one of the vfio-ccw maintainers now).

  Thomas


