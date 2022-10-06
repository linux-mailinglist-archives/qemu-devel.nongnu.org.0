Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D311C5F69BA
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 16:37:38 +0200 (CEST)
Received: from localhost ([::1]:58756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogS0H-0005iH-CC
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 10:37:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ogRtE-0007B4-QF
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 10:30:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ogRt9-0006jo-Bv
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 10:30:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665066614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mXwAIE0w7iuI0QXnsJVCoG5I4topNGmpyK0284MRNAk=;
 b=X13HZ7BdYMR14tT7bvhIezCGyGuguS5hBSAqQ4WgqAzoBVfLvmxFRHJvKx2Ufd5s7hP378
 kUCQ7jOQ7l1GXHDD3t1EDBhrhYaIgtogdTriucjGSzQW2hqndxsGrr9m8ggStu0p8F2MKq
 3x9td9L3J1FA4yzpQPewaOWHIzfEmxY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-358-wma3vzxoPcGWV0Hls1wxSw-1; Thu, 06 Oct 2022 10:30:13 -0400
X-MC-Unique: wma3vzxoPcGWV0Hls1wxSw-1
Received: by mail-wr1-f69.google.com with SMTP id
 m3-20020adfc583000000b0022cd60175bbso589256wrg.6
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 07:30:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mXwAIE0w7iuI0QXnsJVCoG5I4topNGmpyK0284MRNAk=;
 b=ybHAATqfX9s50skB4mzcQB5GZ4/hBdUvdoenl4fspbXbYCSu7KVrLuFLjlQ9Kp77hT
 0aQ5ulxs98nUUdOFAOCG9M3oWOcmVqqusc17ypqdABVqqP6tYQvdXkFLe6Iw9x/0PP8j
 HiDtJdojapFlymmqrGgz6ZySUM3Cok9ZXoFTV8Qm88K+5sE2VOHiFPGg6hZL4q2twugz
 JkiEs/0agmwkjO2jp7WETsC9wsVSHaKeh6v/GX3ynd6C3LUld7qGxEzCOmoC0ytuMTH5
 nB3UhaF6ebB6oVe5YJua/LphXRPpbg2T/nuz3BWKO3tbxxlwy4SbzU+cmBXTumNfxtk2
 qF4Q==
X-Gm-Message-State: ACrzQf1CkJbmMbDNf747faiGdfJhrMn4XIF3vvBoaoDCdXGQDDvlag3n
 /rC/vvumoyWz/DlG/sxhcrcMKmw5UAXRmxF8D+q/2g2E3WXRNb1NpH1E+2NuY7UU22YvWa5h3cG
 EaYcqa+rNrOb4gEI=
X-Received: by 2002:a5d:4209:0:b0:22c:d5fd:1a06 with SMTP id
 n9-20020a5d4209000000b0022cd5fd1a06mr149027wrq.508.1665066611021; 
 Thu, 06 Oct 2022 07:30:11 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5sqalyvPcNlNm5RxtzkUzl0JqoPoBYxx8zOGI1YEG10AFeJgPVKv/IuR4ds9oTe1OlGJig1A==
X-Received: by 2002:a5d:4209:0:b0:22c:d5fd:1a06 with SMTP id
 n9-20020a5d4209000000b0022cd5fd1a06mr149013wrq.508.1665066610801; 
 Thu, 06 Oct 2022 07:30:10 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 h14-20020a05600c2cae00b003c0d504a92csm3094773wmc.22.2022.10.06.07.30.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 07:30:10 -0700 (PDT)
Date: Thu, 6 Oct 2022 10:30:07 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH] gitmodules: recurse by default
Message-ID: <20221006102941-mutt-send-email-mst@kernel.org>
References: <20221006113906.179963-1-mst@redhat.com>
 <CAFEAcA8K-4KdjuG8QqFU9gLEiZ7A3Xx3zG0FP4uP4482p0GFfA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8K-4KdjuG8QqFU9gLEiZ7A3Xx3zG0FP4uP4482p0GFfA@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Thu, Oct 06, 2022 at 02:02:53PM +0100, Peter Maydell wrote:
> On Thu, 6 Oct 2022 at 13:36, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > The most commmon complaint about submodules is that
> > they don't follow when one switches branches in the
> > main repo. Enable recursing into submodules by default
> > to address that.
> 
> Just to check, because the git docs are a bit unclear to me,
> does this retain the existing behaviour that if a submodule
> isn't checked out at all then it remains not-checked-out ?
> (That is, we don't want to force developers to have checked
> out submodule sources for all the edk2 and other rom blob
> sources which aren't needed for day-to-day QEMU development.)
> 
> thanks
> -- PMM


I think so - by default submodules are considered inactive,
git only recurses into active modules.
I just tried the following:

>git clone qemu qemu-tst
>cd qemu-tst
>ls -l $(grep submodule .gitmodules |sed -e 's/[^"]*"//' -e 's/".//')
dtc:
total 0

meson:
total 0

roms/edk2:
total 0

roms/ipxe:
total 0

roms/openbios:
total 0

roms/opensbi:
total 0

roms/qboot:
total 0

roms/QemuMacDrivers:
total 0

roms/qemu-palcode:
total 0

roms/seabios:
total 0

roms/seabios-hppa:
total 0

roms/sgabios:
total 0

roms/skiboot:
total 0

roms/SLOF:
total 0

roms/u-boot:
total 0

roms/u-boot-sam460ex:
total 0

roms/vbootrom:
total 0

slirp:
total 0

subprojects/libvfio-user:
total 0

tests/fp/berkeley-softfloat-3:
total 0

tests/fp/berkeley-testfloat-3:
total 0

tests/lcitool/libvirt-ci:
total 0

ui/keycodemapdb:
total 0


HTH

-- 
MST


