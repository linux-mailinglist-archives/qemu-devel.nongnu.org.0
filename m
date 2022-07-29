Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C61585322
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 17:58:32 +0200 (CEST)
Received: from localhost ([::1]:35214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHSNi-0004fh-Mr
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 11:58:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1oHSM6-0002o4-Ue
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 11:56:50 -0400
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c]:37535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1oHSM5-0000vF-7N
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 11:56:50 -0400
Received: by mail-qt1-x82c.google.com with SMTP id l14so3598937qtv.4
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 08:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=D+UCyyTE9S7UgorlIlTwR6/AMil96zpXZYGTLEKWcTk=;
 b=X1W1CqVuie0gGFctqsATqHI8L79X5PXcMfkbYYU/CuFiEosSRga4I7w/6XAuPuwaXT
 X5gkpZOaLmn6DVFhyprbTYr8B9aN01YdUt30ywtzh2ehgYBjEisbX/dO86p9e/00VEGb
 dcnfQ+nnarx7oonRm38AP3yNUEvuL/mSETzZVS+ioVmzT5jm3Lv4ajM0iB4UxB9V+Zxg
 mW0NDVPwAxE6NmrVpg6KQ4hLEIf+XoVbrS8CwV00kFb77qlnbebGCoO+3C3MZGQEBjSe
 D2RB/fCQFMRmoy9IP2B9LHKDSQ34DZxGN1xv4QaO/HkA3qsC1vNPCKRsaraQqAP7OE17
 X68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to;
 bh=D+UCyyTE9S7UgorlIlTwR6/AMil96zpXZYGTLEKWcTk=;
 b=ZFGuwq9Q/htybjUQ/ol6QcdTE036WcMInfUiH7NRWCYvw9Dzcs/4/z848WCLAGpW+d
 FdkXU/csdZ1jS8EE85I++eYck2COqsug5/MFvjDy3P80eVS4YSy4rqEdAJzA91BkWyxW
 pjBcPiV+Rq/OA8d+WeSj2B6np3uuI28wCT6xr9uE984gRNHkEjqAwm01QLYzSKfFvrhN
 BtqIph+Q6sZtzxJdjONEn+xIWPhfwVtFcbO/MNOfpsALRv2zpV4RLYXOWgR/KOYvC2rc
 boV/iQAVk5VJjchr3i7P9nmXaWqZ5/VHehRqofpDZk3EVjNOxEP6wuSiO+bib2t4R9+u
 gAQw==
X-Gm-Message-State: AJIora/lFlSUxk90Yag0gf7uXvU8ax2MwbU+9ajB7oZ0w6VY7mWbSjCv
 fiqNXozqCzytMWgmEj1dTpnf7mPo5g==
X-Google-Smtp-Source: AGRyM1tb9oBENrs5ycRoiadjjh3Y37tZf3PKqqlFVgpINetIkJx2VIyDqQaC8lvtyFwM56DvdFDcWA==
X-Received: by 2002:ac8:5f06:0:b0:31e:e2b8:67c3 with SMTP id
 x6-20020ac85f06000000b0031ee2b867c3mr4012842qta.620.1659110207799; 
 Fri, 29 Jul 2022 08:56:47 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id
 bs8-20020a05620a470800b006a34a22bc60sm2737086qkb.9.2022.07.29.08.56.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 08:56:47 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:391a:8024:6c96:ac89])
 by serve.minyard.net (Postfix) with ESMTPSA id AFD6B180052;
 Fri, 29 Jul 2022 15:56:45 +0000 (UTC)
Date: Fri, 29 Jul 2022 10:56:44 -0500
From: Corey Minyard <minyard@acm.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 "M : Marcel Apfelbaum" <marcel.apfelbaum@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH 12/15] ipmi: Add an SMBus IPMI interface
Message-ID: <20220729155644.GY3834@minyard.net>
References: <20190919213924.31852-1-minyard@acm.org>
 <20190919213924.31852-13-minyard@acm.org>
 <CAFEAcA88GqrqoENf8NHxeNgTjj-jutz8Kspk43L1gp_VJJdh+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA88GqrqoENf8NHxeNgTjj-jutz8Kspk43L1gp_VJJdh+Q@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=tcminyard@gmail.com; helo=mail-qt1-x82c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-To: minyard@acm.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 28, 2022 at 05:21:44PM +0100, Peter Maydell wrote:
> On Thu, 19 Sept 2019 at 22:39, <minyard@acm.org> wrote:
> >
> > From: Corey Minyard <cminyard@mvista.com>
> >
> > Signed-off-by: Corey Minyard <cminyard@mvista.com>
> > ---
> 

Thank you for the ping.  Comments inline...

> Very old patch, but Coverity has decided it doesn't like something
> in this function that's still basically the same in the current codebase
> (CID 1487146):
> 
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

Hmm.  In some cases you have to accept a zero-length packet (as
described in the comments), but if you said:

  if (len > 0)
      memcpy(sid->inmsg + sid->inlen, buf, len);

would that make Coverity happy?  I was under the impression that if you
passed zero into len, you could pass anything into the data on a memcpy.
But apparently not; I can make this change.

-corey

> 
> > +        sid->inlen += len;
> > +        break;
> > +    }
> > +
> > +    if (send && sid->inlen) {
> > +        smbus_ipmi_send_msg(sid);
> > +    }
> > +
> > +    return ret;
> > +}
> 
> thanks
> -- PMM
> 

