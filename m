Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1750930BA65
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 09:56:16 +0100 (CET)
Received: from localhost ([::1]:51988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6rTr-0008Pu-6A
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 03:56:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1l6rST-0007pa-UY
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 03:54:51 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:42080 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1l6rSR-0002qx-8U
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 03:54:49 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 6E0A641251;
 Tue,  2 Feb 2021 08:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1612256084;
 x=1614070485; bh=3+kSjxtAtPlS/9qfgK2Mr4MtW6voZCYGo4TNjgnoktU=; b=
 PU0dPZe8diCwum+m/LLvxZmkwLDcgf+yOAM9bULsXELOxZH1Me6CmfRNVbcbeWaf
 KpUdypkSXuPMPVoYPyUuoD7iFhnKTsE9f6SLJ8gvnTJxJYPr6ikUO+175zcex6pu
 d8+V8bV3elqOd65zGGxk69JVOe00SqKZAwt7CYvpdxc=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q06WOkABbXKx; Tue,  2 Feb 2021 11:54:44 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 37C7C4120D;
 Tue,  2 Feb 2021 11:54:44 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 2 Feb
 2021 11:54:44 +0300
Date: Tue, 2 Feb 2021 11:54:43 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3] tcg: Fix execution on Apple Silicon
Message-ID: <YBkTU8mkG3QbgTAy@SPB-NB-133.local>
References: <20210113032806.18220-1-r.bolshakov@yadro.com>
 <e0b70beb-2905-9520-e825-219278fe4ed7@linaro.org>
 <330c4b1a-6a8a-3625-8c39-7f9c88b20847@linaro.org>
 <YBR1GgEg+WLIo9/M@SPB-NB-133.local>
 <616e9fff-f4eb-8540-9628-2bce9c455c6b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <616e9fff-f4eb-8540-9628-2bce9c455c6b@linaro.org>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Alexander Graf <agraf@csgraf.de>, Joelle van Dyne <j@getutm.app>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 29, 2021 at 07:27:57PM -1000, Richard Henderson wrote:
> On 1/29/21 10:50 AM, Roman Bolshakov wrote:
> > 
> > I thought you already added MAP_JIT in 6f70ddee19e. It's getting enabled
> > on my M1 laptop. Was it intended or not?
> > 
> >     /* Applicable to both iOS and macOS (Apple Silicon). */
> >     if (!splitwx) {
> >         flags |= MAP_JIT;
> >     }
> > 
> > TCG from master branch of QEMU works fine on M1. I'm not sure why do we
> > need to duplicate it.
> 
> I thought there was something about abi/api build issues.  If there's nothing
> that needs doing, great!
> 

Hi Richard,

You're correct that older versions of OS X/macOS might not have MAP_JIT
definition, so a simple wrapping of the hunk with ifdef MAP_JIT might be
sufficient (or guard it for Big Sur and above):

  #if defined(MAC_OS_VERSION_11_0) && \
      MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_VERSION_11_0
      if (!splitwx && __builtin_available(macOS 11.0, *)) {
          flags |= MAP_JIT;
      }
  #endif

But I'm not sure if we want to support hosts older than 10.14.

Regards,
Roman

