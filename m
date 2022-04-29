Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6012E515426
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 20:56:41 +0200 (CEST)
Received: from localhost ([::1]:35746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkVnD-00052c-Uo
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 14:56:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nkVlz-00048i-F1
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 14:55:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nkVlw-0004nd-QT
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 14:55:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651258518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=JlgSObmtPJojc3ghAsTJ6SPrXPsTww4Pv1N6Mv9AOfY=;
 b=IUuEvMRiUqkQ/yCdGuIjiSrt9cafYlRaHahBfM12/s3upA+fp8dlVC2Cn394f94Dpk/CxJ
 iH9jnfkzhoXaQobMroEBZdji2LAKQmCvoHN0FgyX6lHCwI8iqqOeBQ3zcjlsNgLjf8QQDl
 lAqjQTRBey4KP66+Ihl3UorGRZr7ogw=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-112-z-lk4NP4PJqgifYUlJ8eNg-1; Fri, 29 Apr 2022 14:55:16 -0400
X-MC-Unique: z-lk4NP4PJqgifYUlJ8eNg-1
Received: by mail-ua1-f72.google.com with SMTP id
 t20-20020ab04ad4000000b003627cd606a2so3776106uae.11
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 11:55:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=JlgSObmtPJojc3ghAsTJ6SPrXPsTww4Pv1N6Mv9AOfY=;
 b=na7vjU1Ee2rFzPi5slxDUicbAkdmQdQN5S8eLnv5zFdeCz8mE0nRgecVPYkDg9aXft
 SFQn9OX0YkwlkIEXLzxyOjSgEqOE6O89KfaKZRbQqcGYqBsZ66IlyjBZqMXrFiwVhjSy
 bTae5+mx7VQ+5gQBgNKgvPpgcPdDb9yD8E0Dxp05dVN38u4eokP0++ySeMn5+1hzLFdU
 HV4fxPTE+8EHjvXAy4IDxuE5Skif6Fm/zufsfGnToZkUaCo8fC1FfntlerQMVqQBHw/Y
 lweNjafgWkKmlvri9uS+Qg86gnuP+xSKglPgyq83FP0DfBx8lWPEbRRjY6GejtIBSowS
 Y0Pg==
X-Gm-Message-State: AOAM533IHNr9+LoJFdq7zL2ScnMR+ZXkWsyRe0v+3AXegVonmhGwfCim
 5EpdU/Qa6aHD4+0e48y3IZvjDN/KgvM2mcgM6xIWIgNtXpiEqVXq4HQe8+N5eB+S+9xvgmT0F0t
 0L1QX/seKkdaFP2TZlsWU9V216jaxVic=
X-Received: by 2002:a1f:e8c1:0:b0:34d:b3e0:b18a with SMTP id
 f184-20020a1fe8c1000000b0034db3e0b18amr180055vkh.24.1651258515901; 
 Fri, 29 Apr 2022 11:55:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNTFAs4Jtf8it8Gs/pMuN61Cb9OkUN7ll6NRHfecNQ3/reLWMoDYz8v/kf+F9DLreIa/1BjMn86bq4R0jlD80=
X-Received: by 2002:a1f:e8c1:0:b0:34d:b3e0:b18a with SMTP id
 f184-20020a1fe8c1000000b0034db3e0b18amr180046vkh.24.1651258515723; Fri, 29
 Apr 2022 11:55:15 -0700 (PDT)
MIME-Version: 1.0
From: John Snow <jsnow@redhat.com>
Date: Fri, 29 Apr 2022 14:55:05 -0400
Message-ID: <CAFn=p-ZuDcEkZ8qViR0TeR47yxmOxOOqCZWEj5zvQDQEWUGYVw@mail.gmail.com>
Subject: [python-qemu-qmp MR] Add rudimentary GitLab CI configurations
To: qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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
Cc: Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, I'm still figuring out how this should work in the future, but for
now I am just going to drop a manual note here on the mailing list
that points to a new merge request for qemu.qmp that adds preliminary
GitLab configuration:

https://gitlab.com/qemu-project/python-qemu-qmp/-/merge_requests/1

In the future I might write a little bot that announces new MRs, but
if you're interested in keeping tabs on the project, I recommend
signing up for GitLab and following the project in some capacity.

Thanks,
--js


