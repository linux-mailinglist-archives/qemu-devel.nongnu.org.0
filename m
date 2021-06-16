Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 474DE3A94CE
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 10:13:33 +0200 (CEST)
Received: from localhost ([::1]:42658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltQg0-00006Y-Bl
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 04:13:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1ltQfE-0007s5-80
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 04:12:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1ltQf9-0008BN-LH
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 04:12:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623831157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vnoFGGQw6T4wPJ1ILN+WVuhMcR2gwaxzPF1JMKIhdo0=;
 b=b3U8fHSUQYQnbdLypshnBp8PoCYfJ+fzu+t3QXhHgc3uoj/DJYB1OoV6WfiHW1AZOlMh7F
 oO9zeoVinSo4RHwsdDIE3OD1WstH1Dnf2rX+TKX7mkMZ5G8Ov198dkSsrUjw/7Z6AN6++q
 TR39/zmKaxIXzHHAkn3YfS+5Mj+pEcY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-66-3Z6tY2eEOW-eFyygslL6_w-1; Wed, 16 Jun 2021 04:12:36 -0400
X-MC-Unique: 3Z6tY2eEOW-eFyygslL6_w-1
Received: by mail-ed1-f71.google.com with SMTP id
 v8-20020a0564023488b0290393873961f6so571492edc.17
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 01:12:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=vnoFGGQw6T4wPJ1ILN+WVuhMcR2gwaxzPF1JMKIhdo0=;
 b=NKtn5S94LMqk9w9JsY3x2YLF/pyPZR+swBf6fNE+dqxUm9DEAH7LgYWDEWoI1o+Cnp
 LP8qbPGITJLAwAuFpuOE5PrJ9ygg5hG8oMfVSzdjlAf3ty20QfkL19KvG9b3kxXwZfrX
 ZEipzYB7nU9Ibsis+rcMVFtvsO91Uma+siNiPLgUX6cdGXQf0VXU7Lt7Xhkh5alIszZX
 pkeCSY9aYeS/hD8oDhl86tL13HS4HpopZt+9fKHl5FTx+Q1Nh6C/V/erXrxMkqJrL45t
 zAfVs/H4Nghr5AkQbt0ftes9sN4hhr8BQlLC06+quH0OPx/zQs1OdlasQY/ribHf+Rbr
 ldtA==
X-Gm-Message-State: AOAM530bJZAxVtkCdzz8Lmz7mpam+wcx1IazOymTVcQ04FI3vfbFFdsR
 0o+p9THlC9h+Yl+lyDvG6QHaA1XcL1BIyonYJS4Ed295niqCqfsxHGkhSc6WSEMczGWmDz5dVVb
 qAKwgubyvani2QEs=
X-Received: by 2002:a17:906:3006:: with SMTP id 6mr4139507ejz.73.1623831155205; 
 Wed, 16 Jun 2021 01:12:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPpJqYhx7x6XvTQNdXVEOEtIP2OWBRgzPYnTxXWMbNtSa2mboGb6CcyEJa6xxYsNvWlAZILg==
X-Received: by 2002:a17:906:3006:: with SMTP id 6mr4139486ejz.73.1623831155027; 
 Wed, 16 Jun 2021 01:12:35 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id p5sm1026602ejm.115.2021.06.16.01.12.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 01:12:34 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v8 3/9] i386: hardcode supported eVMCS version to '1'
In-Reply-To: <20210608125207.xxhvuh7ktxspo3bj@habkost.net>
References: <20210608120817.1325125-1-vkuznets@redhat.com>
 <20210608120817.1325125-4-vkuznets@redhat.com>
 <20210608125207.xxhvuh7ktxspo3bj@habkost.net>
Date: Wed, 16 Jun 2021 10:12:33 +0200
Message-ID: <87tuly449a.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eduardo Habkost <ehabkost@redhat.com> writes:

> On Tue, Jun 08, 2021 at 02:08:11PM +0200, Vitaly Kuznetsov wrote:
>> Currently, the only eVMCS version, supported by KVM (and described in TLFS)
>> is '1'. When Enlightened VMCS feature is enabled, QEMU takes the supported
>> eVMCS version range (from KVM_CAP_HYPERV_ENLIGHTENED_VMCS enablement) and
>> puts it to guest visible CPUIDs. When (and if) eVMCS ver.2 appears a
>> problem on migration is expected: it doesn't seem to be possible to migrate
>> from a host supporting eVMCS ver.2 to a host, which only support eVMCS
>> ver.1.
>
> Should we rewrite this as "it wouldn't be possible to migrate",
> as this patch fixes the problem and makes it possible?

Yes, no problem with such amendment. Currently, there's no issue as
EVMCSv2 just doesn't exist. We, however, expect it to appear some time
in the future and this change allows us to re-use
KVM_CAP_HYPERV_ENLIGHTENED_VMCS in KVM without (potentially) breaking
migrations. Note: the migration will only be broken when we migrate to
KVM/QEMU which does not support EVMCSv2 *and* when the guest is already
using it. As we expose the range of supported versions, it is possible
that guests (esp. older Hyper-V versions) will stick to 'v1' even when
'v2' is supported.

>
>> 
>> Hardcode eVMCS ver.1 as the result of 'hv-evmcs' enablement for now. Newer
>> eVMCS versions will have to have their own enablement options (e.g.
>> 'hv-evmcs=2').
>> 
>> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
>
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

Thanks! Please let me know if expect v9 with amended commit message or
if you're able to alter it upon commit.

-- 
Vitaly


