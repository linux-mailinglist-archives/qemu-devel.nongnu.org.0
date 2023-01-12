Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70405667CE2
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 18:46:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG1c6-0001hf-39; Thu, 12 Jan 2023 12:43:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pG1by-0001gQ-6S
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 12:43:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pG1bw-00030C-DQ
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 12:43:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673545411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q8K/J3ngYbpkfG8Q1Q/IuCkSZ858JPZU0keveTQ6P4I=;
 b=ZWNtoJPE9AzpaOleiKUWAYISl5PsOx6kodSgZTeS6Mz6KfX6u1rZ10nUJ6nJWTDmM2N8qn
 24FDPK2OIBgPd0wS1MMdCDRrG8XAEGPZpZU235Lyo9VXKAFps7SDu/H4MWyvru2os1mik4
 M/c5sK44tVgQbcFubqCKU2VdGtyjb1U=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-241-xwNW9L6lPgqWDbLjr98fTQ-1; Thu, 12 Jan 2023 12:43:30 -0500
X-MC-Unique: xwNW9L6lPgqWDbLjr98fTQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 o5-20020adfba05000000b0029064ccbe46so3665319wrg.9
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 09:43:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q8K/J3ngYbpkfG8Q1Q/IuCkSZ858JPZU0keveTQ6P4I=;
 b=S6QKkpZ58I+ZXLfG+cyZzKSLtByQgvCWrXl0DefMMFzgUnHC1BRKJhmKVv4xvr3TeD
 99a5otwBsB3aUPJncpH1nAsCh0IHDjBUGZX97XHxcJyoPwVIWn1t6WVB3XDCEAM6AmsF
 /h+0ClaxjU2OYHYkVmxON4cakdB2/+6lCa7TahNpCsgO107HCTHC6SyK6AzNrTPbVamE
 0nQbik63utEkfoaG0kLNRf7Krcuyp0+Rtn1kgw63YHhgWFgTG7qUOdwfbywocreO0Aj3
 GUrLg9GSveX0NJp/6H/pME/Trnhg90FgOnlpHRd/+J79cbHYnaJGsICKfxrKCiMnO32N
 HorQ==
X-Gm-Message-State: AFqh2kqndHoFUgcXVQZnj/7ZeD7a1naCuXWNO1DcpW6zU2IZDXwgMmpq
 FtshqYAANRz35RHk/rGSvg9f/+l4HtCyNjQPLz9+ccMzgL0McTwkqiQhabgIE7qypFu+ET/iq7e
 J234PBlnRy1/IGiI=
X-Received: by 2002:a05:600c:1e8c:b0:3da:1d94:bfa5 with SMTP id
 be12-20020a05600c1e8c00b003da1d94bfa5mr993420wmb.16.1673545409069; 
 Thu, 12 Jan 2023 09:43:29 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsR2WwyP5Vkv/KGXTNOZNSES1CqEIG83Ns/gkJOMdMj/28hfefPxK7WGjocouBUczrAVis1Hg==
X-Received: by 2002:a05:600c:1e8c:b0:3da:1d94:bfa5 with SMTP id
 be12-20020a05600c1e8c00b003da1d94bfa5mr993392wmb.16.1673545408803; 
 Thu, 12 Jan 2023 09:43:28 -0800 (PST)
Received: from redhat.com ([2.52.157.155]) by smtp.gmail.com with ESMTPSA id
 m18-20020a05600c4f5200b003c71358a42dsm36439441wmq.18.2023.01.12.09.43.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 09:43:28 -0800 (PST)
Date: Thu, 12 Jan 2023 12:43:23 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 imp@bsdimp.com, kevans@freebsd.org, ben.widawsky@intel.com,
 jonathan.cameron@huawei.com, kbastian@mail.uni-paderborn.de,
 jasowang@redhat.com, michael.roth@amd.com, kkostiuk@redhat.com,
 tsimpson@quicinc.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, philmd@linaro.org,
 Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH v3 1/1] include: Don't include qemu/osdep.h
Message-ID: <20230112124239-mutt-send-email-mst@kernel.org>
References: <20230112115005.1504812-1-armbru@redhat.com>
 <20230112115005.1504812-2-armbru@redhat.com>
 <20230112082537-mutt-send-email-mst@kernel.org>
 <Y8AewFAHRGf6ZI3x@redhat.com>
 <CAFEAcA9REU2emdHRhfO2=ZZB3K9O=eKSP1k5aVh_Hwh0+cCW5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA9REU2emdHRhfO2=ZZB3K9O=eKSP1k5aVh_Hwh0+cCW5w@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, Jan 12, 2023 at 03:58:56PM +0000, Peter Maydell wrote:
> On Thu, 12 Jan 2023 at 15:14, Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Thu, Jan 12, 2023 at 08:51:26AM -0500, Michael S. Tsirkin wrote:
> > > On Thu, Jan 12, 2023 at 12:50:05PM +0100, Markus Armbruster wrote:
> > > > docs/devel/style.rst mandates:
> > > >
> > > >     The "qemu/osdep.h" header contains preprocessor macros that affect
> > > >     the behavior of core system headers like <stdint.h>.  It must be
> > > >     the first include so that core system headers included by external
> > > >     libraries get the preprocessor macros that QEMU depends on.
> > > >
> > > >     Do not include "qemu/osdep.h" from header files since the .c file
> > > >     will have already included it.
> > > >
> > > > A few violations have crept in.  Fix them.
> > > >
> > > > Signed-off-by: Markus Armbruster <armbru@redhat.com>
> > > > Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> > > > Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> > > > Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
> > > > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > >
> > > With my awesome grep skillz I found one more:
> > > $ grep -r --include='*.h' qemu/osdep.h
> > > include/block/graph-lock.h:#include "qemu/osdep.h"
> > >
> > > Looks like all C files must include qemu/osdep.h, no?
> >
> > Yes, and IMHO that is/was a mistake, as it means our other header
> > files are not self-contained, which prevents developer tools from
> > reporting useful bugs when you're editting.
> 
> The underlying requirement is "osdep.h must be included
> before any system header file". "Always first in every .c file"
> is an easy way to achieve that, and "never in any .h file" is
> then not mandatory but falls out from the fact that any
> such include is pointless and only serves to increase
> the compilation time (and to increase the chances that
> you don't notice that you forgot osdep.h in your .c file).
> 
> If there's a better way to do this (e.g. one which meant
> that it was a compile error to put osdep includes in the
> wrong place or to omit them) then that would certainly
> save us periodically having to do this kind of fixup commit.
> 
> thanks
> -- PMM

yes I just posted a patch that will catch most (though not all)
such cases. if we switch to -include it will catch all of them
but there seems to be some resistance to this idea.


