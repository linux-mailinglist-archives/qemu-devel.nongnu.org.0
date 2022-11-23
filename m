Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 105EC635BA1
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 12:26:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxns4-0005Sa-2F; Wed, 23 Nov 2022 06:24:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oxnrY-00057A-Iz
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 06:24:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oxnrV-0007QL-MG
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 06:24:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669202655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sA6kQa63kT5DBa73irm8C3MNfC5MWe86Uv1W5TsLgEg=;
 b=e9jhPpzHPDozCz3gzWJqvkE+te0ORk/7vlao7lxeimD4esUg925g94JEV2oYQ7CnvgTqJ4
 ljhxv897TcG+iJUjbvp2BVKqUHXIR9gsyI7U2Guy4kDG66ps/BL0q1WkUfyytlR48wZhpe
 n80dCsU3T37PHh2oqSkNLtFklXVbuTw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-265-M1rnpBQOO8a1_9aDfB4lcg-1; Wed, 23 Nov 2022 06:24:14 -0500
X-MC-Unique: M1rnpBQOO8a1_9aDfB4lcg-1
Received: by mail-wr1-f70.google.com with SMTP id
 j30-20020adfa55e000000b00241b49be1a3so4867685wrb.4
 for <qemu-devel@nongnu.org>; Wed, 23 Nov 2022 03:24:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sA6kQa63kT5DBa73irm8C3MNfC5MWe86Uv1W5TsLgEg=;
 b=j0Z4rfnMdvIpdZjG8k6I0sfXL6ERazT/pbSOxhHgjyBUtrxSHMNvaejqG/sNbdM5M6
 zhI8WFCiFRZstGvDbWgt1kaFm7uhxRs9ccu9vrQaL1ni3jMlOk8Jk+ttjkjXXKJvi5z8
 Ig+5uXvjbwZaUbWCuH7fyZ5fk9orve7bBqIJXIoQwY5nXVNh7oph/Zdf6bw1ODXiLLbX
 umfWuWUYMcLHLt6njw3p7NBV1+7TCxgSZhOGvIQnM344/AsfQW1tAdEMBFmmX1r3jh4H
 WBPf2AmwAFyoImlVwONbhLclGiUbDl5Q1fuEBewafkw2l3QXwlpwsgKYp3OTuSINib5O
 fYHQ==
X-Gm-Message-State: ANoB5plwLi1Y0uyb3SqAIK9mhAql0ofyC5AHLQcSnrTKACrFd/r9Q5ue
 2pZ9S7Q/9bVzNpr7oAwDAV+FtANggbL0ZJhp8IRtrSN9Rm+QYfmcaMLnDDggFKR2jFmPMqwE+a+
 1jK6bV/0dhsQbvsI=
X-Received: by 2002:adf:a158:0:b0:241:b98f:fa22 with SMTP id
 r24-20020adfa158000000b00241b98ffa22mr11073269wrr.648.1669202653203; 
 Wed, 23 Nov 2022 03:24:13 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4j2biAr5LPDpMbdNgil+8+C9dYx3/hfihHXBSHFq9IW8jkCOLwXLjTxyWmNV2NGkAp8zEV8Q==
X-Received: by 2002:adf:a158:0:b0:241:b98f:fa22 with SMTP id
 r24-20020adfa158000000b00241b98ffa22mr11073256wrr.648.1669202652948; 
 Wed, 23 Nov 2022 03:24:12 -0800 (PST)
Received: from redhat.com ([2.52.16.74]) by smtp.gmail.com with ESMTPSA id
 r13-20020a056000014d00b0024165454262sm16315408wrx.11.2022.11.23.03.24.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 03:24:12 -0800 (PST)
Date: Wed, 23 Nov 2022 06:24:09 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: Stefan Berger <stefanb@linux.ibm.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, alex.williamson@redhat.com,
 stefanb@linux.vnet.ibm.com, cohuck@redhat.com, f4bug@amsat.org
