Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 299F963568D
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 10:32:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxm5x-0007HV-82; Wed, 23 Nov 2022 04:31:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oxm5g-0007Di-Vr
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 04:30:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oxm5e-0004Mj-PA
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 04:30:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669195845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Totho/lv8e8jMWXtdnZV8dDJQnEL/npZ0sOF1CeQA44=;
 b=fGXVhWUoBw5eLQDUhW27crQoUQk5m/XIx8lYN2ZKgAWPy7x6tVEu40bgZN9uE8mTTpNFPa
 +1x/Ke8rM8nvjJx0neiLdgT0QnESRvVXT7TaDy3Sa9AC68f/9W5O2SM+EYuqkltatEJ+uD
 8LwXYGHv2URZbtvdTax4/rBJKu+kjwM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-324-8mEvFVO0OZib71JfoCP0Qw-1; Wed, 23 Nov 2022 04:30:42 -0500
X-MC-Unique: 8mEvFVO0OZib71JfoCP0Qw-1
Received: by mail-wr1-f71.google.com with SMTP id
 s1-20020adfa281000000b00241f7467851so15460wra.17
 for <qemu-devel@nongnu.org>; Wed, 23 Nov 2022 01:30:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Totho/lv8e8jMWXtdnZV8dDJQnEL/npZ0sOF1CeQA44=;
 b=xYztmgHWiCrRXcV1ii1zbdb2tubx5kM+OrAmTIFZaVfYueQYJqR5oW5moZ7geXkBmJ
 F/f3Tk1c2cph0Lwbohc7p0YfztFJ2aO/kQbdmlL/3+9oCyoOyJojbs+7ykA2IBdOMl9l
 WX9+FZUxz7FEig2y6plS7CkPilp4Sepjm8rOeUiBDFDbd/wH3B+rYvrI+PBRGAodqPIB
 JLVdrR/dVMGOjU3ury57XDxCvF6KbFutnHhPwNchcm8yzPvLC4MTRN7UT8BpnoyeIzRT
 ePOaKaYnT7+sI0Z8FKt0xcyhEzMlD6t/NNtqRpGrqJ32XAUUl4IPnEScRPXmusmQoWo5
 MkHg==
X-Gm-Message-State: ANoB5plubNI2IpsfyPo9WtuT+jQvK0jflEUTo1ZhFv1c9h1+QBp/hdIb
 gtjyCWrmoTbUeUTzRHhSwbKyNHAG1GwZu8w8dlJ4CvbJA++lrCDp+9StoB77bXcD2D71KyoKlHZ
 NuRmcXd5fL3g653E=
X-Received: by 2002:adf:e844:0:b0:241:bfc9:5975 with SMTP id
 d4-20020adfe844000000b00241bfc95975mr9184146wrn.605.1669195841638; 
 Wed, 23 Nov 2022 01:30:41 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5Gr557XegSQv57m/KUYfkt4STY/rCiVOWsoiDBDPq5U4cDzL3IT4nEmwWmjhESsn9JERF7zQ==
X-Received: by 2002:adf:e844:0:b0:241:bfc9:5975 with SMTP id
 d4-20020adfe844000000b00241bfc95975mr9184134wrn.605.1669195841393; 
 Wed, 23 Nov 2022 01:30:41 -0800 (PST)
Received: from redhat.com ([2.52.16.74]) by smtp.gmail.com with ESMTPSA id
 y10-20020a5d620a000000b002366dd0e030sm16139761wru.68.2022.11.23.01.30.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 01:30:40 -0800 (PST)
Date: Wed, 23 Nov 2022 04:30:37 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: Stefan Berger <stefanb@linux.ibm.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, alex.williamson@redhat.com,
 stefanb@linux.vnet.ibm.com, cohuck@redhat.com, f4bug@amsat.org
Subject: Re: [PATCH v5 1/2] sysemu: tpm: Add a stub function for TPM_IS_CRB
Message-ID: <20221123043005-mutt-send-email-mst@kernel.org>
References: <20220506132510.1847942-1-eric.auger@redhat.com>
 <20220506132510.1847942-2-eric.auger@redhat.com>
 <96940f79-a6e0-d14f-5d74-abe280846f26@linux.ibm.com>
 <20221123013441-mutt-send-email-mst@kernel.org>
 <45e916e5-9297-a8e4-c539-123e0ee6347c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <45e916e5-9297-a8e4-c539-123e0ee6347c@redhat.com>
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

On Wed, Nov 23, 2022 at 09:18:39AM +0100, Eric Auger wrote:
> Hi,
> 
> On 11/23/22 07:36, Michael S. Tsirkin wrote:
> > On Fri, May 06, 2022 at 09:47:52AM -0400, Stefan Berger wrote:
> >>
> >> On 5/6/22 09:25, Eric Auger wrote:
> >>> In a subsequent patch, VFIO will need to recognize if
> >>> a memory region owner is a TPM CRB device. Hence VFIO
> >>> needs to use TPM_IS_CRB() even if CONFIG_TPM is unset. So
> >>> let's add a stub function.
> >>>
> >>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >>> Suggested-by: Cornelia Huck <cohuck@redhat.com>
> >> Reviewed-by: Stefan Berger <stefanb@linnux.ibm.com>
> > ... and now in 7.2 vdpa needs a dependency on tpm too, what a hack :(
> > And what exactly is it about TPM CRB that everyone needs to
> > know about it and skip it? The API does not tell ...
> An excerpt of one reply I made at that time:
> 
> The spec (CG PC Client Platform TPM Profile (PTP)
>     Specification Family “2.0” Level 00 Revision 01.03 v22, page 100) 
> says that the command/response data "may be defined as large as 3968",
> which is (0x1000 - 0x80), 0x80 being the size of the control struct.
> so the size of the region logically is less than a 4kB page, hence our
> trouble.
> 
> We learnt in the past Windows driver has some stronger expectation wrt
> memory mapping. I don't know if those latter would work if we were to
> enlarge the window by some tricks.
> 
> https://trustedcomputinggroup.org/wp-content/uploads/Mobile-Command-Response-Buffer-Interface-v2-r12-Specification_FINAL2.pdf
> says
> 
> "
> Including the control structure, the three memory areas comprise the
> entirety of the CRB. There are no constraints on how those three memory
> areas are provided. They can all be in system RAM, or all be in device
> memory, or any combination.
> 
> Thanks
> 
> Eric

So we put it in system RAM then? But why isn't DMA there allowed?

> >
> >>> ---
> >>>   include/sysemu/tpm.h | 6 ++++++
> >>>   1 file changed, 6 insertions(+)
> >>>
> >>> diff --git a/include/sysemu/tpm.h b/include/sysemu/tpm.h
> >>> index 68b2206463c..fb40e30ff60 100644
> >>> --- a/include/sysemu/tpm.h
> >>> +++ b/include/sysemu/tpm.h
> >>> @@ -80,6 +80,12 @@ static inline TPMVersion tpm_get_version(TPMIf *ti)
> >>>   #define tpm_init()  (0)
> >>>   #define tpm_cleanup()
> >>>
> >>> +/* needed for an alignment check in non-tpm code */
> >>> +static inline Object *TPM_IS_CRB(Object *obj)
> >>> +{
> >>> +     return NULL;
> >>> +}
> >>> +
> >>>   #endif /* CONFIG_TPM */
> >>>
> >>>   #endif /* QEMU_TPM_H */
> >>


