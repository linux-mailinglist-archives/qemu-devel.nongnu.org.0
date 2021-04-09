Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 606E035A51C
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 19:58:20 +0200 (CEST)
Received: from localhost ([::1]:33056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUvOc-0008MS-Vd
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 13:58:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1lUvNW-0007ut-I9
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 13:57:11 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:44021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1lUvNT-00017l-9Z
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 13:57:10 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 x21-20020a17090a5315b029012c4a622e4aso3582329pjh.2
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 10:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JCXs8G8k/P/VUzD2FIP2qjuzYjeDR3xbVJNiYhuk2Q4=;
 b=cnCtL1NHYOFnS308NhM6xOndrh/pCddKQ6ONHZ4BWy91qf/PuekOFpem5NaK2lKeF8
 FYFzjkxccU2dzos3LQl1mTe8e+bnti5PrCgqJEU9QZQQajsa9behqmZugig9TJfVQDzp
 WSKBT9WSNULXm/7Ud0iULm+ZMw4rabANmb1n1YiSMjvSJBJpjeEdApwXKVXFCc03G8iL
 CwPENN/EV3LE2HKtORerIc5WyxZA8rpCHA4ha5SB1jRt9Jf9DMh0KsB6QMaQiNea9PAi
 s38fIaA49WDZSk2usuIHqwL69Y38hwU0yQF8dAaRj2womOrh20p4zGnd4jpxcEQ7Mp35
 kSag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JCXs8G8k/P/VUzD2FIP2qjuzYjeDR3xbVJNiYhuk2Q4=;
 b=XvRMJEWhvruI2ZNMzSLiQWO+Q3DHxrqCEtIi9SmZV+fPDfbM8otQhSsLAPAcMaOUBf
 wbiRiefuNP3wOUN5Ixhf+8XR8Si0f8Qy8/avSL/R4ubhKM03PKWoC66ui5vzRXCIbKgt
 y4SlYUkYZv6YkFXs7FeOV+iDM/1fCdFWz+rjBo/bo5B1UnUFBZ22izPJWqd9qZ/G1X7z
 7L289nQGEfeSB/yIDNgK24mKOrB78I8xlhAkb7BxSx7UwZ2TynyN+fUx+Z8ExCHXVyST
 RvQe3t4FxnmRmDtAYmMdHb5GdO+gA0dYco8NyHq5mUJ+OeQkPdglF2vGGx1C+T2b+ydq
 FD4g==
X-Gm-Message-State: AOAM530ZyVa0o4Ajg/WsiYE3MkWEgOlpOQngkHWjUxmv12fE6dRB9WMg
 v9M9tcKItfMTVCziyHigbe0=
X-Google-Smtp-Source: ABdhPJwgxO0paXbQQI72U9XuQM0I/47Xxsfp1ZcbJRLF8yDurdnTF2GHr1zLmy7oVvAifFqZ1sFD+A==
X-Received: by 2002:a17:90b:ecc:: with SMTP id
 gz12mr14801433pjb.79.1617991025245; 
 Fri, 09 Apr 2021 10:57:05 -0700 (PDT)
Received: from localhost ([192.55.55.43])
 by smtp.gmail.com with ESMTPSA id x1sm2811611pje.40.2021.04.09.10.57.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 10:57:04 -0700 (PDT)
Date: Fri, 9 Apr 2021 10:55:12 -0700
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] checkpatch: Fix use of uninitialized value
Message-ID: <20210409175512.GB218869@ls>
References: <161786467973.295167.5612704777283969903.stgit@bahia.lan>
 <20210408174913.GA218869@ls> <20210409074011.12ea4ed2@bahia.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210409074011.12ea4ed2@bahia.lan>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=isaku.yamahata@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: isaku.yamahata@intel.com, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Isaku Yamahata <isaku.yamahata@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 09, 2021 at 07:40:11AM +0200,
Greg Kurz <groug@kaod.org> wrote:

> On Thu, 8 Apr 2021 10:49:13 -0700
> Isaku Yamahata <isaku.yamahata@gmail.com> wrote:
> 
> > 
> > How about initializing them explicitly as follows?
> > ($realfile ne '') prevents the case realfile eq '' && acpi_testexpted eq ''.
> > Anyway your patch also should fix it. So
> > Reviewed-by: Isaku Yamahata <isaku.yamahata@intel.com>
> > 
> > 
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > index 8f7053ec9b..2eb894a628 100755
> > --- a/scripts/checkpatch.pl
> > +++ b/scripts/checkpatch.pl
> > @@ -1325,8 +1325,8 @@ sub process {
> >  	my %suppress_whiletrailers;
> >  	my %suppress_export;
> >  
> > -        my $acpi_testexpected;
> > -        my $acpi_nontestexpected;
> > +        my $acpi_testexpected = '';
> > +        my $acpi_nontestexpected = '';
> >  
> 
> Hmm... I haven't tried but I believe this will break when these are
> passed to checkfilename() :
> 
> sub checkfilename {
>         my ($name, $acpi_testexpected, $acpi_nontestexpected) = @_;
> [...]
>         if (defined $$acpi_testexpected and defined $$acpi_nontestexpected) {
>                 ERROR("Do not add expected files together with tests, " .
> 
> 
> >  	# Pre-scan the patch sanitizing the lines.

Oops. You're right. I scratch it.

-- 
Isaku Yamahata <isaku.yamahata@gmail.com>

