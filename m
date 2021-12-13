Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C86A247218E
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 08:16:35 +0100 (CET)
Received: from localhost ([::1]:37628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwfZa-0005q7-En
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 02:16:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mwfYI-00054d-Bx
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 02:15:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mwfYF-0006yu-4Q
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 02:15:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639379709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uucjfux0J0sacdGZyoje/nN1vPxvgsWVu9bIt5aDl9A=;
 b=W1ku0WffQERs3hIziz9we9yiGMAr2a6vNFDrRl2hpc3ERnMLzumSGCUhZ4Oo6QAFE7uh5U
 TJU9TxHd5rQViCYFVgCA0dDfukCMT0n3yGbAJNu+Y1T83NOcLrNnrqSdGQeFAIUrAO/MRv
 KVSnxExFgbYb18a3t3l9UXkhzkmpSBs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-122-Kk4lm7qONHaonYnY9gWveQ-1; Mon, 13 Dec 2021 02:15:05 -0500
X-MC-Unique: Kk4lm7qONHaonYnY9gWveQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 k8-20020a5d5248000000b001763e7c9ce5so3551427wrc.22
 for <qemu-devel@nongnu.org>; Sun, 12 Dec 2021 23:15:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uucjfux0J0sacdGZyoje/nN1vPxvgsWVu9bIt5aDl9A=;
 b=7SJ69kkGAFrkgupgHPBVSVnHuxlBsiZAhS6swqEOf5Y/icEL/itHC+B+QXjJq7ixb9
 6fAZwOnf4o86K9k+VwfNRD9FvCosXiCxr7n9dH3kkvGRRuWHsLdmg1rhl+On4tElQJgK
 y8vs6Td9e2Ji3UQHSfD+xR9JacTDbt3dSFueWgqG+W0oZ1r8XF8V36R4O/j3PYhXj52G
 8BBEuBc+lZ2mTQOlnRFP8PF5uUgJlGSS3ylg/WPqJJHtCQ5t3iEEQMNWUMJ4MA6g8Wp3
 SWGVHsCeGB3IA2qjOuSTMIA0TfngWvRoBd011u1sSCoNTXRJmiNbzU0YCOKCUWecFyA/
 oQKQ==
X-Gm-Message-State: AOAM530pSYJiEDFtc0rQFaqMlDy7MsBjXiX5Anyji86/HfFB8KlhywKt
 ugcNbjGaxbrlNtPNmeofzsI42GwoLv/5UAdKPQlCrIvzZcIL4QiG2bqaPqvfO/uxG6OcyC7R9Dq
 0veMYK4yIbJ2ka1k=
X-Received: by 2002:a05:6000:1544:: with SMTP id
 4mr30019540wry.358.1639379703981; 
 Sun, 12 Dec 2021 23:15:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyE7kqwmwfdSudZl5h87LRl66nZLRvVS+FrRn+LBeNBJGiNhaMq/SrRSQ/ejiZED6eERQR93A==
X-Received: by 2002:a05:6000:1544:: with SMTP id
 4mr30019522wry.358.1639379703806; 
 Sun, 12 Dec 2021 23:15:03 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id n7sm10398994wro.68.2021.12.12.23.15.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 23:15:03 -0800 (PST)
Message-ID: <6eb8cf35-21dc-9275-fa9f-dabcfd2d99e5@redhat.com>
Date: Mon, 13 Dec 2021 08:15:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2] Move the libssh setup from configure to meson.build
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>
References: <20211209144801.148388-1-thuth@redhat.com>
 <20211209145501.GK1127@redhat.com>
 <b59169e2-409a-75e0-339c-4021499d7131@redhat.com>
 <20211209152230.GL1127@redhat.com>
 <9e55f8f5-1588-367d-3681-54c77d77700f@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <9e55f8f5-1588-367d-3681-54c77d77700f@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.713,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.093, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/2021 14.05, Philippe Mathieu-Daudé wrote:
> On 12/9/21 16:22, Richard W.M. Jones wrote:
>> On Thu, Dec 09, 2021 at 04:08:24PM +0100, Thomas Huth wrote:
>>> On 09/12/2021 15.55, Richard W.M. Jones wrote:
>>>> On Thu, Dec 09, 2021 at 03:48:01PM +0100, Thomas Huth wrote:
>>>>> It's easier to do this in meson.build now.
>>>>>
>>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>>> ---
>>>>>   v2: Added the missing "config_host_data.set('CONFIG_LIBSSH', libssh.found())"
>>>>>
>>>>>   configure                     | 27 ---------------------------
>>>>>   meson.build                   | 13 +++++++++----
>>>>>   meson_options.txt             |  2 ++
>>>>>   scripts/meson-buildoptions.sh |  3 +++
>>>>>   4 files changed, 14 insertions(+), 31 deletions(-)
> 
>>>> I should say that my interest in the ssh driver in qemu is not that
>>>> much these days.  I've been telling people to use nbdkit-ssh-plugin
>>>> instead.  It's more featureful and running it in a separate process is
>>>> probably safer too.
>>>
>>> Then it's maybe time to deprecate the ssh driver in QEMU?
>>
>> Weeeellllll ...  I didn't necessarily want to say that.  Others may be
>> using it, and deprecating working software causes trouble for some.
>> But I'll let others have their say on this.
> 
> The deprecation process is slow, users have 8 months to notice it,
> and we might discover contributors willing to maintain it. IOW more
> PROs than CONs IMHO.

Right - one of the ideas of the deprecation process is that this is a way to 
find out if a feature is still used in practice, and whether someone still 
cares about it being maintained. So if you think that there is a better 
alternative these days and don't want to maintain the feature forever 
anymore, just send a patch to docs/about/deprecated.rst to mark it as 
deprecated there (and the status in MAINTAINERS should maybe rather be "Odd 
Fixes" than "Supported", I guess?).

  Thomas


