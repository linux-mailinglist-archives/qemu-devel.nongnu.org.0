Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A7D6A53D0
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 08:45:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWuf4-0003ci-51; Tue, 28 Feb 2023 02:44:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWueS-0003Qu-0t
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 02:43:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWueQ-00087r-Gu
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 02:43:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677570233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ufREbMFBsFQIjAxMK7Naz6Z2bm0FVGjZtzY/hZNym1g=;
 b=Qyn/Z1ppqnYohE2oYN7zPVj51VTMFQql/zn7xYrfFvtiS1MAJh7JWVJlTfgtNx7dowwokS
 YbVM4EteY4Qdz4zNgHLHYhBJeCHRCeFqaVsYyJ2TuLK2RNpRHoz05nKbxgQbNwfc8acNMN
 NffFy5vYKUfQgm+LwC1RulyJ7vbi19s=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-649-kVocjdr4Mdm9EJX0vrN6mw-1; Tue, 28 Feb 2023 02:43:51 -0500
X-MC-Unique: kVocjdr4Mdm9EJX0vrN6mw-1
Received: by mail-wm1-f69.google.com with SMTP id
 u19-20020a05600c00d300b003eb24ce58ceso3299095wmm.9
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 23:43:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ufREbMFBsFQIjAxMK7Naz6Z2bm0FVGjZtzY/hZNym1g=;
 b=0JLR29mINNNa3v278jx/3YDtR9c5d/e/Xwu08DLZXlG6rNUicSDXfSDBgqa8DqlmWx
 yszuDdcOTMJ9jznWEcKkskgEPi/ZLBJ7gfREFMmdRRL1GG2gtglC75/q71H3xOy8a1BU
 h8bFPRvQd4SdIFD8PEPyyWBrwlpmO2VX4Dhyyn0HGUR4tnCjGRzviwEKSOPcwEFxbfMI
 AkeYsT5lOetZ3GdLFEKs5X936jRmAtpxT7u/VJ41atKVHjxJl3weOFi6LBvaK/zHgbnQ
 5YMWfEZxtLubNNAQe09j80kXhu0Xrlkp1o34u24df3Luf2P/JT/Dofo8AK1eBn4W1vs8
 22Kg==
X-Gm-Message-State: AO0yUKXBhHw78X/HVknQmsg94sqlRl22M/A+vCv9d7Kz+GOtwjf/3Dkj
 Eyk2M88nRgAk54ZlLznYjgd989t5s0d4tywSG8IpN5sZAFCUTuOA+8zv53bmdf7AjeRaOJzuDcI
 JoCjh6mStFqaJ5bo=
X-Received: by 2002:a5d:424a:0:b0:2ca:d5dc:bba4 with SMTP id
 s10-20020a5d424a000000b002cad5dcbba4mr1466430wrr.59.1677570229883; 
 Mon, 27 Feb 2023 23:43:49 -0800 (PST)
X-Google-Smtp-Source: AK7set/+OC6jQRznL8bCi2fp/4ORQCK/tSgqjWzf1oQTF69+WhcSUvxgOLNifCcD01s1iI5r3TuvcQ==
X-Received: by 2002:a5d:424a:0:b0:2ca:d5dc:bba4 with SMTP id
 s10-20020a5d424a000000b002cad5dcbba4mr1466399wrr.59.1677570229519; 
 Mon, 27 Feb 2023 23:43:49 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-75.web.vodafone.de.
 [109.43.177.75]) by smtp.gmail.com with ESMTPSA id
 u17-20020adff891000000b002c553e061fdsm8954445wrp.112.2023.02.27.23.43.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 23:43:48 -0800 (PST)
Message-ID: <2979548a-59f9-744f-70a7-d0fd00be0a2a@redhat.com>
Date: Tue, 28 Feb 2023 08:43:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230227111050.54083-1-thuth@redhat.com>
 <20230227111050.54083-2-thuth@redhat.com> <Y/yY72L9wyjuv3Yz@redhat.com>
 <20230227150858-mutt-send-email-mst@kernel.org>
 <77b8545c-4f2a-b389-2811-47d2d48940d9@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <77b8545c-4f2a-b389-2811-47d2d48940d9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

On 27/02/2023 23.32, Philippe Mathieu-Daudé wrote:
> On 27/2/23 21:12, Michael S. Tsirkin wrote:
>> On Mon, Feb 27, 2023 at 11:50:07AM +0000, Daniel P. Berrangé wrote:
>>> I feel like we should have separate deprecation entries for the
>>> i686 host support, and for qemu-system-i386 emulator binary, as
>>> although they're related they are independant features with
>>> differing impact. eg removing qemu-system-i386 affects all
>>> host architectures, not merely 32-bit x86 host, so I think we
>>> can explain the impact more clearly if we separate them.
>>
>> Removing qemu-system-i386 seems ok to me - I think qemu-system-x86_64 is
>> a superset.
> 
> Doesn't qemu-system-i386 start the CPU in a different mode that
> qemu-system-x86_64? Last time we discussed it, we mention adding
> -32 and -64 CLI flags to maintain compat, and IIRC this flag would
> add boot code to switch the CPU in 32-b. But then maybe I misunderstood.
> Thomas said, "CPUs must start in the same mode they start in HW".

No, I think you misunderstood something here. x86 CPUs always start in 
16-bit mode, as far as I know, and the firmware / OS then has to switch to 
32-bit or 64-bit mode as desired.

  Thomas


