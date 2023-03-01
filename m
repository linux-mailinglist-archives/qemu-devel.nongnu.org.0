Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF036A6C7A
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 13:38:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXLhr-00058w-TR; Wed, 01 Mar 2023 07:37:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pXLhp-00058n-Pl
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 07:37:13 -0500
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pXLhn-000156-Tc
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 07:37:13 -0500
Received: by mail-yb1-xb34.google.com with SMTP id v101so139629ybi.2
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 04:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+YMOFDVdRh5CH5g/U6VE5tu3ccbvtRNg+AgJ4AnDkl0=;
 b=WZ62QflkJSCqFoBmau7dfRNtnfiw/200rqFnzkYTpItoHmYXewm4bhs+/WMmEFn97x
 OFRf7lcQHla0HKIDbMXO8puadOacoRFHZNv2y9dQZCWuUd3o+KgtHKyxFi8V7SxL/yuC
 GTWQUYfJViTZAAJ0ulVbvninkR8vZWiL4UlAgKJfeuufE+36ZgG3bP4f22LC3s0sLBai
 DHzPVuLr1bOQOZy8uR2KnqEZOs3aaA15EojFuK0alG3UGgC2fydpQ9c8pylKmFr/sfoH
 OCd9ROIahaxwYXK0t/hJMrUeLg5TYjJ6Hn6cxjh01BTJfS67HmX1/LCEB7YUR+nDnDfn
 tt1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+YMOFDVdRh5CH5g/U6VE5tu3ccbvtRNg+AgJ4AnDkl0=;
 b=dpMcrZ1GQU8BVzbW9b743W/6inRJaXnGVPbd+stXDRZC4ixQnwerNJa3UWH58S23+P
 8zixGMVe4D0QOnlO7bA++RLNLy7RH3Hpz/Xl68MQHTqw5Msj0cD8X6+GwGXmL9z55tpo
 5SRtf/0gGGS/r/ykzLGtu7MlKN9XYYSP8Z/f31eeqdsVzGOa2LnF3D7l8zqyK+eSREPo
 9aH1py5dvSxAhkwm9W0h2GiqtkDzZFEW/hpGUqq1Xx8Ke38IbiNwr5Hw3/KgiG7Eok3t
 IfNShil4XWW9aakFUDT34UCCvYemJCycMnshK+nfClvb5BvYBu4RIG+Nsvgej6TfUoJn
 xPnA==
X-Gm-Message-State: AO0yUKWuq8VIgBffIIsCvRb0VREhUNWcaRSnLkiJ5pReDD6jWK34wdhD
 187pmp9vn+EiP0KLlNfJxaakeToFhAvxTvsdYgc=
X-Google-Smtp-Source: AK7set++PDtXUJIc6kAjvQoG19Hq14hAuDWp/lfEi26UBxuwr0XzkEuy8bJ1yjFgfEUvzXvOLo95b13F/GMEsk6AJxI=
X-Received: by 2002:a5b:8cf:0:b0:aaf:b6ca:9a30 with SMTP id
 w15-20020a5b08cf000000b00aafb6ca9a30mr3140605ybq.6.1677674230432; Wed, 01 Mar
 2023 04:37:10 -0800 (PST)
MIME-Version: 1.0
References: <20230224011006.1574493-1-stefanha@redhat.com>
 <618f8617-8240-4d48-cbd4-6c16695eae1c@redhat.com>
 <19b0fd52-2bdc-ca64-d132-f9ee282ee4f8@redhat.com>
In-Reply-To: <19b0fd52-2bdc-ca64-d132-f9ee282ee4f8@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 1 Mar 2023 07:36:58 -0500
Message-ID: <CAJSP0QXoHyqq7xAvpqSSkMPYbEQpj34CeNYw285dt1fXSQ-7Wg@mail.gmail.com>
Subject: Re: [qemu-web PATCH] Announce Google Summer of Code and Outreachy 2023
To: Thomas Huth <thuth@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Wed, 1 Mar 2023 at 03:02, Thomas Huth <thuth@redhat.com> wrote:
>
> On 27/02/2023 17.11, Thomas Huth wrote:
> > On 24/02/2023 02.10, Stefan Hajnoczi wrote:
> >> QEMU is participating in GSoC and Outreachy again. This blog post will
> >> draw people's attention to our open source internships and increase the
> >> number of applicants.
> >>
> >> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> >> ---
> >>   _posts/2023-02-23-gsoc-outreachy-2023.md | 46 ++++++++++++++++++++++++
> >>   1 file changed, 46 insertions(+)
> >>   create mode 100644 _posts/2023-02-23-gsoc-outreachy-2023.md
> >
> > Thanks, pushed!
>
> And now it's finally online (after the CI is working again):
>
>   https://www.qemu.org/2023/02/23/gsoc-outreachy-2023/

Thank you!

Stefan

