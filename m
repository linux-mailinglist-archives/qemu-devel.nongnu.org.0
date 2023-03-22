Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8233B6C4606
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 10:17:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peuZF-0005OX-8T; Wed, 22 Mar 2023 05:15:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1peuZC-0005Nt-H2
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 05:15:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1peuZA-0008Gu-1b
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 05:15:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679476531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qe8FkMS8IIr8Fiv/IjW0H6pjAEHKsTte6fxyaSmjxKM=;
 b=RymRG0nh/fv4KWGJCZlpxyJ4eb9Iiw5OSNLbyarb2Xpom/AwpKcHh34STwBju0AqGKSfjj
 nPh5ZbLWFN4eMo2OQxb87MaCcCvGK4cg1HkDBBJU+9pDl3W/53pNETK5ZeN6mCuLw7+GGK
 fomTy1DktlU0bSo5pySXnHPbyO+cVFc=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-c1Vf4YFKP1-4PUMyFJAukw-1; Wed, 22 Mar 2023 05:15:29 -0400
X-MC-Unique: c1Vf4YFKP1-4PUMyFJAukw-1
Received: by mail-qt1-f198.google.com with SMTP id
 ga17-20020a05622a591100b003bfdf586476so10535387qtb.7
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 02:15:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679476529;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qe8FkMS8IIr8Fiv/IjW0H6pjAEHKsTte6fxyaSmjxKM=;
 b=QIAU0acj4YdmINCjXItxv9Zi/HVnKAt53k2rukClP6sH9dJ+yMAAsOGKTgL2vatoES
 LobWhwNKmBRwA3p8/4wk9B6rBlzI7thgo3bUSamLWG236wn7JkBHcppXZfcNUFaNFiqD
 eeuGXGxCzIJmsdFL8OL1psMn7dyIqF8x3nt6oeAFox7CcXKmQVVhpHXJ046868BcpoHB
 8BSGy4ed2wP4r6lO8xDzZwX6Jpak1Gn7uy8PErQmJm15ATbP+lU99Tz49yibsUQuYHkd
 oPRl6IEY8BPzlmj3wzA+v6jkxhQVRrZTgVGP/x+V1/3B5E+JsdLMF0PDMMLyuxd7hFGP
 e0oQ==
X-Gm-Message-State: AO0yUKXtfHIzQmVz4nI0spM1G9kz3E1189gisJHcMqf+5OwKtAdJpv1r
 4S/Dl6hlx4Zo0n72zWQwDeprd0ATbbpwtjzR8ImO1WIWUw14H5PYrK4pIjEcZhuHSisM+v9F7qs
 IHDxfFEZQ4EP2BU0=
X-Received: by 2002:a05:622a:1c9:b0:3bf:ce27:e1fc with SMTP id
 t9-20020a05622a01c900b003bfce27e1fcmr4873119qtw.7.1679476529434; 
 Wed, 22 Mar 2023 02:15:29 -0700 (PDT)
X-Google-Smtp-Source: AK7set/V41fRWIiqFSf00+OBHnEDhECGnGi5PaXnKOmB3xl9R62WpAJH/FBPdL9MP52wyeJV3f4/vQ==
X-Received: by 2002:a05:622a:1c9:b0:3bf:ce27:e1fc with SMTP id
 t9-20020a05622a01c900b003bfce27e1fcmr4873090qtw.7.1679476529152; 
 Wed, 22 Mar 2023 02:15:29 -0700 (PDT)
Received: from [192.168.8.106] (tmo-102-206.customers.d1-online.com.
 [80.187.102.206]) by smtp.gmail.com with ESMTPSA id
 b5-20020ac84f05000000b003b82a07c4d6sm9775463qte.84.2023.03.22.02.15.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Mar 2023 02:15:28 -0700 (PDT)
Message-ID: <6317fd2d-2d46-5d58-7b3e-f8046f807e46@redhat.com>
Date: Wed, 22 Mar 2023 10:15:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers
 <qemu-devel@nongnu.org>, qemu-stable <qemu-stable@nongnu.org>
Cc: Michael Roth <michael.roth@amd.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <4e79a438-778b-877d-d3dc-ad05cbab88cc@msgid.tls.msk.ru>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: qemu 7.2 stable release, 2nd try
In-Reply-To: <4e79a438-778b-877d-d3dc-ad05cbab88cc@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 22/03/2023 09.16, Michael Tokarev wrote:
> Hi!
> 
> After posting an RFC (due to me doing a stable release for the first time) and
> getting exactly 0 replies/comments, I'm a bit worried, - does this mean there's
> no interest in getting 7.2-stable out of the doors at all? :)

First, thank you very much for tackling this!

... but yes, IIRC there was always not that much response to the stable 
patch series that Michael Roth posted to the list in the past, so it seems 
most developers do not really look at this :-(

> With 8.0 approaching rapidly, and with no other comments or new patches for
> -stable, let's make this official within a week from now, on Mar-29.
> 
> It *feels* like quite some more changes should be picked too, but let's do
> *something* after all :)

I agree, picking at least some patches is better than nothing!

> I still need some minor help with the final step, - pushing to main qemu git
> repo and running the whole testsuite before the actual release.  Asking for
> push/commit access for that.

I suggest asking the Owners/Maintainers of the project directly is maybe the 
best idea (see https://gitlab.com/qemu-project/qemu/-/project_members).

  Thomas


