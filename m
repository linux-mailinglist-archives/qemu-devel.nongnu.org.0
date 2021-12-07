Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB3546B406
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 08:33:53 +0100 (CET)
Received: from localhost ([::1]:36814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muUz1-00067x-V6
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 02:33:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1muUwQ-0003zL-1K
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 02:31:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1muUwO-0001HP-2k
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 02:31:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638862267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=onUTxiO/Y5znL/OFxN1oppgOlrpcgzATu/JNVk1iP1U=;
 b=LCtp3pGUhZiyDhKE+FNQ10DlW1ALPa3xF4RVIzfbEOIChYxJiNkk4qRF1xoY9PdnQ7NDWJ
 QWZa0roWuOn/pAcA30islghcDmS8oJOJmaTMCf4N/JFBfjtObGGW55nRT/4MU4JGbrYd9Y
 6S8ieauKiqQ36dPFHrmfF/DcJfDBwhI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-427-JlzshMOSObSH_ye9U-dX6g-1; Tue, 07 Dec 2021 02:31:04 -0500
X-MC-Unique: JlzshMOSObSH_ye9U-dX6g-1
Received: by mail-wm1-f70.google.com with SMTP id
 y141-20020a1c7d93000000b0033c2ae3583fso7306335wmc.5
 for <qemu-devel@nongnu.org>; Mon, 06 Dec 2021 23:31:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=onUTxiO/Y5znL/OFxN1oppgOlrpcgzATu/JNVk1iP1U=;
 b=4RzkJ2GoWaboQ7OKGvgO6CVeEs/ZO4wX8/MrsB/+FL5zAnqbaAMyWFP77LsBdI1RkA
 2WEnmsmc4kNrmRmDNXIoxa5bwnmVbHiMyLcGSsNn9EFj99vyxYYHmek1ULc+YD/7Fv/x
 QynmA1yXoLWM8gJ2TamZNLmHtYitey4X9sAZ6gLYKRp2k+NOszuahGylFdCIsMWnrSQT
 YgKauV7NNRG6IzyA5cBLhNLu/oo4kXUzyyxy22yXjVhcz1XDWheGfrby/zDVD1gacNAl
 dBYWnT4gV7Zo4lZakwKfOTZ5p06IOTOiTCRJ929o9QA9WXqQxleB/MtBgLAUKnbRuTmF
 UmWw==
X-Gm-Message-State: AOAM532+AZdc5Mupu/WF+UTUre8FfQQtwNm1MOxKIzQV1JMPyO9fTqo9
 MbjZNTw6Fq1OpBIQlTIbjheK505YJwD8oZxkJMbWMpwhQsjy2sq+mDQH4uxNfZ6ASUzcMVTlb5t
 1hHXaS1fUHrCsWMo=
X-Received: by 2002:adf:e0c3:: with SMTP id m3mr49160255wri.546.1638862263143; 
 Mon, 06 Dec 2021 23:31:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzKEAUHnF9sYxURwg3Q/0suw6RoCkXcUsFcuqtuTmHGGowYWYujW7JAUtaK4ojZ/TOyCfd7eg==
X-Received: by 2002:adf:e0c3:: with SMTP id m3mr49160235wri.546.1638862262908; 
 Mon, 06 Dec 2021 23:31:02 -0800 (PST)
Received: from [192.168.100.42] ([82.142.9.98])
 by smtp.gmail.com with ESMTPSA id y15sm16664698wry.72.2021.12.06.23.31.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Dec 2021 23:31:02 -0800 (PST)
Message-ID: <1a11b82c-858e-1e34-5768-5e75a1420664@redhat.com>
Date: Tue, 7 Dec 2021 08:31:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v6 3/6] failover: fix unplug pending detection
To: Ani Sinha <ani@anisinha.ca>
References: <20211206222040.3872253-1-lvivier@redhat.com>
 <20211206222040.3872253-4-lvivier@redhat.com>
 <alpine.DEB.2.22.394.2112070939570.40413@anisinha-lenovo>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <alpine.DEB.2.22.394.2112070939570.40413@anisinha-lenovo>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.44, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jens Freimann <jfreimann@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/12/2021 05:13, Ani Sinha wrote:
> 
> 
> On Mon, 6 Dec 2021, Laurent Vivier wrote:
> 
>> Failover needs to detect the end of the PCI unplug to start migration
>> after the VFIO card has been unplugged.
>>
>> To do that, a flag is set in pcie_cap_slot_unplug_request_cb() and reset in
>> pcie_unplug_device().
>>
>> But since
>>      17858a169508 ("hw/acpi/ich9: Set ACPI PCI hot-plug as default on Q35")
>> we have switched to ACPI unplug and these functions are not called anymore
>> and the flag not set. So failover migration is not able to detect if card
>> is really unplugged and acts as it's done as soon as it's started. So it
>> doesn't wait the end of the unplug to start the migration. We don't see any
>> problem when we test that because ACPI unplug is faster than PCIe native
>> hotplug and when the migration really starts the unplug operation is
>> already done.
>>
>> See c000a9bd06ea ("pci: mark device having guest unplug request pending")
>>      a99c4da9fc2a ("pci: mark devices partially unplugged")
>>
> 
> This has already been merged upstream:
> https://git.qemu.org/?p=qemu.git;a=commit;h=9323f892b39d133eb69b301484bf7b2f3f49737d

Sorry, I forgot to rebase my series before sending.

Thank you for the remark.

Laurent


