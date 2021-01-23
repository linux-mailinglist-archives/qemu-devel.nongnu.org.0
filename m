Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 072A0301772
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 19:03:04 +0100 (CET)
Received: from localhost ([::1]:41620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3NFW-0002jv-Hl
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 13:03:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3NDW-0001yv-PA
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 13:00:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3NDS-0003A1-9i
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 13:00:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611424852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7HeZdHqYjeXec9ywYVCkfKb9HkDLby788FRPLCpcHYg=;
 b=J9KGJaPpswXIG2puYDz9Tctl4Hc3JTkgFAZxSpnkj/M/SdkDsU3oFFeTX4e/m9/yZ8Avr9
 LEFp08NiD+JykW6tdkrRnXpZTPNVKWE8pPZwgOlKTrmM7roy9UvadfGeG8iq2uTDUJ3VLg
 WIuOn0aL0q6EeeMXVFjpDWsdmFKd0KI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-2T04PfYdM4q8aMQvAEg89g-1; Sat, 23 Jan 2021 13:00:49 -0500
X-MC-Unique: 2T04PfYdM4q8aMQvAEg89g-1
Received: by mail-ed1-f72.google.com with SMTP id j11so4045290edy.20
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 10:00:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7HeZdHqYjeXec9ywYVCkfKb9HkDLby788FRPLCpcHYg=;
 b=Cwrk33nQ/0XPD4n0qk0QfWOtCLoEPztJNHGZTKQqyLjOSxXRfkjYDQmoqTlD7GyW+I
 8U/YYtJw07O83+W8NjIuu8yiLhfzCOo8wLkAM50hwZtCCQmFplPlDF20hyo5IjP/bA7s
 UaOK0fJVwKu+BuhPxMUxM6cNBSX3vq1/1Tu1/aYsyWNh7o/iQ69PVjVUCg/drBawDbvq
 L7G3o5M9OXu+qMyVXBz4cIvRsPo+euXTN2nfiMWE+se//PMQvYyNVayfkDmnovDuoIlo
 RaOo8WYXT275uPrdHlaP1buTcjLb7R0NBv16zbBI9ef8U2+2eEcfJYQcE2ZmJ45Ko+Uz
 So0Q==
X-Gm-Message-State: AOAM532oojntMcx99RgWRlYMjrmAG5QsP2Lh67NdrlsMx8qA7sNPAJH7
 LQ9xFbdGrrrixshKeOlz0bdvyTIOcD1+gF/ZWQ2NrcIBYRfzbZodRKlylIkt2cE1bbanLRJfEbc
 4dfkbHkD+2XMtETE=
X-Received: by 2002:a17:906:cc89:: with SMTP id
 oq9mr298929ejb.154.1611424848839; 
 Sat, 23 Jan 2021 10:00:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw5pfgYG5L97qOk381OWB6xXiEJYWPn0PkqIcmSR57jblPxJaE5NldA9OoxEkn6KIxxGyB/cQ==
X-Received: by 2002:a17:906:cc89:: with SMTP id
 oq9mr298919ejb.154.1611424848669; 
 Sat, 23 Jan 2021 10:00:48 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id p3sm7615968edh.50.2021.01.23.10.00.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jan 2021 10:00:47 -0800 (PST)
To: luoyonggang@gmail.com
References: <20210107140039.467969-1-pbonzini@redhat.com>
 <20210107140039.467969-9-pbonzini@redhat.com>
 <20210113103143.GA1568240@redhat.com>
 <50a309ed-64a3-6d17-9edb-6274abb4e498@redhat.com>
 <CAE2XoE9gag5J7reaQPaovto6HDvDPaGOJCSGeModiXVr5p7chg@mail.gmail.com>
 <CABgObfa0A_q3_Hev49hT5SHPNvxaE1TrLJ4QPagM5n3g-8P5xw@mail.gmail.com>
 <CAE2XoE_UyVdRnLAYijiwuEO=8-uC4Tv=PRyHMTarvEjTwN8bxw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 8/8] configure: automatically parse command line for meson
 -D options
Message-ID: <c1dc7a3f-ad19-6000-a2ee-eb9a49cfac52@redhat.com>
Date: Sat, 23 Jan 2021 19:00:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAE2XoE_UyVdRnLAYijiwuEO=8-uC4Tv=PRyHMTarvEjTwN8bxw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.165,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/01/21 04:30, 罗勇刚(Yonggang Luo) wrote:
>  > We could and I did it in the first version. However it's ugly that 
> the user has to use --python on some setups in order to get a full help 
> message.
> 
>    Yeap, but finally configure should gone, so I think --python are 
> acceptable by user, just need make sure to be noticed when the default 
> python
> are not python3

When configure will be gone, these 200 lines of Perl will disappear with 
it, so we don't have to think for future users and developers, but for 
the present.

I don't expect configure or Makefile to go away completely, because for 
example things such as "git submodule" handling are easier to do in the 
shell.  However, we also need to evaluate what's the road to a minimal 
configure (just like our Makefile is pretty minimal, only tests/tcg 
still has lots of build logic).  In that respect, automatic parsing 
command line simplifies moving things from configure to meson, and that 
is true no matter what language the parser is written in.

(BTW, I'm not such a Perl fan.  I have only ever written like 3 or 4 
programs in Perl).

Paolo


