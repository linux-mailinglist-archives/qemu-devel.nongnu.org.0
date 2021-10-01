Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5317941EB54
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 13:04:25 +0200 (CEST)
Received: from localhost ([::1]:37114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWGL1-0007uW-U2
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 07:04:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mWGIe-00064Z-Ac
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 07:01:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mWGIT-0005aN-Ip
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 07:01:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633086101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HXYf5CmfDbUcmrXM3YY5m0hpwRh30a8hWHdzZt/s+w0=;
 b=PP/an1LlJ4XIkPAThkLuyakaEZY8Aefapyg2hBEiL6BZxZECPLnPJTlLgDVy964Uds8Zyj
 m5+2yMb0VVh3Cf13CYDITG2u9EzIywhZUn1IdFBn2m6ivHJqfX/4cjphDj6IZKJfBuOT4h
 eZkBPM3YaVYyuOatc7wmaMyhBjoi9lA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-j99HlEPEOPiF9Vm2rNEZ1w-1; Fri, 01 Oct 2021 07:01:40 -0400
X-MC-Unique: j99HlEPEOPiF9Vm2rNEZ1w-1
Received: by mail-wm1-f71.google.com with SMTP id
 o11-20020a05600c378b00b0030d4f47013aso737939wmr.7
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 04:01:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HXYf5CmfDbUcmrXM3YY5m0hpwRh30a8hWHdzZt/s+w0=;
 b=NED+guWQTKKq0b/Qish11T5xV8WtQOhFmA3pD/KSW4rU3jLDQCT3bBoSq+LzhI5Bqh
 64PKYDI5BKBUgF1LqUx3WySH9Sp9bu6mRFG4Q1Mz/oabPh/Afh0U1oB4rY6Z2+IH61MD
 YmMu8vzvlJrUnn1YUloAYMAFGp9rV/O+YgCLjYZ+VT6lEfGSGHYFOuCR/ETYMB1cvziD
 upogIaMWC5PHNgZA+sG3MoU0WZRoyeDxK6ZkOZNgbfJY1prwhojtSFqPr7Lwb0i2ZamI
 +MHiRSqZ3tK5K6GrtcrTlUBzpcM5SU4GZ6llslHrcJ2USutx0FaaK9bFElvxZt5dFsDE
 9asA==
X-Gm-Message-State: AOAM533MFpOg98ol4D3sZ0zCm1nmI2PRmDOL6iH9gCH9jsB/mP0ap+u0
 Th/Ev5DnB+IMmSW6n8hhFltWd1sE/mLyKx4DvHLkEvK43oxQ9MUxIcLUyLC30+eO8PWUx2Y4s9a
 AIeexIIEcuf0W9Sw=
X-Received: by 2002:adf:ab06:: with SMTP id q6mr3009134wrc.433.1633086099498; 
 Fri, 01 Oct 2021 04:01:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwotPMliT1TzWiKEsRho0rdPW+PxxhBLFvSmu7VaXDbJ7lWYYw4VrXJs47ClN6dfshvjJrNng==
X-Received: by 2002:adf:ab06:: with SMTP id q6mr3009107wrc.433.1633086099204; 
 Fri, 01 Oct 2021 04:01:39 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.21.142])
 by smtp.gmail.com with ESMTPSA id y11sm6605594wrg.18.2021.10.01.04.01.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 04:01:38 -0700 (PDT)
Message-ID: <0eeefb15-1b41-076c-7dd4-ca5fc78eefa9@redhat.com>
Date: Fri, 1 Oct 2021 13:01:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3] failover: fix unplug pending detection
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20211001082502.1342878-1-lvivier@redhat.com>
 <20211001104514.46bhlpenx4rz2qnm@sirius.home.kraxel.org>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <20211001104514.46bhlpenx4rz2qnm@sirius.home.kraxel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.127, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Julia Suvorova <jusual@redhat.com>, qemu-devel@nongnu.org,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 Jens Freimann <jfreimann@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/10/2021 12:45, Gerd Hoffmann wrote:
> On Fri, Oct 01, 2021 at 10:25:02AM +0200, Laurent Vivier wrote:
>> Failover needs to detect the end of the PCI unplug to start migration
>> after the VFIO card has been unplugged.
>>
>> To do that, a flag is set in pcie_cap_slot_unplug_request_cb() and reset in
>> pcie_unplug_device().
> 
>> +    /*
>> +     * pending_deleted_event is used by virtio-net failover to detect the
>> +     * end of the unplug operation, the flag is set to false in
>> +     * acpi_pcihp_eject_slot() when the operation is completed.
>> +     */
>> +    pdev->qdev.pending_deleted_event = true;
> 
> This has the side effect of blocking a second 'device_del' command.

This problem is not introduced by this patch as it only adds the code we already have in 
PCIe Native hotplug to ACPI hotplug (but see below).

> So, in case the first time didn't work (for example due to the guest not
> listening because grub just doesn't do that), you can try a second time
> once the linux kernel is up'n'running.
> 
> I suspect this patch will break that (didn't actually test though).

I think the solution to this problem is to not check for pending_deleted_event value in 
qmp_device_del().

But this has been explicitly added by:

commit cce8944cc9efab47d4bf29cfffb3470371c3541b
Author: Julia Suvorova <jusual@redhat.com>
Date:   Thu Feb 20 17:55:56 2020 +0100

     qdev-monitor: Forbid repeated device_del

     Device unplug can be done asynchronously. Thus, sending the second
     device_del before the previous unplug is complete may lead to
     unexpected results. On PCIe devices, this cancels the hot-unplug
     process.

     Signed-off-by: Julia Suvorova <jusual@redhat.com>
     Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
     Message-Id: <20200220165556.39388-1-jusual@redhat.com>
     Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

So do you mean ACPI differs from PCIe Native hotplug in this case?

Thanks,
Laurent




