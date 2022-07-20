Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9CC57B6E9
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 14:58:42 +0200 (CEST)
Received: from localhost ([::1]:37140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE9Hl-0006Yx-M8
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 08:58:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oE9EY-0001yG-HQ
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 08:55:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oE9EP-0003ar-OG
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 08:55:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658321710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fwQwdEybxaPiKXD5OTVJ9laepUFrEQRfAkjQcDL14LY=;
 b=OUeIahLI/tSWFjW9SHXKdNI5oEKNMWZQg9XEbCc9lHdCPmgZdINlBuBHARO1SqUeEgBOG1
 D4dZmZPjUNgqfUX0doslqItvetGOoenG3K6Q2DGIUpptly8NfjfIOCjoC3yJzvAx8CfunE
 y3+jkdusTXr9Rn0r+sXoMQY7ApQCoMI=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-DXVyxRYiNYyxg-Oo1xNy6g-1; Wed, 20 Jul 2022 08:55:09 -0400
X-MC-Unique: DXVyxRYiNYyxg-Oo1xNy6g-1
Received: by mail-qk1-f200.google.com with SMTP id
 v13-20020a05620a0f0d00b006b5f0ec742eso6062317qkl.2
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 05:55:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fwQwdEybxaPiKXD5OTVJ9laepUFrEQRfAkjQcDL14LY=;
 b=yz7Ia1JmaW3Rf8YVd48QIyPkUAdd8lURzNWUqmCUt1It5U0k5GOrFGx3c6jxuUygTg
 6U80h6+7gs4RQmDoQOVRdgvDVnlkacPjQAV/iuaTafVtCcWroK6iTZk+qpG/tBboxTbV
 66iN52f2JCSvYLaFVnUD4wrTrFNh7W8b++kuxAzwv5kVfmAt5mtwjQstJlugPPajnf+N
 egV7niNMrgdiL6qdtkUuMEpIN+cJ3AZN9yKLQFeW2xJuw+GvSD91QVG/mcHJ/++Yk3be
 4aDXKJYPSRThfuBZu/FVomPy2SalpzrnYOX6MozHpQkd9NzDFxq2iCTHyGjAA0miA3Me
 BSQA==
X-Gm-Message-State: AJIora+nufNfPv8CsChS6hnWC/K4n+Ls5Sx01bi1kN+tGidT/T/IekEw
 ABRTcA6W5rCti0QIrRvCQ694XG5n2mml90scbCPzEYBDggUCwcdJqPDmjKyWEEqNCnsshrypWbZ
 HngwyKXBhvje/mPU=
X-Received: by 2002:a05:620a:1399:b0:6b5:e989:9e6e with SMTP id
 k25-20020a05620a139900b006b5e9899e6emr9988497qki.325.1658321709030; 
 Wed, 20 Jul 2022 05:55:09 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sTqho3eWHO2UL8Vt1P9Ga3/kXbvg34fydT3/REWovl7SFwVmWhdNbrrCXY4cT7qUTqGYcCYg==
X-Received: by 2002:a05:620a:1399:b0:6b5:e989:9e6e with SMTP id
 k25-20020a05620a139900b006b5e9899e6emr9988480qki.325.1658321708836; 
 Wed, 20 Jul 2022 05:55:08 -0700 (PDT)
Received: from xz-m1.local
 (bras-base-aurron9127w-grc-37-74-12-30-48.dsl.bell.ca. [74.12.30.48])
 by smtp.gmail.com with ESMTPSA id
 fy19-20020a05622a5a1300b002f936bae288sm6354364qtb.87.2022.07.20.05.55.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 05:55:08 -0700 (PDT)
Date: Wed, 20 Jul 2022 08:55:07 -0400
From: Peter Xu <peterx@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH] tests: migration-test: Allow test to run without uffd
Message-ID: <Ytf7K+Vhbz+hRNdI@xz-m1.local>
References: <20220707184600.24164-1-peterx@redhat.com>
 <bcd9b961-d1b5-e334-5bb1-7ee56be29725@redhat.com>
 <YtWxHSjpORK31aLs@xz-m1.local>
 <4ebe2d62-b627-3d2b-3c3e-73701fbf7be5@redhat.com>
 <YtaJg0zU8Fo3p2NB@redhat.com> <YtcLucZuvELrFC0f@xz-m1.local>
 <718b0346-dd8c-ef5a-4089-b4e2ac7b1302@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <718b0346-dd8c-ef5a-4089-b4e2ac7b1302@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 20, 2022 at 12:52:02PM +0200, Thomas Huth wrote:
> On 19/07/2022 21.53, Peter Xu wrote:
> ...
> > It seems the button to generate API token just didn't have a respond for me
> > until I refresh the page (then I can see some token generated), however I
> > still haven't figured out a way to see the initial 6 letters since they'll
> > be always masked out..  Changing browser didn't work for me either. :(
> 
> I haven't tried in a while, but IIRC the token is indeed only shown at the
> first access - and if that's not happening for you, then there is likely
> something broken. Are you using some plug in like uMatrix or the like? Maybe
> it helps to switch that off?

Sadly no, besides the Chrome I commonly use I also tried a fresh new
Firefox and Safari on different hosts.  None worked for me..

-- 
Peter Xu


