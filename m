Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F51325F82
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 09:56:04 +0100 (CET)
Received: from localhost ([::1]:43696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFYup-0002d7-0O
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 03:56:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFYqB-0005uy-M8
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:51:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFYq3-0004V6-Bn
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:51:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614329465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eOPxzDIMv0hgyb89ynJPAqW5c1N4Vq6XKqOktXnlbMA=;
 b=JhJVs5mSeP3s4IbXFUGAWAg1Aw+UaC4657bYIGbRbTMmTPvqVdXu6FgBkOXWRdKQank9xd
 zdX+/GSXy3eUuxUL70K4a92+r77NS+S12G3oL8rXG4Ug6EpmOchnj7O3HQyJtlRESzSdxW
 eZS3n1I9yxgcFWVcsSUrFITqMAcZqjs=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-94-lAzIrJfZNqewbdXfr65B9g-1; Fri, 26 Feb 2021 03:51:03 -0500
X-MC-Unique: lAzIrJfZNqewbdXfr65B9g-1
Received: by mail-ej1-f70.google.com with SMTP id ci1so3925073ejc.0
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 00:51:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eOPxzDIMv0hgyb89ynJPAqW5c1N4Vq6XKqOktXnlbMA=;
 b=qZ2PuJWrgoxTR1U273BoNI6Bnfj0Pz/yvoiwxoGFMyB4hq97nz19tz1kpCliByMg7n
 StFTNtJwyjGoyN2A2GTBkMUqO4NOoL3/tNlE458a4Hj4eEBJuvoQqTR+5+6uO851t29z
 RSFkbnqrWbbg2wq/QZXeo3IB3Alz62IC1wQtdR6lvlgSeqfeoAa8QesQckrZXYtD+Wng
 Hy3jZUW/hE874I77LRSoT9TL7AU4OYLgnz8q8CdeLh8HxiLbYRBH/oMwT3npK42IuSRV
 vqskOCwnYEik7U0V9gYr6pFY9VLu++rFtcPlmP1ab/z+S+uGnkjoJOxDNOLmHBSK7u5+
 apYQ==
X-Gm-Message-State: AOAM533BBZ3mieFJLYNwHastEFeSJIialo8Ydo7edYGAJI05/ig316WM
 FHR7ATi9KRDzPOwUV6pV5eZOvnzqmkUPPFjsrn0hJFd99Hg2LCJ/XT/s0QdO4yCIj7uZ7oY/Sa9
 N0zO7mCVM8O54HaI=
X-Received: by 2002:aa7:c9c9:: with SMTP id i9mr2088438edt.160.1614329462524; 
 Fri, 26 Feb 2021 00:51:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzoElCsgLpHhhY7AezSVSdbNBlGKXMZQgYyoIvcZRPzwY1R19UgSPtiCKhqbH9dFfWb97qaBQ==
X-Received: by 2002:aa7:c9c9:: with SMTP id i9mr2088425edt.160.1614329462374; 
 Fri, 26 Feb 2021 00:51:02 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id t15sm569772edc.34.2021.02.26.00.51.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Feb 2021 00:51:01 -0800 (PST)
Subject: Re: [PATCH] multiprocess: move feature to meson_options.txt
To: Paolo Bonzini <pbonzini@redhat.com>, Jag Raman <jag.raman@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20210224122306.451764-1-pbonzini@redhat.com>
 <72fc7d76-f8e3-2c0f-e890-99509bb6230d@redhat.com>
 <e89873e7-d996-0161-8c4f-587aadd2208f@redhat.com>
 <YDfRz3zhkoTiyoKt@stefanha-x1.localdomain>
 <C3EAD382-8A3B-4DC7-9982-CC1DDAEEF4B7@oracle.com>
 <cd96210d-58bc-2978-02bc-b7ca794f7274@redhat.com>
 <08381101-fde1-dc5c-8156-32e90b21fee3@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a9cf5d49-f30c-0b21-4c76-de454e1c9583@redhat.com>
Date: Fri, 26 Feb 2021 09:50:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <08381101-fde1-dc5c-8156-32e90b21fee3@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.435, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>, Thomas Huth <thuth@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/26/21 8:48 AM, Paolo Bonzini wrote:
> On 26/02/21 00:16, Philippe Mathieu-Daudé wrote:
>>> I personally don’t have any preference for the name.
>> Great.
>>
>> So with the summary/description updated as:
>>
>> summary_info += {'Multiprocess QEMU (vfio-user device backends)':
>> multiprocess_allowed}
>>
>> option('multiprocess', type: 'feature', value: 'auto',
>>         description: 'Multiprocess QEMU (vfio-user device backends)
>> support')
>>
>> Reviewed-by: Philippe Mathieu-Daudé<philmd@redhat.com>
>>
> 
> It's not yet vfio-user.  For now I can put "out of process device
> emulation";

OK.

> however, if the protocol is going to change, I wonder if it
> should be disabled by default.

Sounds safer indeed. We need to add --enable-multiprocess in CI to
keep testing the feature.


