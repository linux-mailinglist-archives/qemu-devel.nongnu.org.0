Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F3555C06A
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 12:53:41 +0200 (CEST)
Received: from localhost ([::1]:51232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o68qi-00067h-Pc
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 06:53:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o68nS-0003cQ-CZ
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 06:50:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o68nL-0005s0-5y
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 06:50:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656413410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ps7m0GwsE568brrwnMln1yKEt+y4gtGq0ZdHUYPmZQ0=;
 b=AyPNkUzJ+fNpPgbKpJqfShMOD8gWXJvRpa+MInJYbIJsqsgc5BQVxOU3IXhEV+rTcqUL6f
 DObhC5lDPz8IkuKu/jgJSxhUGNTFV4iUh8xcp3V/HcKwSU1HC2y/7G6HqNV2ZsbQAQiDb8
 OT28Est0UMuUfUuWlIVvWrsvX5YRKWg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-7O1NeQ6cOo2jYFUlhgaUOA-1; Tue, 28 Jun 2022 06:50:09 -0400
X-MC-Unique: 7O1NeQ6cOo2jYFUlhgaUOA-1
Received: by mail-wm1-f69.google.com with SMTP id
 6-20020a1c0206000000b003a02cd754d1so4921616wmc.9
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 03:50:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=Ps7m0GwsE568brrwnMln1yKEt+y4gtGq0ZdHUYPmZQ0=;
 b=mqerV3xhp2SGnXqnqYxls2lNv7Crfe6CUNQZhC+fUPUk8/q0bhI2EN4N30OLsK3io5
 ZVbNbwDZWTr+YYfprz7SnJ8NW0CXEQ8ISdZz5wBeTbPQaBICys17EHsrrr9Z8QSddBKk
 TJ5jYcnzX/3dcjIJOWpacs37b4HD4c9S2M/kF20qzvycGvBCT8ypkqhkroD25rngnpND
 zZQhDR6srRdsIXSWkSHFsiUR1NhU5i0XOWHmc+ROFZ/qX3yqNiNIimjLZ5sj0VnlsiYr
 0hH26wzXFBFZEn9xiJZ6sxrUpxKE0XN0qEBkLKWwv7QBJcjK2j9jKgPh7f/uHizRfNJk
 xXJw==
X-Gm-Message-State: AJIora/OL6eYVjPtOt+CCPoGgVO+tXWS6rHj6Ge5JnmUHe289pzFUqrZ
 OxE5vTfiZnlY0poSQOixUoY1H9egfLVFjqHP6kluL9unvdhQwoz4M6NXBKeOl/5YFSCZvBS9asw
 g0+AOTo59uukI2Gw=
X-Received: by 2002:adf:d1c2:0:b0:21b:e465:1e36 with SMTP id
 b2-20020adfd1c2000000b0021be4651e36mr10521478wrd.271.1656413407896; 
 Tue, 28 Jun 2022 03:50:07 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tg9W7rSsUBTA5EDlwRwdM3JkwglwSZex1Qwto0EDzWKz7Vc3cYSOsfll52Q+Y7XLc5NkKuLA==
X-Received: by 2002:adf:d1c2:0:b0:21b:e465:1e36 with SMTP id
 b2-20020adfd1c2000000b0021be4651e36mr10521453wrd.271.1656413407682; 
 Tue, 28 Jun 2022 03:50:07 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 t18-20020a1c7712000000b0039749b01ea7sm20065497wmi.32.2022.06.28.03.50.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jun 2022 03:50:07 -0700 (PDT)
Message-ID: <1182d647-bef1-0a8a-a379-86f029af7ac6@redhat.com>
Date: Tue, 28 Jun 2022 12:50:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, John Snow <jsnow@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 imammedo@redhat.com, qemu-devel@nongnu.org
References: <20220628030749-mutt-send-email-mst@kernel.org>
 <7bf5976e-8277-7c78-f412-44f7be8754f4@redhat.com>
 <YrqyWhu8ThAcUGI4@redhat.com>
 <CAARzgwyZNAYK3p16wjeykoCB9C+tmznY+OZAM-vw+Pn_4CdMqQ@mail.gmail.com>
 <Yrq6anPW60FkjmK6@redhat.com>
 <59150265-44ed-0b14-df1c-42e3f2e97b7e@redhat.com>
 <CAARzgwzST+3PjEomfbweeB0KYnmO0yoxVJWiV9+9A_h32swnyw@mail.gmail.com>
 <CAARzgwxcjppQuO65aFzyzNBaFvJer7JEWoJeALaoKON=3XAQhg@mail.gmail.com>
 <20220628060210-mutt-send-email-mst@kernel.org>
 <d7a7b28f-a665-2567-0fb6-e31e7ecbb5c8@redhat.com>
 <20220628062551-mutt-send-email-mst@kernel.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: Why we should avoid new submodules if possible
In-Reply-To: <20220628062551-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/06/2022 12.30, Michael S. Tsirkin wrote:
> On Tue, Jun 28, 2022 at 12:21:39PM +0200, Thomas Huth wrote:
>> On 28/06/2022 12.03, Michael S. Tsirkin wrote:
>> [...]
>>> For biosbits if we are going this route then I feel a submodule is much
>>> better.  It records which version exactly each qemu version wants.
>>
>> As far as I know, you can also specify the version when using pip, can't
>> you? So that's not really an advantage here.
> 
> But of course if you do you do not get updates ;) You do
> however rely on a 3rd party to faithfully provide you
> correct code based on the version, and host it forever.
> 
>> On the contrary, submodules have a couple of disadvantages that I really
>> dislike:
>>
>> - submodules do not get updated automatically when doing a "git checkout",
>> we have to update them via a script instead. This causes e.g. trouble if you
>> rsync your source tree to a machine that has no access to the internet and
>> you forgot to update the submodule before the sync
> 
> how is pip better?

