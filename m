Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF24450B283
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 10:02:40 +0200 (CEST)
Received: from localhost ([::1]:60606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhoFT-0006EP-8f
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 04:02:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nhoAq-0003Gb-Ks
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 03:57:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nhoAn-0008H6-AZ
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 03:57:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650614267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SkiHOa+aenN9079jC13YJRIFEIqK0xKqdAhlkOCAQn8=;
 b=QW80tgR7Nsj4Bu7MWFtNenoPR98qq6YYil2LgZUwBjcxXD0w6wX0ciADwsKWepafODImLs
 n3M/LTXAuYH9KHYNUuc7GjdaoQjdWM1+znlvcYBTyJqt//E6SmryCcsPlMQguCqqyFxu4I
 YQ/7YgNvrrfEoRYdqTGMRhGQlyipVjI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-18-HgQexhuLMt6afvDB6BvrOw-1; Fri, 22 Apr 2022 03:57:46 -0400
X-MC-Unique: HgQexhuLMt6afvDB6BvrOw-1
Received: by mail-wr1-f70.google.com with SMTP id
 l7-20020adfa387000000b0020acc61dbaeso153560wrb.7
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 00:57:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=SkiHOa+aenN9079jC13YJRIFEIqK0xKqdAhlkOCAQn8=;
 b=mlNwAIeb7sR+bUyTjCBpvm912ikm5tjoMfCz5Ue8URDCDOaKGv3pcK7o6pNp3oUpWI
 o5LvxpJ+0Uv/xoxk32kEvH6v/yaLuPUEfTTINU3+Kqjf5K6LV37mmMaocb+RlMR2xpK+
 OpsYshrjXrO29rjNxZtIeYU9UoMEsMZ5elo7DE/SjfwkJbTamiig9MSVV389Mv46NX42
 ZGzo2turYhKl0J2IjupOnQtwQzSoMV4G/PLlVvfkwIV6rAzWsevSzAVmV6zBQCbnAXGV
 3YMwuuZIhsvtQJQY3Wl+3ETU3Xa3GIc0Fk8Qnf+tSILqIStA/THoLSqDH5TBiR7tc8Gp
 w0ug==
X-Gm-Message-State: AOAM533s815rJ1c7rmAMjou5OpJyjU9yPeqsuwUYfuG3JiYRmkk5wtOA
 0vZKUNw+Kb716heU3GFgaO/5iqvQputngk/TJmPAm8VliKvBehfS0QMmVBQvWsd+rLpIKyEH6uu
 0NNhvjuRk5x4mIos=
X-Received: by 2002:adf:d1cc:0:b0:20a:7ebe:8553 with SMTP id
 b12-20020adfd1cc000000b0020a7ebe8553mr2725358wrd.292.1650614264999; 
 Fri, 22 Apr 2022 00:57:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfVxp0LmFwr8puOCmhIIe5UciLxJl6WPimBkGJFOv8MuwoT3hkHSyFpfwS4I5YZHX3NCnSaQ==
X-Received: by 2002:adf:d1cc:0:b0:20a:7ebe:8553 with SMTP id
 b12-20020adfd1cc000000b0020a7ebe8553mr2725345wrd.292.1650614264748; 
 Fri, 22 Apr 2022 00:57:44 -0700 (PDT)
Received: from redhat.com ([2a03:c5c0:107d:f9b5:bcf:cc21:25f8:ae83])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a0560001a8d00b0020aab7cefc4sm1104500wry.46.2022.04.22.00.57.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 00:57:44 -0700 (PDT)
Date: Fri, 22 Apr 2022 03:57:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V2 1/4] intel-iommu: don't warn guest errors when getting
 rid2pasid entry
Message-ID: <20220422035626-mutt-send-email-mst@kernel.org>
References: <20220321055429.10260-1-jasowang@redhat.com>
 <20220321055429.10260-2-jasowang@redhat.com>
 <BN9PR11MB52769DCA64DCF7B107FD244B8C199@BN9PR11MB5276.namprd11.prod.outlook.com>
 <CACGkMEsKJjnBb0qPM8oZvSHt326pMF8JCN8Fu1Qqjeu5pmdfMg@mail.gmail.com>
 <c5a0a8e8-b000-9efa-b334-93637724f49d@intel.com>
 <d04f5de3-9e66-9bdb-b268-b7b64c8489bd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d04f5de3-9e66-9bdb-b268-b7b64c8489bd@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Yi Liu <yi.l.liu@intel.com>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peterx@redhat.com" <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 29, 2022 at 12:52:08PM +0800, Jason Wang wrote:
