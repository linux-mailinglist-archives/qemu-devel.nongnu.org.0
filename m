Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E82BD436DA0
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 00:40:19 +0200 (CEST)
Received: from localhost ([::1]:36336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdgjT-0004Vn-1P
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 18:40:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mdgeP-0003WD-Bc
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 18:35:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mdgeN-0006sh-9z
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 18:35:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634855701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=irIoG3CttG7e7fgz76sTwXmtcjSjbMBRymRUj99jkfs=;
 b=GFqnE0GTvtpgztjeg809iPqu57PsvO3gj7ocqDos8hozAEqY92p17SB/3CiwERtbeaXE2A
 +X9Gk8ItESSx5cT6lefzXSbuSvQcjPHT9Q9LYaQMG5QIv0nvHSdPw+eGOAFyIfANFooqV8
 flfqYWhWiv7hw3kbqyIR72qeWRiFwhg=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-130-8VCmUknrNpSKv93qzUCRlA-1; Thu, 21 Oct 2021 18:34:59 -0400
X-MC-Unique: 8VCmUknrNpSKv93qzUCRlA-1
Received: by mail-lj1-f198.google.com with SMTP id
 v13-20020a2e2f0d000000b0021126b5cca2so694049ljv.19
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 15:34:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=irIoG3CttG7e7fgz76sTwXmtcjSjbMBRymRUj99jkfs=;
 b=eL8FPeB3Ai6SETE0COx2XW9nZAAq2TrckM2UTsk08uoWpaP7LaUiFVsmnN6uJ2S7gD
 frEF+aXXDtDD2aRhqPdJne3DZYFNvJDAc1E+dHz9wqZcHSvf44LMHjKgxVp3e0ekarRx
 aW7Vr54mowoSDDsROqT4DY+VAqZpXNMzeweixNC33HKuhIbgNSqBlNndLyR3Z6iTO8+3
 KBdnU1N3jHWjINRfUpPtYFjuXUZGm0JB6fHxKcfFSjvOA3yPhICG6WerLqTK3sMiZd12
 N5LHOggdZ5+srq3YLvtvniy43YeHUgk7SrtycqDL9JM3xlyWjrBhzeoTELZwwYk6AzNV
 k5kg==
X-Gm-Message-State: AOAM5307q+Zu49F8R3EUn1hyjI/KBUNv1GeCPApAPZRGcMvVafoaHvWb
 N683DE9Qd7PxHvV2sxu2dJWNkR+cNKeLcTn0gXSXyH1TAXf4f8KYYtQxRaYPL5a/EHwX7C7JX8x
 91w7vOnrXk0n0n/RaiNnba6rP/lu8ZyE=
X-Received: by 2002:a05:6512:3a8e:: with SMTP id
 q14mr7698512lfu.215.1634855698377; 
 Thu, 21 Oct 2021 15:34:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwI1pfxahHQZ2Sld5qXWSYfslHkBRfknP4csVOT7yGTTMY8RoI+wunXObAD5beWslyCwRo74aZyDqAHkTaJTmc=
X-Received: by 2002:a05:6512:3a8e:: with SMTP id
 q14mr7698488lfu.215.1634855698028; 
 Thu, 21 Oct 2021 15:34:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210910112624.72748-1-luis.pires@eldorado.org.br>
 <20210910112624.72748-4-luis.pires@eldorado.org.br>
 <e324a9af-daab-273b-e448-33386c79e4e6@linaro.org>
In-Reply-To: <e324a9af-daab-273b-e448-33386c79e4e6@linaro.org>
From: Eduardo Habkost <ehabkost@redhat.com>
Date: Thu, 21 Oct 2021 18:34:42 -0400
Message-ID: <CAOpTY_r21YorsZVWyV8D7yOD-wXvNfhj-i9YO2VKgLWjq=_jbg@mail.gmail.com>
Subject: Re: [PATCH v3 03/22] host-utils: introduce uabs64()
To: Richard Henderson <richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Greg Kurz <groug@kaod.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Luis Pires <luis.pires@eldorado.org.br>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 21, 2021 at 4:04 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 9/10/21 4:26 AM, Luis Pires wrote:
> > Introduce uabs64(), a function that returns the absolute value of
> > a 64-bit int as an unsigned value. This avoids the undefined behavior
> > for common abs implementations, where abs of the most negative value is
> > undefined.
>
> I do question the comment there wrt undefined. We compile with -fwrapv, which means that
> *no* overflow is undefined; we always have properly truncated twos-compliment values.

Can we really assume that -fwrapv would make llabs(LLONG_MIN) not
undefined? We would be calling a function compiled by somebody else
(possibly without -fwrapv).

--
Eduardo


