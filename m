Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 741D86647D7
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 18:57:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFIly-0000XZ-Nb; Tue, 10 Jan 2023 12:50:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pFIlw-0000VQ-FF
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 12:50:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pFIlu-0004aG-Ok
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 12:50:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673373049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y0gP4TuSdmmkwc6KaCt3EEFN0GKpf0v+bXFFXmejAWk=;
 b=T/3PxB8gfkKlci2B28FR6LJKLbBkXB7xtInxNqq9+CM2OTQ8DaK9bGTEc1ahyVskEb6xS2
 mNXbbrEYvnP9WWwI+tQb6yqvx0DWgKHTVAilDRmg3wNyCQOBmYci98zD+nIMgtMduFZ6qi
 W/cDl0RCKRH9KqXMY7XG94Y2kvOLaxM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-564-N6E5JRgANWuPsi4v0O7oPA-1; Tue, 10 Jan 2023 12:50:48 -0500
X-MC-Unique: N6E5JRgANWuPsi4v0O7oPA-1
Received: by mail-wr1-f71.google.com with SMTP id
 t2-20020adfa2c2000000b002bbdae91832so1750463wra.21
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 09:50:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y0gP4TuSdmmkwc6KaCt3EEFN0GKpf0v+bXFFXmejAWk=;
 b=iyv/cEMV0K549xKo9WjCSJd/7drtfuJB2a4sIbfR/wFRwhHRmYurabGe5hyML+3U9I
 vXv4WwqlzIcK5RN4JOhr/rVcgEVWTfGrJuY3DgibJm9A91FtoKREgJCpr4QlA0T6H7Ur
 h5nlDhJ8YwP2vs72+Wq9gBgEO/6ERVWVJ8AQNfEGa7zobuasySS7wYrFGhao2XII1yPL
 6e3BGiNslPGWBrPNFiywup8ixbg5GNagqoaS65YeBWlOslOEXGZjLIv6/kwUk3GMsIr6
 7D7nFstCHEC3ikhDEuveNtU/ebaDpfcV/8oBdBbCAVnchALp+Xb24ZpV+sIOEScQWENW
 atlQ==
X-Gm-Message-State: AFqh2koQD/BRPJcnF6zH1mQ0AGF6Ovt1q2q2gezGk6n5Njm+rccK5RfL
 kpAEhEhkz+ryd8vh1/aLKGLtlN6fh8OdnEpQijm1NK56wTHjZ7G9Jeap8kdPhSpT0UFtvEI0b0+
 BZefHCh3QfR/ZY+Y=
X-Received: by 2002:a05:600c:4f55:b0:3cf:7197:e67c with SMTP id
 m21-20020a05600c4f5500b003cf7197e67cmr48867182wmq.25.1673373047062; 
 Tue, 10 Jan 2023 09:50:47 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvN964VE6oMySWoqJrzCnjxDgFwqSfUtTAVuzagOxt9lf8/p2lV4qr1sVhbBV6+EkrtpifeNw==
X-Received: by 2002:a05:600c:4f55:b0:3cf:7197:e67c with SMTP id
 m21-20020a05600c4f5500b003cf7197e67cmr48867174wmq.25.1673373046903; 
 Tue, 10 Jan 2023 09:50:46 -0800 (PST)
Received: from redhat.com ([2.52.137.155]) by smtp.gmail.com with ESMTPSA id
 f11-20020a05600c4e8b00b003d04e4ed873sm23138292wmq.22.2023.01.10.09.50.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 09:50:46 -0800 (PST)
Date: Tue, 10 Jan 2023 12:50:42 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 pbonzini@redhat.com, ebiggers@kernel.org,
 Mathias Krause <minipli@grsecurity.net>, qemu-devel@nongnu.org
Subject: Re: [PATCH qemu v3] x86: don't let decompressed kernel image clobber
 setup_data
Message-ID: <20230110125005-mutt-send-email-mst@kernel.org>
References: <Y69fUstLKNv/RLd7@zx2c4.com>
 <20221230220725.618763-1-Jason@zx2c4.com>
 <Y72FmQlNwBsp8Ntc@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y72FmQlNwBsp8Ntc@zx2c4.com>
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

On Tue, Jan 10, 2023 at 04:34:49PM +0100, Jason A. Donenfeld wrote:
> Hi Michael,
> 
> Could you queue up this patch and mark it as a fix for 7.2.1? It is a
> straight-up bug fix for a 7.2 regression that's now affected several
> users.

OK. In the future pls cc me if you want me to merge a patch. Thanks!

> - It has two Tested-by tags on the thread.
> - hpa, the maintainer of the kernel side of this, confirmed on one of
>   the various tributary threads that this approach is a correct one.
> - It doesn't introduce any new functionality.
> 
> For your convenience, you can grab this out of lore here:
> 
>   https://lore.kernel.org/lkml/20221230220725.618763-1-Jason@zx2c4.com/
> 
> Or if you want to yolo it:
> 
>   curl https://lore.kernel.org/lkml/20221230220725.618763-1-Jason@zx2c4.com/raw | git am -s
> 
> It's now sat silent on the mailing list for a while. So let's please get
> this committed and backported so that the bug reports stop coming in.
> 
> Thanks,
> Jason
> 
> 


