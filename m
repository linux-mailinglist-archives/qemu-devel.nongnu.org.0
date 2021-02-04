Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E0630FB73
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 19:32:29 +0100 (CET)
Received: from localhost ([::1]:38142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7jQa-0007Mf-5z
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 13:32:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7ied-0006v2-86
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:42:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7ieb-0007Ni-FX
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:42:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612460570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ymY6gtpmt5rR2xzrdY59UgjTHm5tOYd33wQ5u0YMlAM=;
 b=UOkAwBtTlVPR3ig5ZkF4n87Rnj0YMbXe31YntFeymS2QyBXTUoS4YWVyXIPfsE2sqjnndV
 Q0As6vV+aEGGt8jMHI6nr2od5dlJMYZl4iiWtgQPE4V69cVCr9iBdoYqwFx1aCS4XW89dB
 pdLyTvDnpg1Avt54bt4SAGRVqnM4JVk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-xp7MXNlGO8aLkiflAfPAYg-1; Thu, 04 Feb 2021 12:42:49 -0500
X-MC-Unique: xp7MXNlGO8aLkiflAfPAYg-1
Received: by mail-ej1-f71.google.com with SMTP id jg11so3191127ejc.23
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 09:42:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ymY6gtpmt5rR2xzrdY59UgjTHm5tOYd33wQ5u0YMlAM=;
 b=pL1O3W7TqigkoxLS1e6pi+K/wMv1aXsrkD4ObLRTDXLqiy5LglPWvF4GtZYZHJlO2r
 UMbwDhieAkclY1QKYNXUPzWPFMt6szbLCA4xSl17bWYtArUG05mKU+abfVUp33Bu/eDo
 k0YA0N4YhIksGAJo/9/itz4lIgs2TesQp9oWFeJyArb5J5x14vC9FxKG0OvEKgw8RP/i
 8cZORwFpvDh6sUimfKd3+845Q55gV2zTweZ4AhgXXZ5E+HjcSlnNEGPwIyIMvnOzheB/
 54PYvy/cEymLl5t/avNfJRlFg0vaZk90DbO9SmtiL+7fM2DA4HAE+0oKuZ3seNwkB+vc
 uEEA==
X-Gm-Message-State: AOAM532H/KIXWLyOrw3Bi/QQlY+nihUWarwQ5cR2nLH7oXGaPo5CR+YW
 plx2i/M5usNLNCBOmom03Uzv6kbXlIcx2+zT58pL+1GmQR/+qLIqZoFGWypiye2nVP0nAEalPtb
 tLMyEjVIKYlwfqBk=
X-Received: by 2002:a05:6402:304e:: with SMTP id
 bu14mr127186edb.60.1612460568042; 
 Thu, 04 Feb 2021 09:42:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzuMoPPvDTymC0uIVtPyCoPLIvOEb4B5PubbV842X6UtZXHpZ1Qp6bpn+9j0fltO6LObxHT7g==
X-Received: by 2002:a05:6402:304e:: with SMTP id
 bu14mr127164edb.60.1612460567836; 
 Thu, 04 Feb 2021 09:42:47 -0800 (PST)
Received: from [192.168.1.36] (107.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.107])
 by smtp.gmail.com with ESMTPSA id f11sm2736391eje.114.2021.02.04.09.42.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 09:42:47 -0800 (PST)
Subject: Re: [RFC] Move tools sources to the tools directory (was Re: [PATCH
 v2] MAINTAINERS: Fix the location of tools manuals)
To: Paolo Bonzini <pbonzini@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org
References: <20210204135425.1380280-1-wainersm@redhat.com>
 <516694bd-42fe-7929-811b-545f257c58bf@redhat.com>
 <0e0f9745-fe21-0bc6-2d02-431d67a6b57e@redhat.com>
 <affe4e6c-8f3e-1ec2-5a6f-6da31a2ced98@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <573fa4c4-6092-09ac-be49-0cc18af72a1a@redhat.com>
Date: Thu, 4 Feb 2021 18:42:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <affe4e6c-8f3e-1ec2-5a6f-6da31a2ced98@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.182, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Greg Kurz <groug@kaod.org>, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/21 3:40 PM, Paolo Bonzini wrote:
> On 04/02/21 15:22, Wainer dos Santos Moschetta wrote:
>>>> -F: docs/interop/virtfs-proxy-helper.rst
>>>> +F: docs/tools/virtfs-proxy-helper.rst
>>>
>>> Unrelated, but Paolo once said helpers are not tools.
> 
> I think helpers is not a good word.  However, if an executable:
> 
> - can be started directly by QEMU, or is not useful without an emulator
> 
> - is usually too complex for a user to run manually
> 
> then it should be documented in docs/interop (not docs/tools).  Their
> sources however can be in tools/, that's not a problem at all.

I understand tools can be built/used standalone (no dependence),
while helpers are companion of another binary, thus dependent on it:

- we can build tools without emulator
- it is probably pointless to build an helper without its helpee
- some binaries can't be use without helpers

Maybe "companion" is a better candidate to describe?


