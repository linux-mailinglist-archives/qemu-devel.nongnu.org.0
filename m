Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B9C6D4DF0
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 18:33:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjN6T-0007zl-7h; Mon, 03 Apr 2023 12:32:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pjN6L-0007eX-HI
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 12:32:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pjN6I-0008WG-7m
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 12:32:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680539528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gKSg/Lwm98s+kXsyQ31r9Ek6uk2FwWpL+uKSG2Vlv5E=;
 b=ZrtkiUxu4Yyok8tiJoG3NwnPe6fYwAh46BZKow+8e7DgCM1W5vUIGTaeUseHBTEv2LylU/
 U1z4AsXz8O61bxtVeL7d3ShdefE6pbVuLgfpHtbSb8YAqX8ZmO8s9CFaHc5elh2ZUMnIO7
 3WXS01Ad1k4szoLyseUxO8bnJ03CNFA=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-108-1dLteavONE-LYrHpWEEFiw-1; Mon, 03 Apr 2023 12:32:07 -0400
X-MC-Unique: 1dLteavONE-LYrHpWEEFiw-1
Received: by mail-qv1-f71.google.com with SMTP id
 px9-20020a056214050900b005d510cdfc41so13402423qvb.7
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 09:32:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680539526;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gKSg/Lwm98s+kXsyQ31r9Ek6uk2FwWpL+uKSG2Vlv5E=;
 b=5lhd/qrdiKoirbKp5demwspAGQO0rHi1H7wzBB2/HU/uVZOWGnKMWomg7o5B0c6pVK
 Umcsi8M7A0JoN2EChv3VfWXjNd63VPl79DffQ6GfX8X0tpQruEvSSoBbGTgAqn+7253W
 tY0zo6zHo3RjtkCTwfjdLvlrlGogUbLiG+cbQDOEnGrBA5s0m2Cy5iHWyj65VoWGi/vp
 aurHJCGJqbFftDrXNFAI19rAJa6bWpbPQDdGsPneFqrlxz9Pwj4vb0GxNyYxTqetQ4GR
 KJUAcDHyM5VNBqwytuWut6JT5P/bwwbKslYL9i8oF+c2gxvlyiaqCPULoplcYSI4/97m
 CVpg==
X-Gm-Message-State: AAQBX9derrPWAELngY4aiHHE4lSeGF9nD8iLc/Rk/zMbNDo7LFl8Ciar
 uboXaeViCnOckT/PT9JRuNxj48CC15tqkVp9h06rcalG8LkDYV2UH+rcG5ixSPguZLRNwwzPrnI
 DMiGvkMy9zNMBHLc=
X-Received: by 2002:a05:6214:20af:b0:5b7:fc3f:627c with SMTP id
 15-20020a05621420af00b005b7fc3f627cmr57974272qvd.41.1680539526722; 
 Mon, 03 Apr 2023 09:32:06 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZUMeM6RHJ4eZqb5W012K4XoXWQOAtBmDVbkHnFvztXKAPOjP1b09wmPNizYrZibnP4rSo9FA==
X-Received: by 2002:a05:6214:20af:b0:5b7:fc3f:627c with SMTP id
 15-20020a05621420af00b005b7fc3f627cmr57974242qvd.41.1680539526429; 
 Mon, 03 Apr 2023 09:32:06 -0700 (PDT)
Received: from [192.168.100.30] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 kv1-20020a056214534100b005dd8b934572sm2769915qvb.10.2023.04.03.09.32.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 09:32:06 -0700 (PDT)
Message-ID: <94e21f89-0a3e-701b-7171-7398dff9ce46@redhat.com>
Date: Mon, 3 Apr 2023 18:32:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: an issue for device hot-unplug
Content-Language: en-US
To: Yu Zhang <yu.zhang@ionos.com>, qemu-devel <qemu-devel@nongnu.org>,
 Jinpu Wang <jinpu.wang@ionos.com>, Elmar Gerdes <elmar.gerdes@ionos.com>
References: <CAHEcVy5SV34jaubY5F-q=H+smvMVOzKbb=rTaNJDNXyGdFaLZg@mail.gmail.com>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <CAHEcVy5SV34jaubY5F-q=H+smvMVOzKbb=rTaNJDNXyGdFaLZg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.349, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Yu,

please open a bug in the bug tracker:

https://gitlab.com/qemu/qemu/-/issues

It's easier to track the problem.

What is the version of QEMU you are using?
Could you provide QEMU command line?

Thanks,
Laurent


On 4/3/23 15:24, Yu Zhang wrote:
> Dear Laurent,
> 
> recently we run into an issue with the following error:
> 
> command '{ "execute": "device_del", "arguments": { "id": "virtio-diskX" } }' for VM "id" 
> failed ({ "return": {"class": "GenericError", "desc": "Device virtio-diskX is already in 
> the process of unplug"} }).
> 
> The issue is reproducible. With a few seconds delay before hot-unplug, hot-unplug just 
> works fine.
> 
> After a few digging, we found that the commit 9323f892b39 may incur the issue.
> ------------------
>      failover: fix unplug pending detection
> 
>      Failover needs to detect the end of the PCI unplug to start migration
>      after the VFIO card has been unplugged.
> 
>      To do that, a flag is set in pcie_cap_slot_unplug_request_cb() and reset in
>      pcie_unplug_device().
> 
>      But since
>          17858a169508 ("hw/acpi/ich9: Set ACPI PCI hot-plug as default on Q35")
>      we have switched to ACPI unplug and these functions are not called anymore
>      and the flag not set. So failover migration is not able to detect if card
>      is really unplugged and acts as it's done as soon as it's started. So it
>      doesn't wait the end of the unplug to start the migration. We don't see any
>      problem when we test that because ACPI unplug is faster than PCIe native
>      hotplug and when the migration really starts the unplug operation is
>      already done.
> 
>      See c000a9bd06ea ("pci: mark device having guest unplug request pending")
>          a99c4da9fc2a ("pci: mark devices partially unplugged")
> 
>      Signed-off-by: Laurent Vivier <lvivier@redhat.com <mailto:lvivier@redhat.com>>
>      Reviewed-by: Ani Sinha <ani@anisinha.ca <mailto:ani@anisinha.ca>>
>      Message-Id: <20211118133225.324937-4-lvivier@redhat.com 
> <mailto:20211118133225.324937-4-lvivier@redhat.com>>
>      Reviewed-by: Michael S. Tsirkin <mst@redhat.com <mailto:mst@redhat.com>>
>      Signed-off-by: Michael S. Tsirkin <mst@redhat.com <mailto:mst@redhat.com>>
> ------------------
> The purpose is for detecting the end of the PCI device hot-unplug. However, we feel the 
> error confusing. How is it possible that a disk "is already in the process of unplug" 
> during the first hot-unplug attempt? So far as I know, the issue was also encountered by 
> libvirt, but they simply ignored it:
> 
> https://bugzilla.redhat.com/show_bug.cgi?id=1878659 
> <https://bugzilla.redhat.com/show_bug.cgi?id=1878659>
> 
> Hence, a question is: should we have the line below in  acpi_pcihp_device_unplug_request_cb()?
> 
>     pdev->qdev.pending_deleted_event = true;
> 
> It would be great if you as the author could give us a few hints.
> 
> Thank you very much for your reply!
> 
> Sincerely,
> 
> Yu Zhang @ Compute Platform IONOS
> 03.04.2013


