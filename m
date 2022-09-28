Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EDD5EDDA4
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 15:26:43 +0200 (CEST)
Received: from localhost ([::1]:53612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odX5G-0002ow-CW
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 09:26:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1odTnn-0003Vp-MF
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 05:56:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1odTnm-0005oW-4r
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 05:56:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664358984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lt3JWhY1nKGt+igdh2p4nQzgK+sHG4tKJOuGpzkL9h0=;
 b=dRN3m5Yd7WuTlFyOGcAaCQ8yVTaWofPwWel4+Maek6e5sys5t4w9jQgmaOqPLci3OKNcwU
 OYUXN5EMScNS64wu8wbhRSUTpndTz7Z1uSjw+l6rZh5gHzBIk3+ZixH/LaB1/NBlX6vUri
 WBhPzVInMyc/wJpEAwneJTyv2cgi4/I=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-653-7Iugfr9sMN-bjkg3n8LDfg-1; Wed, 28 Sep 2022 05:56:23 -0400
X-MC-Unique: 7Iugfr9sMN-bjkg3n8LDfg-1
Received: by mail-wm1-f71.google.com with SMTP id
 d5-20020a05600c34c500b003b4fb42ccdeso911274wmq.8
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 02:56:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Lt3JWhY1nKGt+igdh2p4nQzgK+sHG4tKJOuGpzkL9h0=;
 b=bvZgcYlm5G2CDqNEjhTdmCJ1yAKqFC0dohowb+M1fNMKIgruFZUTYDdFA3l8PsC3Pt
 kiloMLmKd5Sm+Ycj2HLzSa/XCKUyqOslnfNr0yO/JKz+W7Qr0K/lqjeN1IPqyd4tBgRD
 25ps7MknyxoVjkQMVlw78n6oOM1kRoTu8fKqXNsDCXxc7AdUMhrpk2WdmkpdBjBLORWQ
 f8nuPel+PfpErxzWMJPqU3dkfw4nA2ZRbuSZU9XFps+2pGySKAY9rts2e9nCWOex75U9
 59XKWurM9Nwi8cYGL3kYT8l8/FeBAFa20ei/dFSdkpZMUAlO9EhKL+5Vvcp0FwVNhrnj
 MkZA==
X-Gm-Message-State: ACrzQf3UapQ3plOuzUup3Kn7Epl/z7Gf13Jnn87NGjMmVOk8lFeKJnsO
 OH4XihQlPRW5+yrFVqZSZwxuK3gJFpW0NRFhqypIUIavQnUm4f9FnD3n5M1ekn4TjOWKSuaRM7C
 Vq8mtrdpJt3+zmmQ=
X-Received: by 2002:a05:6000:1541:b0:22a:3b77:6ef4 with SMTP id
 1-20020a056000154100b0022a3b776ef4mr19888381wry.303.1664358982587; 
 Wed, 28 Sep 2022 02:56:22 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM72G+a6VPiRaNgHQGMRtqdPFBCk0R0HPuVDlAS2wuXwUC5qB8IYIZz9MSo3dU3icC7S8zgvoA==
X-Received: by 2002:a05:6000:1541:b0:22a:3b77:6ef4 with SMTP id
 1-20020a056000154100b0022a3b776ef4mr19888373wry.303.1664358982324; 
 Wed, 28 Sep 2022 02:56:22 -0700 (PDT)
Received: from redhat.com ([2.55.47.213]) by smtp.gmail.com with ESMTPSA id
 j7-20020a5d4527000000b0022af5e36981sm4586710wra.9.2022.09.28.02.56.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Sep 2022 02:56:21 -0700 (PDT)
Date: Wed, 28 Sep 2022 05:56:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, pbonzini@redhat.com,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, imammedo@redhat.com, jsnow@redhat.com,
 peter.maydell@linaro.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 07/11] acpi/tests/bits: add python test that exercizes
 QEMU bios tables using biosbits
Message-ID: <20220928055339-mutt-send-email-mst@kernel.org>
References: <YzK1VzoU05vnlxY4@redhat.com>
 <CAARzgwxpm-tF3OwK95gHe+9_6qBebiqPFLug-59RUt85aCnuZQ@mail.gmail.com>
 <YzLN3Y1pNO8SVn9M@redhat.com>
 <CAARzgwx+ZitnYKvmkDGA1+Aq3_yPQFSs5GfTvGaAeNmHxUSNOQ@mail.gmail.com>
 <CAARzgwwLXp9rDkQ4OTW2TUgnp_XDyMTXf6OhsKE9qAL1HTuMRQ@mail.gmail.com>
 <YzMahUpNtsas18rN@redhat.com>
 <20220927172044-mutt-send-email-mst@kernel.org>
 <2a5c6c18-e0b1-aaf8-78fa-5a12396fef87@redhat.com>
 <20220928053421-mutt-send-email-mst@kernel.org>
 <17d249fc-d1b7-4336-fa4c-dc5e245e10c8@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <17d249fc-d1b7-4336-fa4c-dc5e245e10c8@redhat.com>
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

On Wed, Sep 28, 2022 at 11:39:36AM +0200, Thomas Huth wrote:
> On 28/09/2022 11.35, Michael S. Tsirkin wrote:
> > On Wed, Sep 28, 2022 at 10:31:39AM +0200, Thomas Huth wrote:
> > > On 27/09/2022 23.21, Michael S. Tsirkin wrote:
> > > > On Tue, Sep 27, 2022 at 04:45:09PM +0100, Daniel P. Berrangé wrote:
> > > > > On Tue, Sep 27, 2022 at 07:35:13PM +0530, Ani Sinha wrote:
> > > ...
> > > > > > Alright, .gitlab-ci.yml is produced and the pipeline succeeds.
> > > > > > However, the question still remains, where do we keep the generated
> > > > > > artifacts?
> > > > > 
> > > > > The following link will always reflect the published artifacts from
> > > > > the most recently fully successful CI pipeline, on the 'qemu-bits'
> > > > > branch, and 'qemu-bits-build' CI job:
> > > > > 
> > > > > https://gitlab.com/qemu-project/biosbits-bits/-/jobs/artifacts/qemu-bits/download?job=qemu-bits-build
> > > > > 
> > > > > Tweak as needed if you push the CI to master branch instead. This
> > > > > link can be considered the permanent home of the artifact. I'd just
> > > > > suggest that the QEMU job automatically skip if it fails to download
> > > > > the artifact, as occassionally transient infra errors can impact
> > > > > it.
> > > > 
> > > > This just means once we change the test old qemu source can no longer use it.
> > > > Why is this a good idea? Are we so short on disk space? I thought CPU
> > > > is the limiting factor?
> > > 
> > > FYI, we'll soon be short on disk space, gitlab plans to introduce storage
> > > limits:
> > > 
> > >   https://about.gitlab.com/pricing/faq-paid-storage-transfer/
> > > 
> > >   Thomas
> > 
> > A good reason not to use CI artifacts to store images maybe?
> > I was proposing storing binaries on qemu.org not on gitlab.
> 
> For qemu.org, you should maybe talk to Paolo and Stefan first, I'm not sure
> whether we could allow additional network traffic
> beside the normal release tarballs there...
> 
>  Thomas

I guess we need to design this sensibly to checksum local files
and only fetch if there's change, and that only for
people who work on ACPI.

-- 
MST


