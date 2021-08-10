Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 863643E57E6
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 12:02:37 +0200 (CEST)
Received: from localhost ([::1]:48452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDOai-0004qe-9n
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 06:02:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mDOZt-000400-8L
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 06:01:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mDOZq-000381-V1
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 06:01:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628589702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BKsTyRBfaQSCzarDwxlFKY1IPnHILmi9rMmOyC0BfGM=;
 b=C8UpVZum9BJhdou9wuG5NlRpilOhZ2CsovdZLNmu2K20Fq4ovMWWd/jFbOmPBrib93Qr9H
 HG5cEv/tK0WHjVodjA59uKop6j8vNb9tnGTUbJUrVsTti8l+xUrdT5zm9JG9GoAsZb+kPL
 ZcYzlYS9m5+JT8TovUdwu6c4XO5kD6U=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-V2Fj98nUPNKfkr80E4wY7Q-1; Tue, 10 Aug 2021 06:01:41 -0400
X-MC-Unique: V2Fj98nUPNKfkr80E4wY7Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 e17-20020adfa4510000b02901550e0550f3so237267wra.11
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 03:01:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=BKsTyRBfaQSCzarDwxlFKY1IPnHILmi9rMmOyC0BfGM=;
 b=mJ8C4UxDJMHHeULx1KM9SWavv/4STjNHyvq2ADbJSjOWtlVyKwroeG6xKFWKRbohvF
 doBHQC9ttRg3qxnOgGRHzdpoR2TcOyW6lCIEooua3Lh3TnwhLNe29AXxI9dIHR/ZTLFL
 fHVuGNvYmmMOSwFuJ5S7IuIGCCAyrdTDbSDyVr3a+v57jBvLiD27hhRV2l3F3MMkq6Nu
 5aydPKOVi3okUbncSxMguJqGegmJG/5AR50h/LfuFSKfm57bbOznhBz6b/GshHB8Vir1
 aNlCVHK3CbiNuMqnIih1e8c41DObI/F5zoGVDPzKxLuHe1OMdbfkUqKHKw2tnBFDvXYu
 J87g==
X-Gm-Message-State: AOAM5339rve0RxbfyammPo8wybRdn3ibDMXFsDh2mgnfWFp1m8miP5Jl
 1e/O8BW1Cc4Re6/y+1lJlothKRbN1OFIrpWGn1K8bPgSHjQlPiwJ1slFYWbYvywx91pine4cSz/
 vqq3HSFubKvxA/oA=
X-Received: by 2002:a05:6000:18a4:: with SMTP id
 b4mr6051563wri.162.1628589699897; 
 Tue, 10 Aug 2021 03:01:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSk/iNZm43oPT+w32V5Lkvkm25RPsJ8mzbWFIPDYrGzDLSaYz2vC+Te8WreQllKQ6wVG8HvA==
X-Received: by 2002:a05:6000:18a4:: with SMTP id
 b4mr6051533wri.162.1628589699623; 
 Tue, 10 Aug 2021 03:01:39 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id z17sm1524498wrr.66.2021.08.10.03.01.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 03:01:39 -0700 (PDT)
Date: Tue, 10 Aug 2021 11:01:37 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-stable@nongnu.org
Subject: Re: [PATCH] audio: Never send migration section
Message-ID: <YRJOgT08qsnO6PhT@work-vm>
References: <20210809170956.78536-1-dgilbert@redhat.com>
 <YRFiDMlKFQ/Kxrhx@redhat.com>
 <bedb4670-4e44-2d69-c611-3bf3bdce6587@redhat.com>
MIME-Version: 1.0
In-Reply-To: <bedb4670-4e44-2d69-c611-3bf3bdce6587@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: kraxel@redhat.com,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Philippe Mathieu-Daudé (philmd@redhat.com) wrote:
> On 8/9/21 7:12 PM, Daniel P. Berrangé wrote:
> > On Mon, Aug 09, 2021 at 06:09:56PM +0100, Dr. David Alan Gilbert (git) wrote:
> >> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> >>
> >> The audio migration vmstate is empty, and always has been; we can't
> >> just remove it though because an old qemu might send it us.
> >> Changes with -audiodev now mean it's sometimes created when it didn't
> >> used to be, and can confuse migration to old qemu.
> 
> Not a 6.1 regression but easy change for rc3 IMO.
> 
> >> Change it so that vmstate_audio is never sent; if it's received it
> >> should still be accepted, and old qemu's shouldn't be too upset if it's
> >> missing.
> 
> Worth Cc: stable@ maybe?

Hmm yes, cc'd this reply.

Dave

> >> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> >> ---
> >>  audio/audio.c | 10 ++++++++++
> >>  1 file changed, 10 insertions(+)
> > 
> > Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> > Tested-by: Daniel P. Berrangé <berrange@redhat.com>
> > 
> > 
> > For testing I have a VM with -audiodev, but *WITHOUT* any sound
> > frontend devices. Live migrating to a QEMU using QEMU_AUDIO_DRV
> > would previously fail. With this applied it now works, showing
> > that we dont uncessarily send this.
> > 
> > I also tested migration to a QEMU with -audiodev, but without
> > this patch, and that still works as before, showing that QEMU
> > is happy if this section is not sent.
> > 
> >>
> >> diff --git a/audio/audio.c b/audio/audio.c
> >> index 59453ef856..54a153c0ef 100644
> >> --- a/audio/audio.c
> >> +++ b/audio/audio.c
> >> @@ -1622,10 +1622,20 @@ void audio_cleanup(void)
> >>      }
> >>  }
> >>  
> >> +static bool vmstate_audio_needed(void *opaque)
> >> +{
> >> +    /*
> >> +     * Never needed, this vmstate only exists in case
> >> +     * an old qemu sends it to us.
> >> +     */
> >> +    return false;
> >> +}
> >> +
> >>  static const VMStateDescription vmstate_audio = {
> >>      .name = "audio",
> >>      .version_id = 1,
> >>      .minimum_version_id = 1,
> >> +    .needed = vmstate_audio_needed,
> >>      .fields = (VMStateField[]) {
> >>          VMSTATE_END_OF_LIST()
> >>      }
> >> -- 
> >> 2.31.1
> >>
> > 
> > Regards,
> > Daniel
> > 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


