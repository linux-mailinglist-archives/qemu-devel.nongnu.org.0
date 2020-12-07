Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEAE2D11CD
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 14:25:15 +0100 (CET)
Received: from localhost ([::1]:35074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmGVu-0000Fl-MY
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 08:25:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmGMJ-000479-LN
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 08:15:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmGMC-00013Q-4Q
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 08:15:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607346911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=P8E9r6EVqPEiRqlaumtn8A3AH4erPVBibEbVofdGhF4=;
 b=NEYMsYEi4idYlSBrCyGNxo99DfcV6Q3/XyNohssFsdkbjF/z+m+p8lHhD9FMRn0dKhzdxJ
 bLt5lKP3hgEW+s0krQNA+THfTZWZyklROi1ahT3WK0wcVEx42W2hl89NGuqsS4Iu1neGiB
 TBBcAnDavQTqnleW8NV+GYAhiYRhhwU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-F1MK32edP5iz-EAN6Racpg-1; Mon, 07 Dec 2020 08:15:09 -0500
X-MC-Unique: F1MK32edP5iz-EAN6Racpg-1
Received: by mail-wr1-f72.google.com with SMTP id b1so4789088wrc.14
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 05:15:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D+Xzt47T3O6uanVPO2OPfmJ/SH9QMRtVuJ5cnLL0G9o=;
 b=sPoUu3tQrP5a3Ytg2uxcchD5aBaoxqOh+8ndg3KTdL6o6d2YaF3m4TxWfHNJ/oEZdx
 9hUtXayImtPTK6p1QIxU8AnBS2OyCziMkAvzDNTyrIi8sQft3RoYhiyqa2TwYAUU1ETI
 XIojR0V7kkOuX7FspaLBJ7nHICE5kZPwfb4BWzgcfqo8/5LX1RptCjNhLla3EaGeLylm
 8sU8l0p4HpbNDtAVZ8cVGITJRjP+WFnt2DzYMAwXrXqYfzBZH4duUfzbaC/8D0CmKX6C
 fc4PPiLxjBP05YlQvy9XJAsbdfCR1aM2h25mNdVm1yzh11d316I7bjzSRt98hBqn0pMd
 f3qQ==
X-Gm-Message-State: AOAM5332rZbznMyqOvIw/1chNh8G7GZaOHBg9agYbe5QXjchfDNazUj3
 QWYzOPcPDx6MXGt0ycwGkcytEm+ZrNORNIklq128pn2YDFkIdVV19fm5kWDr01Ob33LsSftnCCd
 Yh7FWKuJwv3gydBBWtQo8vFAL/AcHB8zOaCkVwO+49iVkuO6Aa9ZVGfpra5Zyd7mV
X-Received: by 2002:a5d:4d88:: with SMTP id b8mr19446900wru.134.1607346907713; 
 Mon, 07 Dec 2020 05:15:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzpnUya1Cq26y+zerYd2xTIJ5RvuSXM0q1BxVsK+34xdINKnlF/ke5kWAF9RdCASl4P3rK0fg==
X-Received: by 2002:a5d:4d88:: with SMTP id b8mr19446856wru.134.1607346907342; 
 Mon, 07 Dec 2020 05:15:07 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id 94sm6169289wrq.22.2020.12.07.05.15.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 05:15:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/5] gitlab-ci: Add accelerator-specific Linux jobs
Date: Mon,  7 Dec 2020 14:14:58 +0100
Message-Id: <20201207131503.3858889-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TVD_PH_BODY_ACCOUNTS_PRE=0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Willian Rampazzo <wrampazz@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since v2:=0D
- Fixed ARM Xen job=0D
- Renamed jobs with -$accel trailer (Thomas)=0D
=0D
Since v1:=0D
- Documented cross_accel_build_job template (Claudio)=0D
- Only add new job for s390x (Thomas)=0D
- Do not add entry to MAINTAINERS (Daniel)=0D
- Document 'build-tcg-disabled' job is X86 + KVM=0D
- Drop the patches with negative review feedbacks=0D
=0D
Hi,=0D
=0D
I was custom to use Travis-CI for testing KVM builds on s390x/ppc=0D
with the Travis-CI jobs.=0D
=0D
During October Travis-CI became unusable for me (extremely slow,=0D
see [1]). Then my free Travis account got updated to the new=0D
"10K credit minutes allotment" [2] which I burned without reading=0D
the notification email in time (I'd burn them eventually anyway).=0D
=0D
Today Travis-CI is pointless to me. While I could pay to run my=0D
QEMU jobs, I don't think it is fair for an Open Source project to=0D
ask its forks to pay for a service.=0D
=0D
As we want forks to run some CI before contributing patches, and=0D
we have cross-build Docker images available for Linux hosts, I=0D
added some cross KVM/Xen build jobs to Gitlab-CI.=0D
=0D
Cross-building doesn't have the same coverage as native building,=0D
as we can not run the tests. But this is still useful to get link=0D
failures.=0D
=0D
Resulting pipeline:=0D
https://gitlab.com/philmd/qemu/-/pipelines/226240415=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
[1] https://travis-ci.community/t/build-delays-for-open-source-project/1027=
2=0D
[2] https://blog.travis-ci.com/2020-11-02-travis-ci-new-billing=0D
=0D
Philippe Mathieu-Daud=C3=A9 (5):=0D
  gitlab-ci: Document 'build-tcg-disabled' is a KVM X86 job=0D
  gitlab-ci: Replace YAML anchors by extends (cross_system_build_job)=0D
  gitlab-ci: Introduce 'cross_accel_build_job' template=0D
  gitlab-ci: Add KVM s390x cross-build jobs=0D
  gitlab-ci: Add Xen cross-build jobs=0D
=0D
 .gitlab-ci.d/crossbuilds.yml | 78 ++++++++++++++++++++++++++----------=0D
 .gitlab-ci.yml               |  5 +++=0D
 2 files changed, 62 insertions(+), 21 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


