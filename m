Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F61E3A5E3D
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 10:18:25 +0200 (CEST)
Received: from localhost ([::1]:48796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lshnb-0003c9-Ox
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 04:18:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lshlr-000186-KD
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:16:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lshlo-0003w5-1o
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:16:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623658591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=75ZKNqk1/5XLdvIzoISE0ROi9ms6gz5s5XrLWRxlJEA=;
 b=JRfolYAYfsET2QCjC8gje5KH1GshXnPFviCE3INdPstQX9rUxtDv+4N6yh2oRe+zTREhFy
 U7lDZhH3UXfblxi0EKeEqs7k1N0Ywl9Mzk8qcJ5a5+m1V5qDDAGN2i9srtJSyxgeb7eBMQ
 MkfBa8I6Jqg5fwrrRpC5QzXR9UtBpq8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-UlZ-Q9efPEakIAC_TYEz7w-1; Mon, 14 Jun 2021 04:16:30 -0400
X-MC-Unique: UlZ-Q9efPEakIAC_TYEz7w-1
Received: by mail-ed1-f69.google.com with SMTP id
 t11-20020a056402524bb029038ffacf1cafso10454861edd.5
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 01:16:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=75ZKNqk1/5XLdvIzoISE0ROi9ms6gz5s5XrLWRxlJEA=;
 b=aI8firiCvb6dUAhNiimTl1+aFZaUnJBa0HfTFJzUCrRbgj/qgQailRygZZxzHyVrW6
 7KYPk8tmhPeKCvIN7YWLyFlWpUlmqOuvMW50oKOQIOA2dh8iuVWp5/CZ0TRKKAfxdtZR
 P4r6g4c0SCnCNNQOlYboljMvrshWVcXV3iqZ4Vinxrnu2zxDaT2KzM4yKedJi6znG0fC
 vOylLSLGQPGZ/lGefyz3HiQgK8IPOR+qK165LN7US6y5fVF9XarveHoqn3tNmmv8yFPJ
 fjLqoL67I1hlZ0w76W1sw5p77nJbOl4uLpttUjotO7ATApc+Z9DaOWyVeoRJ1suzvJ3c
 An0g==
X-Gm-Message-State: AOAM530ktnard1om7AEKXEb1gQ16laa5JFFv0KhjXDYZuvXOOEKnKTLF
 7n5D9MXdI+e38qvtKhVA/NhbpeDhOVWq1S6Xu83lvFqscdlat5ZEdecl8yiV3oiEjw8m+EPV4a3
 ZgK/6PzohqvFGQladwxW6EAJIFVvOssy/bKD5sEeK0+MKdMeoBDzbNELbEYasdZugRMI=
X-Received: by 2002:a05:6402:1d0c:: with SMTP id
 dg12mr15615588edb.155.1623658588823; 
 Mon, 14 Jun 2021 01:16:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6m2OHykkXTlkjt4hQWnhwWxwZEZSHLP6jcwvn3AEQOoJ+IXKOfMmAmkrxDY9hif42MaPVfg==
X-Received: by 2002:a05:6402:1d0c:: with SMTP id
 dg12mr15615570edb.155.1623658588563; 
 Mon, 14 Jun 2021 01:16:28 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id fn3sm6578085ejc.96.2021.06.14.01.16.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 01:16:28 -0700 (PDT)
Subject: Re: [PATCH] esp: store lun coming from the MESSAGE OUT phase
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20210611115756.662367-1-pbonzini@redhat.com>
 <f78018a5-8845-1fd8-f580-57bafc534e6c@ilande.co.uk>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <70ab4483-b0f6-6b12-203e-8b2a940ecd88@redhat.com>
Date: Mon, 14 Jun 2021 10:16:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <f78018a5-8845-1fd8-f580-57bafc534e6c@ilande.co.uk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.144, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/06/21 12:40, Mark Cave-Ayland wrote:
> 
> Unfortunately the VMSTATE_*_V() macros don't work in ESPState because 
> ESPState is currently embedded in both sysbusespscsi and pciespscsi 
> using VMSTATE_STRUCT() where the version of the vmstate_esp 
> VMStateDescription does not match those in the vmstate_sysbus_esp_scsi 
> or vmstate_esp_pci_scsi VMStateDescriptions. This is currently handled 
> by adding an explicit mig_version_id field containing the 
> vmstate_esp.version_id field and testing accordingly.
> 
> The fix is to use the same logic as esp_is_version_5() when adding the 
> new field to vmstate_esp. I've tested the changes below squashed into 
> your patch, along with the just posted fix for esp_is_version_5(), and 
> confirmed that I can reload old qemu-system-sparc images from 5.2 and 
> 6.0 as well as git master.

Ah, ok.  So I'll squash this fix, thanks!

Paolo


