Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA0A323A39
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 11:12:33 +0100 (CET)
Received: from localhost ([::1]:48124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEr9k-0002cP-W9
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 05:12:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEr8e-0002Cl-NA
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 05:11:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEr8Z-0008I0-Si
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 05:11:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614161477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=igppCznv1W52kcu7K+03F6tz7Lyxh2RbpPo9VBd3sqc=;
 b=ALr1dC33S1WpKsLun/4Jh8txePu1LJJYCN01Tiv8yCjv20yXU9smjOeLhTOuKQlkCHEKdh
 /+0uk0got/Nrg7Ua+8V7THAMWYfzXGZZrupkbwp+vXygFsQR4TIQBuo6DlHdCx+6ehE9sC
 gXMG7jbMA/tZTWL1UpF2P1VUBI/SVZE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-YodsPgssNSuyAusD-5ByBQ-1; Wed, 24 Feb 2021 05:11:15 -0500
X-MC-Unique: YodsPgssNSuyAusD-5ByBQ-1
Received: by mail-wr1-f71.google.com with SMTP id g5so807851wrd.22
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 02:11:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=igppCznv1W52kcu7K+03F6tz7Lyxh2RbpPo9VBd3sqc=;
 b=gwDKZxzLCjsOSjPfiHTGe4DCJDvNlJBx9YvcGjUSUizSuxBanu7Hhn8ijKt8V/E6tu
 2WL3fILC9I9l6g+vAQrKPmfMk9Aw9qs2J/q1JILNXOvUdkqnvM6agMneLVkIhpv8Ndtv
 6jyLhgpFAAiPhjyUPydJsk2c6pNomU3LbSGS6vlczGGtqiNn2tGAbXcsPnCx/uDSB/aK
 RWdfogvqkLdHewla5OM9ysCBYpHhqX4Wpos0eYImt78i1p1oesXqgYnm+y5drtZPfmwe
 b2GQvmm24gnX2ymDxpKT0mqA3dK59zBMEyK7sJvKmSEqpaHA4pEBFsugi8OR+6OUqf1T
 iXwA==
X-Gm-Message-State: AOAM530G1sANgYRq5uNSBvaXoh26yZs/v8ENT4Wr2XTPP5CsMqKlHhTM
 9vRigQgX8TsWTmFl6EZcwaubmbnwoPoVY2joHq1S0xgyAX03LM8cw0mZgKqoHEhuEcHhXIEJ+HM
 0cB0dG6Wj8M2o75k=
X-Received: by 2002:a7b:c76a:: with SMTP id x10mr3018190wmk.80.1614161474399; 
 Wed, 24 Feb 2021 02:11:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxpIzcYcGVYKNpExnfwTXbaXLR4Prgs4auqBT/BUKg/n85pwXg5yUZZ618mbrgYbjoTmRiyQw==
X-Received: by 2002:a7b:c76a:: with SMTP id x10mr3018177wmk.80.1614161474227; 
 Wed, 24 Feb 2021 02:11:14 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id d7sm2460381wrm.62.2021.02.24.02.11.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Feb 2021 02:11:13 -0800 (PST)
Subject: Re: [PATCH 1/6] net: introduce qemu_receive_packet()
To: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
References: <20210224055401.492407-1-jasowang@redhat.com>
 <20210224055401.492407-2-jasowang@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9e432ff0-793e-64a7-97f3-ff3a374ee98f@redhat.com>
Date: Wed, 24 Feb 2021 11:11:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210224055401.492407-2-jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: QEMU Security <qemu-security@nongnu.org>, ppandit@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/21 6:53 AM, Jason Wang wrote:
> Some NIC supports loopback mode and this is done by calling
> nc->info->receive() directly which in fact suppresses the effort of
> reentrancy check that is done in qemu_net_queue_send().
> 
> Unfortunately we can use qemu_net_queue_send() here since for loop
> back there's no sender as peer, so this patch introduce a
> qemu_receive_packet() which is used for implementing loopback mode
> for a NIC with this check.

IIUC the guest could trigger an infinite loop and brick the emulated
device model. Likely exhausting the stack, so either SEGV by
corruption or some ENOMEM?

Since this is guest triggerable, shouldn't we contact qemu-security@
list and ask for a CVE for this issue, so distributions can track
the patches to backport in their stable releases? (it seems to be
within the KVM devices boundary).

> 
> NIC that supports loopback mode will be converted to this helper.
> 
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  include/net/net.h   |  5 +++++
>  include/net/queue.h |  8 ++++++++
>  net/net.c           | 38 +++++++++++++++++++++++++++++++-------
>  net/queue.c         | 22 ++++++++++++++++++++++
>  4 files changed, 66 insertions(+), 7 deletions(-)


