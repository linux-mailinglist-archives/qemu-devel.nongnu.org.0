Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 055AE68DF9E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 19:09:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPSNz-000400-Ti; Tue, 07 Feb 2023 13:08:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pPSNx-0003yX-3g
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 13:08:05 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pPSNv-0002B2-GX
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 13:08:04 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 hn2-20020a05600ca38200b003dc5cb96d46so13781889wmb.4
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 10:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Ph3FtF6Gv/w/0QY5AV76m674VYhK0WMzSLKeXPU3VT8=;
 b=ZTQViDBFio4J73KYlhcTZjeY0cK+IYZM6QJsf3Sg8ZCV1DZn3iZDbP4rOyioCTmygL
 0rCPYjyKKbUK6mo95nGrc7nMp7GfLIkUEDs+AYqxm78PYj/7CSXHRBFBXYQq8WaydroM
 A7j9oQi3ynhcj+BHe+k3UzPeReATp1t4PuxbKP1cLBd4sgZGb5PnMymnJRr5dolz4IOA
 y7p8RQKqWB/z2HtX58bhaWJipgDxWLk44oo2UPSZtVSjLKV+LZqy4iG2zxPlZwoTO4aE
 Db3rho7cmnHeYIeX4BDeeKmhFr1Xl2VWhdSzqjXKph90paFQq4XDq/Y8zp/S5nebSdzh
 /TVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ph3FtF6Gv/w/0QY5AV76m674VYhK0WMzSLKeXPU3VT8=;
 b=Xl05R5e3Z3robr0AECdh6387cN9FiWG87RB4iRwYAQWd+Rdn0vFfYCJgPlXKeuMm+f
 U/L2sl4b3NmvL/6ZmXFkVXElCMbIJIKeu6qsrzuHJQms4Ft3Qf5/rLvxZnINMINREJRt
 NkFDf0zi85t6rsjkSabIvPVNtW44pgjG6YJvUWhoRgUF8uY031FJgLy+3/cS4lnucyAB
 QA67FJmM8zqinPT5lGfj/bnNAmpruNgvizlXBN4M3P+RE1B8hFpJu3hJh5kMEdAD97sn
 vW5P2yon5sdrYgk7E1W9HEd94P/HybwOX8o+xmHTMgwBFt1Chy7rmyLvX1pP42y9/A0l
 uJDg==
X-Gm-Message-State: AO0yUKV4ya6HcFixD+xbUGtbW6Ybf46y1GqL7DLuNB2RxpUm8psMTzd/
 bPxLPTRz/320xzAkuJx1nEYDVw==
X-Google-Smtp-Source: AK7set+ZZXWIFK7H2bQtFicUbDOO63VEB4bZiMIRz032NSktoiSG3JMKtNVhwBftBHMiTVu7k4QB8Q==
X-Received: by 2002:a05:600c:4f54:b0:3df:f3cb:e8cb with SMTP id
 m20-20020a05600c4f5400b003dff3cbe8cbmr242685wmq.4.1675793280796; 
 Tue, 07 Feb 2023 10:08:00 -0800 (PST)
Received: from google.com (44.232.78.34.bc.googleusercontent.com.
 [34.78.232.44]) by smtp.gmail.com with ESMTPSA id
 i3-20020a5d5223000000b002bfae1398bbsm11805596wra.42.2023.02.07.10.08.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 10:08:00 -0800 (PST)
Date: Tue, 7 Feb 2023 18:07:44 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org, eric.auger@redhat.com,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v2] hw/arm/smmuv3: Add GBPA register
Message-ID: <Y+KTcKmTGXqKGID7@google.com>
References: <20230126141120.448641-1-smostafa@google.com>
 <CAFEAcA_gdg_bUwasDs0O54qL5_2=DEMzAFu22x4d7mrx6W5vLA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_gdg_bUwasDs0O54qL5_2=DEMzAFu22x4d7mrx6W5vLA@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=smostafa@google.com; helo=mail-wm1-x329.google.com
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

Hi Peter,

On Tue, Feb 07, 2023 at 02:03:02PM +0000, Peter Maydell wrote:
> On Thu, 26 Jan 2023 at 14:12, Mostafa Saleh <smostafa@google.com> wrote:
> >
> > GBPA register can be used to globally abort all
> > transactions.
> >
> > It is described in the SMMU manual in "6.3.14 SMMU_GBPA".
> > ABORT reset value is IMPLEMENTATION DEFINED, it is chosen to
> > be zero(Do not abort incoming transactions).
> >
> > Other fields have default values of Use Incoming.
> >
> > If UPDATE is not set, the write is ignored. This is the only permitted
> > behavior in SMMUv3.2 and later.(6.3.14.1 Update procedure)
> >
> > As this patch adds a new state to the SMMU (GBPA), it is added
> > in a new subsection for forward migration compatibility.
> >
> > Property "migrate-gbpa" was added to support backward compatibility.
> > However, if the GBPA.ABORT is set from SW at time of migration, the
> > GBPA migration will be forced to avoid inconsistencies where a qemu
> > instance is aborting transactions and it is migrated to another
> > instance bypassing them.
> 
> Nothing ever sets the migrate-gpba property to anything
> except its default 'true' value, so this (a) means that
> it breaks migration compat and (b) seems a bit unneccessary.
> 
> Can we say "migrate the field only if it is something other
> than its reset value", not have the property, and get
> migration compatibility that way ?
> 
> Otherwise the patch looks OK.
> 
> thanks
> -- PMM

Thanks for reviewing the patch. I am not really familiar with migration,
My understanding that this would be set from cmdline(that is how I tested it).

But yes, you are right, this is actually unnecessary, we can just
migrate only if GBPA value is different from reset value.

I will send v3 with this change.

Thanks,
Mostafa

