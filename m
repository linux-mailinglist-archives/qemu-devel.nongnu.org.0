Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 212B73F62B3
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 18:33:03 +0200 (CEST)
Received: from localhost ([::1]:53008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIZME-0000tz-2Q
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 12:33:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mIZJ9-0005Y4-Nb
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 12:29:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mIZJ7-0007ZS-1X
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 12:29:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629822588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ARTf5p0uASE/vp3KI4IXEA6Ic85cLMFbNt1M12KYr+s=;
 b=GZivu36iICqAw7mjDR4oIPtSNEFZeYZIGYNKrGrqKgQbH5zIDpEEyGAsr36qpoQI7ENiqG
 09M5ywvTF3pXeeSP1Vrow/FeLdufUTbY1WRmjTBLQZshp+QPObyUd4e6O5NJnEkU3eANnF
 fViZZtkRy7Ib9vDwJTk5hQ7pdJkzc6M=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-lsEFf1BNO02qTgrnXve6qQ-1; Tue, 24 Aug 2021 12:29:46 -0400
X-MC-Unique: lsEFf1BNO02qTgrnXve6qQ-1
Received: by mail-pj1-f71.google.com with SMTP id
 k23-20020a17090a591700b001796382f0d7so194123pji.5
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 09:29:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ARTf5p0uASE/vp3KI4IXEA6Ic85cLMFbNt1M12KYr+s=;
 b=C07RRMX3fAi+XB4SRjaMpBPa8BJz3feUlDxR9PM9r4Y5fEIwQrArdCgPyiomBe4NHS
 6a4Pf+8+xTG4+hrjuz6I4oX+suczfPglojPH2tZpWO7O7vfmjkJ5V6ywdjEID+exT4/+
 clBlbeqOaeJY/B/XaC5qfzEhu4wYJk+MyIG3kOQozNJMFZzMtgBmqEV05eNL372HvKJ8
 gUVzwhQ74j/FfiOlzNWs7hwVAlE6BQNdip+FWmTuwTQjl5BWXPckT7Csiwqj/YiETmbm
 8owrMqpkHOHujXP13J7yb5+XQZ7Rn/F9vCNOVgWTBBSzS7Mj8sypTCSb5+KuuIS1UvxA
 CqOg==
X-Gm-Message-State: AOAM533tH9VgLwTKRSiSeqUIyIVboRtVPmOsvrd8V+dq6asXlRfrmkDg
 HA/heaVY04/74J5Pcyl+BG8fkYJvi+MaKK4B7hKz5BZYss3G8z0npDA7im5nAVHLYP4oDAipoY1
 nADj7J3fbwRRs7vl60XVfCeSw/IUeu9I=
X-Received: by 2002:a62:8144:0:b0:3af:7e99:f48f with SMTP id
 t65-20020a628144000000b003af7e99f48fmr21040833pfd.2.1629822585407; 
 Tue, 24 Aug 2021 09:29:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQUE1LE9m5dPokpt5gWMEOdN6wD8gpjU9zyhSTqb4u578alHv74W0xqgCuBoXW/HrsamyMq6Iv/6TMgbUdSW4=
X-Received: by 2002:a62:8144:0:b0:3af:7e99:f48f with SMTP id
 t65-20020a628144000000b003af7e99f48fmr21040817pfd.2.1629822585184; Tue, 24
 Aug 2021 09:29:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210812180403.4129067-1-berrange@redhat.com>
 <20210812180403.4129067-2-berrange@redhat.com>
In-Reply-To: <20210812180403.4129067-2-berrange@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 24 Aug 2021 13:29:19 -0300
Message-ID: <CAKJDGDaKrZY0APYZKrkqXbvx-m353ETn+uffYr305Wv4mzdULQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] docs: split the CI docs into two files
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 12, 2021 at 3:04 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> This splits the CI docs into one file talking about job setup and usage
> and another file describing provisioning of custom runners.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  docs/devel/ci-jobs.rst    |  40 ++++++++++
>  docs/devel/ci-runners.rst | 117 ++++++++++++++++++++++++++++
>  docs/devel/ci.rst         | 159 +-------------------------------------
>  3 files changed, 159 insertions(+), 157 deletions(-)
>  create mode 100644 docs/devel/ci-jobs.rst
>  create mode 100644 docs/devel/ci-runners.rst
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


