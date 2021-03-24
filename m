Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B31E348315
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 21:48:26 +0100 (CET)
Received: from localhost ([::1]:56472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPAQT-0002s2-C6
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 16:48:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lPAOI-00021Y-Gi
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 16:46:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lPAOG-00034C-Uc
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 16:46:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616618768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6jpbU7vle/qFPIDo8YJ/pAybA1Ur6pwgoLSRSbvmRnM=;
 b=VXUuRYOVOFtz6JFU4ft/l9LTiwzulYdWH9OwqZD/H3QJn2L/rmxLuR1jdDS6MMZyYScv/T
 aJBn1LJqTSP+aQZl5IstJsfWm2OSzINlYu4OxkOfTynkAEgNU9sPMixE6/SycOo5q/gDDE
 jVh6Oxn23Fgbwn4GAQg5TXoPd92xXzY=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-ZkDzg3KRORKABCZCEP2erg-1; Wed, 24 Mar 2021 16:46:06 -0400
X-MC-Unique: ZkDzg3KRORKABCZCEP2erg-1
Received: by mail-yb1-f198.google.com with SMTP id g9so3719812ybc.19
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 13:46:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6jpbU7vle/qFPIDo8YJ/pAybA1Ur6pwgoLSRSbvmRnM=;
 b=gON/OKPpZmFKNjF4pfDseeP0lx00XXINLAtFv6c3IcyIqprUoyg6LFODkC8RPy2c8U
 HY9Jo33VjCvCQyMAmOPbsFrdcNMeIfo2qaZQyJUHfR+Y+WmehSvcOjJ5gkmcwOgXOEiS
 dROVnu7KE+0HLX2x9UV3rigo4gdGqhDMz++xQ2Uimb2o/t5FPb6m6SE4Dzf1WdCAJ26i
 xf8KQwiyXRFrp6RqO0l3ijcEv0FGygmGsQYaPXPIHRWJ0ZH5pI7e8PeXCYmoRLEu/O3G
 RKrOddae2NUluf8ZczKCUZNs/SXPS8mdKIO24s9hrH7jD1VWHrOApot/rFKrVp1sMgqh
 PBag==
X-Gm-Message-State: AOAM531jjiwP4aDjtZ1fg/k8SqElIDIPpABnYEcS8rGCoEFF0/FJpT9+
 tBtZQhBU30IFF3NDpFNlpvZnH3Nt9VSrDzy7D3lw6kmn4TupDHH+UT2iTEWg5dLZ9JSJ0r/dUPf
 hccDmqNOjPyOUghiiFuFa7kH+qbFoA+0=
X-Received: by 2002:a25:7d07:: with SMTP id y7mr7331287ybc.425.1616618765236; 
 Wed, 24 Mar 2021 13:46:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwktsQ0aUZmQOpgyGJDTRenVkrlAiGjxvDuVu/zmd0VZ9Pw0Q79WhlJz1bS9ag6ZpUsZMPSbPJ1P8QSPE8vKLA=
X-Received: by 2002:a25:7d07:: with SMTP id y7mr7331273ybc.425.1616618765088; 
 Wed, 24 Mar 2021 13:46:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210323221539.3532660-1-crosa@redhat.com>
 <20210323221539.3532660-8-crosa@redhat.com>
In-Reply-To: <20210323221539.3532660-8-crosa@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 24 Mar 2021 17:45:39 -0300
Message-ID: <CAKJDGDYkS6uZ-BOo_fTF9Vs0144-2DbYY6pPef-tUqr2wNbXhg@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] Acceptance Tests: set up SSH connection by
 default after boot for LinuxTest
To: Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Willian Rampazzo <willianr@redhat.com>,
 Eric Auger <eauger@redhat.com>, John Snow <jsnow@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 23, 2021 at 7:16 PM Cleber Rosa <crosa@redhat.com> wrote:
>
> The LinuxTest specifically targets users that need to interact with Linux
> guests.  So, it makes sense to give a connection by default, and avoid
> requiring it as boiler-plate code.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/avocado_qemu/__init__.py | 5 ++++-
>  tests/acceptance/virtiofs_submounts.py    | 1 -
>  2 files changed, 4 insertions(+), 2 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


