Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 882093B3E65
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 10:22:07 +0200 (CEST)
Received: from localhost ([::1]:33060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwh6E-0007Ov-JV
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 04:22:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lwh5C-0005xJ-Bn
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 04:21:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lwh5A-0002kz-Fs
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 04:21:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624609259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X6cqmGGCZEC/XgbfFSco04+MVzayJt9znMEQ3Qbzz7M=;
 b=e6MMuR/cyMS6+fqcJftLDy1GpC0ZyYrsNNVglnhQo4d7cC/SqQ5cXN0CBDk8ZAJkmgmZvY
 7vJ7i2tOHR0+MvojupyNFF8Pj8vYsF7FS6anMNC8LBTH9J55kifg9zQRjs5Q4PDzIznqoW
 tNG/m8WjYckKm/FWpzCG0Y8YLpHloAo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-GV5qs_toMTWzlLdA0xyRYg-1; Fri, 25 Jun 2021 04:20:56 -0400
X-MC-Unique: GV5qs_toMTWzlLdA0xyRYg-1
Received: by mail-ed1-f70.google.com with SMTP id
 ee28-20020a056402291cb0290394a9a0bfaeso4765909edb.6
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 01:20:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=X6cqmGGCZEC/XgbfFSco04+MVzayJt9znMEQ3Qbzz7M=;
 b=Nmx/WXNBxNno4yphI9Viz/pVT7wmvZpJmBkQdRARM2iJ+h37wYt8DJr1IZOwe4qlEG
 spTG2PHuYi91ZO3Mlow35HdI/zMry6/SOjCf0DpboWgqwqE9dz5+GB0QMzS0fOnPAyX4
 +l6m3XMw5YqPjIXJaZFPUSLUC6EgmZlbvCKLHWjwMBNCnsc1KKlPPTgLP8sDp6zqCCxE
 A278dJgtiFaoC3OoyDveGe42E+TrjuR71tNpRIru6VZ0V0xlEubwXWoeqf8SKWwGuMUN
 NKI0A4rpKxPg81eX4z3OEDlQkxNu85DK5vOZYpwTz/Uno3oqzv5MtQ53XtkUrjimo8Ta
 qEfQ==
X-Gm-Message-State: AOAM531gbGWsqiK1ywbGCAWhIQz/hGfIDPBHmgHcHdPDtT59HMSA/K2n
 VMKvkwueMx0WFUX592qdUBSkRcRhR37vikcWzP9C4TlPIPp7VR4cUsos66KfyCmXVgYnOtj5Mfb
 zZOrON81npJB0xgw=
X-Received: by 2002:a17:907:9841:: with SMTP id
 jj1mr9592688ejc.94.1624609255470; 
 Fri, 25 Jun 2021 01:20:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3C/QB9+taOjtqP5+HfhGqiDbK4VvSCOR6h4Q66InK8i3zuhoGED31EnBC+8dkoOWc4KTmSQ==
X-Received: by 2002:a17:907:9841:: with SMTP id
 jj1mr9592662ejc.94.1624609255205; 
 Fri, 25 Jun 2021 01:20:55 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 n15sm3386618eds.28.2021.06.25.01.20.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jun 2021 01:20:54 -0700 (PDT)
Subject: Re: [PATCH 07/11] block: feature detection for host block support
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210624180423.1322165-1-pbonzini@redhat.com>
 <20210624180423.1322165-8-pbonzini@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <158a968b-1328-41c2-066e-7b7efcc28bc4@redhat.com>
Date: Fri, 25 Jun 2021 10:20:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210624180423.1322165-8-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Joelle van Dyne <j@getutm.app>, qemu-block@nongnu.org, mlevitsk@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.06.21 20:04, Paolo Bonzini wrote:
> From: Joelle van Dyne <j@getutm.app>
>
> On Darwin (iOS), there are no system level APIs for directly accessing
> host block devices. We detect this at configure time.
>
> Signed-off-by: Joelle van Dyne <j@getutm.app>
> Message-Id: <20210315180341.31638-2-j@getutm.app>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   block/file-posix.c   | 33 ++++++++++++++++++++++-----------
>   meson.build          |  6 +++++-
>   qapi/block-core.json | 14 ++++++++++----
>   3 files changed, 37 insertions(+), 16 deletions(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>


