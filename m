Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E79C0321E27
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 18:33:17 +0100 (CET)
Received: from localhost ([::1]:52324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEF5A-0004OI-TO
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 12:33:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lEF1j-0001e0-0G
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 12:29:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lEF1c-0007ZB-Oz
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 12:29:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614014975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NfelcL+pdhy2e0TOXPlQ7NvTrXFvEcqEPxEcW27tkDc=;
 b=XVNugZXC5KGjTV3Sj08AkioyOkI7CdiWefyYIEWR/ANlslAQ/o8zeORJnk7MLLdSaWNqs+
 gFXqu/mwreeLgiBENc6I3rLGiFjSmSTVRZ/sdk1UcVistGnhbX7sUfL4r97nCQFOCbgSGr
 I6/hByQCHhbAGDhKJUxNCJy3Cz5O5zo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-MVXqQdsJOE-uQP3rVH3VgA-1; Mon, 22 Feb 2021 12:29:27 -0500
X-MC-Unique: MVXqQdsJOE-uQP3rVH3VgA-1
Received: by mail-ej1-f69.google.com with SMTP id v10so485231ejh.15
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 09:29:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NfelcL+pdhy2e0TOXPlQ7NvTrXFvEcqEPxEcW27tkDc=;
 b=pCqN23MG63kINwalX6P4ebHmKDt/5Y8/J92zg97qAH1Uw6k4x9lGhQuHLoAbDa+4US
 eNOtddCP67SotAxYq+y02Bh1cJ1qyLqyz2YSbFl3caCZIEHQKDT9kuwxJwXMB14apfVI
 uzXReOJOdUs9NvFyt92/leCllzSMcS3SE5EQJIejgwvYr6Q4qJpW2QA0V1PuAFiLMosC
 pTh9xqwyR+lSzmm/hk2x4kUBEYQzCMh9dyX3vWdvFPpfBsjm0oVZAR7KZQ4wX2vH2KUt
 e655rjTzVLG9iNK8LjYJWnVFNSnkXAz1cOcwwSoVsmgSD3krIfQ/EZbiAnYG72TIwqAX
 9tYQ==
X-Gm-Message-State: AOAM531SH5JmSET+L25kPqS/Z6KWewWLqIMHgbOJA1XDhgAvx1B20/Eh
 WbpdV9ZGKUWIjePA2hBNKrme5FeHN9Z5hOXavYs2/9imQ3psUmQuSfrsHBRROeOLphAhF7wiYV4
 1y8ydL5nZlUX42jk=
X-Received: by 2002:a17:907:e91:: with SMTP id
 ho17mr21994507ejc.93.1614014965691; 
 Mon, 22 Feb 2021 09:29:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzK0GQwOS/nqz90VFUmY/CYkLPXKAtPQ1HXQmNbHZtOBEkYjxC8G4bCOoWPfL5Mg5PlYdSF9w==
X-Received: by 2002:a17:907:e91:: with SMTP id
 ho17mr21994484ejc.93.1614014965485; 
 Mon, 22 Feb 2021 09:29:25 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id g2sm10807225ejk.108.2021.02.22.09.29.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 09:29:24 -0800 (PST)
Subject: Re: [PATCH v6 05/12] vfio: Support for RamDiscardMgr in the !vIOMMU
 case
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210222115708.7623-1-david@redhat.com>
 <20210222115708.7623-6-david@redhat.com>
 <5920c566-6f4b-8935-bf4c-b941a67152aa@redhat.com>
 <0aaa0fe2-9fac-5cbb-59f8-e087b2397a55@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <95e52a5e-5af9-8739-b15b-5086ecfe5efd@redhat.com>
Date: Mon, 22 Feb 2021 18:29:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <0aaa0fe2-9fac-5cbb-59f8-e087b2397a55@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>, Igor Mammedov <imammedo@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/02/21 15:43, David Hildenbrand wrote:
>> Also, why can't you just pass vrdl to the call?
> 
> I have to modify the callbacks. Similarly done for 
> memory_region_iommu_replay().

Since replay_populate only uses a single callback, that suggests using a 
function pointer instead of the RamDiscardListener*.

Paolo


