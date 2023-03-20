Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B73D36C2177
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 20:31:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peLCt-00010P-67; Mon, 20 Mar 2023 15:30:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1peLCr-0000zt-AY
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 15:30:09 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1peLCm-0005fM-11
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 15:30:08 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3ed2a586c34so173905e9.0
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 12:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1679340600;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SnUV8hN39JglPIbCSoORn1R7yDyPl5d1L/ZnrEvRfrw=;
 b=I5fcfXYfTp9KPUoFp4hSj0i0nL867aWFsTnLm35b9B/WToM6pN7jzsbE5CwHqyA43z
 5Rkvyj8T2Yx1usuoIadVv7RI6Ly3cWYjdKG0/8cnLwKYbR79hDFiCXijgvi7U6Mif9wj
 cYlpwOKh+F1RtQa+UcbMz5nsjlCrxSgcnqGuhLCFU8IlfffIZ+k5BMnqoQlgwDv0rcXy
 4MHKXvZlkSdCGFG2o3LB8dbBYNVB2QU+u5c/u2ovKxuh27XpYv/a8qasoUnKh/mKiZrV
 BZtVBKm7tkU2aQv9mL7OWaE04Y2r9Os4OAK/+rVk+fRbduPJcfSFmjw89mXV8iO3CQsQ
 LQLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679340600;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SnUV8hN39JglPIbCSoORn1R7yDyPl5d1L/ZnrEvRfrw=;
 b=1dopeV6SqcSdldG+q8dEkMY/3LeYaB2T5AvBx/03dnSjJDY1M0JOeDWbrY8vI1pu+E
 Ire8gY3EzpOsswqcpy52DYLAbKEK2HuNZQAa3xD2sjvBjfdllTJDx5oXN6pwNE7ViMsw
 Y/R53lHdxW2vCJcY5diEMWVUNMFH0y3mOjTiiKY41GBge1yLDKP35CkcD51+8hTgWUG8
 0vIe8nIyZaPwQg0a0I7LOwWGSeg2GXDKiLzCVK0Dxm/ugdmLI39JriJO4zyPkPoN8pAn
 1eVEfjG+jpQCZObMQMiJGDkeXQr5IUcJ+AA0W4H2ZL80a4OOKbsnBtww7ufr6AvPCwEc
 mX+w==
X-Gm-Message-State: AO0yUKXhqgrR+5dUj9gr1ehPDILMB/yOzObFQCOTHgHcCwN3BZjPCtEt
 75Vj2xXtJjA5cmXq3noS3FXJug==
X-Google-Smtp-Source: AK7set/FDgH0lP8eXMhD8hd/gv1KHDF4Sytf43lxZ2dSZy5ry5OY9UWyT+hkOR2VQ4LgroWaHYkRSg==
X-Received: by 2002:a05:600c:1c12:b0:3df:f3ce:be44 with SMTP id
 j18-20020a05600c1c1200b003dff3cebe44mr27522wms.3.1679340600339; 
 Mon, 20 Mar 2023 12:30:00 -0700 (PDT)
Received: from google.com (44.232.78.34.bc.googleusercontent.com.
 [34.78.232.44]) by smtp.gmail.com with ESMTPSA id
 z23-20020a7bc7d7000000b003ee1b2ab9a0sm1146241wmk.11.2023.03.20.12.29.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 12:29:59 -0700 (PDT)
Date: Mon, 20 Mar 2023 19:29:54 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org,
 peter.maydell@linaro.org, qemu-arm@nongnu.org, richard.henderson@linaro.org
Subject: Re: [RFC PATCH v2 08/11] hw/arm/smmuv3: Add CMDs related to stage-2
Message-ID: <ZBi0MmXpQJFxh/bh@google.com>
References: <20230226220650.1480786-1-smostafa@google.com>
 <20230226220650.1480786-9-smostafa@google.com>
 <4960b6a9-4044-eee4-c790-fd18ce1033e8@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4960b6a9-4044-eee4-c790-fd18ce1033e8@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=smostafa@google.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

Hi Eric,

On Mon, Mar 20, 2023 at 05:51:07PM +0100, Eric Auger wrote:
> Hi Mostafa,
> 
> On 2/26/23 23:06, Mostafa Saleh wrote:
> > CMD_TLBI_S2_IPA: As S1+S2 is not enabled, for now this can be the
> > same as CMD_TLBI_NH_VAA.
> >
> > CMD_TLBI_S12_VMALL: Added new function to invalidate TLB by VMID.
> >
> > For stage-1 only commands, add a check to to throw CERROR_ILL if used
> s/to to/to
Will do.

> > @@ -1211,12 +1211,22 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
> >          {
> >              uint16_t asid = CMD_ASID(&cmd);
> >  
> > +            if (!STAGE1_SUPPORTED(s)) {
> > +                cmd_error = SMMU_CERROR_ILL;
> Well looking further this is not said explicitly this should return
> 
> SMMU_CERROR_ILL. Maybe you should mark it as a guest error because we do not expect a guest to send such command when S1 is not supported?
> 
I can add a check after the switch for SMMU_CERROR_ILL to log a guest
error. 
> > +                break;
> > +            }
> > +
> >              trace_smmuv3_cmdq_tlbi_nh_asid(asid);
> >              smmu_inv_notifiers_all(&s->smmu_state);
> >              smmu_iotlb_inv_asid(bs, asid);
> >              break;
> >          }
> >          case SMMU_CMD_TLBI_NH_ALL:
> > +            if (!STAGE1_SUPPORTED(s)) {
> > +                cmd_error = SMMU_CERROR_ILL;
> > +                break;
> 
> there is a VMID field. Can't this be used in S2 mode as well?
According to the user manual "4.4.2 TLB invalidation of stage 1"
CMD_TLBI_NH_ALL causes CERROR_ILL if stage-1 is not supported.

Thanks,
Mostafa

