Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 960F2456CCE
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 10:51:47 +0100 (CET)
Received: from localhost ([::1]:52764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo0Yb-000743-LX
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 04:51:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mo0WY-0005ME-8M
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 04:49:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mo0WV-0003ss-4l
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 04:49:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637315374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x5Ee4Xn9kQ1qXuGqMqx+FeWfJFeMuHXcxdYU6We/GOw=;
 b=DVKsH0IBK79jsuJP0/pYm8DhvaGGawcjggCg37nzoCSvIq7HXlpCdXQXAfw9eimvnIN+mc
 QDzZxnoP+eBWxvD9diJfixSEN07o8ynBWqam3i5EZwenITzlYafzAjvOhqNgzea/zRe/yK
 p0hvQ67rFtvNMlouRXx47CLxrKaCVbc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-485-10BdKjfrNpiaaPEqFmFXfw-1; Fri, 19 Nov 2021 04:49:32 -0500
X-MC-Unique: 10BdKjfrNpiaaPEqFmFXfw-1
Received: by mail-wm1-f72.google.com with SMTP id
 z126-20020a1c7e84000000b003335e5dc26bso3798046wmc.8
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 01:49:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=x5Ee4Xn9kQ1qXuGqMqx+FeWfJFeMuHXcxdYU6We/GOw=;
 b=rnSqjYmJzxRGqQOqCRVA3YROCPLN6NAQGrinIv5zGA25TnUVaKTi9XVuQf+IvBFxrk
 w5CcUhUfJkCj5l0JREXf3TQ+USMoqxBUzOEbieQNUV+5XJYiNZ4+qRgqyhR4FDMuFeN1
 2hQUCmB8TYVY9Lb89QAA5vMMGCqVz5EmXbnX+IAaDXNGRHlX2u1i7nzNCzrL6KMP9YFn
 Kt4oiUGoSZrB+zZXjzE2PWeL7UNyl8OSYE6u4ZZH7UIyOJmtIciMmao1TeUnDprDsDdm
 DJuQ76Y8HmCRgkImo4J9BRqo9nR142UumHpBFlnms49EWekPfYGvIXtoQc/RR6l1QLm1
 FVTQ==
X-Gm-Message-State: AOAM532mNalJ+WTWHntVFaq8YP7oeRUer6wF9ky1AoKZNwC1reKLVNbI
 yAyPJB6LyAuxfPwALwF3IPW8Xx9Im0RKqh/S2LQjPE+mr2IetGSh+7xCAKktZdmutlT2gsgiaj3
 L9Cv0ct0RTsesLB4=
X-Received: by 2002:adf:d1c2:: with SMTP id b2mr5733882wrd.114.1637315371742; 
 Fri, 19 Nov 2021 01:49:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxIv3kb1Z0zomfGhv4S7x9rGrn56hlKIgT0HmquQfAeNZ4wvap38LjTu3hFqQvhKA1xQsNx+Q==
X-Received: by 2002:adf:d1c2:: with SMTP id b2mr5733856wrd.114.1637315371596; 
 Fri, 19 Nov 2021 01:49:31 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id g18sm14539105wmq.4.2021.11.19.01.49.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Nov 2021 01:49:31 -0800 (PST)
Message-ID: <c7cb668d-1ed4-c9a6-7c27-d8892c625f0c@redhat.com>
Date: Fri, 19 Nov 2021 10:49:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH-for-6.2 0/2] hw/display: Do not allow multiple (identical)
 VGA devices
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20211118192020.61245-1-philmd@redhat.com>
 <776204b8-22df-555b-1836-425995272fd9@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <776204b8-22df-555b-1836-425995272fd9@ilande.co.uk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.727, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, "Jose R . Ziviani" <jziviani@suse.de>,
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/21 09:21, Mark Cave-Ayland wrote:
> On 18/11/2021 19:20, Philippe Mathieu-Daudé wrote:
> 
>> Commit 7852a77f598 fixed creating multiple TYPE_ISA_VGA devices,
>> generalize the fix to all VGA devices.
>>
>> See https://gitlab.com/qemu-project/qemu/-/issues/44
>>
>> Philippe Mathieu-Daudé (2):
>>    hw/display: Add Error* handle to vga_common_init()
>>    hw/display: Do not allow multiple identical VGA devices
>>
>>   hw/display/vga_int.h        |  2 +-
>>   hw/display/ati.c            |  4 +++-
>>   hw/display/cirrus_vga.c     |  4 +++-
>>   hw/display/cirrus_vga_isa.c |  4 +++-
>>   hw/display/qxl.c            |  4 +++-
>>   hw/display/vga-isa-mm.c     |  3 ++-
>>   hw/display/vga-isa.c        | 11 ++---------
>>   hw/display/vga-pci.c        |  8 ++++++--
>>   hw/display/vga.c            | 17 ++++++++++++++++-
>>   hw/display/virtio-vga.c     |  4 +++-
>>   hw/display/vmware_vga.c     |  2 +-
>>   11 files changed, 43 insertions(+), 20 deletions(-)
> 
> Hi Phil,
> 
> I don't think this is correct for non-ISA devices: for example years ago
> I had a PC running Windows 98SE with 2 identical PCI graphics cards
> configured in dual-head mode.
> 
> IIRC the BIOS would bring up the first graphics card and configure it to
> use the legacy ISA VGA ioports for compatibility, and then once the main
> OS drivers loaded both cards were switched to PCI mode and configured
> using the BARs as normal.

The problem here is QEMU technical debt, not the hardware.

When vga_common_init() calls memory_region_init_ram_nomigrate()
with obj=NULL, "vga.vram" is registered as a QOM singleton.

Updating it would 1/ require non-QOM devices to be QOM'ified
and 2/ break migration unless using HPFM which I don't master.