You don't end up with an inconsistent source tree in that case (which 
happens with submodules quite easily, at least for me it happened a couple 
of times already). Either the machine has an internet connection, so that 
pip can install the missing bits, or it does not and the test has to be 
skipped. But if I copy the wrong state of a submodule around, things get 
messed up quite easily in my experience. Ok, you could say that this is just 
my special setup with rsync, but already given the fact that "git checkout" 
creates an inconsistent state of your source tree until you run the script 
for updating the submodules the next time is an indication that submodules 
are rather a shaky thing (e.g. if you'd create a tarball for somebody else 
from your source tree right after doing a "git checkout").

>> - the content of submodules is not added to the tarballs that get created on
>> the git forges automatically. There were lots of requests from users in the
>> past that tried to download a tarball from github and then wondered why they
>> couldn't compile QEMU.
> 
> how is pip better here?

You don't get incomplete/non-working tarballs in that case.

>> - we include the submodule content in our release tarballs, so people get
>> the impression that hte submodule content is part of the QEMU sources. This
>> has two disadvantages:
>>   * We already got bug reports for the code in the submodule,
>>     where people did not understand that they should report that
>>     rather to the original project instead (i.e. you ship it - you
>>     own it)
>>   * People get the impression that QEMU is a huge monster
>>     application if they count the number of code lines, run
>>     their code scanner tools on the tarball contents, etc.
>>     Remember "nemu", for example, where one of the main complaints
>>     was that QEMU has too many lines of code?
> 
> I think we can skip the checkout in the tarball if we like.
> If people want to run the test they can checkout then.

Release tarballs don't include the ".git" folder infrastructur, so everybody 
who downloads a tarball will simply never be able to run the test.

> 
>> - If programs includes code via submodules, this gets a higher
>>    burder for distro maintainers, since they have to patch each
>>    and every package when there is a bug, instead of being able to
>>    fix it in one central place.
> 
> Come on, this is just a test. We *really* don't care if an ISO
> we use to test ACPI is using an exploitable version of grub.

Wait, I thought we were only talking about tappy here? The ISO binaries 
should certainly *not* be bundled in the QEMU tarballs (they are too big 
already anyway, we should rather think of moving the firmware binaries out 
of the tarball instead).

  Thomas


