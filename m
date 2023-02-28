Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3F26A5502
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 10:01:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWvqv-0002RZ-P8; Tue, 28 Feb 2023 04:00:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pWvqh-0002Lu-Tt
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 04:00:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pWvqg-0004Ms-I5
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 04:00:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677574837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xRtxoAuLpdApFzU8iSpQxKbbqyyyhWT3y9LXsZFTdMo=;
 b=OvM36E8XKXQ1WUt87eNzGf06Aioa8rbjZIfiuHuJUDK3J4IVwPJnUczsIUjPWgnZtSNTV2
 1Awj+/DFWTnngSd6V2qq9J1jSfCevMV4BpVpSh1lBPiLHGdSZVgZ8c5h9ayM+I8wYzx5+E
 Ra4o1YlxKgiWh5t65VTX5ohQf9vg7w4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-39-sX99joS3MPuyP61AOF9c4A-1; Tue, 28 Feb 2023 04:00:33 -0500
X-MC-Unique: sX99joS3MPuyP61AOF9c4A-1
Received: by mail-ed1-f71.google.com with SMTP id
 eh16-20020a0564020f9000b004acc4f8aa3fso12780241edb.3
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 01:00:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677574832;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xRtxoAuLpdApFzU8iSpQxKbbqyyyhWT3y9LXsZFTdMo=;
 b=2kd/SqhQkSoWxrkUr7JAso7doagj8bAd2H1eHAtFJOEyRqNUH5L6T0mo7DLEQtf75b
 5xFipvcbjr49Fbf5I2XIHQy8wzME8bBwsX597Dyf3r7jo5QF7+ryrtGgBLqtuQ4fD4wn
 UT+61lLIk0UkzwrrK/rAAgWobpdBX+RuHkSVdsSLvB/i/w+4ee5KTQrOqtSPRxySrJFB
 MIRrXLFQhC2iK8oDwJISSXKXnuwSzMWT16JelFzeWgo+oXnR4qUGUUfQ6VKaoBHg+9+E
 uu4E2aKNNK+oQLOqnJLAGmurY7tvz56XNX4j/9bNJr8FOwB5S2dU5zeKv3Hjudzxy1ff
 LQ3g==
X-Gm-Message-State: AO0yUKUDUwyZLooBl1vDaZa+iBFfXZ0J3uTbmqO1dvbrhqfgaVeK9/Dp
 ZeeHR5ucXPMjgUzhImVCzJm4NZmTa/IzTQ71Q848Zm1LB9/cNZ2ITrygFZ49dWjkbmga0Bhqioq
 rp9RFxp6n4OWSCz4=
X-Received: by 2002:a17:906:9e11:b0:88b:a30:25f0 with SMTP id
 fp17-20020a1709069e1100b0088b0a3025f0mr1283984ejc.32.1677574832249; 
 Tue, 28 Feb 2023 01:00:32 -0800 (PST)
X-Google-Smtp-Source: AK7set/J1+Ld8LsWEB2TwMozBSOMY+fwEhTxfYILgVCVw7dPM0D6ohU2PzN3oITfWaroDadG9uKo1w==
X-Received: by 2002:a17:906:9e11:b0:88b:a30:25f0 with SMTP id
 fp17-20020a1709069e1100b0088b0a3025f0mr1283970ejc.32.1677574831962; 
 Tue, 28 Feb 2023 01:00:31 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 gg16-20020a170906e29000b008d044ede804sm4189754ejb.163.2023.02.28.01.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 01:00:31 -0800 (PST)
Date: Tue, 28 Feb 2023 04:00:27 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
 libvir-list@redhat.com, xen-devel@lists.xenproject.org,
 Reinoud Zandijk <reinoud@netbsd.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
Message-ID: <20230228035958-mutt-send-email-mst@kernel.org>
References: <20230227111050.54083-1-thuth@redhat.com>
 <20230227111050.54083-2-thuth@redhat.com>
 <Y/yY72L9wyjuv3Yz@redhat.com>
 <20230227150858-mutt-send-email-mst@kernel.org>
 <d1151c34-c2e3-50aa-b12e-f6c5cafed5d3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d1151c34-c2e3-50aa-b12e-f6c5cafed5d3@linaro.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, Feb 27, 2023 at 10:21:14AM -1000, Richard Henderson wrote:
> > Removing support for building on 32 bit systems seems like a pity - it's
> > one of a small number of ways to run 64 bit binaries on 32 bit systems,
> > and the maintainance overhead is quite small.
> 
> It's not that small.

Meaning there are lots of ways to run 64 bit binaries on 32 bit systems?

-- 
MST