Subject: Re: [PATCH v5 1/2] sysemu: tpm: Add a stub function for TPM_IS_CRB
Message-ID: <20221123062202-mutt-send-email-mst@kernel.org>
References: <20220506132510.1847942-1-eric.auger@redhat.com>
 <20220506132510.1847942-2-eric.auger@redhat.com>
 <96940f79-a6e0-d14f-5d74-abe280846f26@linux.ibm.com>
 <20221123013441-mutt-send-email-mst@kernel.org>
 <45e916e5-9297-a8e4-c539-123e0ee6347c@redhat.com>
 <20221123043005-mutt-send-email-mst@kernel.org>
 <9ffcc26f-e3b2-77f1-5929-6c6caf1ea64d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9ffcc26f-e3b2-77f1-5929-6c6caf1ea64d@redhat.com>
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

On Wed, Nov 23, 2022 at 12:10:09PM +0100, Eric Auger wrote:
> 
> 
> On 11/23/22 10:30, Michael S. Tsirkin wrote:
> > On Wed, Nov 23, 2022 at 09:18:39AM +0100, Eric Auger wrote:
> >> Hi,
> >>
> >> On 11/23/22 07:36, Michael S. Tsirkin wrote:
> >>> On Fri, May 06, 2022 at 09:47:52AM -0400, Stefan Berger wrote:
> >>>> On 5/6/22 09:25, Eric Auger wrote:
> >>>>> In a subsequent patch, VFIO will need to recognize if
> >>>>> a memory region owner is a TPM CRB device. Hence VFIO
> >>>>> needs to use TPM_IS_CRB() even if CONFIG_TPM is unset. So
> >>>>> let's add a stub function.
> >>>>>
> >>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >>>>> Suggested-by: Cornelia Huck <cohuck@redhat.com>
> >>>> Reviewed-by: Stefan Berger <stefanb@linnux.ibm.com>
> >>> ... and now in 7.2 vdpa needs a dependency on tpm too, what a hack :(
> >>> And what exactly is it about TPM CRB that everyone needs to
> >>> know about it and skip it? The API does not tell ...
> >> An excerpt of one reply I made at that time:
> >>
> >> The spec (CG PC Client Platform TPM Profile (PTP)
> >>     Specification Family “2.0” Level 00 Revision 01.03 v22, page 100) 
> >> says that the command/response data "may be defined as large as 3968",
> >> which is (0x1000 - 0x80), 0x80 being the size of the control struct.
> >> so the size of the region logically is less than a 4kB page, hence our
> >> trouble.
> >>
> >> We learnt in the past Windows driver has some stronger expectation wrt
> >> memory mapping. I don't know if those latter would work if we were to
> >> enlarge the window by some tricks.
> >>
> >> https://trustedcomputinggroup.org/wp-content/uploads/Mobile-Command-Response-Buffer-Interface-v2-r12-Specification_FINAL2.pdf
> >> says
> >>
> >> "
> >> Including the control structure, the three memory areas comprise the
> >> entirety of the CRB. There are no constraints on how those three memory
> >> areas are provided. They can all be in system RAM, or all be in device
> >> memory, or any combination.
> >>
> >> Thanks
> >>
> >> Eric
> > So we put it in system RAM then? But why isn't DMA there allowed?
> 
> I don't think there is any need and since it violates the alignment
> check in VFIO we discard the region from DMA mapped ones.
> 
> Thanks
> 
> Eric

If that's all then we could just check alignment -
why are we bothering with a tpm specific hack?


> >
> >>>>> ---
> >>>>>   include/sysemu/tpm.h | 6 ++++++
> >>>>>   1 file changed, 6 insertions(+)
> >>>>>
> >>>>> diff --git a/include/sysemu/tpm.h b/include/sysemu/tpm.h
> >>>>> index 68b2206463c..fb40e30ff60 100644
> >>>>> --- a/include/sysemu/tpm.h
> >>>>> +++ b/include/sysemu/tpm.h
> >>>>> @@ -80,6 +80,12 @@ static inline TPMVersion tpm_get_version(TPMIf *ti)
> >>>>>   #define tpm_init()  (0)
> >>>>>   #define tpm_cleanup()
> >>>>>
> >>>>> +/* needed for an alignment check in non-tpm code */
> >>>>> +static inline Object *TPM_IS_CRB(Object *obj)
> >>>>> +{
> >>>>> +     return NULL;
> >>>>> +}
> >>>>> +
> >>>>>   #endif /* CONFIG_TPM */
> >>>>>
> >>>>>   #endif /* QEMU_TPM_H */


