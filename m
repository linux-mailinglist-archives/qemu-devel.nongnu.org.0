Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DAE575684
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 22:45:23 +0200 (CEST)
Received: from localhost ([::1]:59522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC5i7-0005xC-17
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 16:45:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oC5gp-0004Ri-8F
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 16:44:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oC5gl-00048d-T1
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 16:44:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657831439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9d33/7XdAhsOV2q/UXsZWeJlg0TolK/4GENR7F7gRN4=;
 b=MA4bZ/64yWKj9k4dPz8xbQiK29q1Kx0+Cb1ISG6WOnbRS4Or8mIQfvmoIFwXWClPieOW8+
 ew7u9emnauUQ8gZD7l56SsFxDQM8u8PpF0wDsaThfGZH+mHHKifIFfqrY+31LqHq63tzBf
 Anv3SorW3symcUztFwbUawdZGwejODA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-494-u78b8_mCMrmrf8YFWjxeZQ-1; Thu, 14 Jul 2022 16:43:57 -0400
X-MC-Unique: u78b8_mCMrmrf8YFWjxeZQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 r5-20020a1c4405000000b003a2fdeea756so2417746wma.2
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 13:43:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9d33/7XdAhsOV2q/UXsZWeJlg0TolK/4GENR7F7gRN4=;
 b=AVuAkcXwbsRmiI+p7usDZ+GKFERfchKP3LLqFx0ExwRx75bURKS7irHMmXL2ZTSGPz
 uR+IqUxvHUnw/iMuy+VW91ZI2ui28Ixi7kZHy6d3nxG8TgAjL4cNoCziQ9M/1t01S5Ie
 9zZjtxNpKlDPgL/KY//Nyt0DA8juygYllrx6ln/KSZ7pwZH3YtHjbUlpeJY9sHpSucW8
 MLxCgE8QEtwlVXNV+0ESlO7PpvCIWMheY79Frwuf+N0FaUWQqYhoQG+AMQVlZP1Mgwzm
 7d4b8Q/KNFdUzZ7Lal4L989hDl+Zr+jtwehCxiLWZ7TnTXMKMFMixE4/GNaH4urE2sfR
 eT8g==
X-Gm-Message-State: AJIora94o7a8SZgaUpUcR6GC63dvBEA5S9Fm1HMsg+2atmSFHL24I2Fh
 dcwAMdTuQcvlRqKTTyHWIOp+LZsn694QJGqYSlA5g1iCNoAq6zYdhO7IA9YJi+n9YoAEDZjMJ+P
 aQJU8r27M11lYWgY=
X-Received: by 2002:a05:600c:898:b0:3a2:cef5:9d80 with SMTP id
 l24-20020a05600c089800b003a2cef59d80mr11102540wmp.39.1657831436621; 
 Thu, 14 Jul 2022 13:43:56 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uNKGaQRvqVRIpQMYiu7oebCZ/+2ZksJiDK7MwmBZhYErcom/SrOPvKSuQP0/nDmfaDcfu6/g==
X-Received: by 2002:a05:600c:898:b0:3a2:cef5:9d80 with SMTP id
 l24-20020a05600c089800b003a2cef59d80mr11102524wmp.39.1657831436429; 
 Thu, 14 Jul 2022 13:43:56 -0700 (PDT)
Received: from redhat.com ([2.52.24.42]) by smtp.gmail.com with ESMTPSA id
 j9-20020a05600c190900b003a2fde6ef62sm3315304wmq.7.2022.07.14.13.43.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 13:43:56 -0700 (PDT)
Date: Thu, 14 Jul 2022 16:43:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, thuth@redhat.com, peter.maydell@linaro.org,
 jsnow@redhat.com, pbonzini@redhat.com, imammedo@redhat.com
Subject: Re: [PATCH v2 07/11] acpi/tests/bits: add python test that exercizes
 QEMU bios tables using biosbits
Message-ID: <20220714164129-mutt-send-email-mst@kernel.org>
References: <20220710170014.1673480-1-ani@anisinha.ca>
 <20220710170014.1673480-8-ani@anisinha.ca>
 <YtAitsVyHmsLRKEL@redhat.com>
 <alpine.DEB.2.22.394.2207141943060.2135546@anisinha-lenovo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2207141943060.2135546@anisinha-lenovo>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 14, 2022 at 07:49:36PM +0530, Ani Sinha wrote:
> > so you skip downlaod if it already exists locally. IIUC it is looking
> > in the CWD, which is presumably the directory the QEMU build is
> > performed in ?
> 
> Yes, build/test/pytest/bits-test
> 
> > So if dev cleans their build tree, the cache is lost ?
> 
> Yes.
> 
> >
> > Avocado has a more persistent cache outside the build tree IIUC.
> >
> 
> So that is why I have the environment variable mechanism for passing to
> the test that will point to the location of the archives. The developer
> can download the files there and point to the test. Or I can change the
> scriprt accordingly if we know where we were downloading. We were
> discussing submodules and it was fiercely hated. So mst suggested another
> repo where to keep the binaries. My script that check out that repo
> somewhere outside the build directory and point the test to that location.
> 
> I have kept several options open. We just need to make some decisions.
> 

For now I would probably just have a script to fetch into source tree.

-- 
MST


