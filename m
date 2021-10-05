Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 175F9422DFD
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 18:30:20 +0200 (CEST)
Received: from localhost ([::1]:50144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXnKc-0007k3-HU
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 12:30:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mXmse-00009D-AN
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:01:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mXmsY-0004nc-TI
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:01:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7vXOOANnQt1mGj7GjQ0KPc66Uy0U2FpTCet+Ux1qkgg=;
 b=HqQtlj9j7cnDJrejAicVo80mUvYoS2le8NYHj30sUFtqn4RktNgkiY+hR6XlE4ifHDCUPi
 L8IWpl/STwzhbTlz1L5uXgwypbq0TY6Y0kimBQid73a/+8Qg+MKhgtfWop9hGJLXLh/Jaa
 wN9B1TQ5cHDJ/7FMkkoOR4zsF+siQD8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-112-XGmTx2w1Mmeo5ndTCGjy2Q-1; Tue, 05 Oct 2021 12:01:16 -0400
X-MC-Unique: XGmTx2w1Mmeo5ndTCGjy2Q-1
Received: by mail-wr1-f69.google.com with SMTP id
 v15-20020adfa1cf000000b00160940b17a2so4398851wrv.19
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:01:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7vXOOANnQt1mGj7GjQ0KPc66Uy0U2FpTCet+Ux1qkgg=;
 b=1d+8jId8455rH+3RV2Gc/6HMMcGK7ydTWN4lQ9pjV/pP1DXXsCVEqeyBDLS9leH3YR
 BxlEJrx5AQpNZZNEbXD9SguD57z+nD32PwQNIFRwd+XNdSn2u7SAopvEFGENOrV6Ilrf
 ovACRRJEthzv2NzilZ0To3nwwO2Y4RC29XUa7K70TlsIoEcbrmag2m2F26YVC/c8PMX0
 HyXV3trhYCgDt9Byk2ynylD+bqCZWPZ+bLBJwrHSw7/x0a+FAgriWIg6yDKnTNzr75OC
 Hxjbprv0kDEfBm+eyOXFKm8kCuDMbj960t8MuuxvvPVOnIPQHVPJbyhxolZzS46kU9BC
 QOMw==
X-Gm-Message-State: AOAM530YxU9dN9xkLToHR4vwJOGpwMgu5ZjIlSwXOBi4+68WM+yVcAxU
 ksORZiT40CbRl+1a4/o1ubwKYJzEpyo1LrRQH9Vkm/gnq2SWqYfBnFFpUoPHSZygOuTBQ5BAK9h
 wPe2iNv8luXNpWFo=
X-Received: by 2002:a05:600c:4e86:: with SMTP id
 f6mr4329710wmq.166.1633449675474; 
 Tue, 05 Oct 2021 09:01:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVhEi8l7NR2j4E/5ZQ4dbX7VHSOBNyjhXAkX/IcdZnFOwXI2qGS799TR/IXJJ65VcvLJ3kAg==
X-Received: by 2002:a05:600c:4e86:: with SMTP id
 f6mr4329679wmq.166.1633449675256; 
 Tue, 05 Oct 2021 09:01:15 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.3.114])
 by smtp.gmail.com with ESMTPSA id c14sm17870023wrd.50.2021.10.05.09.01.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 09:01:14 -0700 (PDT)
Message-ID: <5b30770b-ef21-b3e7-96d4-92bb22f3aa2a@redhat.com>
Date: Tue, 5 Oct 2021 18:01:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3] failover: fix unplug pending detection
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20211001082502.1342878-1-lvivier@redhat.com>
 <20211005111401-mutt-send-email-mst@kernel.org>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <20211005111401-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 Jens Freimann <jfreimann@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/10/2021 17:14, Michael S. Tsirkin wrote:
> On Fri, Oct 01, 2021 at 10:25:02AM +0200, Laurent Vivier wrote:
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
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>> Reviewed-by: Ani Sinha <ani@anisinha.ca>
> 
> Laurent, are you thinking of addressing Gerd's comment?

No, because as said by Ani, it's not the scope of this patch. The patch only aligns ACPI 
to PCIe Native to be able to manage failover.

The problem reported by Gerd and Daniel has been introduced by another patch, globally.

Except if you think it's really required I will not send a new version.

Thanks,
Laurent


