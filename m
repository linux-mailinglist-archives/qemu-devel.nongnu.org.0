Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DC83EA9CD
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 19:52:52 +0200 (CEST)
Received: from localhost ([::1]:49064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEEst-0007OX-HG
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 13:52:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mEErb-00061o-8R
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 13:51:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mEErZ-0002c4-Rq
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 13:51:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628790689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WFrePFS7A1S/a2WExrvFsjRcz1evRXBfKDI3FC2ZynA=;
 b=BQxZoO0F5zUVlHI2J418Zu7GQlcbPiNIeYucm0X2MdOS5o+12TrC+tp1oSJ2GGjx4/YaEU
 ep3lV8mDh5MFqAPuM2ZwTNB/s8SfxnhsEJe1Bij2PckHQ/dl09NlXwHbt1ihcrydoBrwvO
 aUtBgdEaOY8E51d75qTVatr7Z9R84g0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-V4IJFOTEPJ26nR0zqvyIaQ-1; Thu, 12 Aug 2021 13:51:28 -0400
X-MC-Unique: V4IJFOTEPJ26nR0zqvyIaQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 l18-20020a0564021252b02903be7bdd65ccso3438658edw.12
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 10:51:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WFrePFS7A1S/a2WExrvFsjRcz1evRXBfKDI3FC2ZynA=;
 b=RfslLLnax83txKp3WzAsPn7rKo7RBtvE405ueiUILFeh7O4iZdN4X03D2Kh5/NcZzG
 yio/gWmgMloh5tl+NJN/mNQWz4UU+9g6BGpi+Zcnz83ypkK+9W2Trx7iOy22ETYQH7xo
 Fdr+cFRLxdiUNEOqGbzQSwwBmJ1v6HpWkd2rGkrhrVBK+wr0mqXlhm6CmFbRVrhqCwXt
 PV4D7HaiLMCUhc1Rxgyv6syg+NawGyYJ1ZOX8AmwGVRLmrcOBPGDgok2YoBVISSyE9i4
 nmmlX10xfM5BEJ3LUzC+6zQCOIoIxFVkmfXgLL8ep9LAQ9YOoqEpyK1mrMyPYDHJICG1
 O2Ug==
X-Gm-Message-State: AOAM530UFMh0TYI72qGNOlQvRUTocTktWJhLDKGNWZxxIHIhXTqOGoDZ
 2KmS/qrfgAgLI/bjWFVi5dKNB4b5Vhym5yN+vpaBEhWLg71xFYrncfsFI/+KDfOoQX0Up70cuqg
 EWvxaweLjZCsnwZsaizeJMx2VTqU5QUgrjaBVoL/3LoyR2afy4qPdsnbdgxHokEC5n7Y=
X-Received: by 2002:a17:907:2097:: with SMTP id
 pv23mr4729523ejb.262.1628790686657; 
 Thu, 12 Aug 2021 10:51:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzslTkOqfHAXzfkzzZ/DvbT0KAkFhgm90wyER++zberd01q0h45otTcVmxcSXj0VadFIedzFg==
X-Received: by 2002:a17:907:2097:: with SMTP id
 pv23mr4729506ejb.262.1628790686400; 
 Thu, 12 Aug 2021 10:51:26 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id e22sm1477960edu.35.2021.08.12.10.51.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Aug 2021 10:51:25 -0700 (PDT)
Subject: Re: [PATCH] configure: Remove spurious [] from tr
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210812110942.19065-1-dgilbert@redhat.com>
 <CAFEAcA9dp-kM_cB9g=7kpeCbFVxiwoQ14L+mymc_pHwZ_1UDnA@mail.gmail.com>
 <YRUcoAiKWtxfPVqB@work-vm>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3712b78c-063d-803c-004f-ed7544ee0d19@redhat.com>
Date: Thu, 12 Aug 2021 19:51:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRUcoAiKWtxfPVqB@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Eric Blake <eblake@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/08/21 15:05, Dr. David Alan Gilbert wrote:
> In configure line 4464:
> if !(GIT="$git" "$source_path/scripts/git-submodule.sh" "$git_submodules_action" "$git_submodules"); then
>      ^-- SC1035: You are missing a required space after the !.
> 
> which hmm I've not quite got my head around yet; but maybe that one is
> real.

Trying

! (echo abc); echo $?
!(echo abc); echo $?

both work in bash, but the latter fails with zsh:

abc
1
ff:2: no matches found: !(echo abc)

Paolo


