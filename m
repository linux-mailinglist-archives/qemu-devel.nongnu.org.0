Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA5B4AA0F2
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 21:11:25 +0100 (CET)
Received: from localhost ([::1]:49860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG4vU-0003Za-Bu
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 15:11:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nG4Y5-0006qf-0b
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 14:47:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nG4Y2-0005yb-7T
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 14:47:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644004029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=04abdb9JKlRXjPT5OfIskjbhrKcbq4rtqcrvalIhIOQ=;
 b=HgCVcPq/Se7UMLJrUPMnNT31wR66TYJRfeKmjW9WGSf9J+qRi3Ckd4YKWrxfndJzBe33pD
 aTMscatQOGGowXD0xhTb1pLCdHfguP5wCLC8bEpRTp84tBFYUUZgLEhDIr6sHm2qWltI5i
 9v+1My5XjKFsGED0u2MKfzxjOk4Wk34=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-czwKyZCdN_i6Pwm5FQR34g-1; Fri, 04 Feb 2022 14:47:08 -0500
X-MC-Unique: czwKyZCdN_i6Pwm5FQR34g-1
Received: by mail-ua1-f70.google.com with SMTP id
 q19-20020ab04a13000000b002fef2f854a6so4023125uae.7
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 11:47:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=04abdb9JKlRXjPT5OfIskjbhrKcbq4rtqcrvalIhIOQ=;
 b=ZVgbWGNcryFU2DLNX0p8oZY5h0UG9o5+EFk8f2OhQIk+63NKSlUmtHdW5Jvhm9pV+N
 esZ7ncLb6adJN9i+8AT59VYxFBSt8CnWbuXwoFs7hJFbklr0VizH7jI0ZyoGqKT/j9Kg
 AWrEoek0V8O+XkjHwzwZUtVCxcMS3tYsuA+tmRb+hMoi+GyUrxO7mh2alSD2NrMSMs9m
 xaMxWyG/eK+ZwHiaIMjYptgqdDerRYw+xXPVNnGUqbYY6mG26wv+QDf+XsPe7pVANhgP
 Ji/cfSaIpSTw+bpyBVBRHriMVecbtdI/Uj4fTG9wXMqDOv5A/SFN0spmeHWpYFYIBccm
 0gjw==
X-Gm-Message-State: AOAM530XY53bftj0/+3GbTUorPHf0hvaUWDxcbyUXSeXG9pUsirmHKtc
 4pvjb/oKKbPP8kI7gOf4fepDVTcpdOhpLYkzH7CiZoRu5FKBJKuBsfaS/kjf8TfcnhDddOW6Seq
 jL4/Dv8aybAhQEAZtDHb3KZMObdvsfjk=
X-Received: by 2002:a67:f70f:: with SMTP id m15mr1514281vso.61.1644004027839; 
 Fri, 04 Feb 2022 11:47:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyhEXWN8deRV9L75Lbn9tI+LkbFwR3Xo9lS5bZOpYOllZpSvw2VWY3E7NvAHHX2IBrWLetFsSe4NtrbLqnn6j4=
X-Received: by 2002:a67:f70f:: with SMTP id m15mr1514279vso.61.1644004027671; 
 Fri, 04 Feb 2022 11:47:07 -0800 (PST)
MIME-Version: 1.0
From: John Snow <jsnow@redhat.com>
Date: Fri, 4 Feb 2022 14:46:57 -0500
Message-ID: <CAFn=p-YxK8JduYOzxwDJSsmANgsqb+tK049t75VbXK-=Qi3J9w@mail.gmail.com>
Subject: Adding a 'qemu.qmp' repository to gitlab.com/qemu-project/
To: Peter Maydell <peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter:

I am working my way towards splitting the QMP library out of the
qemu.git source tree. I'd like to ask for permission to:

(1) Create a "qemu.qmp" repository under the qemu-project umbrella on GitLab
(2) Add Cleber Rosa and myself as maintainers of this repository. (In
discussion, Dan Berrange suggested a third maintainer for redundancy,
but nobody from outside of RH has yet volunteered. The offer stands,
but I have to press on in the meantime.)

The initial patches that set up the new repository are not yet
finalized and are still under review/development (on the qemu-devel
list, as normal), but I wanted to reach out and directly ask if you
have any objections to this plan so I can adjust the trajectory of my
work if necessary.

In short, the plan is to publish the QMP library as its own
mini-project published to the Python package repository, and take
patches via GitLab merge requests.

Thanks,
--js


