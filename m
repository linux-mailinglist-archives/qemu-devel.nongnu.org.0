Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3418373879
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 12:18:16 +0200 (CEST)
Received: from localhost ([::1]:60948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leEbf-000697-PW
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 06:18:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1leEZg-0004mJ-To
 for qemu-devel@nongnu.org; Wed, 05 May 2021 06:16:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1leEZe-0003K3-7s
 for qemu-devel@nongnu.org; Wed, 05 May 2021 06:16:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620209769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iYYZT1nvTi6ov4Y3c+Ru9Q4fli8vaFAEvUR/2rSYRBQ=;
 b=e5m9f5g8RzLOFcF2P6ERtC2ixfdcGx6smijbx+PPfn6XiYLtgcbm3u1xKolS7Ar+yRCw4V
 UHS2RdCw69cksSGGP2FbOQ6dY0bP7KTLbDtgWdC7xMSyazqD50FWVxrMcf4+svdtBHmGsv
 0IYMK4MRFitjTR//hBUhE0nnLHH3vbw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-CiWFd8c4MLq-TmGbccu8QQ-1; Wed, 05 May 2021 06:16:08 -0400
X-MC-Unique: CiWFd8c4MLq-TmGbccu8QQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 k9-20020a17090646c9b029039d323bd239so268788ejs.16
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 03:16:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=iYYZT1nvTi6ov4Y3c+Ru9Q4fli8vaFAEvUR/2rSYRBQ=;
 b=CzBhjoOSfgoPy/F+LwR1oPJex82iLt9eOTGK5r8WeaEoe/yN8mLRaQ/3hltRU/fmot
 +pJ2goy8IUKQ0yIZTSERo8rE66TuOb/MdmXttUvgAqzUqtQLWWu5p6wzmfxxJ+PPl4rv
 /SYKy9KFPRmVubJ90QwPhEOnTdYyFDhYca4y++3IVfMqNdn91ErkMbZHGCmV2AH51zNe
 WyvKOoYjtJ1/J6HzXHiOErl3H7AgwGnl1unnJFZxziDId+dEdb9Mxfq7BNXRTjCMH1so
 lq35fSHqdOYPP02iM6yGhdtIphQMvS3zksTr40Nk7uIaXxecnxRVBvzFO9cIJwHUf7nI
 wpMA==
X-Gm-Message-State: AOAM5328p4c9DfNACPDvzJI0WVHdMCLBPbkKpGYNxPbqvGztmb1DxG3F
 hJP59aosSiEF5d1S67Cm010uFs4WFEgsmLrry8iD+IsLpquflIphzNQRqfqlAuHaJONvr+jLS+j
 hMR+p0gQg6UrSshQ=
X-Received: by 2002:a50:e809:: with SMTP id e9mr31732076edn.316.1620209766876; 
 Wed, 05 May 2021 03:16:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdaaCMEDeB2E4WGMJHws7LBotg58ED4N6tIiNGa+9pAe4//Bg9Hfxtkm7H1GVCQlrjgwlkeQ==
X-Received: by 2002:a50:e809:: with SMTP id e9mr31732038edn.316.1620209766629; 
 Wed, 05 May 2021 03:16:06 -0700 (PDT)
Received: from steredhat (host-79-18-148-79.retail.telecomitalia.it.
 [79.18.148.79])
 by smtp.gmail.com with ESMTPSA id k5sm17610530edk.46.2021.05.05.03.16.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 03:16:06 -0700 (PDT)
Date: Wed, 5 May 2021 12:16:04 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Thomas Huth <thuth@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: Switching to the GitLab bug tracker
Message-ID: <20210505101604.cv6n3gpodm3hd4ax@steredhat>
References: <a6d77040-1dba-90c7-5ebe-5778177e686e@redhat.com>
 <YJEJNBJOqry5sHiy@stefanha-x1.localdomain>
 <2953611e-8780-f2a8-6394-0a5099042eb1@redhat.com>
 <20210505095530.lvpuyunqzv422app@steredhat>
 <f7d8205b-ad22-877f-78ad-486beb56d4fc@redhat.com>
MIME-Version: 1.0
In-Reply-To: <f7d8205b-ad22-877f-78ad-486beb56d4fc@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 qemu-discuss <qemu-discuss@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 05, 2021 at 11:58:45AM +0200, Thomas Huth wrote:
>On 05/05/2021 11.55, Stefano Garzarella wrote:
>>On Tue, May 04, 2021 at 12:20:03PM +0200, Philippe Mathieu-Daudé wrote:
>>>On 5/4/21 10:43 AM, Stefan Hajnoczi wrote:
>>>>On Mon, May 03, 2021 at 01:16:51PM +0200, Thomas Huth wrote:
>>>>>As you might have already noticed by some other mails on the qemu-devel
>>>>>mailing list, we are in progress of switching our bug tracking tool from
>>>>>Launchpad to Gitlab. The new tracker can now be found here:
>>>>>
>>>>> https://gitlab.com/qemu-project/qemu/-/issues
>>>>
>>>>Thank you for doing this, Thomas!
>>>>
>>>>>1) We likely won't have the possibility anymore to 
>>>>>automatically send e-mail
>>>>>notifications for new bugs to the qemu-devel mailing list. If you want to
>>>>>get informed about new bugs, please use the notification mechanism from
>>>>>Gitlab instead. That means, log into your gitlab account, browse to
>>>>>
>>>>> https://gitlab.com/qemu-project/qemu
>>>>>
>>>>>and click on the bell icon at the top of the page to manage your
>>>>>notifications, e.g. enable notifications for "New issues" there.
>>>>
>>>>All maintainers and most regular contributors should follow the issue
>>>>tracker so that QEMU developers are aware of new issues. Please do this!
>>>>
>>>>An alternative mechanism is the RSS/Atom feed available by clicking the
>>>>"Subscribe to RSS feed" button left of the "New issue" button here:
>>>>
>>>>  https://gitlab.com/qemu-project/qemu/-/issues
>>>
>>>You can also subscribe to labels of interest [*] going to
>>>https://gitlab.com/qemu-project/qemu/-/labels
>>>
>>>For example in my case I subscribed to receive notifications
>>>only from these labels:
>>>
>>>- kind:Bug
>>>- Storage
>>>- pflash
>>>- Fuzzer
>>>- workflow:Merged
>>
>>Cool feature, I also subscribed to some labels.
>>
>>I was trying to assign a label, for example "Storage" to this issue:
>>https://gitlab.com/qemu-project/qemu/-/issues/96
>>
>>but I can't, should I have some special permission/role?
>
>Yes, you need to be at least a "Reporter" in the members list of a 
>project to be able to add labels. You can ask one of the owners (see 
>https://gitlab.com/qemu-project/qemu/-/project_members) to add you as a 
>reporter.
>

Thomas, Daniel, thanks for the hint!

Paolo has just added me as a "Reporter".

Stefano


