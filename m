Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8702435FE1
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 13:04:04 +0200 (CEST)
Received: from localhost ([::1]:46066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdVrf-0002kJ-Dd
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 07:04:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mdVlL-0005aj-Hc
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 06:57:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mdVlK-0007Eb-2j
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 06:57:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634813849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iNxOXJLsUKlxh8+qNKGEfolq+ouzSLzUgmXC1c5JVOs=;
 b=RFHm9X3/XsAbY9sSQt6ByB+59/vN+pMEr25bvXfJKlOUDN0Jxr9nxgOfu/XZ9HqTSRALJI
 q823QPfmIFeaXXYy+MwolYNXkaGAD2fcpZS7kWpa0YU7qtfOP4bifxSk1RMYnAvVitIceg
 OOfan1sJEBCsPNCOIWrkWhD75SuQUoo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-gOngyYoBPG28xzvCDq3NXQ-1; Thu, 21 Oct 2021 06:57:28 -0400
X-MC-Unique: gOngyYoBPG28xzvCDq3NXQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 m1-20020a1ca301000000b003231d5b3c4cso785672wme.5
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 03:57:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=iNxOXJLsUKlxh8+qNKGEfolq+ouzSLzUgmXC1c5JVOs=;
 b=K1wnyqr4hE11Jf3MSNRgv3Bxeifj4G007jyvllsgY4qzdvxb35KmwhEPgMHBkB+gXN
 OaICtPqE0RqQTceNjGOfJ2XX94CAWyIslA4WM5KT/9xgRA3V8dkatZqAor0d2oxjAme5
 8eJFPJY479NE0R99eBlOqBC47c3iFhcL7YIrI2z72Eq3fAnksd/WflCKRjDW8auQJeVW
 bvKXlGrp4p/Pfju0PwemIKTMPlFZ1S3lZ5H+1zkwjlrJW1ZIdXI4m2TpmbF3skGp5jfz
 vb3IXoKDR6bzoyK9zMn54XJ/0UKGlCc1SfTV7MbXRHqb+mIYIb63EIrwG5PDrQ2ROGOG
 l2rg==
X-Gm-Message-State: AOAM531am+ardSncLDf7PONoewlhvgNOxoE4YsaPaXo3eWSbd2wJK9O4
 +raA4JU9S1Om04JdC9+JY/AMpvZnYRuOpYkZPjw2lIUkBUdMkXazB8PGuPm9XsGEVDLao9fArvB
 a0Vfr1fpGYKyLJKk=
X-Received: by 2002:adf:ff91:: with SMTP id j17mr6066987wrr.132.1634813847407; 
 Thu, 21 Oct 2021 03:57:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4XlXcCvL9bFkCRb+aKOPpT8Ogt8iJDqbNmw1txadh+T+lFxySkcuYVqlsnhBPl5jnZK6IzA==
X-Received: by 2002:adf:ff91:: with SMTP id j17mr6066955wrr.132.1634813847226; 
 Thu, 21 Oct 2021 03:57:27 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23aba.dip0.t-ipconnect.de. [79.242.58.186])
 by smtp.gmail.com with ESMTPSA id j1sm5174477wrd.28.2021.10.21.03.57.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 03:57:26 -0700 (PDT)
Message-ID: <856f5d4d-6964-dd3c-7a51-7edd8660a125@redhat.com>
Date: Thu, 21 Oct 2021 12:57:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 4/8] pci: Define pci_bus_fn/pci_bus_ret_fn type
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20211021104259.57754-1-peterx@redhat.com>
 <20211021104259.57754-5-peterx@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20211021104259.57754-5-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.267, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21.10.21 12:42, Peter Xu wrote:
> The pci_bus_fn is similar to pci_bus_dev_fn that only takes a PCIBus* and an
> opaque.  The pci_bus_ret_fn is similar to pci_bus_fn but it allows to return a
> void* pointer.
> 
> Use them where proper in pci.[ch], and to be used elsewhere.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---

Reviewed-by: David Hildenbrand <david@redhat.com>

But should we just have squashed that into patch #1?

-- 
Thanks,

David / dhildenb


