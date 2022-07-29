Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3E65852E3
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 17:39:01 +0200 (CEST)
Received: from localhost ([::1]:46518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHS4p-0000GY-Va
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 11:39:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oHS1Q-0005At-Gd
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 11:35:34 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:37738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oHS1N-0005WM-U5
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 11:35:27 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-32194238c77so55092587b3.4
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 08:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=odHIm6saliemtu2g3oeMF1EBtM+8kxqt/44yJf0WKLo=;
 b=Ir6zmclhMQBC6CyFSsIjpBsnbysngacajjI1szb5sq1UKspa5heBVmZk/rtZvSnPN4
 2l/atk7C0K4upF7XM7M+8E5sh4fDqAwHp5QdrUuKYA4/KT4OAHFlTB5KqasSpHGkjdD7
 kp8vAtj3DnT2K79JrxO8srqzZRYg04H2Jv9sM3Voui8tlK5u9KsbyEQTGP0SE8Z277is
 HMqaMKXPoerD7ZAGHH2/n8D2+wC5oMDKnMIEDC0fWqJ2dOsn1zxtkivIepOr+3sgsbGq
 Xop828pPzqE3TLN6+MioYcdctcit/tYM8kxTNPkNF5v/Xps7oFvChHQnC5ND3miCzGiL
 GXQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=odHIm6saliemtu2g3oeMF1EBtM+8kxqt/44yJf0WKLo=;
 b=hSFlEIdQkVDVYxl9DzvsPXBRBSrpmw6xq8IT6agu0qGvwnFWlk435p0H9f42zYvaPu
 yJ850HncZ59oXhXQXU35eIqxUjrqlQbceMyhVEkiqkAFda43UX/NkcsNStkATM92adWR
 eQI2hE86WUBqbbyF7M4rcVQZsk6lBQiqdpR2fQCwQqdMBXltKHtBe8qdsMrTbU46jO2Z
 Gb7Blk/DDQMw3EwQbotXzKoIVqK/iSw5ydzMrz0UcNouQmCyQ+rgCk3Ss8cFuyTjvbtI
 e/vrirlj2WX5B6vIHz2fPZz5p4Mfd0+s4A1cF3fX+MOiMvy77nmBATBZw4W0Ci3RuYXL
 BPsg==
X-Gm-Message-State: ACgBeo2pSV5vrvI5+XoeXrPJZRNspVMbKroWy0YEhVtfbwxN2lz6dDcE
 t3rU75EWE15kLD9i2qQfjXX4c5XtMhyQ6PgEOSVT7A==
X-Google-Smtp-Source: AA6agR4ZYkPVY2dMVkdGWUDTeElfd+m1jNLybsqiwIwhY/TqyS9V4xtwwSI5jqXmA5tBvydycHtHbwLGoHKxR/QVqN4=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr3582632ywb.257.1659108924800; Fri, 29 Jul
 2022 08:35:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190919213924.31852-1-minyard@acm.org>
 <20190919213924.31852-13-minyard@acm.org>
 <CAFEAcA88GqrqoENf8NHxeNgTjj-jutz8Kspk43L1gp_VJJdh+Q@mail.gmail.com>
In-Reply-To: <CAFEAcA88GqrqoENf8NHxeNgTjj-jutz8Kspk43L1gp_VJJdh+Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 Jul 2022 16:34:44 +0100
Message-ID: <CAFEAcA_Akt5mszq=B8FZoyfBNZ=MYNfZoL7p+T0QaWJgpqAAgA@mail.gmail.com>
Subject: Re: [PATCH 12/15] ipmi: Add an SMBus IPMI interface
To: minyard@acm.org
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>,
 "M : Marcel Apfelbaum" <marcel.apfelbaum@gmail.com>, 
 David Gibson <david@gibson.dropbear.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, 28 Jun 2022 at 17:21, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 19 Sept 2019 at 22:39, <minyard@acm.org> wrote:
> >
> > From: Corey Minyard <cminyard@mvista.com>
> >
> > Signed-off-by: Corey Minyard <cminyard@mvista.com>
> > ---
>
> Very old patch, but Coverity has decided it doesn't like something
> in this function that's still basically the same in the current codebase
> (CID 1487146):

Ping ?

> > +static int ipmi_write_data(SMBusDevice *dev, uint8_t *buf, uint8_t len)
> > +{
> > +    SMBusIPMIDevice *sid = SMBUS_IPMI(dev);
> > +    bool send = false;
> > +    uint8_t cmd;
> > +    int ret = 0;
> > +
> > +    /* length is guaranteed to be >= 1. */
> > +    cmd = *buf++;
> > +    len--;
> > +
> > +    /* Handle read request, which don't have any data in the write part. */
> > +    switch (cmd) {
> > +    case SSIF_IPMI_RESPONSE:
> > +        sid->currblk = 0;
> > +        ret = ipmi_load_readbuf(sid);
> > +        break;
> > +
> > +    case SSIF_IPMI_MULTI_PART_RESPONSE_MIDDLE:
> > +        sid->currblk++;
> > +        ret = ipmi_load_readbuf(sid);
> > +        break;
> > +
> > +    case SSIF_IPMI_MULTI_PART_RETRY:
> > +        if (len >= 1) {
> > +            sid->currblk = buf[0];
> > +            ret = ipmi_load_readbuf(sid);
> > +        } else {
> > +            ret = -1;
> > +        }
> > +        break;
> > +
> > +    default:
> > +        break;
> > +    }
> > +
> > +    /* This should be a message write, make the length is there and correct. */
> > +    if (len >= 1) {
> > +        if (*buf != len - 1 || *buf > MAX_SSIF_IPMI_MSG_CHUNK) {
> > +            return -1; /* Bogus message */
> > +        }
> > +        buf++;
> > +        len--;
> > +    }
>
> After all of this preamble, len can be zero...
>
> > +
> > +    switch (cmd) {
> > +    case SSIF_IPMI_REQUEST:
> > +        send = true;
> > +        /* FALLTHRU */
> > +    case SSIF_IPMI_MULTI_PART_REQUEST_START:
> > +        if (len < 2) {
> > +            return -1; /* Bogus. */
> > +        }
> > +        memcpy(sid->inmsg, buf, len);
> > +        sid->inlen = len;
> > +        break;
> > +
> > +    case SSIF_IPMI_MULTI_PART_REQUEST_END:
> > +        send = true;
> > +        /* FALLTHRU */
> > +    case SSIF_IPMI_MULTI_PART_REQUEST_MIDDLE:
> > +        if (!sid->inlen) {
> > +            return -1; /* Bogus. */
> > +        }
> > +        if (sid->inlen + len > MAX_SSIF_IPMI_MSG_SIZE) {
> > +            sid->inlen = 0; /* Discard the message. */
> > +            return -1; /* Bogus. */
> > +        }
>
> ...this error checking on the values of the 'middle' request
> means that after one 'middle' request we can end up with
> sid->inlen == MAX_SSIF_IPMI_MSG_SIZE (ie we filled the
> entire sid->inmsg[] array).
>
> But then if we get another 'middle' request with len == 0,
> that will pass this error checking because (sid->inlen + len == MSG_SIZE)
> and fall through into...
>
> > +        if (len < 32) {
> > +            /*
> > +             * Special hack, a multi-part middle that is less than 32 bytes
> > +             * marks the end of a message.  The specification is fairly
> > +             * confusing, so some systems to this, even sending a zero
> > +             * length end message to mark the end.
> > +             */
> > +            send = true;
> > +        }
> > +        memcpy(sid->inmsg + sid->inlen, buf, len);
>
> ...calling memcpy() with argument 1 being a pointer that points
> one past the end of the array. Even though len will be 0 and
> we won't memcpy() anything, this is (depending on how you choose
> to intepret things the C standard doesn't come right out and state
> explicitly) undefined behaviour, because memcpy() wants to be passed
> valid pointers, even if you ask it to do no work with a zero len.
>
> This isn't going to be a visible bug in practical terms, but it would
> make Coverity happy if we either (a) rejected a request with an empty
> length or else (b) skipped the memcpy(). I don't know enough about
> IPMI to know which is better.

thanks
-- PMM

