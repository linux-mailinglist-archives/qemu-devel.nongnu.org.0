Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7994D519224
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 01:06:38 +0200 (CEST)
Received: from localhost ([::1]:43196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm1bJ-00045J-GF
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 19:06:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nlzOX-0005tx-65
 for qemu-devel@nongnu.org; Tue, 03 May 2022 16:45:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nlzOU-0002T7-Os
 for qemu-devel@nongnu.org; Tue, 03 May 2022 16:45:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651610687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=gH3vmaLr8PwTUtyB6eWjEAbcA6W8sgBrj6SSN+DphEo=;
 b=Yh3JA4T9MneUs1jXg5DoqLncQHEckZDUFaPcBvlcdSeCx6er/hYYtKj62qxSNtxcqjruzr
 fZb2KWoMFiW99L99iLmoypNj/g15QSsB8hG+AlLv9BdBnPQLGj6Dm8yMDJ9txkX8nGVhMe
 ajT2Hx9KxhDzEG/7Qlvczuq6FE66G+0=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-250-BxlBsCM5NhiJYaHiE2QCIQ-1; Tue, 03 May 2022 16:44:39 -0400
X-MC-Unique: BxlBsCM5NhiJYaHiE2QCIQ-1
Received: by mail-ua1-f71.google.com with SMTP id
 r4-20020ab06604000000b00360317232f6so7947261uam.6
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 13:44:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=gH3vmaLr8PwTUtyB6eWjEAbcA6W8sgBrj6SSN+DphEo=;
 b=Hy8NIc/VMKMS3ICu3nb4zyMEd7u7+0/k1MI/2wyad9MYPBpUv6+8bQxvrwF2g6biqG
 OBlmCXOuEFtNy0itcBgczwcp3NCxut2xytSfMfFjXmKkniSuFlxJjVKIR9XBywbtYaAZ
 cf1mYdnKnhQPElVqJB81fDPzZO2/8JvFdGlR+jllv/4PdB5XU/9/7u00IXlQ10zJ05dQ
 ooCVSiCsWV5zEtzdio73rkdlE3MQhRDh0EvYO6fpJgH1bdd4FivdJ1R4aPIyxTd2T+rb
 RqjYrGKp4P4grDP+L5V20mU0LcmGEmCw8NbOQO5oVW5PHymcpLwpbYE+lmq697VfV1O8
 rrQg==
X-Gm-Message-State: AOAM531YhRpdfuvSSXajOdE1SySXjBNghgqnzZT6bl7CvpIPmvDD8pq+
 dVaTyFPB465hnqsq0bnwR9BS+ifEFEYT9KVZGJHGiguzXXGMDSwG2fHnXPmH7lsCpuPD9DL/iMD
 gMEdAEu0XTY2TGT9WHu3/XUYZGrCK/kg=
X-Received: by 2002:ab0:67cf:0:b0:341:257f:ce52 with SMTP id
 w15-20020ab067cf000000b00341257fce52mr5249635uar.109.1651610672189; 
 Tue, 03 May 2022 13:44:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwb508Qv10zKgJ36dSs9Xu+LKh/bADhem5O2yy5xuOhtslD9qP+owROQgY7aOrpsiWXOVG+dzY/fqdk7xD0pDM=
X-Received: by 2002:ab0:67cf:0:b0:341:257f:ce52 with SMTP id
 w15-20020ab067cf000000b00341257fce52mr5249628uar.109.1651610672020; Tue, 03
 May 2022 13:44:32 -0700 (PDT)
MIME-Version: 1.0
From: John Snow <jsnow@redhat.com>
Date: Tue, 3 May 2022 16:44:21 -0400
Message-ID: <CAFn=p-bw5qjmEuXSSuYRUYLQzXXnkw68pFua970zx4ggMrvq+Q@mail.gmail.com>
Subject: [python-qemu-qmp MR] Add Sphinx documentation
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Cleber Rosa <crosa@redhat.com>, Kashyap Chamarthy <kchamart@redhat.com>, 
 Beraldo Leal <bleal@redhat.com>, Daniel Berrange <berrange@redhat.com>, 
 Damien Hedde <damien.hedde@greensocs.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I'm continuing to mail these manually for now, until I settle on an
automated solution or feel like there's enough buy-in on the GitLab
instance to not warrant the advertisement. Please consider
starring/watching the repo if you're interested in QMP lib updates as
I try to angle for an initial public release.

-

MR: https://gitlab.com/qemu-project/python-qemu-qmp/-/merge_requests/4
From: https://gitlab.com/jsnow

Howdy! This MR:

- Adds sphinx documentation as a build artifact
- Ensures documentation builds without errors in the CI pipeline
(preventing stale cross-reference bitrot)
- Publishes docs to e.g. https://jsnow.gitlab.io/python-qemu-qmp/
- Revamps some of the docstrings to make the rendered output more
appealing/accurate/etc.

I'm looking for holistic feedback on the documentation. Feedback on
grammar, readability, layout and presentation of the HTML docs, etc
are all welcome. If you have feedback on the design of the library
itself: that is also extremely welcome, but may need to be addressed
in subsequent MRs, filed as issues/bugs/change-requests and so on.

Note: This MR is going to show a failed pipeline. This is due to other
GitLab configuration issues that I'm working on addressing in !3.
However, I wanted to begin soliciting feedback on the documentation
here in the meantime, because I predict it will be a very iterative
process.


