Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B96DC4B9B97
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 09:59:33 +0100 (CET)
Received: from localhost ([::1]:51826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKcdQ-00037s-QI
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 03:59:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nKbyY-0002NT-KS
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 03:17:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nKbyU-0000Jw-RH
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 03:17:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645085831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CJkdgo7A77/X0imCeNq5orro4nYb4ZGrUdQEphPNrtI=;
 b=bXVefa0bK0z1FTXhH83aq4iUN5VeidkQxOipvX7eNSxUOA7/b1QoDwNfx1qM2XcsWdS5UN
 JnlWbgCVECnoBnkxZohZvggqk8a9iLZqVpDm8OpqVN89yqFvzbFzoYfA5TT8rb0Mfvs6I7
 323FygI231AWiLAiUX8+sP8VOhcs3Yw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-568-6JUjWSoAOXS0wSVjiddfZg-1; Thu, 17 Feb 2022 03:17:10 -0500
X-MC-Unique: 6JUjWSoAOXS0wSVjiddfZg-1
Received: by mail-wm1-f69.google.com with SMTP id
 j39-20020a05600c1c2700b0037becd18addso1346444wms.4
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 00:17:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CJkdgo7A77/X0imCeNq5orro4nYb4ZGrUdQEphPNrtI=;
 b=VNCOyp8YspVpwEAbXfLoWxGWbdhOCIYXj4r/C8jpz8hso9211vuRxD5paxNEnRosIu
 IdZFe3OUkNevMSrxWQHA58UeojmfNMRwZyP3ogY1geRrgm2ByPSZBpvoc7gWY3H4KB+d
 9uP8lkVOQhSp+Im4Vz51cPW4ZYUMBEA7paEQcIn6A3H6vyxdO2DQRdrWVhmj3GSZQfiT
 1D7EWVgXSX+SntC73ucQQ6s6vIgfPcdSAvpw6JFGStJib25wNkocaYyXlj5M1+rELbCZ
 v+6b0/NPA6Ae8JLgpr+xdvJMeTslYJ7Q+u+s2hdyGX6G82rO6QJRDqk2Cetty5yseb9O
 +nDQ==
X-Gm-Message-State: AOAM5316tPIbqzg6lLQaguo3NzB/mASUE+u+TxoN/AyVDoiH3wrBNk8Y
 a6TqyHEcXvQQdjpi7QIF2e/28n6oyKvG7vZUzeNLm7LUBUO5rojmJPoeOUALUeJB/Rw5ecu0rd0
 NsZ0d7zBoAszZA+c=
X-Received: by 2002:a1c:4408:0:b0:37b:c7f0:a36e with SMTP id
 r8-20020a1c4408000000b0037bc7f0a36emr1563483wma.186.1645085828756; 
 Thu, 17 Feb 2022 00:17:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyvUSf37RRpP+loqm8umUrVEfRNlqhDIU5iBoIwXGRWnsGLC86Utvtst6p8yQVc/3CGJqQM6Q==
X-Received: by 2002:a1c:4408:0:b0:37b:c7f0:a36e with SMTP id
 r8-20020a1c4408000000b0037bc7f0a36emr1563465wma.186.1645085828516; 
 Thu, 17 Feb 2022 00:17:08 -0800 (PST)
Received: from redhat.com ([2.55.139.83])
 by smtp.gmail.com with ESMTPSA id l5sm547452wmq.7.2022.02.17.00.17.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 00:17:08 -0800 (PST)
Date: Thu, 17 Feb 2022 03:17:04 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 3/3] x86: Switch to q35 as the default machine type
Message-ID: <20220217031311-mutt-send-email-mst@kernel.org>
References: <20220215162537.605030-1-dgilbert@redhat.com>
 <20220215162537.605030-4-dgilbert@redhat.com>
 <YgvtLmoJcv+ZSW1S@redhat.com>
 <20220216105808.77kqhmsagz3ej74h@sirius.home.kraxel.org>
 <YgzZhHKSAFYTYFDc@work-vm>
 <db583712-cd6e-d67d-ad98-989a9867499a@redhat.com>
 <Yg03HB5KHGYWyI0J@work-vm>
 <f5ea8b34-2d50-c0d7-4ec0-ff0921dbcbd4@redhat.com>
 <20220217080852.omqkckc5i2lav7gb@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20220217080852.omqkckc5i2lav7gb@sirius.home.kraxel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: eduardo@habkost.net, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 quintela@redhat.com, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 17, 2022 at 09:08:52AM +0100, Gerd Hoffmann wrote:
>   Hi,
> 
> > Other heretic question: Should we maybe get rid of the default machine type
> > for *all* targets? ... so that we do not continue to run into this issue
> > again and again and again...
> 
> /me votes "yes".
> 
> take care,
>   Gerd

Well originally qemu tried to be friendly and to just create
a reasonable machine when given a disk, to the point where
it would even set up some networking by default.

And I think it's not a bad idea, forcing everyone to specify a bunch of
boilerplate does not really result in people researching which machine
type is good for them, people instead just copy paste from a random
website.

So maybe we can detect that basic usage somehow (I only have some
vague ideas) and then set a bunch of defaults that we consider
best?

-- 
MST


