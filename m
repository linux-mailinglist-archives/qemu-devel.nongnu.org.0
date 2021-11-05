Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 528434466DD
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 17:18:39 +0100 (CET)
Received: from localhost ([::1]:33432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj1vK-0003dD-FT
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 12:18:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mj1sV-0001Su-Fs
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 12:15:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mj1sS-0008Ja-05
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 12:15:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636128938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+lNGNenvfNaipWqikW0be/kLkgzbLBZJj/+W7bssb4o=;
 b=H2eumD05T0KkN1gQvwcPOU9qGNKP582aCg+Migl+uOtouguotLTfeinClVObu4/JTd7uHC
 qaDP1HE54HvdxXBJLmyMbOXlhFEFlWb9pTtzrf0lYUuDDMjAoN+LTrXrElhPdDAAJAJ7FO
 HuQSqJ9FDKQq9YG472BW5xcUfq3+ECU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-_YsLFFQmPpKhncVb8ckQLA-1; Fri, 05 Nov 2021 12:15:37 -0400
X-MC-Unique: _YsLFFQmPpKhncVb8ckQLA-1
Received: by mail-ed1-f71.google.com with SMTP id
 w13-20020a05640234cd00b003e2fde5ff8aso3642176edc.14
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 09:15:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+lNGNenvfNaipWqikW0be/kLkgzbLBZJj/+W7bssb4o=;
 b=rqQnzDeAx6hxsGupwpTN8GY1sY4LN99csbwNRjDN5Pq68UBOIi17U1PYgb5i24eOcM
 KWvnJ2g8qN8f/Eq0VOx8ftiUXk7IJ47VuF0E9zb0wLQhLiTQaWizXFpFoD5PmzUq3cvK
 tfZ+8nAQYKly9panHtImEZEJafXu8Oaf5FeqpCo6WMDxL7jKRidfyvXdTMRPSxy+qey6
 bHsRvOAkAR0lYpnesr+IqKihu2NJ1w8qcoauUUvEyh8PbuTslg4x3L8zh1gTX3QQcQ/Y
 8B9nKpZi2eeRJ6vgcMN+uXlXaK5+bGN/JYtWUIB0ANlaWO95MVSYQNziELoJwqEfvkn4
 P2vg==
X-Gm-Message-State: AOAM530O2hPQ+WUMYQU5LBtbip3xEzngdMJR06AviKDN6A/ssei7dkpD
 4F++OEDSHy0nhZYKDtguPtgkCGJ2LqO4HmsIDzyw9Oap1EfWH7PlVMkigW3Zb9depO4KcITj1KV
 zCaw57CYERKUK/Ms=
X-Received: by 2002:a17:906:5641:: with SMTP id
 v1mr23478187ejr.357.1636128935885; 
 Fri, 05 Nov 2021 09:15:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcerAogqoKzyR8II+N3nIqm/3BxSk1dxBGisH5QFMI761bNpiEBbBlbIc7HQ2PmBiXuZRdCg==
X-Received: by 2002:a17:906:5641:: with SMTP id
 v1mr23478147ejr.357.1636128935655; 
 Fri, 05 Nov 2021 09:15:35 -0700 (PDT)
Received: from ?IPV6:2001:b07:add:ec09:c399:bc87:7b6c:fb2a?
 ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id i4sm4604540edt.29.2021.11.05.09.15.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Nov 2021 09:15:34 -0700 (PDT)
Message-ID: <2e4b52b0-b1fc-58c5-9631-fbf9d7f927fc@redhat.com>
Date: Fri, 5 Nov 2021 17:15:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Artificially target-dependend compiles
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <87czneyaw3.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87czneyaw3.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.093, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/5/21 14:45, Markus Armbruster wrote:
> Moving these definitions to machine-target.json moves the generated C
> from qapi/qapi-*-machine.[ch] to qapi/qapi-*-machine-target.[ch], where
> CONFIG_ACPI_VMGENID is okay.  It also makes qmp_query_vm_generation_id()
> target-dependent: it needs qapi/qapi-commands-machine-target.h.

If I understand correctly, the problem that 
qapi-commands-machine-target.h is target-dependent, because it uses 
"#ifdef CONFIG_ACPI_VMGENID" around the prototype?

On one hand, the "#ifdef" is unnecessary: the prototype does not depend 
on anything target-specific.  Removing it will avoid the 
target-dependence.  On the other hand, the "#ifdef" has a defensive 
purpose, in that an unnecessary definition (such as the one currently in 
the stub) will fail due to the implicit definition of 
qmp_query_vm_generation_id().

> Have you seen similar artificial target-dependence elsewhere?

I can't think of a specific example, but it does ring some bells.

Paolo


