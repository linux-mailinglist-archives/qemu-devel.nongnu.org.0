Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD4B372920
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 12:39:15 +0200 (CEST)
Received: from localhost ([::1]:51658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldsSR-0002eh-3T
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 06:39:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lds9z-0006yo-5h
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:20:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lds9w-0004BH-6w
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:20:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620123607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0gHwAACULLNDf7+9T/JkN0gZn3ETdLrecqMeDe4XYMw=;
 b=fx3Z7HC5zrvbDCNTcNxP7fsHFQWlWq8aZHrYS4F8tiHz8y7oiqM+TqGaxGbIIM3w4RP/R/
 gddOJ9aBC94tnXJW1BDd1SlLrivSd95T+FdrMUmUd5f3gA8fBnGl7vPVbJPs8d01Bd0B/Q
 6YKItuW34UxI6mEouvzHqbMaqEJj2iw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-tS_0b6gnPx-bt9Jgo6rmBw-1; Tue, 04 May 2021 06:20:05 -0400
X-MC-Unique: tS_0b6gnPx-bt9Jgo6rmBw-1
Received: by mail-wm1-f72.google.com with SMTP id
 o126-20020a1c28840000b0290149b8f27c99so701507wmo.2
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 03:20:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0gHwAACULLNDf7+9T/JkN0gZn3ETdLrecqMeDe4XYMw=;
 b=hk3izWMzbCJzFexY9ctBtcxPBlWoVpYv4ozts7HCUgmQ0o4a1kAg98/5Rzr78ylDUf
 4flm+6ghn1FWRtbCfoJdf//ezDBSoSbDAtMBNmpvjJXW/iYHdXzOMnc8DMFN+iurEfMn
 6FkYlzk04rIWaOWnJOyApTdRqgWb4p+SPaE+Ct0u7KGx2SIlPHeDdENBndM4BSlZTOtW
 q+U0dHsDvCT7WUbWaJ3cAFU3Brm/G6PCzWB4hnqo4LUNEkIsLoLFxYRkb+WsLpSYo7JA
 jrCXKEm64YobKYCzec4x60aYDihAEWCtqDOD85jpcsVm7AJinMoXcR527DXTz+9GytEH
 wLVw==
X-Gm-Message-State: AOAM533wGgKVzJO7mFQGPs+OnLkYau0/0XI0ogUrhgaXTgDQI4LrFZHb
 bComP8xgo0/h5q0xgiCdtZGTKosTRfFie6i/Mo01dY/auMyBSMRMzLPxAe8DlX6IQWOg3pO7jZo
 PfIHf5jhJsuw2cPE=
X-Received: by 2002:adf:e846:: with SMTP id d6mr31125411wrn.356.1620123604711; 
 Tue, 04 May 2021 03:20:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3sSVziBcB09kiEQ/9j5+DaLUlYaDIWdyedzv9mwe9zEiW9dGg1USqmIBTLFySguCxOVe0rw==
X-Received: by 2002:adf:e846:: with SMTP id d6mr31125396wrn.356.1620123604593; 
 Tue, 04 May 2021 03:20:04 -0700 (PDT)
Received: from [192.168.1.19]
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id i3sm17290690wrb.46.2021.05.04.03.20.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 May 2021 03:20:04 -0700 (PDT)
Subject: Re: Switching to the GitLab bug tracker
To: Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <a6d77040-1dba-90c7-5ebe-5778177e686e@redhat.com>
 <YJEJNBJOqry5sHiy@stefanha-x1.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2953611e-8780-f2a8-6394-0a5099042eb1@redhat.com>
Date: Tue, 4 May 2021 12:20:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YJEJNBJOqry5sHiy@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 qemu-discuss <qemu-discuss@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/4/21 10:43 AM, Stefan Hajnoczi wrote:
> On Mon, May 03, 2021 at 01:16:51PM +0200, Thomas Huth wrote:
>> As you might have already noticed by some other mails on the qemu-devel
>> mailing list, we are in progress of switching our bug tracking tool from
>> Launchpad to Gitlab. The new tracker can now be found here:
>>
>>  https://gitlab.com/qemu-project/qemu/-/issues
> 
> Thank you for doing this, Thomas!
> 
>> 1) We likely won't have the possibility anymore to automatically send e-mail
>> notifications for new bugs to the qemu-devel mailing list. If you want to
>> get informed about new bugs, please use the notification mechanism from
>> Gitlab instead. That means, log into your gitlab account, browse to
>>
>>  https://gitlab.com/qemu-project/qemu
>>
>> and click on the bell icon at the top of the page to manage your
>> notifications, e.g. enable notifications for "New issues" there.
> 
> All maintainers and most regular contributors should follow the issue
> tracker so that QEMU developers are aware of new issues. Please do this!
> 
> An alternative mechanism is the RSS/Atom feed available by clicking the
> "Subscribe to RSS feed" button left of the "New issue" button here:
> 
>   https://gitlab.com/qemu-project/qemu/-/issues

You can also subscribe to labels of interest [*] going to
https://gitlab.com/qemu-project/qemu/-/labels

For example in my case I subscribed to receive notifications
only from these labels:

- kind:Bug
- Storage
- pflash
- Fuzzer
- workflow:Merged

What I miss is getting notified when new labels are created...

Regards,

Phil.

[*]
https://docs.gitlab.com/ee/user/project/labels.html#subscribing-to-labels


