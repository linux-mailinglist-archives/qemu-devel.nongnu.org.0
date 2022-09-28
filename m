Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 160135ED465
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 07:56:42 +0200 (CEST)
Received: from localhost ([::1]:60520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odQ3k-0004si-KQ
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 01:56:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1odQ0N-0003Gz-NX
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 01:53:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1odQ0L-0003po-CB
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 01:53:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664344388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g5bsxTiKbM/eASvh+KnXAUdlMgfGe61xOojJPdMJDqU=;
 b=bXRRGfg5ZLSiuZjYxny0pSYjzsrhEDEVkk5GS7lDBlrvjQqHteuaxRVWUyN6TwOdU2psox
 RFKDre8RXkUMRpuFmAUDM8qZX3Hl/Bs7dL5b8ZQXeOf+GmjnHUN4eZrXUvfIXF7brcPXY/
 uJ8GvxcAbej1XJFNesNjur1Z/KuXWcU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-609-t9Pu4PfgP1mILZAODMwQRg-1; Wed, 28 Sep 2022 01:53:05 -0400
X-MC-Unique: t9Pu4PfgP1mILZAODMwQRg-1
Received: by mail-wr1-f71.google.com with SMTP id
 s16-20020adf9790000000b0022cc14c6114so956271wrb.0
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 22:53:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=g5bsxTiKbM/eASvh+KnXAUdlMgfGe61xOojJPdMJDqU=;
 b=et3L5OOJNE74iTEu8deUBulQ+MB7FC0m3BrYlBKdmQf0TwGNPu/ZBHd7IPzTyfYGvF
 tNBitrZ7DV/HmJmITX76tlm575qTmTh1zic4HV8eCXeyObU5XIcB5enw/6ozMx6jH43N
 hGnKsHnt+09JSa9ri/jaOLtJk+uefP1O4HZwaoBZScZkJLpX3ZaupT/yNFrFHGL2kz1B
 P7zREzSSu0ehaBMrT2Q1WWEuLPbyihXZ1PkKnrWLVdtGOj69VLuebMZoX8p+vtHXA//S
 53fVirySsTVY1hbQdsz8F9x4vRYn2qfxB5BAdS15M0Y3mCwZYdLcpXOpObH1EaskZMC3
 m0Qw==
X-Gm-Message-State: ACrzQf3Ft10Lauegi3yfroWtOc3bVOt5++lnq0EE4tzwqH023UgQ0TKK
 BokszfurNwr34R2g2BCpytjHXz9gAIJzujis5ixRiOooANxI/w3cBq7v4oI++DJVhfFjVsOnf1f
 uqr4kZbl8UcnnzDM=
X-Received: by 2002:a5d:5406:0:b0:228:db0e:a4d3 with SMTP id
 g6-20020a5d5406000000b00228db0ea4d3mr18690207wrv.8.1664344384273; 
 Tue, 27 Sep 2022 22:53:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5uJbgLeFG4Hen+A9nkWnRGxX2Mq2K0opr7QRftRL+p0RN6eEjKtO4dYylEWGEBOglPu1ACMQ==
X-Received: by 2002:a5d:5406:0:b0:228:db0e:a4d3 with SMTP id
 g6-20020a5d5406000000b00228db0ea4d3mr18690196wrv.8.1664344384055; 
 Tue, 27 Sep 2022 22:53:04 -0700 (PDT)
Received: from redhat.com ([2.55.17.78]) by smtp.gmail.com with ESMTPSA id
 l18-20020a05600c1d1200b003a601a1c2f7sm762142wms.19.2022.09.27.22.53.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 22:53:03 -0700 (PDT)
Date: Wed, 28 Sep 2022 01:53:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>, qemu-devel <qemu-devel@nongnu.org>,
 Thomas Huth <thuth@redhat.com>,
 "Maydell, Peter" <peter.maydell@linaro.org>,
 "P. Berrange, Daniel" <berrange@redhat.com>, John Snow <jsnow@redhat.com>,
 "Mammedov, Igor" <imammedo@redhat.com>
Subject: Re: [PATCH v2 07/11] acpi/tests/bits: add python test that exercizes
 QEMU bios tables using biosbits
Message-ID: <20220928013638-mutt-send-email-mst@kernel.org>
References: <20220710170014.1673480-1-ani@anisinha.ca>
 <20220710170014.1673480-8-ani@anisinha.ca>
 <CABgObfYW8O-JGhjLm47HmHG7WRhOQDO1EhUCTP59TZo4DnkQVg@mail.gmail.com>
 <20220927175440-mutt-send-email-mst@kernel.org>
 <CABgObfYv=-CwuxgjfPHeZ-yJMu0HFM=GSjkMSuvvVLtbQCEbHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABgObfYv=-CwuxgjfPHeZ-yJMu0HFM=GSjkMSuvvVLtbQCEbHQ@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

On Wed, Sep 28, 2022 at 01:10:15AM +0200, Paolo Bonzini wrote:
> 
> 
> Il mer 28 set 2022, 00:09 Michael S. Tsirkin <mst@redhat.com> ha scritto:
> 
>     On Tue, Sep 27, 2022 at 11:44:56PM +0200, Paolo Bonzini wrote:
>     > I also second the idea of using avocado instead of pytest, by the way.
>     >
>     > Paolo
> 
>     I do not think this is a good fit for bios tests.
>     bios tests are intended for a wide audience of ACPI developers
>     across a variety of host systems. They basically do not need anything
>     from the host and they need to be super easy to configure
>     since we have lots of drive through contributors.
> 
> 
> The setup would be the same, with avocado installed in a virtual environment
> via pip. It doesn't need to be set up outside, neither with distro packages nor
> in ~/.local, and especially it is not necessary to deal with avocado-vt.
> 
> Paolo

Hmm, good point.

-- 
MST


