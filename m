Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E565A58A878
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 11:03:16 +0200 (CEST)
Received: from localhost ([::1]:35410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJtEh-0005DM-Cu
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 05:03:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oJt9W-0001nO-2L
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 04:57:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oJt9U-000382-8u
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 04:57:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659689871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X6QrJ7c22mJhMGtZeuXIQCs/jI6BVs0Ss3FkW7wUe4A=;
 b=E7oA1PP/Z9XKB6CSVGqugaDRdQ3SVF0wKW6yPQH8S/tM15vmKSTLMuNPMsGViKZkhIiVby
 u8uovjcGQx6iq1wqqeG9aDKOpi1j4aTDliLXSGdwrJPDvbL39pc51iMf1Bck51CaRexayf
 wTLwl/a8TXOgQ1u3zWzK3/lmTaKj6LQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-526-3mB9W3nxMQO_cqW73NgBRA-1; Fri, 05 Aug 2022 04:57:50 -0400
X-MC-Unique: 3mB9W3nxMQO_cqW73NgBRA-1
Received: by mail-ej1-f71.google.com with SMTP id
 go15-20020a1709070d8f00b00730ab9dd8c6so980536ejc.6
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 01:57:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=X6QrJ7c22mJhMGtZeuXIQCs/jI6BVs0Ss3FkW7wUe4A=;
 b=7yPa4uNThoiizERz0zwEc4fGiRuqX1HdTi0syWKY+WBRTxPOqtav7wCvzUpI9pqdC2
 QnYOynkl1vTSVfn958oZTZIooleW0Rhe/oUPDjs6t1sNdVGtyEJ0JRZKxAAUHFhavIPB
 JGRNIrf8yHHXdpWYDpJd8XUPyrfkgagNv8h9S3V25X7vMwBYkmi8Vu4nz1rnLGRl2XxT
 PABXhXeAr11NE21aNw1b4YteSEfNit3/YdAnrAPZoi4lNppaBEowVVxJwqvY1oUkLmae
 3m7WsdmEG/NzohUs4idZkKMyOl6EhfY5xILRYy5UvWTQDJVb9wHCgaxpSpsnfQfZMCcn
 JfeQ==
X-Gm-Message-State: ACgBeo12UAvJnaBfoFXfCXiQG4BV+I/I4lUHLf1YyBsb4vi3cbNT8VDs
 Yren8G3oZaIPC44nhvMuSbYk0RKsSwNMnvDMfxQDTxidXGRliDq2hB+7Zanhe6U5itaM5l6CsEV
 ktN/aRcCNaoEr1eA=
X-Received: by 2002:a17:907:7294:b0:72b:1ae:9c47 with SMTP id
 dt20-20020a170907729400b0072b01ae9c47mr4596506ejc.253.1659689869102; 
 Fri, 05 Aug 2022 01:57:49 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6T4JXtrgLvrC2bY9e3UoPCRFa2D8xqbikAWF86Iilncc0deuM8zRWv22Ls2EeVmNFX3CLB5Q==
X-Received: by 2002:a17:907:7294:b0:72b:1ae:9c47 with SMTP id
 dt20-20020a170907729400b0072b01ae9c47mr4596491ejc.253.1659689868848; 
 Fri, 05 Aug 2022 01:57:48 -0700 (PDT)
Received: from redhat.com ([2.52.137.185]) by smtp.gmail.com with ESMTPSA id
 kg9-20020a17090776e900b0073094d244d6sm1335193ejc.55.2022.08.05.01.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 01:57:48 -0700 (PDT)
Date: Fri, 5 Aug 2022 04:57:44 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, "Zhang, Chen" <chen.zhang@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "stefanha@gmail.com" <stefanha@gmail.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Xie Yongji <xieyongji@bytedance.com>
Subject: Re: [PATCH 0/1] Update vfio-user module to the latest
Message-ID: <20220805045600-mutt-send-email-mst@kernel.org>
References: <cover.1659403195.git.jag.raman@oracle.com>
 <MWHPR11MB00312737931679069FAAE7AB9B9D9@MWHPR11MB0031.namprd11.prod.outlook.com>
 <e8eab8e6-e6a5-af95-223f-e0ca91b4d833@redhat.com>
 <YuzT2MA9Q4mAr4eQ@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YuzT2MA9Q4mAr4eQ@redhat.com>
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

On Fri, Aug 05, 2022 at 09:24:56AM +0100, Daniel P. Berrangé wrote:
> On Fri, Aug 05, 2022 at 09:21:07AM +0200, Thomas Huth wrote:
> > On 02/08/2022 12.00, Zhang, Chen wrote:
> > > 
> > > 
> > > > -----Original Message-----
> > > > From: Qemu-devel <qemu-devel-
> > > > bounces+chen.zhang=intel.com@nongnu.org> On Behalf Of Jagannathan
> > > > Raman
> > > > Sent: Tuesday, August 2, 2022 9:24 AM
> > > > To: qemu-devel@nongnu.org
> > > > Cc: stefanha@gmail.com; berrange@redhat.com
> > > > Subject: [PATCH 0/1] Update vfio-user module to the latest
> > > > 
> > > > Hi,
> > > > 
> > > > This patch updates the libvfio-user submodule to the latest.
> > > 
> > > Just a rough idea, why not depends on linux distribution for the libvfio-user.so?
> > > It looks no libvfio-user packet in distribution's repo.
> > > 
> > > Hi Thomas/Daniel:
> > > 
> > > For the RFC QEMU user space eBPF support,
> > > https://lore.kernel.org/all/20220617073630.535914-6-chen.zhang@intel.com/T/
> > > Maybe introduce the libubpf.so as a subproject like libvfio-user.so is more appropriate?
> > 
> > Fair comment. I never noticed them before, but why do we have those
> > submodules in the subprojects/ folder (libvduse, libvfio-user and
> > libvhost-user)? ... I don't think it's the job of QEMU to ship libraries
> > that a user might want to use for a certain feature, so could we please
> > remove those submodules again? If someone wants to use this, they can
> > compile the libraries on their own or help their favorite distribution to
> > ship them as packages.
> 
> FWIW, I don't really agree with shipping libvfio-user.so as a submodule
> either, but the consensus was that we have to do it because there's no
> stable ABI committed to by libvfio-user maintainers yet.  My counterpoint
> is that as long as QEMU ships libvfio-user as a submodule, there's no
> incentive to create a stable ABI, leaving a chicken & egg scenario.

It's weird that the parent lumps libvfio-user which is
a submodule with libvduse and libvhost-user which are not.
I don't know whether moving libvfio-user to avoid confusion
is justified.

-- 
MST


