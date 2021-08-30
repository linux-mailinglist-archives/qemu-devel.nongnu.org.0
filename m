Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5000B3FB2F8
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 11:14:01 +0200 (CEST)
Received: from localhost ([::1]:59888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKdMd-0004cx-I5
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 05:13:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mKdLC-0003v6-OU
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 05:12:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mKdL9-0004Sz-2g
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 05:12:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630314745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i6+w1oE+65GUOJTRLqKpun/2IGKBxk5iXx/dzYzHPuk=;
 b=hYO3IO+gJCqthmGhIg/nWZuHhcrrDSWffPYA8TZ3SBucWvGgV8ltwevFqHlRIY1PqZqFaw
 8/4WDeyrvjkEbgmyROwBYB4XY0GYgYwMx4xXvG5dk7nvxbofGujMGWpimI53B7uheYDs+y
 tdkAW0Qpqk/xVkeEfpb26CfGZBlgph4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-zYsRSvuwNIymHFVLixoJFA-1; Mon, 30 Aug 2021 05:12:22 -0400
X-MC-Unique: zYsRSvuwNIymHFVLixoJFA-1
Received: by mail-wm1-f72.google.com with SMTP id
 j33-20020a05600c48a100b002e879427915so4452929wmp.5
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 02:12:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i6+w1oE+65GUOJTRLqKpun/2IGKBxk5iXx/dzYzHPuk=;
 b=aYYq3r4UKCcx3DqN3QQQXnIl/A93ILxFfLugwNv6PKsn1MzErmkUGGac4AD6dJPoY0
 q1Z/U6zmSGs4Xu6hz67eIwokBuexN/pA030QvkYWz/dDoVbjYrN2CT2b+F/rmZIWkobk
 RdPnUNf8c3Ow9Gad7p397Uuw2LVL5hno5BvhoHE6rBtcF6grdKpTqCNAS89Oi6csCCiI
 cIFcxPUUxR8zgZnoOdUUXV7VGr+wb7JSHX3T+5dcdy8jwrCp6DxutPsuUSiBZ+C+ruwt
 A7nEd+8uL8jst+L2NB5E06vw57f1WvnLJnuMGZmn38fSZE/tr+RAB7CMw1LVZko+egIe
 y9oA==
X-Gm-Message-State: AOAM5328YexJzZlUNLHFK55TAIn0nenpcQkPdMSYxdegJI6zLGWWjLYV
 CNK48Y+38elAvzUwnJ41llnSzkm6ULLekisUuSRzBWe+xPr/Z9pod6CMCZRHO1/sY8OG8jkeDXh
 DYz99J7d8u3zudsUgCW1VJWh1VBzV7aE5LzSO03TllWV0ipiLbWMZCEsvdI8Jgi+g
X-Received: by 2002:a7b:cd92:: with SMTP id y18mr32106184wmj.78.1630314741024; 
 Mon, 30 Aug 2021 02:12:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2MvtfDOvoUFIgmVQK1LzsmIWV/C2xji+rvL0fEJvpii0zQ8B/MoFr8JqihFzZMC+0wGYz8w==
X-Received: by 2002:a7b:cd92:: with SMTP id y18mr32106159wmj.78.1630314740795; 
 Mon, 30 Aug 2021 02:12:20 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id i68sm15071227wri.26.2021.08.30.02.12.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 02:12:20 -0700 (PDT)
Subject: Re: [PATCH 0/3] Use meson_options.txt in the configure script
To: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20210829173210.39562-1-thuth@redhat.com>
 <CAMxuvawhwnwWRXAZOJj3SbtHXE8kC89=pHR+2-TD7ByLzoC_Pw@mail.gmail.com>
 <48ccdd11-5836-5886-f928-95c960fb810a@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0c4f5250-cb6e-a185-914c-f42c63d998e5@redhat.com>
Date: Mon, 30 Aug 2021 11:12:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <48ccdd11-5836-5886-f928-95c960fb810a@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.58, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/30/21 7:11 AM, Thomas Huth wrote:
> On 29/08/2021 23.22, Marc-André Lureau wrote:
>> Hi Thomas
>>
>> On Sun, Aug 29, 2021 at 9:32 PM Thomas Huth <thuth@redhat.com
>> <mailto:thuth@redhat.com>> wrote:
>>
>>     It's cumbersome to maintain the build options twice, one time in the
>>     configure script and one time in meson_options.txt. Thus let's add
>> some
>>     logic to the configure script to look at the meson_options.txt file
>>     instead of handling every option twice.
>>
>>     Thomas Huth (3):
>>        configure: Add the possibility to read options from
>> meson_options.txt
>>        configure: Remove options that can be handled via
>> meson_options.txt
>>          instead
>>        configure: Get help text from meson_options.txt
>>
>>       configure         | 429
>> ++++++----------------------------------------
>>       meson_options.txt |   2 +-
>>       2 files changed, 53 insertions(+), 378 deletions(-)
>>
>>
>> It looks similar to:
>> https://patchew.org/QEMU/20210107140039.467969-1-pbonzini@redhat.com/
>> Isn't it? (I haven't studied in details neither, I may be out of topic).
> 
> Oh, right, thanks for the pointer, I wasn't aware of that series yet.
> It's indeed similar to patch 8/8 from Paolo's series. But while Paolo is
> using an additional Perl-script and a json file for handling the
> configure options, my series just uses some lines of shell code in the
> configure script.
> 
> Paolo, why did your patch get stalled? ... my way of parsing is
> certainly way more fragile, but it's less complicated and seems to work
> as long as all the options are written in the same way in
> meson_options.txt (e.g. as long as nobody tries to use multi-line
> descriptions of the options there etc.)... so maybe if the additional
> Perl script was too much, this could be a good compromise?

IIRC while Perl is perfect for parsing, the maintenance cost is too
high. The git-forge / meson switch proved next-gen contributors are
more at ease with Python. The few contributors who are fluent with
Perl are usually very busy maintainers.


