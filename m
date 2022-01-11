Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2214C48AF76
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 15:25:05 +0100 (CET)
Received: from localhost ([::1]:37442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7I59-0000rF-Ob
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 09:25:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1n7HiJ-0004gP-Hj
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 09:01:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1n7HiA-0008Qq-Kq
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 09:01:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641909675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pqYmuyulXM4nd3Uc4e4NB+0oCsDMpC2Jz+d/erh44sA=;
 b=CP15cTFQt+C6BKDqHbS3AAHBHRzAkyb72j7NoyCeBKgQ1+T5Q28eL98DPbAJM0x+if8Ala
 yCzTtmJz/zavniDcaYGtzM2ltZnSiE3I2VBZgxV38WargQkiXSq9bedT9+IWT75a1haBRZ
 HtcUhdMcE6dtNIgKo9CcVgFDC417zp4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-115-UE5VALh9MJSJzKXgSqJeyA-1; Tue, 11 Jan 2022 09:01:13 -0500
X-MC-Unique: UE5VALh9MJSJzKXgSqJeyA-1
Received: by mail-wm1-f71.google.com with SMTP id
 v185-20020a1cacc2000000b0034906580813so1602346wme.1
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 06:01:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=pqYmuyulXM4nd3Uc4e4NB+0oCsDMpC2Jz+d/erh44sA=;
 b=P4NXuE4DFfbGPl/xaK6S50JfNACW8SETlWSCAD1kdjVX9VWHkAGogRNTbVqXN/DGx3
 zEyqLuxYmUPNxkzUuOZTOFux92plxy/qPox69K44U3HRGgtzK1fzmnaQb4IOKwAz2T8N
 KG84PgqV2XcbBSIoHXUNAlMMrOHzOZCXe/fuZwYtnm6tb7iwZJ79lGqvgJE6lyeowzUq
 cHWc857gRSK0G9RH6Fhg3QNiEBO1Q8gGiHJrXysmsiSFj5hVmdyAPijkpfbF0YzKm9l+
 R6gTFyhTJSWwc/lt9dbA1Y2Rb9XMtYPKD4f+05jQBcRKhSI1/Z5D5A2xbGfi3VPAP9cE
 Rsgw==
X-Gm-Message-State: AOAM532jS2vIuLkW48R+cBIBHPntqbEgdKVZjDcfE17bIdITLkuboFvA
 qY1Q0cmofEwuSQ0On2cEObfuHHAzSUcLcLRo+rzzckIhKMjyo3SjnWviGOoc0TH1d+IHux0rB7k
 /ak1Crb5wqCcLX3A=
X-Received: by 2002:a1c:9d54:: with SMTP id g81mr2653864wme.51.1641909672672; 
 Tue, 11 Jan 2022 06:01:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzyQBEKis3j638zuRMnBkG5T6TNrqUC3WXdEnku7TXzJbzpi9Wp+HqZ0oUmT8fd0xFyAOQkbQ==
X-Received: by 2002:a1c:9d54:: with SMTP id g81mr2653856wme.51.1641909672497; 
 Tue, 11 Jan 2022 06:01:12 -0800 (PST)
Received: from work-vm (82-132-238-227.dab.02.net. [82.132.238.227])
 by smtp.gmail.com with ESMTPSA id s1sm1699949wmh.35.2022.01.11.06.01.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 06:01:12 -0800 (PST)
Date: Tue, 11 Jan 2022 14:01:09 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] clock-vmstate: Add missing END_OF_LIST
Message-ID: <Yd2NpdtUt2hRzYgu@work-vm>
References: <20220111101934.115028-1-dgilbert@redhat.com>
 <CAFEAcA-e61v6nTzH=Ep-KMVCJsVA=17O8CtDCLyk5DOtjVNgGw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-e61v6nTzH=Ep-KMVCJsVA=17O8CtDCLyk5DOtjVNgGw@mail.gmail.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: damien.hedde@greensocs.com, alex.bennee@linaro.org, luc@lmichel.fr,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Tue, 11 Jan 2022 at 10:19, Dr. David Alan Gilbert (git)
> <dgilbert@redhat.com> wrote:
> >
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> >
> > Add the missing VMSTATE_END_OF_LIST to vmstate_muldiv
> >
> > Fixes: 99abcbc7600 ("clock: Provide builtin multiplier/divider")
> > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > ---
> >  hw/core/clock-vmstate.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/hw/core/clock-vmstate.c b/hw/core/clock-vmstate.c
> > index 9d9174ffbd..7eccb6d4ea 100644
> > --- a/hw/core/clock-vmstate.c
> > +++ b/hw/core/clock-vmstate.c
> > @@ -44,6 +44,7 @@ const VMStateDescription vmstate_muldiv = {
> >      .fields = (VMStateField[]) {
> >          VMSTATE_UINT32(multiplier, Clock),
> >          VMSTATE_UINT32(divider, Clock),
> > +        VMSTATE_END_OF_LIST()
> >      },
> >  };
> 
> Oops :-(
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> We could maybe make this kind of bug more likely to be detected by
> instead of having the terminator be an "all zeros" VMStateField,
> having it check both for name == NULL and for a magic number in the
> VMStateFlags field. That way (assuming something in "make check"
> causes us to do a scan through every registered vmstate struct)
> forgetting the terminator will be likely to cause us to crash or hang
> rather than finding some 0 data and thinking that's the
> terminator.

Yeh, let me see what I can come up with for that.

Dave

> thanks
> -- PMM
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


