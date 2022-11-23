Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2140636077
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 14:52:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxq9D-0002HH-79; Wed, 23 Nov 2022 08:50:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oxq8h-0002FW-2x
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 08:50:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oxq8e-0004SL-Qc
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 08:50:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669211407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cD+UYfgUZDkgHG1VDXSLB+Db8OCblmSgK7GQ9bAde58=;
 b=hhioHXkyGEVWMUxzcI6b1QQUGQF5M/H2c1zLZzyJPRxW63s/fkKCzjzHcZSxQklXtoBypd
 epgC/tZA9vW5buaQmTKnjMdjZSRppHXtAMEzukcbwKBvhw4cmqGY12E6F6K0s0G04DRxtu
 t+mIiC0ae1qwm02r0bDWK5oCDewVE9M=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-423-eAActfxCPTq0km6S3HuW4A-1; Wed, 23 Nov 2022 08:50:05 -0500
X-MC-Unique: eAActfxCPTq0km6S3HuW4A-1
Received: by mail-wr1-f72.google.com with SMTP id
 r6-20020adfbb06000000b00241d4028812so2751247wrg.20
 for <qemu-devel@nongnu.org>; Wed, 23 Nov 2022 05:50:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cD+UYfgUZDkgHG1VDXSLB+Db8OCblmSgK7GQ9bAde58=;
 b=swED5s4F03B6/ghvt5Etn3ykuw166fEUwzB3hq1N+sDMeR/+5/KwHSwVtdhkjMYDgP
 2O2imKdTIfO7pb04aNjqweSdzUPAlLy7WCXau1i6GxcA8hepB14wryzlxoNLbTRI9Upn
 YFo9LIzUgRgEyRPhWUg5PCqxTunFXdW0Skee48xZ7m5FtgvKEH9Of5d6SqUrPRHeaX2d
 IX42xAE7kgyWA7kM9x6USjqcgddcl/9vtVT/O9Z6RqyNS1yrQw/Cm9FNhs5O7Vi3ipsc
 K5s5g0+b2X9PZBzr0RHRm0nqK0RgGXWwgvBX34JP/WFGieBd/Ez4/5mvMtG1HcIYchJO
 zj9A==
X-Gm-Message-State: ANoB5pnXZU2UBNZk4eNe/9iepwyU+cVrkAVMNVkpivKMTMN2X0HhvvfT
 Jv2NvKWmPxFtzLN9+GjPJnsBwza0JMeZDJ5UbF9jAzm37ZuDnU+LBZeSmkUhzzK9WJeJIJt2GSt
 Xu83Ok07WMwtUAGA=
X-Received: by 2002:adf:e784:0:b0:241:784b:666b with SMTP id
 n4-20020adfe784000000b00241784b666bmr17245120wrm.483.1669211404629; 
 Wed, 23 Nov 2022 05:50:04 -0800 (PST)
X-Google-Smtp-Source: AA0mqf64Lp0CCEE2EQ7gnU233qRTmYCzLx4tXx2Pd3aiM+sW3DbMGsC+tMLqZRW2rvHe9oZtITGTGA==
X-Received: by 2002:adf:e784:0:b0:241:784b:666b with SMTP id
 n4-20020adfe784000000b00241784b666bmr17245105wrm.483.1669211404332; 
 Wed, 23 Nov 2022 05:50:04 -0800 (PST)
Received: from redhat.com ([2.52.16.74]) by smtp.gmail.com with ESMTPSA id
 k21-20020a05600c1c9500b003cfa3a12660sm8050701wms.1.2022.11.23.05.50.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 05:50:03 -0800 (PST)
Date: Wed, 23 Nov 2022 08:49:59 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: Stefan Berger <stefanb@linux.ibm.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, alex.williamson@redhat.com,
 stefanb@linux.vnet.ibm.com, cohuck@redhat.com, f4bug@amsat.org
Subject: Re: [PATCH v5 1/2] sysemu: tpm: Add a stub function for TPM_IS_CRB
Message-ID: <20221123083317-mutt-send-email-mst@kernel.org>
References: <20220506132510.1847942-1-eric.auger@redhat.com>
 <20220506132510.1847942-2-eric.auger@redhat.com>
 <96940f79-a6e0-d14f-5d74-abe280846f26@linux.ibm.com>
 <20221123013441-mutt-send-email-mst@kernel.org>
 <45e916e5-9297-a8e4-c539-123e0ee6347c@redhat.com>
 <20221123043005-mutt-send-email-mst@kernel.org>
 <9ffcc26f-e3b2-77f1-5929-6c6caf1ea64d@redhat.com>
 <20221123062202-mutt-send-email-mst@kernel.org>
 <2ba28eec-d205-d4de-2c48-6ff476ed5633@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2ba28eec-d205-d4de-2c48-6ff476ed5633@redhat.com>
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

