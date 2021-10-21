Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BABA4360B3
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 13:46:52 +0200 (CEST)
Received: from localhost ([::1]:55276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdWX5-0005KM-JL
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 07:46:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mdWQK-0002z6-85
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 07:39:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mdWQI-0003WH-4t
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 07:39:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634816388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dVqCE1qN/jitsGRTP/HvNoCm8XrRBDXRR0QHzxApkL4=;
 b=iHXYnh18HozmFhKJr4ylxMeE3pLMZGnCSG8IFs5MhGoQ2rUs8m2/9/+7lXnQdvf2arycsT
 /rpVGzdf0USntXcARgNo/sgfj5N+ssoh/uirq0nlJqsIlA/nPO/YHdf4l5uzXBgVwirGnx
 RlnuLEHPh7g5KfkbRvFtxGDqKwdfZs0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-KSbFOSJ7NyKyunlHNlWv5Q-1; Thu, 21 Oct 2021 07:39:45 -0400
X-MC-Unique: KSbFOSJ7NyKyunlHNlWv5Q-1
Received: by mail-wr1-f72.google.com with SMTP id
 k2-20020adfc702000000b0016006b2da9bso99405wrg.1
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 04:39:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dVqCE1qN/jitsGRTP/HvNoCm8XrRBDXRR0QHzxApkL4=;
 b=LDY9EPl/zXBSrQPGBeT6y2PAYMPrT+dB6ccPAa0zQJ6Huvzg6EGJjUEvJ76R3/Tw8+
 Cy/z6fUb42DKw8sKlQ1BPAOBvfPCWXxtm8ieuvnUG2fwYpBwNw2aYBvCnC6VLKj9qEmc
 1le1FMeIRt/SIekSuQNMNb0Qb5W7+1KQxQiSQtuZjgwa7my1U+mjLxUQDCGglZvkmIQs
 jgJroziq8myLz22UWcwNfDWzqpPfDcOAD8bmXbNXFV2yCfnCN0j6CGkK4l445AaBjanu
 Tl5dBY6WvWObj1Ez6L3mU+i0L31ibG8DYeyCYYeZG+3C1oGogmJWub3/3namn0E7kHEf
 f1Tw==
X-Gm-Message-State: AOAM5329kIsiR8578C5ktHmKLGS90/ZI+mz9UWtkI+w91Gw6sUFgQ9gl
 YgOn+jp3aUA7XNopi5gSQ06pLc2s1YLxFtuncUp2D7JAiz9wlUPf+GvaBXX/wsyP0+vemIT7Bj6
 ZnWxjIOHPE5jE6Uw=
X-Received: by 2002:adf:ab03:: with SMTP id q3mr6930618wrc.396.1634816384619; 
 Thu, 21 Oct 2021 04:39:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjQss50szErJ4DBrGuG1LKrzLqypbtwkeBYWnVwO7wwwtZHZFJjAmp2g5bN7WVvGEtcqPcFA==
X-Received: by 2002:adf:ab03:: with SMTP id q3mr6930584wrc.396.1634816384411; 
 Thu, 21 Oct 2021 04:39:44 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id g8sm4658046wrx.26.2021.10.21.04.39.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 04:39:44 -0700 (PDT)
Message-ID: <ca2fdfa0-d5f3-3164-b4cd-b6c35d27bf32@redhat.com>
Date: Thu, 21 Oct 2021 13:39:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 2/8] pci: Export pci_for_each_device_under_bus*()
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20211021104259.57754-1-peterx@redhat.com>
 <20211021104259.57754-3-peterx@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211021104259.57754-3-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.867, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/21 12:42, Peter Xu wrote:
> They're actually more commonly used than the helper without _under_bus, because
> most callers do have the pci bus on hand.  After exporting we can switch a lot
> of the call sites to use these two helpers.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  hw/pci/pci.c         | 10 +++++-----
>  include/hw/pci/pci.h |  5 +++++
>  2 files changed, 10 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


