Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF9E62EE20
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 08:12:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovvWt-0007Km-0e; Fri, 18 Nov 2022 02:11:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ovvWS-0007Cn-0n
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 02:10:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ovvWP-00032O-2U
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 02:10:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668755440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KVMR/Lfif8y8RBr3ZhdmdtWBXVMuRLYestAVq0pqoyM=;
 b=LE1bE9hklV49CBazDPMNOSu/K9H0QLHdANyWEgHRmL3NOmDlXdoSha3qYtqAJvv6ga95Dn
 Z5PhnHzLWMoNpu1NVtBV6ds7rZAyg2QS9XKI+t5tUzfBUE9xWG/ljnBMCZkR4He3OqJIrP
 VZtcPo+b6C398kvqY7Z9xFnv0x9cbzA=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-82-5QxOlizYMfmR-nyPdR8RfQ-1; Fri, 18 Nov 2022 02:10:36 -0500
X-MC-Unique: 5QxOlizYMfmR-nyPdR8RfQ-1
Received: by mail-pj1-f71.google.com with SMTP id
 k9-20020a17090a39c900b0021671e97a25so2550352pjf.1
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 23:10:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KVMR/Lfif8y8RBr3ZhdmdtWBXVMuRLYestAVq0pqoyM=;
 b=EqirWkUpHrs7hMVaK/EE5FQgGbBnG4V4UhF0+Y83i//6GK5sK2M3QeAEE3eGx3XHiI
 UBTN5naNhXkcTKA5x57HUJ37ZCPWZtiBS7M+xrvW6XEmfTIs8lEQXSLUt0GGu32d5aWP
 wbnxZWXgJpIrHdtnvtsaMynfmNCyC13k3ynK6w51UL6JTo37+gp3aV2r8Jqi9DIDNiTl
 Dpixed8Vb3Im9eqQlgpOw7B5rvDrz6RD7290ITZoWgT7MVI4O0zCiVqwuhPkDQK1VLCc
 tMrSJzUTvbpgVyBeg85amao9Y6qKClKIsdjhvRIHVRLXbjPF4t4deI3BuMIMmMXY5+Mr
 ylzg==
X-Gm-Message-State: ANoB5pkFTkHuCNuKfUA+V6IV/RquJuJxkJPQTB6Sew16vRscEMOPc7Po
 IBSiSUQLU4xWhtNIX7WS6GIZ8HuCWgfhLJaWKV9qZllfWYi631vEF8dwdoqnaqEf4DdSEuIVXd9
 dJSSnS9CQZynwrnQ=
X-Received: by 2002:a62:19c8:0:b0:56b:f390:36f with SMTP id
 191-20020a6219c8000000b0056bf390036fmr6729500pfz.2.1668755435560; 
 Thu, 17 Nov 2022 23:10:35 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5Mq4IcZQKQ6IOsK2AHjRzidV3lcnbl7ATPjckk3MDjAjwqKd3FXPosCvJTv9Y4qAAmzMc7uA==
X-Received: by 2002:a62:19c8:0:b0:56b:f390:36f with SMTP id
 191-20020a6219c8000000b0056bf390036fmr6729490pfz.2.1668755435327; 
 Thu, 17 Nov 2022 23:10:35 -0800 (PST)
Received: from [10.72.13.166] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 y9-20020aa793c9000000b0057255b82bd1sm2322937pff.217.2022.11.17.23.10.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 23:10:34 -0800 (PST)
Message-ID: <07ba380f-59c8-3f13-d719-e6ee821408f8@redhat.com>
Date: Fri, 18 Nov 2022 15:10:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH for-7.2] rtl8139: honor large send MSS value
Content-Language: en-US
To: Tobias Fiebig <tobias@fiebig.nl>, 'Stefan Hajnoczi' <stefanha@gmail.com>
Cc: 'Stefan Hajnoczi' <stefanha@redhat.com>, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org, 'Russell King - ARM Linux' <linux@armlinux.org.uk>
References: <20221115163659.1595865-1-stefanha@redhat.com>
 <011801d8f967$5dad0f00$19072d00$@fiebig.nl>
 <CACGkMEtJ2+2yhHgD33wiWvUEREei2ThQAkRNFWzRrDt5D50u+g@mail.gmail.com>
 <008c01d8f9ad$6ba58e20$42f0aa60$@fiebig.nl>
 <CAJSP0QUcYkKjJ1NMvKcs=03Z0Yjm+SD6H0wScJ-Zx62sXb6egQ@mail.gmail.com>
 <01e701d8fa2f$4124d750$c36e85f0$@fiebig.nl>
 <CAJSP0QX_PCNU6PFd8svnGJq5U9-0+weAN6MyiyYqWHkssY4QPA@mail.gmail.com>
 <CAJSP0QW76L82s=LM=RpWEwiFPFaNBe4J4AXBi6jtDR2h8dE1UQ@mail.gmail.com>
 <004f01d8fa77$80cfe4b0$826fae10$@fiebig.nl>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <004f01d8fa77$80cfe4b0$826fae10$@fiebig.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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


在 2022/11/17 19:26, Tobias Fiebig 写道:
> Heho,
> Ok, that explains a lot. I was also thinking that the vlan bit seem to overlap with the MTU field, and wanted to look at that later today.
>
> Re the 12b: IIRC, the standard 1500 MTU for ethernet is already without the ethernet header; That can have up to 26b (18b basis, 4b 802.1q, 4b 802.1ad), but leads to a total frame length of 1526 (with other additions (MPLS) also just making the frame bigger, without touching the MTU/MSS). MSS than as usual -40 for v4 and ~ -60 for v6.
>
> So I doubt that those 12b are subtracted for the ethernet header.
>
> Does somebody still have an RTL8139 around, to test how the real hardware behaved?


This would be very hard, I can think that the Qemu rtl8139 emulation is 
probably the only user for kernel 8139cp drivers for years.

Thanks


>
> With best regards,
> Tobias
>
> -----Original Message-----
> From: Stefan Hajnoczi <stefanha@gmail.com>
> Sent: Thursday, 17 November 2022 12:16
> To: Tobias Fiebig <tobias@fiebig.nl>
> Cc: Jason Wang <jasowang@redhat.com>; Stefan Hajnoczi <stefanha@redhat.com>; qemu-devel@nongnu.org; qemu-stable@nongnu.org; Russell King - ARM Linux <linux@armlinux.org.uk>
> Subject: Re: [PATCH for-7.2] rtl8139: honor large send MSS value
>
> After looking more closely at txdw0 it seems that the code mixes "Tx command mode 0", "Tx command mode 1", and "Tx status mode". The bits have different meanings in each mode, so this leads to confusion :).
>
> Stefan
>


