Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C0F699588
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 14:18:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSe8P-0002OD-VM; Thu, 16 Feb 2023 08:17:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pSe8N-0002Nn-9z
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 08:17:11 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pSe8K-0002kz-Ec
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 08:17:11 -0500
Received: by mail-wm1-x336.google.com with SMTP id n33so1583766wms.0
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 05:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=aajx42+edRFDRtjphwx6vIDAqm2MFL4c2Qd6sf5sRp4=;
 b=Ggqzx+acWzK+DKeqehUK3SWwxkSlqL7S5waLXMzVE8ErXIlT6hUlA7ExcmbjpHr69r
 hFbLHlty84uUzWu4W87G+bWnqXPWlFIzAvmqgL5FKo3T540cb3yAm+Qaomba4EU5WRsZ
 quPNoP+dJHc+hZozSDNJt+bzZxdTo8fjcZFhy+kjOZLfGICQB9X+JhFA4AV85VxL3Tvw
 KT0U5oxdhx+orB3vQnxtKT2gizSOM64CJZM63g60vGWNvQV/H0UW/Sr/8dZePi+tNezP
 3dRuCW5VNlxerazsCX62Ih1JgJQxz7+Ajiul1SoEVAnwTarFLGJQ+Rv73XDkaPVkubpT
 X3mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aajx42+edRFDRtjphwx6vIDAqm2MFL4c2Qd6sf5sRp4=;
 b=Yq253HRZLurOSWV+EHQ3pCX0Z7y3MDL02X/QlyfnrpIHAIgsOMBAAYc1oGFHEHeNJd
 QLz5Wm+cAiasOKdfuchy5eO7aQcFyGjB5hz64tEMbVc8Ea36xbSZhwY6k7lJsBh537Bz
 lPOOUXoSnyVUJfxhzu5tf9iLZIA3tGsS6pz0ARunwcMfZfcUO71UPEe/VUpZEtA40Xrh
 fU/Ra5p16xnkS0ROhdsvKo641fQ1Nzugs5yMTd5hpHDzGW8MIJkjJmgHUu4LzAzxgpB7
 /zec7punsKLVPleUOOZKbSdXXk54WXLgTHbctLPMPAPYgp5ZGzJewOzH3uoZX2TUxQok
 b6Pg==
X-Gm-Message-State: AO0yUKWZbT2AryQ5Sg2FFnbCybQzZSFoo5UjidA6OTbZCCiyZa9xy4eB
 8DD0lSkU/woeFmWtfQ7tvJYmbA==
X-Google-Smtp-Source: AK7set99JFRD7afl5bJTKoqSCxhlCSzVWrWJiBx8aejMP31+DJnMB0gTlWeduN7uMwiTttGy9Yz/rQ==
X-Received: by 2002:a05:600c:213:b0:3df:f3ce:be48 with SMTP id
 19-20020a05600c021300b003dff3cebe48mr165202wmi.7.1676553426582; 
 Thu, 16 Feb 2023 05:17:06 -0800 (PST)
Received: from google.com (44.232.78.34.bc.googleusercontent.com.
 [34.78.232.44]) by smtp.gmail.com with ESMTPSA id
 m22-20020a05600c3b1600b003daf6e3bc2fsm10661417wms.1.2023.02.16.05.17.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 05:17:06 -0800 (PST)
Date: Thu, 16 Feb 2023 13:17:02 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
Subject: Re: [RFC PATCH 06/16] hw/arm/smmuv3: Parse STE config for stage-2
Message-ID: <Y+4szt24KUwaz50y@google.com>
References: <20230205094411.793816-1-smostafa@google.com>
 <20230205094411.793816-7-smostafa@google.com>
 <3086b46d-b7dd-5403-f0c0-7051a7fbc189@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3086b46d-b7dd-5403-f0c0-7051a7fbc189@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=smostafa@google.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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

On Wed, Feb 15, 2023 at 06:47:52PM +0100, Eric Auger wrote:
> On 2/5/23 10:44, Mostafa Saleh wrote:
> > Parse stage-2 configuration and populate it in SMMUTransCfg.
> > Configs in this patch (s2g, ttb, tsz, sl0).
> above 'sentence' a bit cryptic.
I will reword it.

> > +++ b/hw/arm/smmuv3.c
> > @@ -366,7 +366,48 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
> >          return 0;
> >      }
> >  
> > -    if (STE_CFG_S2_ENABLED(config)) {
> > +    if (STAGE2_SUPPORTED(s->features) && STE_CFG_S2_ENABLED(config)) {
> Don't you want to check both S1 and S2 aren't set?
Yes, currently this is ignored, but looking at the SMMU manual it is
illegal to configure an unsupported stage, I will update it.

> > +            break;
> > +        case 0x2: /* 16KB */
> > +            cfg->s2cfg.granule_sz = 14;
> > +            break;
> > +        default:
> > +            qemu_log_mask(LOG_GUEST_ERROR,
> > +                          "SMMUv3 bad STE S2TG: %x\n", STE_S2TG(ste));
> > +            goto bad_ste;
> > +        }
> > +
> > +        cfg->s2cfg.vttb = STE_S2TTB(ste);
> > +        cfg->s2cfg.tsz = STE_S2T0SZ(ste);
> What about IDR3.STT currently 0 so S2T0SZ <= 39
> 
> don't you need to check against SMMU_IDR3.STT/S2TG
> 
> • In architectures after SMMUv3.0:
> – If STE.S2TG selects a 4KB or 16KB granule, the minimum valid value for
> this field is MAX(16,
> 64-IAS).
> – If STE.S2TG selects a 64KB granule, the minimum valid value for this
> field is (64-IAS).
I will add a function to validate S2T0SZ based on the behaviour after
SMMUv3.0 and checks against STT disabled. I believe it is safe just to
check S2T0SZ <= 39 without checking IDR3.STT as we don’t support it
for now.

> > +                          cfg->s2cfg.tsz);
> > +            goto bad_ste;
> > +        }
> > +
> > +        cfg->s2cfg.sl0 = STE_S2SL0(ste);
> > +        if (cfg->s2cfg.sl0 == 0x3) {
> > +            qemu_log_mask(LOG_UNIMP,
> > +                          "SMMUv3 STE->SL0 0x3 has no meaning!\n");
> > +            goto bad_ste;
> what about S2PS, S2VMID?
> 
> you may either squash [RFC PATCH 11/16] hw/arm/smmuv3: Read VMID from
> STE into that patch or at least mention in the commit msg that S2VMID
> will be dealt with separately
I will squash it with
"[RFC PATCH 11/16] hw/arm/smmuv3: Read VMID from STE"
I missed S2PS, I will add it in V2.

Thanks,
Mostafa

