Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2958698588
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 21:26:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSOLe-0002Pr-7y; Wed, 15 Feb 2023 15:25:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pSOLW-0002Od-UV
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 15:25:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pSOLV-00019N-0E
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 15:25:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676492739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IPpT/q8P05pu0r/Ko/7ZIbdOXwlVzi+0CV7G5Fh/I24=;
 b=T2O0E7OR3qV3pa1l2FPB37JDS2JgXvi6fiQLfivMUMx5WRBwplAm7OHdg51RevbTB2VWvd
 liPxKQYdMXevgWMtvhQLBalZJsrXI+QHE9wgo+p/z79qRuE1nq8wK4zdBvH8WWmchd+Ehl
 u+D3+CtOWr2MWYct7H8A/pyoMq/X8Rw=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-146-hZ9ftCbqO-qx6KeD9SLJ1g-1; Wed, 15 Feb 2023 15:25:38 -0500
X-MC-Unique: hZ9ftCbqO-qx6KeD9SLJ1g-1
Received: by mail-pl1-f197.google.com with SMTP id
 h5-20020a170902748500b0019aacd1fb04so4254192pll.2
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 12:25:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676492737;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IPpT/q8P05pu0r/Ko/7ZIbdOXwlVzi+0CV7G5Fh/I24=;
 b=cnKS51eGKKNPwjj7K1h3NZEacyzaVL72MbuWh21RDN7uvYDmlteRSHACU+8P4fGLGV
 hRXRKF8rasg28YTTzfJAJwSF7TYx+d8cu/5j4FIhGntjy6WmgIifQJkF/HiOpKQDaUWo
 21AA8ni2j/tc8Yn0noOMBWUqcRgQsq5GN6SyTBbdL45wcqUnCrivvC4QjNtM5J0v4Fn3
 Qqn2qXvrzdZC1bCmZamu7sei0I9vnKGDFYKeMyugHHL/D7Fy2OGdjRS5xhqVnh48wg47
 RY3VpKtk/AkFAU+KwboveP0GRSnfDKuII8gghicrL7rLe9fJZTgi16U00HFJLJJqPeuZ
 VQ1w==
X-Gm-Message-State: AO0yUKUpleF4yGO36zbvkMxVQqo6Zpm3rf4DLyECktXLDvOpTjXkbjtM
 ESjAV/AFBYgBZ5oQkxQTD94+lXGCVh/p6P56P4vk0JWBeGlF9fCrK0iDxqgYypS1J0ljxc/UkGs
 V8xLeMzcZjqswE7yL/0zBjh/PJyP+mBI=
X-Received: by 2002:aa7:9d1d:0:b0:5a8:beb3:d561 with SMTP id
 k29-20020aa79d1d000000b005a8beb3d561mr547874pfp.17.1676492737439; 
 Wed, 15 Feb 2023 12:25:37 -0800 (PST)
X-Google-Smtp-Source: AK7set+5wgdL8h6fHzDEI0VjgcTFJVAki0k2sLlamOLNW2/WEtrvr8xssBEwrVum7gwIRK6MTcNpKlg5Kx1S3Sn+smM=
X-Received: by 2002:aa7:9d1d:0:b0:5a8:beb3:d561 with SMTP id
 k29-20020aa79d1d000000b005a8beb3d561mr547856pfp.17.1676492737132; Wed, 15 Feb
 2023 12:25:37 -0800 (PST)
MIME-Version: 1.0
References: <20230209154034.983044-1-jsnow@redhat.com>
 <20230209154034.983044-6-jsnow@redhat.com>
 <Y+YelalmW43ePE53@redhat.com>
In-Reply-To: <Y+YelalmW43ePE53@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 15 Feb 2023 15:25:26 -0500
Message-ID: <CAFn=p-aAYWy7eLdgnDshJ7LnV7fQVHag_yOG1Pp0UWBYi4ZpWw@mail.gmail.com>
Subject: Re: [PATCH 5/7] testing: Add Python >= 3.7 to Centos, OpenSuSE
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Fri, Feb 10, 2023 at 5:38 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Thu, Feb 09, 2023 at 10:40:32AM -0500, John Snow wrote:
> > This is just a proof-of-concept patch, as these files are lcitool
> > generated. The real fix will involve updating the lcitool configuration
> > and updating these files that way.
>
> Paolo has been working on this
>
>   https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg03547.html
>
> though I requested we adapt it a little:
>
>   https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg02237.html
>   https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg02239.html
>
> With regards,
> Daniel

Ah, I had no idea that Paolo was specifically working on 3.7 as a
minimum requisite; I hadn't actually seen this or talked with him
about this in some time. With this series I was mostly occupied with
the simpler question of "Is this even possible?"

... I'll just trust that the lcitool changes are in good hands with Paolo.

Thanks for the links to the relevant threads :~)

--js


