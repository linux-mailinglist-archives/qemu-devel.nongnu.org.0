Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCCB6D7924
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 11:59:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjzvH-0003L2-QH; Wed, 05 Apr 2023 05:59:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pjzvG-0003KX-0y
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 05:59:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pjzvE-0000cH-1n
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 05:59:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680688758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z1RoLdTGjJKknDxS8UDtn94lJcmRP42I+fSSFbPgTSU=;
 b=gpYuFqObAowB0CGE7U/a4ZeGZyCAlCLyqIBpemNgTt+pTrnx0LaYmtXLgGauk1Npd2J+hm
 X9qNzKmvSx11VKj+A4L+hUznudJHLuSnd2B6DMF2MHFwi60mCnzn4dPedv6OZnK1a8KyS9
 UKVbUqLQxKkMYX8ryhqLMtpzXDJ4zoA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-380-lTLVc6WQMMerU5oZzeRcWA-1; Wed, 05 Apr 2023 05:59:17 -0400
X-MC-Unique: lTLVc6WQMMerU5oZzeRcWA-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-946832a17f7so29597266b.2
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 02:59:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680688756;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z1RoLdTGjJKknDxS8UDtn94lJcmRP42I+fSSFbPgTSU=;
 b=o5hjTpCQILydrS+Z2e+JseuvrNaSBGLdIfhPQrmlmeVeWQy9FLTTrduN5lap3sFJ2T
 YenX3QXNEp9Xa5joewJetav1oJS7J+1FhM0TIwmgYoaKcA7Lrbtq2bL8Oo+YLHlFLZEB
 4bmUrSoGNPAAZQU4hYtHq7F5LUQrKU9ngFjWPhnfO0HsJN+f0S8QjgUz8Z6fMmOUaw7G
 339U87RRV/bRdk5nAAvqD2JGObTq/eh4fVVlguX9myuTOWWpOLaDbylRy9gYZsKqJtEH
 OZVfQauGrR+gPqNrZtwlCfsVaov9ftWP2DkziyocJ3/jhNjkYStZUcPNgd40DpfRXkQA
 YETQ==
X-Gm-Message-State: AAQBX9cT5v0bempHq9LaTnekePUYYHnRldbin/opGVPk0dTMfn6H8Vkk
 ibD7dYr6SC8qU2SfkRz0Ftcba66BFCFd+Hdh5bGqktBHq2Qx9wNg9ttCDQb15L7frdHWreZLq0m
 5x783PzQq06HtXWY=
X-Received: by 2002:aa7:d84c:0:b0:502:7d3f:bdbe with SMTP id
 f12-20020aa7d84c000000b005027d3fbdbemr1606381eds.15.1680688756132; 
 Wed, 05 Apr 2023 02:59:16 -0700 (PDT)
X-Google-Smtp-Source: AKy350bCSAkDe0zC+0zfGkyFV7+PF3uRCEfWEqh0OkOCtYBcsYFK3X1T7fUZWEkEFxC1bn3ZjdCzrQ==
X-Received: by 2002:aa7:d84c:0:b0:502:7d3f:bdbe with SMTP id
 f12-20020aa7d84c000000b005027d3fbdbemr1606176eds.15.1680688750256; 
 Wed, 05 Apr 2023 02:59:10 -0700 (PDT)
Received: from redhat.com ([2.52.139.22]) by smtp.gmail.com with ESMTPSA id
 o28-20020a509b1c000000b004aeeb476c5bsm7036514edi.24.2023.04.05.02.59.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 02:59:09 -0700 (PDT)
Date: Wed, 5 Apr 2023 05:59:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, anisinha@redhat.com, jusual@redhat.com,
 kraxel@redhat.com, pbonzini@redhat.com
Subject: Re: [PATCH] acpi: pcihp: make pending delete expire in 5sec
Message-ID: <20230405055833-mutt-send-email-mst@kernel.org>
References: <20230403161618.1344414-1-imammedo@redhat.com>
 <20230403131833-mutt-send-email-mst@kernel.org>
 <20230404102807.4626b0be@imammedo.users.ipa.redhat.com>
 <20230404084603-mutt-send-email-mst@kernel.org>
 <20230404160435.45c2513d@imammedo.users.ipa.redhat.com>
 <20230404104122-mutt-send-email-mst@kernel.org>
 <20230405093020.3cbcd6e7@imammedo.users.ipa.redhat.com>
 <20230405043026-mutt-send-email-mst@kernel.org>
 <20230405112416.38e83b0c@imammedo.users.ipa.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230405112416.38e83b0c@imammedo.users.ipa.redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Apr 05, 2023 at 11:24:16AM +0200, Igor Mammedov wrote:
> > > PS:
> > > See commit message, Windows is not affected as it doesn't
> > > clear GPE status bits during ACPI initialization
> > > (at least the one version I've tested with, and I won't bet
> > > on this with other versions or staying this way)  
> > 
> > So I am saying linux should match windows. Clearing GPE
> > is a bad idea as you then miss events.
> 
> I'd say it depends on if guest OS is able to handle hot[un]plug
> at boot time when it enables GPE handlers (or any other time).
> (My point of view here, it's a guest OS policy and management
> layer should know what installed guest is capable of and what
> quirks to use with it)
> 
> I'll try to send a kernel patch to remove GPEx.status clearing,
> though it might be more complex than it seems,
> hence I'm quite sceptical about it.

In the world of ACPI, windows is basically the gold standard,
whatever it does linux has to do ;)

-- 
MST


