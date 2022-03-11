Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7114D66D0
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 17:50:43 +0100 (CET)
Received: from localhost ([::1]:47974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSiTS-0004lF-9A
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 11:50:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1nSiRG-0002uZ-NX
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 11:48:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1nSiRC-0002o6-LU
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 11:48:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647017301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7xS3hSeoztSIh3ZFT0hkE4nqGhZDYP02Hu9JlcmRdFI=;
 b=ONP+exISbeeUU4CArplrY9gohXEcKVf9drt6s0m3lIpvOTFpmF/s8HNkMTKjd3M4MdmTZE
 W25iYuJ+XvMEbEegNYNcyk/m6U7r7wuk2ibz5Vddhxu3D/OwGKHvpM58LcGq9eCd7VBhjt
 Oa3xBoLK/Slh/oa1TH+sldIir1rxoPY=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-208-Il5bfCuwMuurmA8udoFcNA-1; Fri, 11 Mar 2022 11:48:19 -0500
X-MC-Unique: Il5bfCuwMuurmA8udoFcNA-1
Received: by mail-oi1-f200.google.com with SMTP id
 k8-20020a0568080e8800b002ccac943a76so6373106oil.15
 for <qemu-devel@nongnu.org>; Fri, 11 Mar 2022 08:48:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=7xS3hSeoztSIh3ZFT0hkE4nqGhZDYP02Hu9JlcmRdFI=;
 b=yukreSJ89yMzWXVNYaDcXl4gPItHX0gdQO1bARAnFz3mnFhiZw51kcTqFAy21UNz9z
 RAp4V17v2dkW5VlKr9J9EwtoFOcKQe8xnEZTLKVm7IS7kP2f8QmrnWoJCrQHsKIkL3qu
 aik64y/AfNu0BkFFSrm43dhwezT/aanZ1PGKCe7jmBUelARTOoTOGkaAc+SnznNaJyHu
 8bV4OAaUU8D1UdS+B/R64PEc/kX1uQ1xconoAhnE14ykr57CvlsgTXVCSgetL3HCXaFj
 tUrWc8i6nlxMUevI9/hwjL79dqq8MV3LbyS9eYII8VMAhOXTIONsT7O+Pni3u89spfVF
 731A==
X-Gm-Message-State: AOAM533G/tOBAFOdJ4CO4KJOpMbKSrvZesoCSo89OJnXY3/t5qYHIoDA
 r2WsVPgyty9gDg1sA5smO/iK9fxbWF0aa/PZOCKUb+LgpH8jlGeWwHtpXGiB0dPViMNRfry03wG
 6SV3/UmhYcqvTZBg=
X-Received: by 2002:a05:6830:2447:b0:5b2:3169:5a4a with SMTP id
 x7-20020a056830244700b005b231695a4amr5392482otr.166.1647017297952; 
 Fri, 11 Mar 2022 08:48:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyj1o/UtpknPwMZkCXV2OBdoBU9o+klNL6o3NuKqagFBO2R2PqZManZx/UFW9toR+bvDXYeVA==
X-Received: by 2002:a05:6830:2447:b0:5b2:3169:5a4a with SMTP id
 x7-20020a056830244700b005b231695a4amr5392443otr.166.1647017297073; 
 Fri, 11 Mar 2022 08:48:17 -0800 (PST)
Received: from localhost ([191.181.58.94]) by smtp.gmail.com with ESMTPSA id
 t15-20020a056808158f00b002e331356c87sm1196356oiw.39.2022.03.11.08.48.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Mar 2022 08:48:16 -0800 (PST)
Date: Fri, 11 Mar 2022 13:48:14 -0300
From: Beraldo Leal <bleal@redhat.com>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH] tests/avocado: starts PhoneServer upfront
Message-ID: <20220311164814.fxzup3bxwzmyweri@laptop.redhat>
References: <20220311130919.2120958-1-bleal@redhat.com>
 <875yokpnbn.fsf@p50.localhost.localdomain>
 <20220311150054.tfn4wtbzm6uhflcu@laptop.redhat>
 <87wnh0xxlz.fsf@p50.localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <87wnh0xxlz.fsf@p50.localhost.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=bleal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=bleal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: thuth@redhat.com, berrange@redhat.com, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 11, 2022 at 11:18:38AM -0500, Cleber Rosa wrote:
> 
> Beraldo Leal <bleal@redhat.com> writes:
> 
> > On Fri, Mar 11, 2022 at 09:28:24AM -0500, Cleber Rosa wrote:
> >> 
> >> Beraldo Leal <bleal@redhat.com> writes:
> >> 
> >> > Race conditions can happen with the current code, because the port that
> >> > was available might not be anymore by the time the server is started.
> >> >
> >> > By setting the port to 0, PhoneServer it will use the OS default
> >> > behavior to get a free port, then we save this information so we can
> >> > later configure the guest.
> >> >
> >> > Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
> >> > Signed-off-by: Beraldo Leal <bleal@redhat.com>
> >> > ---
> >> >  tests/avocado/avocado_qemu/__init__.py | 13 ++++++++-----
> >> >  1 file changed, 8 insertions(+), 5 deletions(-)
> >> >
> >> > diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
> >> > index 9b056b5ce5..e830d04b84 100644
> >> > --- a/tests/avocado/avocado_qemu/__init__.py
> >> > +++ b/tests/avocado/avocado_qemu/__init__.py
> >> > @@ -602,9 +602,8 @@ def prepare_cloudinit(self, ssh_pubkey=None):
> >> >          self.log.info('Preparing cloudinit image')
> >> >          try:
> >> >              cloudinit_iso = os.path.join(self.workdir, 'cloudinit.iso')
> >> > -            self.phone_home_port = network.find_free_port()
> >> > -            if not self.phone_home_port:
> >> > -                self.cancel('Failed to get a free port')
> >> > +            if not self.phone_server:
> >> > +                self.cancel('Failed to get port used by the PhoneServer.')
> >> 
> >> Can you think of a condition where `self.phone_server` would not
> >> evaluate to True?  `network.find_free_port()` could return None, so this
> >> check was valid.  But now with `cloudinit.PhoneHomeServer`, I can not
> >> see how we'd end up with a similar condition.  Instantiating
> >> `cloudinit.PhoneHomeServer` where a port can not be alloccated, AFAICT,
> >> would raise a socket exception instead.
> >
> > Since this is a public method and could be called anytime before
> > set_up_cloudinit(), I decided to keep the check just for safety reasons.
> > Ideally, I would prefer not to have this dependency and add a new
> > argument, but I didn't want to change the method signature since it
> > would be required.
> >
> 
> I'm not sure I follow your point.  Let me try to rephrase mine, in case
> I failed to communicate it: I can't see how "if not self.phone_server"
> is a valid check given that it will either:
> 
> * Contain an instance with a port that is already allocated, OR
> * Not get assigned if cloudinit.PhoneHomeServer() fails (and raises an
>   exception).

You are right, makes sense. I will fix with a v2.

Thanks
Beraldo


