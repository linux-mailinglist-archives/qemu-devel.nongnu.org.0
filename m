Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E03331FCD5
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 17:11:16 +0100 (CET)
Received: from localhost ([::1]:47980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD8N9-0001zZ-H4
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 11:11:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lD8HC-000484-6m
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 11:05:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lD8H5-0002jc-Lk
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 11:05:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613750698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EsB5A35zT6J0mETctHokfVJP+26epQc//8l5Kt/F45c=;
 b=ii7RRyvk7cf/JyAdF4go+LNOS3/xSerkz9bh3ocHtEmuuW0kTI7sVya3d+cn8u2c4Y2US3
 oGc1NTSb7mFYTIvRqo8kXT3cdW2/f9gsRbo34+Frzfe9kEi5ybjxaY6Habl49VKrDc4P4l
 Rx5r3KC1s6/Su0idD6CmKFmO85QBt7Q=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-IfsZsDRUOw6RU51WUryMDA-1; Fri, 19 Feb 2021 11:04:55 -0500
X-MC-Unique: IfsZsDRUOw6RU51WUryMDA-1
Received: by mail-wm1-f72.google.com with SMTP id s192so2665748wme.6
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 08:04:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EsB5A35zT6J0mETctHokfVJP+26epQc//8l5Kt/F45c=;
 b=WdYuUR7KVjsaGw7lu8tqRAmww+chbKLe+CD8ZXqWoGQTMzW64J+olQ2XITPvzn1AbB
 4UPMLSGzSw5K/kWyjyIFddLTI7fMiSpRc7TJHraHRmrmtR05R8hA4e+kq8q15sqlt1cb
 AFmZve6k0bz9jyJYDhEcRgdU1T3ySSczLxdLegfWILYjbBCbO0KIIaaYlKRA2l0rA2lE
 nechS6ts+CgxwYrEkdsPy6O32huw9RjrT+BR+hiOc3kzDJwAohIbPWD8jQKwC/lcKQnv
 ZHDiJW3Mh3EEH08QE40DDTRwz04F7sy4Y1AY5KbInjYXJRDvDD5jWe/+x7TMZRhMcC2W
 AgsA==
X-Gm-Message-State: AOAM532ec3bGMExG6qxc+5gzo/qw+pwfduDJfOb8BTBWUkHDlNexyVxA
 Y3DnmLcryXKG4f0LrQHposYUgOnjvi+kmo6VouYUkr26OX3UTSXoZR9kul447wrOOAcOSJgZmjE
 WzlD2zoGSYRMbvBeWvm2zdiU+vapnOu9WIz9OXryWvpUabmSQH9mCwDstQkNyhoK3edg=
X-Received: by 2002:adf:fd51:: with SMTP id h17mr2665815wrs.420.1613750694201; 
 Fri, 19 Feb 2021 08:04:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw8dl3ZubedKzbEw/EwEb2AXT0Tgjj9NjgxDQOczzWmOk2rKDvGcAqGq43q5aM1RPW1nLB83g==
X-Received: by 2002:adf:fd51:: with SMTP id h17mr2665780wrs.420.1613750693964; 
 Fri, 19 Feb 2021 08:04:53 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p17sm2587680wmq.27.2021.02.19.08.04.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Feb 2021 08:04:53 -0800 (PST)
Subject: Re: meson, NEED_CPU_H, CONFIG_TCG and tests/
To: Thomas Huth <thuth@redhat.com>, Claudio Fontana <cfontana@suse.de>
References: <eb7d8eca-13ef-07cf-41b4-d7276399fff1@suse.de>
 <a9f6fbf7-fb29-eca6-44f0-91381e8b3084@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ad889877-fc1c-9346-3cc5-4d177295f076@redhat.com>
Date: Fri, 19 Feb 2021 17:04:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <a9f6fbf7-fb29-eca6-44f0-91381e8b3084@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/02/21 14:30, Thomas Huth wrote:
>> But how could tests see this?
> 
> The test are generic, not target-specific code, so they can not see 
> things like NEED_CPU_H, of course.
> 
> But CONFIG_TCG seems to be defined in config-host.h, so you should be 
> able to use that define, shouldn't you?

Yes, CONFIG_TCG is defined in config_hsot just for that reason:

tcg_arch = config_host['ARCH']
if not get_option('tcg').disabled()
   ...
   accelerators += 'CONFIG_TCG'
   config_host += { 'CONFIG_TCG': 'y' }
endif

It's ugly, but I kept it that way when moving accelerator configuration 
to Meson.

Paolo


