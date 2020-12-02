Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 574432CBAE6
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 11:50:09 +0100 (CET)
Received: from localhost ([::1]:51586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkPi4-0007OR-Bj
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 05:50:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kkOsF-0006sp-5C
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:56:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kkOsC-0004MV-6t
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:56:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606902991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y6483IhVJ0O5EE5z0qX4vFzaVpZbprPp9WiUJ9LX9BE=;
 b=Sjx+W9AxsFwUVBgaTxZRf4HSa0qbNa6zmzP+/wDEWqTyp7k/voEcZKe23MaTn0+Di/OzM2
 W/0CCtGLWQ0ITV7Uwe/q1vRrY/ku8RHWm+cUJLi27QbWDuMezPg2Zr7foH00qbnjID630M
 Jidwnvx6DJBPHdwi1PKovyUFIMN9l8I=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-VzF3eyzBNnyxMsipyK6d5g-1; Wed, 02 Dec 2020 04:56:30 -0500
X-MC-Unique: VzF3eyzBNnyxMsipyK6d5g-1
Received: by mail-wr1-f71.google.com with SMTP id c11so2776681wrt.12
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 01:56:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=y6483IhVJ0O5EE5z0qX4vFzaVpZbprPp9WiUJ9LX9BE=;
 b=Law1B5pkxA/Sa8XXXUOPCLwK3E1/D9jc6CCwJxF4Gngba1knsCPK8YCsYn6ud8n5Ee
 KwUmTRzDRRCCv6KjtXGkEbx1YIpk03dDadDY5HpuvxG4aFHklNv1iurq0xe7Kz7ixeMn
 qwA3MYp7CeSoJkKlQsLkAikPq5l4wOaGOiWiYHvH4+Mri2r8i9XcVyjDYYkogde70Mzc
 qE9ofKg7+c0M9UWW+wdkOJhdB/zJCzc5+TTLEPSaP2c8UPUF1p/ChiJeP0gKZV0p92ye
 cXQwQ/+aao1FiMb/8EJFG+2gd6yd5CXLmxFYemcdjHUTrdBd+T7Pnss3TRtdLsyOQL4M
 m3mA==
X-Gm-Message-State: AOAM532PbLjbzOdPqt14nTUrrbMNTiJb7TYHmUAxqja2jca/YB50lXUY
 SHEtoMQXYONthLZbqrAWtH3Nr6ROgPFB/q4SXQBp+Rmg46utAT27xz00yyKlQJoh6Ro7C8/juXT
 EM+5JZ5EQWG1kT84=
X-Received: by 2002:adf:f441:: with SMTP id f1mr2367199wrp.225.1606902988727; 
 Wed, 02 Dec 2020 01:56:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwO6Y1Eqz+MG//piWa+vfL8lNyG7iJ2MPoIS97ozOtcItBwtqA1GipObXx+lshC1zy4Pcmrog==
X-Received: by 2002:adf:f441:: with SMTP id f1mr2367182wrp.225.1606902988593; 
 Wed, 02 Dec 2020 01:56:28 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id l24sm1497235wrb.28.2020.12.02.01.56.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 01:56:27 -0800 (PST)
Date: Wed, 2 Dec 2020 04:56:25 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "McMillan, Erich" <erich.mcmillan@hp.com>
Subject: Re: [PATCH v6] hw/i386/pc: add max combined fw size as machine
 configuration option
Message-ID: <20201202045601-mutt-send-email-mst@kernel.org>
References: <20200925175751.4017-1-erich.mcmillan@hp.com>
 <20201117115329-mutt-send-email-mst@kernel.org>
 <CS1PR8401MB03272F390100B1B88CCAC784F3E10@CS1PR8401MB0327.NAMPRD84.PROD.OUTLOOK.COM>
MIME-Version: 1.0
In-Reply-To: <CS1PR8401MB03272F390100B1B88CCAC784F3E10@CS1PR8401MB0327.NAMPRD84.PROD.OUTLOOK.COM>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "imammedo@redhat.com" <imammedo@redhat.com>,
 "lersek@redhat.com" <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Could you help by rebasing this on master? Shouldn't be hard ...
Thanks!


