Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3BE6ACCC5
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 19:36:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZFfq-0001ck-De; Mon, 06 Mar 2023 13:35:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZFfg-0001Td-2l
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 13:34:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZFfe-0002rg-Dj
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 13:34:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678127689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sXY8fIne7uF/sJap6bA4nxbUXJFeceVNHkhtd86CBQk=;
 b=LqIETURl307lP8p+aJgvWKLiHBJlMUNSkOFiKBFIgmriF3RwjFmShQ0M44FI1YthNJJ5ay
 ZHptoZagX2uWIe+AAk3MP5UPiHnA5ZQY3z0XbDrQoEqBQhZWkT37zhqTjxElOu6VJjggTS
 4PM0lrJV+ulb86J5bg7QH57inPC1Vp4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-zhYUKiaEMZOwNukqo0o8ow-1; Mon, 06 Mar 2023 13:34:47 -0500
X-MC-Unique: zhYUKiaEMZOwNukqo0o8ow-1
Received: by mail-wm1-f70.google.com with SMTP id
 u19-20020a05600c00d300b003eb24ce58ceso3906384wmm.9
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 10:34:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678127686;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sXY8fIne7uF/sJap6bA4nxbUXJFeceVNHkhtd86CBQk=;
 b=N4xzxIC955WB77K2teee/vd1OYhXQkQsZFAr78UyTBIAMHskc2n5HLAx+lPpX8LBfG
 RV+LCyTDP0TC7EYgnzvt5DdQkTRV5eTuMm7lAecKC1QRawR0t8AntGD0wHaNS0WSeWVc
 RI33npeLjOVJtd9n4S0AllR/qIi4h9/8m0a2UV1/68OXcMZxrs0zWVX4EyM0WkP690o1
 58UT2HA4B/fLY+Ixs4I1UYITAbU39RMJYavrbVayTiXjDw3tvbVMrMZEYSULj8OISm7b
 9mZhYE6mTC1mD5FlqD4IzMov480ioa/pfNNYQ9/H/0qt42Ej0FXS/sL4e/h+F+9pjpzN
 j5Cg==
X-Gm-Message-State: AO0yUKXf9Hv6XdHgx+eKResm3SodvHuuPGZyEJ7hzxvg9CoqNsl+2Wsa
 5EA/U4P/OTF/dCGMWKCdVfcip0+b1I7eHz0wc4/rHPs3ElJEXOSR/ZeVC87BbV9hnf54EZFjVY9
 9lP5YsCQHTe+TAxc=
X-Received: by 2002:a05:600c:470b:b0:3e0:98c:dd93 with SMTP id
 v11-20020a05600c470b00b003e0098cdd93mr10576764wmo.29.1678127686632; 
 Mon, 06 Mar 2023 10:34:46 -0800 (PST)
X-Google-Smtp-Source: AK7set+DlWkM41wcwBQrDSIme+7zqhqTZJ9Fmi/z8p8zFUY3He6b+u+RP+jjOQ0ZV9Rsr1btOmTUzw==
X-Received: by 2002:a05:600c:470b:b0:3e0:98c:dd93 with SMTP id
 v11-20020a05600c470b00b003e0098cdd93mr10576747wmo.29.1678127686375; 
 Mon, 06 Mar 2023 10:34:46 -0800 (PST)
Received: from redhat.com ([2.52.23.160]) by smtp.gmail.com with ESMTPSA id
 z26-20020a1c4c1a000000b003eb395a8280sm14767480wmf.37.2023.03.06.10.34.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 10:34:45 -0800 (PST)
Date: Mon, 6 Mar 2023 13:34:42 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH] hw/acpi: Set memory regions to native endian as a work
 around
Message-ID: <20230306133246-mutt-send-email-mst@kernel.org>
References: <d9fcba9d-c2c6-5be3-ce5f-baf5a116bbc4@eik.bme.hu>
 <20220119041842-mutt-send-email-mst@kernel.org>
 <20220222094021-mutt-send-email-mst@kernel.org>
 <f9f183c4-b0b8-22c6-57f9-1b6b20e8e5a5@eik.bme.hu>
 <20230220172659-mutt-send-email-mst@kernel.org>
 <f4e755b6-051e-103f-b8bc-2765d277633f@eik.bme.hu>
 <e3a19d91-b9ef-9352-8f60-35432fdf5d1e@redhat.com>
 <c2bdd618-5077-3b3f-12d0-974cf9757692@eik.bme.hu>
 <c465a44a-1ff6-5118-516c-56a8f99b9509@redhat.com>
 <485be109-57a5-178a-1ac6-291fd05d9baa@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <485be109-57a5-178a-1ac6-291fd05d9baa@eik.bme.hu>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Thu, Mar 02, 2023 at 02:42:17PM +0100, BALATON Zoltan wrote:
> On Tue, 21 Feb 2023, Paolo Bonzini wrote:
> > On 2/21/23 13:48, BALATON Zoltan wrote:
> > > My patch works and don't see what else could it break.
> > 
> > I strongly suspect that your patch, while fixing access to one byte of
> > the (2-byte) registers, breaks access to the other byte.
> > 
> > Thanks for the reproduction instructions, I'll take a look.
> 
> Any chance this can still be fixed? As a bugfix we may have one more week
> maybe.
> 
> Regards,
> BALATON Zoltan

I'm not holding my breath for a fix ATM but I am also not really willing
to change this for everyone and risk breaking weird configs such as BE
hosts.

How about propagating a flag from pegasos saying "enable memory core bug
workaround"?

-- 
MST


