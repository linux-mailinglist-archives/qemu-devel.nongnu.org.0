Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF21A5B9BCB
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 15:25:23 +0200 (CEST)
Received: from localhost ([::1]:48176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYorq-0000Y1-SR
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 09:25:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oYogy-0007DW-GZ
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 09:14:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oYogu-0002qA-Ix
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 09:14:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663247643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jHoL0sm1x6fBJuED0zxvaeNa5dbsYOXhMm396L44gqc=;
 b=aJk+iHb8V0ePgEgL0ghwgYW4I3Uoeii+NEEprroWmN1RH7eN+UBOTBJIEBjXx7dsh4Rp/m
 QgH7M4MEd6UEJP9fhyrcsI5ZEXrwbCV3zwftytxcPNWXcWvNIeHVZi7cEdIRJZu9s7Q81Q
 kBpgojeEtyaFtN3jAGA2xsbRFedTFZE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-438-xxAQMhHEPLKNR080wS4hcg-1; Thu, 15 Sep 2022 09:14:01 -0400
X-MC-Unique: xxAQMhHEPLKNR080wS4hcg-1
Received: by mail-wr1-f71.google.com with SMTP id
 s5-20020adfa285000000b0022ad5c2771cso489498wra.18
 for <qemu-devel@nongnu.org>; Thu, 15 Sep 2022 06:14:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=jHoL0sm1x6fBJuED0zxvaeNa5dbsYOXhMm396L44gqc=;
 b=ZqIBB1fEgK3mSOAoQS8fysfOadSlvPlUSTvT3QbkC/48++XDwSErJZjDO2FVgqbWkC
 fFfUKyWn0Y9/m/aY5nTvWqPZRu3ib4WiGRrvotxWPgzbQTtOguVsdBfHSVf6zUPc1V4Z
 mQTWYJPoZodFroDJ/RI8JmPqzKWm8whSeT8Of+PfRyrioZ8npIRukoQY3Xx8DpBMc0kg
 C4kRp0qLHaSakCFEysHzonbhkDUU6T7guDDR25IkyhlfYyPKdp00h/Xc3olW+loWJG+D
 61Ogg0qjnX4fjzUfBZdFxFVh4rXflkWvcpaLMyL4+I5aJtCTTilp0ejnxNcNuB0bsr5Z
 wRUg==
X-Gm-Message-State: ACgBeo3iKJ0n9vxHBt8O022BB6gwlZbm8QuOryG1xswN8JF/UBWyKXUB
 21M9dEJWVoc+CN8cxo/ePd/EyOrof8q1kAYmyZEWB4LRISuLwe10o3hxb81j3H9XLsXwyaOtWhZ
 s1+LA2OW5iSSXA0s=
X-Received: by 2002:a05:600c:5493:b0:3b4:6db5:aeef with SMTP id
 iv19-20020a05600c549300b003b46db5aeefmr6724204wmb.31.1663247639970; 
 Thu, 15 Sep 2022 06:13:59 -0700 (PDT)
X-Google-Smtp-Source: AA6agR71L1On5DDzP8yLF3cHvIkRWxsel4NAwhv0KlQAuc0wzkGDNup4Y9fYZeAER8WAiNFVvWvZ/g==
X-Received: by 2002:a05:600c:5493:b0:3b4:6db5:aeef with SMTP id
 iv19-20020a05600c549300b003b46db5aeefmr6724193wmb.31.1663247639767; 
 Thu, 15 Sep 2022 06:13:59 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 f7-20020a05600c4e8700b003b31fc77407sm3492115wmq.30.2022.09.15.06.13.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 06:13:59 -0700 (PDT)
Date: Thu, 15 Sep 2022 14:13:57 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, armbru@redhat.com
Subject: Re: [PATCH] hmp: Fix ordering of text
Message-ID: <YyMlFdR+iFtGTX8G@work-vm>
References: <20220913101041.99869-1-dgilbert@redhat.com>
 <YyMTEijc2a+BBKMq@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YyMTEijc2a+BBKMq@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> On Tue, Sep 13, 2022 at 11:10:41AM +0100, Dr. David Alan Gilbert (git) wrote:
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > 
> > Fix the ordering of the help text so it's always after the commands
> > being defined.  A few had got out of order.  Keep 'info' at the end.
> > 
> > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > ---
> >  hmp-commands.hx | 46 +++++++++++++++++++++++-----------------------
> >  1 file changed, 23 insertions(+), 23 deletions(-)
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

Thanks, and queued
> 
> With regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


