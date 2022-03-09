Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E814D341A
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 17:24:30 +0100 (CET)
Received: from localhost ([::1]:57918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRz6z-0000YZ-DV
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 11:24:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRz4U-0005s4-QC
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 11:21:54 -0500
Received: from [2a00:1450:4864:20::32d] (port=40954
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRz4S-0002Jl-5A
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 11:21:54 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 h127-20020a1c2185000000b00389d0a5c511so359577wmh.5
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 08:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3dT/OQqvQnoqLWy539HXNwccw4Y/k6egudY3UVh+RkA=;
 b=MKpxb8rdWGK6/geDYSYdWPd/LFeKy2O5NMOqSc+AUk6SLAJATQooKABWtk0Ak7I4wl
 IvUS2Qb60nYPSrZi2ccSzERoCEW8NFwl5RnQcDSBqmg8DoewusSJae2KMymqRqgWDPpO
 32uG5HingL1wvhFKAYglh88YV5b7NnKU3n4ygF0eIlXqQCLDuX1BQkkSsNRCONFOG2Wv
 vuV+fprqKxBqSCQsvTqsSbLJXnyLbPIHIH2comEX98NDkGNDj0XrkpihkGp4iU1sSI18
 k0klNEByTh+kxx3siTiLw63ZD+mjpl7cLLtRXt8cQlV2kpAlw0aZhHavtCo317/s7J8l
 DVNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3dT/OQqvQnoqLWy539HXNwccw4Y/k6egudY3UVh+RkA=;
 b=5aQRUgVHgkQftSfyE6n2XAwwuwBmQFvan7zJnS81yCebqYtAhUh65gi+EOppTSQ+X5
 bV81/ypbgdwSf+0LXr2PF46rpv5ZE200+6qVjMS6IoRCKBzo5qmlBy7QbuTesPsTKwOe
 fQcmrh/EDntD27Rvnll/g6ec8v3YBSKqSRkm74WNPYNhFx2m4otsXvi0FVdFAQfOLIqT
 OpZIsrq8ESPlvxxZprQ9EpRyGbiK4SAmVTAffnRuO5e+FGftsYSALhFiZoCxQyqRItpt
 HkV/V8WWRM4cXCh87fLbqFtSbbKRw4dj1grfNJXuv/d8U84oZzBHlHnoZQnVvDFTiVp2
 wCFw==
X-Gm-Message-State: AOAM5339msa3XhYT/pr+CPIUTl3eMvGiX2x24NjD0OiwbZXoN2XH3RMt
 pZoGUn18ULMHe76NGgj5d4w=
X-Google-Smtp-Source: ABdhPJyXzEO3NLBOHHWevtqe3WpPlVVsM/QMTiyr9YbTrOrQxyC0Yr7QkiExQrYl6uTmoChkgPip2A==
X-Received: by 2002:a05:600c:3506:b0:389:d567:e9fa with SMTP id
 h6-20020a05600c350600b00389d567e9famr127400wmq.74.1646842908739; 
 Wed, 09 Mar 2022 08:21:48 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 c12-20020a05600c0a4c00b00381141f4967sm3063275wmq.35.2022.03.09.08.21.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 08:21:48 -0800 (PST)
Message-ID: <4eb4bb05-814b-c28c-c2f4-0f5f5582301b@redhat.com>
Date: Wed, 9 Mar 2022 17:21:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: QEMU device refcounting when device creates a container MR
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <CAFEAcA87VaeHzW4qbHn+UKjh9gMQbKNcN5ytXBS1MUPSapdhYw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFEAcA87VaeHzW4qbHn+UKjh9gMQbKNcN5ytXBS1MUPSapdhYw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 3/9/22 11:33, Peter Maydell wrote:
> Hi; does anybody know how device reference counting is supposed
> to work when the device creates a "container" MemoryRegion which
> it then puts some of its own subregions in to?
> 
> As far as I can see when you do memory_region_add_subregion it
> increases the refcount on the owner of the subregion. So if a
> device creates a container MR in its own init or realize method
> and adds sub-MRs that it owns to that container, this increases
> the refcount on the device permanently, and so the device won't
> ever be deinited.

The unparent method is supposed to break reference cycles.

In the case of QOM, unparent calls unrealize, so unrealize should remove 
the subregions it created.

Paolo

