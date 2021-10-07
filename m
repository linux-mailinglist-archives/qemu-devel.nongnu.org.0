Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2F742510C
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 12:27:12 +0200 (CEST)
Received: from localhost ([::1]:56130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYQcJ-0004k7-EK
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 06:27:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mYQZM-0003iE-TA
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 06:24:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mYQZJ-0008HX-Ec
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 06:24:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633602243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C9P2oSddTL8BCPnINdK5fHjjWDSlZbZ3c75+t+9iFG8=;
 b=PLBkqoubfc+kPME8hpebFrE0jbAe12sO93jg3F8pUGfiyvl8/RJieZ934Q2B1b27jUzjGc
 6dBnm6bIeN8CY1i7aYrt80hgbRQhgdyOv7pqHNSpZ9xeHwUkUsafBZd6fkfDehXmv4Dil4
 TV3ks3ycZrhSo+984Tm4ZA/j43V7PKk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550--Fr3OFfDPWedug6akMKx5A-1; Thu, 07 Oct 2021 06:24:02 -0400
X-MC-Unique: -Fr3OFfDPWedug6akMKx5A-1
Received: by mail-wr1-f70.google.com with SMTP id
 r16-20020adfbb10000000b00160958ed8acso4298372wrg.16
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 03:24:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=C9P2oSddTL8BCPnINdK5fHjjWDSlZbZ3c75+t+9iFG8=;
 b=s8tJaXceLbwBpvyXotINAVoYGAF6UrOkzPNkAa/EfMl75iwENT8+kSKCx+cCXz8zs/
 kk22k+HdNe1CLRlcvqKF7XxO6lfm19aN34FJbB3knG43ROlUPmOM+nV8h95Ym8sAcofq
 0xn7nPdcaOxPq9PVXkXnqBCgkP6qR4MFkVTmF3GRt8IbkptJ63jd4aBLEORyc0fa63tn
 7Bt7oRbWvN217/ihutbZPvNEZdOjJBQsCL5TIwkSrE7f1FgOJ1UOqtTY2tcTVCFwFjtU
 ECSx8z3FA7KFV18zPQ3x3UCkScWi0obFizukeffbj7xYmGgOOyYVq9iyhAB5mHdBzSQd
 Amnw==
X-Gm-Message-State: AOAM531WpOoYv3LwAdjsA0eKMZpo7a+bUfpGHrb1W4TGU2JSa7xOM04z
 RCuCVFDwtHonhWKTcv8I1+4LIxod2JvreFQgrHYH3cVfFxfllMTVerNVnYyUuj6oAY7lRpZto9m
 +AZgjP+kHaOWTk2Q=
X-Received: by 2002:adf:f309:: with SMTP id i9mr3277958wro.256.1633602241341; 
 Thu, 07 Oct 2021 03:24:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQd13FxMaiugm+nmuUJVqkRzRNmkNx2GoolgbLl3k3FDH2rzFOnTsK98WHrMsPB49xHx2LkQ==
X-Received: by 2002:adf:f309:: with SMTP id i9mr3277940wro.256.1633602241161; 
 Thu, 07 Oct 2021 03:24:01 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x15sm14969434wrl.74.2021.10.07.03.23.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 03:24:00 -0700 (PDT)
Message-ID: <3abc4e8e-5657-14bb-ba89-5b7669c01201@redhat.com>
Date: Thu, 7 Oct 2021 12:23:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: QAPI sync meeting
To: Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <CAFn=p-axq90h+UGa_R2a=LZzXTcjsua3O8xnNvonvFD4ZjwmBQ@mail.gmail.com>
 <YVMeUbGdnsTpwSbD@redhat.com>
 <CAFn=p-ZG6SAVDz-cOtviekvMvibw+ukhYmSOqH7UTrcH-9fCNA@mail.gmail.com>
 <87ee97y3q5.fsf@dusky.pond.sub.org> <YV7Fh2DihM65rgnN@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YV7Fh2DihM65rgnN@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/10/21 12:01, Kevin Wolf wrote:
> 
>    * -chardev: I have patches that QAPIfy the option based on aliases,
>      getting rid of the old handwritten parser that is inconsistent with
>      QMP in non-obvious ways and replacing it with translation to QMP
>      (both using aliases and a little C code) that makes the differences
>      obvious.
> 
>      First posted in November 2020, more details in the cover letter:
>      https://patchew.org/QEMU/20201112175905.404472-1-kwolf@redhat.com/
> 
>      Later versions (not yet posted as a series because I'm waiting for
>      aliases) also make -chardev accept JSON syntax, which is what
>      libvirt really wants to use.

I'm still not sure about this...  It's an awful lot of code if the 
aliases are only used by -chardev, and I'd rather use -object/object-add 
for chardevs if that's at all possible.

Paolo


