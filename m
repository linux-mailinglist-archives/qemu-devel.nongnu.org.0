Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C86373839
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 11:57:26 +0200 (CEST)
Received: from localhost ([::1]:57336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leEHV-0007g6-F8
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 05:57:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1leEFr-0006A3-KA
 for qemu-devel@nongnu.org; Wed, 05 May 2021 05:55:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1leEFn-0007zy-Lj
 for qemu-devel@nongnu.org; Wed, 05 May 2021 05:55:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620208538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zTRm3A2j+Hh08YzQvD7iNn69mkgSgdWEjDZOqr5sEo0=;
 b=Nvvx70bGdgnVqsE7YLHwBb+Vb5674Z8NVFnEI+IeVbktcQDC7rmGcRiKhKod/shKshRcau
 d9ryJemNXsFELZKqOnDlLq4y7idvH0TbDXhjygw05hf+wA8Lm6ce6zOHoe8NYiASxG7ayM
 of9MTQaPYGQlZR0XMSQmeZX1uGYZV2U=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-gEqd67ycOdSnvW_AsQ4o7Q-1; Wed, 05 May 2021 05:55:34 -0400
X-MC-Unique: gEqd67ycOdSnvW_AsQ4o7Q-1
Received: by mail-ed1-f69.google.com with SMTP id
 g7-20020aa7c5870000b02903888f809d62so567380edq.23
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 02:55:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=zTRm3A2j+Hh08YzQvD7iNn69mkgSgdWEjDZOqr5sEo0=;
 b=mz+DqsPJu81unzHMqJ5wiunYBHrGUwbMwhkzNXdCUbMmzw6fyh9XAjjfa/fHiRVzPg
 U2G6A80BdZuIKthl2Q7kNxpyIfSC003vjo8Oglp+DoH16LWA7MrlMpwmTrxT7coPN2ZM
 IvUaZAKfcZ9AoqlpltsOL3Z2oWYaDe2GQ3lCSWCyqQVV6UqxFwqatdC6Ru6aLIEBTmMZ
 P7G8fI18t1BJH7l3/UyehRE5p6Niq7+xShOotfLShwvHdMovOkcdvESI/XMmbIarP8as
 lIB1Fps8I4eex31oWl8cBhlqIAMpaES54U2A5SNH8Ez3Nskv0hNI3M78pyC1Nl5xDCO1
 Fo+Q==
X-Gm-Message-State: AOAM533ueaQsBqNga/HupD1/ep7hQQCMWeU2fIN8kxGCEBT+PNFZG4wn
 hq98e4vsUovzOYBiOjCQditdvLeq12CxXokKHvlUOxES3gflXxT9xvBVIMPitijXyF/kZd4sNVV
 F9VjSKhPZH/KkO4g=
X-Received: by 2002:a17:906:17ca:: with SMTP id
 u10mr25733664eje.124.1620208533405; 
 Wed, 05 May 2021 02:55:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZae7Jz52hjvgO3gY3cxeLtcFa+YG10elymqBOFR2cn58vIiEyqUIPjgG1YaG4S0yF7YAy8w==
X-Received: by 2002:a17:906:17ca:: with SMTP id
 u10mr25733647eje.124.1620208533215; 
 Wed, 05 May 2021 02:55:33 -0700 (PDT)
Received: from steredhat (host-79-18-148-79.retail.telecomitalia.it.
 [79.18.148.79])
 by smtp.gmail.com with ESMTPSA id j7sm15713742edv.40.2021.05.05.02.55.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 02:55:32 -0700 (PDT)
Date: Wed, 5 May 2021 11:55:30 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: Switching to the GitLab bug tracker
Message-ID: <20210505095530.lvpuyunqzv422app@steredhat>
References: <a6d77040-1dba-90c7-5ebe-5778177e686e@redhat.com>
 <YJEJNBJOqry5sHiy@stefanha-x1.localdomain>
 <2953611e-8780-f2a8-6394-0a5099042eb1@redhat.com>
MIME-Version: 1.0
In-Reply-To: <2953611e-8780-f2a8-6394-0a5099042eb1@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 qemu-discuss <qemu-discuss@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 04, 2021 at 12:20:03PM +0200, Philippe Mathieu-Daudé wrote:
>On 5/4/21 10:43 AM, Stefan Hajnoczi wrote:
>> On Mon, May 03, 2021 at 01:16:51PM +0200, Thomas Huth wrote:
>>> As you might have already noticed by some other mails on the qemu-devel
>>> mailing list, we are in progress of switching our bug tracking tool from
>>> Launchpad to Gitlab. The new tracker can now be found here:
>>>
>>>  https://gitlab.com/qemu-project/qemu/-/issues
>>
>> Thank you for doing this, Thomas!
>>
>>> 1) We likely won't have the possibility anymore to automatically send e-mail
>>> notifications for new bugs to the qemu-devel mailing list. If you want to
>>> get informed about new bugs, please use the notification mechanism from
>>> Gitlab instead. That means, log into your gitlab account, browse to
>>>
>>>  https://gitlab.com/qemu-project/qemu
>>>
>>> and click on the bell icon at the top of the page to manage your
>>> notifications, e.g. enable notifications for "New issues" there.
>>
>> All maintainers and most regular contributors should follow the issue
>> tracker so that QEMU developers are aware of new issues. Please do this!
>>
>> An alternative mechanism is the RSS/Atom feed available by clicking the
>> "Subscribe to RSS feed" button left of the "New issue" button here:
>>
>>   https://gitlab.com/qemu-project/qemu/-/issues
>
>You can also subscribe to labels of interest [*] going to
>https://gitlab.com/qemu-project/qemu/-/labels
>
>For example in my case I subscribed to receive notifications
>only from these labels:
>
>- kind:Bug
>- Storage
>- pflash
>- Fuzzer
>- workflow:Merged

Cool feature, I also subscribed to some labels.

I was trying to assign a label, for example "Storage" to this issue:
https://gitlab.com/qemu-project/qemu/-/issues/96

but I can't, should I have some special permission/role?

Thanks,
Stefano