On Wed, Nov 23, 2022 at 02:01:32PM +0100, Eric Auger wrote:
> 
> 
> On 11/23/22 12:24, Michael S. Tsirkin wrote:
> > On Wed, Nov 23, 2022 at 12:10:09PM +0100, Eric Auger wrote:
> >>
> >> On 11/23/22 10:30, Michael S. Tsirkin wrote:
> >>> On Wed, Nov 23, 2022 at 09:18:39AM +0100, Eric Auger wrote:
> >>>> Hi,
> >>>>
> >>>> On 11/23/22 07:36, Michael S. Tsirkin wrote:
> >>>>> On Fri, May 06, 2022 at 09:47:52AM -0400, Stefan Berger wrote:
> >>>>>> On 5/6/22 09:25, Eric Auger wrote:
> >>>>>>> In a subsequent patch, VFIO will need to recognize if
> >>>>>>> a memory region owner is a TPM CRB device. Hence VFIO
> >>>>>>> needs to use TPM_IS_CRB() even if CONFIG_TPM is unset. So
> >>>>>>> let's add a stub function.
> >>>>>>>
> >>>>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >>>>>>> Suggested-by: Cornelia Huck <cohuck@redhat.com>
> >>>>>> Reviewed-by: Stefan Berger <stefanb@linnux.ibm.com>
> >>>>> ... and now in 7.2 vdpa needs a dependency on tpm too, what a hack :(
> >>>>> And what exactly is it about TPM CRB that everyone needs to
> >>>>> know about it and skip it? The API does not tell ...
> >>>> An excerpt of one reply I made at that time:
> >>>>
> >>>> The spec (CG PC Client Platform TPM Profile (PTP)
> >>>>     Specification Family “2.0” Level 00 Revision 01.03 v22, page 100) 
> >>>> says that the command/response data "may be defined as large as 3968",
> >>>> which is (0x1000 - 0x80), 0x80 being the size of the control struct.
> >>>> so the size of the region logically is less than a 4kB page, hence our
> >>>> trouble.
> >>>>
> >>>> We learnt in the past Windows driver has some stronger expectation wrt
> >>>> memory mapping. I don't know if those latter would work if we were to
> >>>> enlarge the window by some tricks.
> >>>>
> >>>> https://trustedcomputinggroup.org/wp-content/uploads/Mobile-Command-Response-Buffer-Interface-v2-r12-Specification_FINAL2.pdf
> >>>> says
> >>>>
> >>>> "
> >>>> Including the control structure, the three memory areas comprise the
> >>>> entirety of the CRB. There are no constraints on how those three memory
> >>>> areas are provided. They can all be in system RAM, or all be in device
> >>>> memory, or any combination.
> >>>>
> >>>> Thanks
> >>>>
> >>>> Eric
> >>> So we put it in system RAM then? But why isn't DMA there allowed?
> >> I don't think there is any need and since it violates the alignment
> >> check in VFIO we discard the region from DMA mapped ones.
> >>
> >> Thanks
> >>
> >> Eric
> > If that's all then we could just check alignment -
> > why are we bothering with a tpm specific hack?
> I think Alex prefered to avoid silently skipping the DMA mapping of a
> region (a possible scenario may be invalid P2P DMA access?). Except if
> we know this region can be safely ignored, which is the case for the TPM
> CRB, hence this whitelist.
> 
> Eric

As a vdpa maintainer I might know (more like trust) TPM can be safely
ignored right now, but for sure I won't know if that ever changes nor
will I remember why down the road. Nor will TPM maintainers remember to
go poke at vdpa if this changes.


> 
> >
> >
> >>>>>>> ---
> >>>>>>>   include/sysemu/tpm.h | 6 ++++++
> >>>>>>>   1 file changed, 6 insertions(+)
> >>>>>>>
> >>>>>>> diff --git a/include/sysemu/tpm.h b/include/sysemu/tpm.h
> >>>>>>> index 68b2206463c..fb40e30ff60 100644
> >>>>>>> --- a/include/sysemu/tpm.h
> >>>>>>> +++ b/include/sysemu/tpm.h
> >>>>>>> @@ -80,6 +80,12 @@ static inline TPMVersion tpm_get_version(TPMIf *ti)
> >>>>>>>   #define tpm_init()  (0)
> >>>>>>>   #define tpm_cleanup()
> >>>>>>>
> >>>>>>> +/* needed for an alignment check in non-tpm code */
> >>>>>>> +static inline Object *TPM_IS_CRB(Object *obj)
> >>>>>>> +{
> >>>>>>> +     return NULL;
> >>>>>>> +}
> >>>>>>> +
> >>>>>>>   #endif /* CONFIG_TPM */
> >>>>>>>
> >>>>>>>   #endif /* QEMU_TPM_H */