> 
> 在 2022/3/28 下午4:53, Yi Liu 写道:
> > 
> > 
> > On 2022/3/28 10:27, Jason Wang wrote:
> > > On Thu, Mar 24, 2022 at 4:21 PM Tian, Kevin <kevin.tian@intel.com>
> > > wrote:
> > > > 
> > > > > From: Jason Wang
> > > > > Sent: Monday, March 21, 2022 1:54 PM
> > > > > 
> > > > > We use to warn on wrong rid2pasid entry. But this error could be
> > > > > triggered by the guest and could happens during initialization. So
> > > > > let's don't warn in this case.
> > > > > 
> > > > > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > > > > ---
> > > > >   hw/i386/intel_iommu.c | 6 ++++--
> > > > >   1 file changed, 4 insertions(+), 2 deletions(-)
> > > > > 
> > > > > diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> > > > > index 874d01c162..90964b201c 100644
> > > > > --- a/hw/i386/intel_iommu.c
> > > > > +++ b/hw/i386/intel_iommu.c
> > > > > @@ -1554,8 +1554,10 @@ static bool vtd_dev_pt_enabled(IntelIOMMUState
> > > > > *s, VTDContextEntry *ce)
> > > > >       if (s->root_scalable) {
> > > > >           ret = vtd_ce_get_rid2pasid_entry(s, ce, &pe);
> > > > >           if (ret) {
> > > > > -            error_report_once("%s:
> > > > > vtd_ce_get_rid2pasid_entry error: %"PRId32,
> > > > > -                              __func__, ret);
> > > > > +            /*
> > > > > +             * This error is guest triggerable. We should assumt PT
> > > > > +             * not enabled for safety.
> > > > > +             */
> > > > 
> > > > suppose a VT-d fault should be queued in this case besides
> > > > returning false:
> > > > 
> > > > SPD.1: A hardware attempt to access the scalable-mode PASID-directory
> > > > entry referenced through the PASIDDIRPTR field in scalable-mode
> > > > context-entry resulted in an error
> > > > 
> > > > SPT.1: A hardware attempt to access a scalable-mode PASID-table entry
> > > > referenced through the SMPTBLPTR field in a scalable-mode
> > > > PASID-directory
> > > > entry resulted in an error.
> > > 
> > > Probably, but this issue is not introduced in this patch. We can fix
> > > it on top if necessary.
> > 
> > agreed.
> > 
> > > > 
> > > > Currently the implementation of vtd_ce_get_rid2pasid_entry() is also
> > > > problematic. According to VT-d spec, RID2PASID field is effective only
> > > > when ecap.rps is true otherwise PASID#0 is used for RID2PASID. I didn't
> > > > see ecap.rps is set, neither is it checked in that function. It
> > > > works possibly
> > > > just because Linux currently programs 0 to RID2PASID...
> > > 
> > > This seems to be another issue since the introduction of scalable mode.
> > 
> > yes. this is not introduced in this series. The current scalable mode
> > vIOMMU support was following 3.0 spec, while RPS is added in 3.1. Needs
> > to be fixed.
> 
> 
> Interesting, so this is more complicated when dealing with migration
> compatibility. So what I suggest is probably something like:
> 
> -device intel-iommu,version=$version
> 
> Then we can maintain migration compatibility correctly. For 3.0 we can go
> without RPS and 3.1 and above we need to implement RPS.
> 
> Since most of the advanced features has not been implemented, we may
> probably start just from 3.4 (assuming it's the latest version). And all of
> the following effort should be done for 3.4 in order to productize it.
> 
> Thanks

I would advise calling it x-version. And declare it unstable for now.  I
think that we don't at this point want to support users tweaking version
to arbitrary values.


> 
> > 
> > > Thanks
> > > 
> > > > 
> > > > >               return false;
> > > > >           }
> > > > >           return (VTD_PE_GET_TYPE(&pe) == VTD_SM_PASID_ENTRY_PT);
> > > > > -- 
> > > > > 2.25.1
> > > > > 
> > > > 
> > > 
> > 


