Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE5536E964
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 13:10:12 +0200 (CEST)
Received: from localhost ([::1]:37246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc4Yd-0000oh-Px
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 07:10:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lc4WO-0007ok-40
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 07:07:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lc4WK-0000YO-5Z
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 07:07:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619694467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QpXI4dj8yy0wFT1+JDFeIj0MD0TglifE8lXDo0qOEpw=;
 b=GEamFYvYJndsa4pFK3WchgZa8PHgMGAhnYup9L8ToI+Dyp1JZ6cZ3KG5lqRv69tSzfar0Y
 a0OvD6HV5O8aA6MODJ0hSk5susU9TuaPR7GFHD6eJFUwOrGPDeaKSP1iWrvuTiTvteUpK0
 l5FkoJXZV+lVijOJPaX+KnzOB1yaTh4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-gwKTM9cQP--j0MdbEOfU8w-1; Thu, 29 Apr 2021 07:07:45 -0400
X-MC-Unique: gwKTM9cQP--j0MdbEOfU8w-1
Received: by mail-ej1-f70.google.com with SMTP id
 ji8-20020a1709079808b029037c921a9ea0so13313430ejc.9
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 04:07:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QpXI4dj8yy0wFT1+JDFeIj0MD0TglifE8lXDo0qOEpw=;
 b=RNGY/EWfF8GunAFNH+djuB4S5Byl+1U0JvqN4U8NH5N7erp/ZmG1V92VWPfWw25esW
 eRqJeNMnZG4Udj6ytz7DLWxFgtlcPzKfqexc1UAtBOKV7FH9PUFycrq+vFszj8NIB2XX
 XLfF4GIdjbpr1DgIVK4zG2XFl2tvlkXD5l537JBa95ADIlqgQSQdmNmjvx0NMZacF05Y
 0bmTmpxrj583ROeNYXmUbLO5Jbxb7Z6iWyWzk6YvgEXpLaGEg8AmgvlmoEOSCwCipxHR
 OvZ3hpc+c42/OJiq9py9SDOYTbLsderXAkP5pxYkIAHHUXDxeJ2Ff25rly+U9iqRLK55
 K18w==
X-Gm-Message-State: AOAM533S99wcQhlmxD6AJEiDYUduw5EtoUyTFoyHrSxHX8gbsFUqTbQG
 K7f4fmPIYapWOBVkJlCEra3KuCePTYMGgnBb3cS6IL+0+20WPkk/EXBWOKPiz9931BZq2OdV1O3
 YCSMwhcFySH+SJII=
X-Received: by 2002:a17:906:7016:: with SMTP id
 n22mr34088293ejj.23.1619694464129; 
 Thu, 29 Apr 2021 04:07:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/5Epxpv9pTD4P+WDgi/1x5XB21LPohbFBR6mAE4vp9W7WwFaRpJ1NtVFXc+YFe+Yzc6EceQ==
X-Received: by 2002:a17:906:7016:: with SMTP id
 n22mr34088266ejj.23.1619694463912; 
 Thu, 29 Apr 2021 04:07:43 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id hp29sm1567366ejc.47.2021.04.29.04.07.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 04:07:43 -0700 (PDT)
Subject: Re: Let's remove some deprecated stuff
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <87y2d1csxe.fsf@dusky.pond.sub.org>
 <20210429101842.hupkajdlkttq6l4v@sirius.home.kraxel.org>
 <YIqJY1Z4jqruCu17@redhat.com>
 <CAFEAcA-_UTcs-XgPD6OLnKBUYJ9xnYRg9FAorinxejp7XZCxpQ@mail.gmail.com>
 <YIqL7dSxR/C6URkX@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <17e37fcd-da9a-9343-bfd7-9b8708846039@redhat.com>
Date: Thu, 29 Apr 2021 13:07:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YIqL7dSxR/C6URkX@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?B?S8WRdsOhZ8OzLCBab2x0w6Fu?= <dirty.ice.hu@gmail.com>,
 Robert Hoo <robert.hu@linux.intel.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/04/21 12:35, Daniel P. Berrangé wrote:
> Note the QEMU since has been ready since 4.0, in April 2019 so 2 years.
> We dropped the ball on getting this implemented in libvirt, since we
> had almost no config options for sound at all in libvirt. We had just
> hardcoded 3 sound backends based on the graphics frontend.
> 
> So in terms of historic libvirt compatibility, we've only ever relied
> on the QEMU_AUDIODRIVER env, none of the other million audio env vars.
> 
> IOW, if QEMU was to be conservative, you can drop all env vars except
> the main QEMU_AUDIODRIVER.

I like that, and keeping -soundhw as well until an audiodev-based 
replacement is there.

Paolo


