Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A69D443489A
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 12:08:51 +0200 (CEST)
Received: from localhost ([::1]:57536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md8Wg-0003KE-NT
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 06:08:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1md8To-0007zr-LK
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:05:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1md8Tl-0003hv-CZ
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:05:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634724343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z9I5SfJEsNXiO07HaLcpBHRJTYB+BfHD+ePAz1GwfCo=;
 b=gLbFqsJO2IAgXTXtYHie/FiQCyfgSFnBc/RQSdNwsp3JooKMol4Rc3n+w/6ZSQMkveXsgQ
 8KCbPP8bRAHN/VOSLSAJHqITNrtTDkgHOQPeDny0fZP4xOk++Fr9XI5UfEftil3RdmbQv/
 gxL6Pu6eF0MdpekMWLnA2+TrhmdgND8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-i8xfMoG_PpaZvp2qKO87SA-1; Wed, 20 Oct 2021 06:05:42 -0400
X-MC-Unique: i8xfMoG_PpaZvp2qKO87SA-1
Received: by mail-wm1-f71.google.com with SMTP id
 204-20020a1c01d5000000b003101167101bso3937683wmb.3
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 03:05:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=z9I5SfJEsNXiO07HaLcpBHRJTYB+BfHD+ePAz1GwfCo=;
 b=nuu17UlboQ3uAF5OrUfC3RS7MTsJh7xAyPsEg02n1v9eUNcQa1z4PeyzGBejjgm3Bf
 qMvRE86h6p7lKwPHZZLl3jq8A9PfBn+p+2P/CVEgvbH1cp6ct2R2ZyRj62YGPiBXU3Yd
 BKiavuMgi4qV5mcMwki5HNUWPsTDGY/O4xVlMymGIQItLpE/NQ+HfPFouhOI8hmlU/HK
 DnyR7vcWvD7OQhM3PCpfzPzCU1uk2FsizdyWkclUjs6wPS4BOsnAe5A24lHWie67HhSh
 gKzz1OSLRc1XbR7F6jUt1h/Yf43Xlh8HIh1n248kjP1cCHhOPLeG9DtAk1UP7ZUaK5PG
 DLJQ==
X-Gm-Message-State: AOAM530BhNz6gTn+gDwC3pEY3osPKTh7hzhjcYcjY6HAsHU16RL03Cn7
 EUs6KqC3Tzp5YX7lVEtZY+64qSm7BXJOesCcsYHKlpgtq7vHuMaYyu2hkc3OVrK4QecybPR0n6b
 OvJX56y5iK7+xlZc=
X-Received: by 2002:adf:b355:: with SMTP id k21mr50758641wrd.380.1634724341076; 
 Wed, 20 Oct 2021 03:05:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymz/e92eLanbRu/qPF1Z6dO0jRpVVKwGiaY9Ip39dsHLcVBa/OOi3tq8BUW7qdX2S0KKdJUw==
X-Received: by 2002:adf:b355:: with SMTP id k21mr50758621wrd.380.1634724340846; 
 Wed, 20 Oct 2021 03:05:40 -0700 (PDT)
Received: from [192.168.1.36] (33.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.33])
 by smtp.gmail.com with ESMTPSA id j13sm1549745wro.97.2021.10.20.03.05.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 03:05:40 -0700 (PDT)
Message-ID: <4e75691f-d40c-3cf3-4e45-2cb71e676581@redhat.com>
Date: Wed, 20 Oct 2021 12:05:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] pci: fix PCI resource reserve capability on BE
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
References: <20211020095408.917102-1-mst@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211020095408.917102-1-mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, CTE_8BIT_MISMATCH=0.001,
 DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.074, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, jing2.liu@linux.intel.com,
 zuban32s@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/20/21 11:54, Michael S. Tsirkin wrote:
> PCI resource reserve capability should use LE format as all other PCI
> things. If we don't then seabios won't boot:
> 
> === PCI new allocation pass #1 ===
> PCI: check devices
> PCI: QEMU resource reserve cap: size 10000000000000 type io
> PCI: secondary bus 1 size 10000000000000 type io
> PCI: secondary bus 1 size 00200000 type mem
> PCI: secondary bus 1 size 00200000 type prefmem
> === PCI new allocation pass #2 ===
> PCI: out of I/O address space
> 
> This became more important since we started reserving IO by default,
> previously no one noticed.
> 
> Fixes: e2a6290aab ("hw/pcie-root-port: Fix hotplug for PCI devices requiring IO")
> Cc: marcel.apfelbaum@gmail.com
> Fixes: 226263fb5c ("hw/pci: add QEMU-specific PCI capability to the Generic PCI Express Root Port")
> Cc: zuban32s@gmail.com
> Fixes: 6755e618d0 ("hw/pci: add PCI resource reserve capability to legacy PCI bridge")
> Cc: jing2.liu@linux.intel.com
> Tested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  hw/pci/pci_bridge.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


