Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D25F56D651D
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 16:21:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjhWv-0001jB-L7; Tue, 04 Apr 2023 10:21:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clegoate@redhat.com>)
 id 1pjhWt-0001iN-Jh
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:20:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clegoate@redhat.com>)
 id 1pjhWs-0007ak-3h
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:20:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680618056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fW48roZJ4afIPRxxhfxwG8M6srIEyysRXeDHTARbeBE=;
 b=TEtwLl51lE1x+nFQfXQorFZasKPFGIaTebQNYe2zhoWox871JAtJCsQR+AIuWfEaGKmWLe
 vSczKRLmNw8FxAJKkBFXluTUdqllZ34dY5LvYs+2Ei8vYoaRD4ZnmrrhDVRg9r9GhYvzQb
 dPtCUcHuw2vS0D9Gq6qfyUQBX/FSQz4=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-65-HrUprhZyNNCdn4tfC37cyg-1; Tue, 04 Apr 2023 10:20:55 -0400
X-MC-Unique: HrUprhZyNNCdn4tfC37cyg-1
Received: by mail-qt1-f200.google.com with SMTP id
 l13-20020a05622a174d00b003e4df699997so20014312qtk.20
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 07:20:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680618055;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fW48roZJ4afIPRxxhfxwG8M6srIEyysRXeDHTARbeBE=;
 b=E99dmwVEbGdUf7rV22wdfkrxdW0TUz9xpIjELe6DIta+RjTpdFmSeURFB9M/UISvPv
 s2DU7TmLRcfX6Oo67EOcJlTUuvL21ibHe7xsqAzQ6NyUYeNajYQNrYgC6dTnAYa98caR
 okK++2QBLRCgb/gdZ1iYceNp9kdLUG0GlWDxfVWLugxoBfr5foRx3PZEWPZWauqvYe6s
 bbCTJfU25pt/FoZPLKpDPqNBYCQqxVj3tzrx4UwXxw70uGcXHTwt1XwPBLtHrvRrdr4c
 Sk6kEhkUH4FQuVzaNzs72mTj/KS6MBzv78Lg3ZTtnnSnvFzBMB+2brhrnuPpaHihK3xC
 iBoA==
X-Gm-Message-State: AAQBX9eepxFM1esyo5w28nLoWExhAMeFJzuQ8ixlR2M16TVjaa6smksE
 I4duH9JTJPSxjsRD6Piy/I2oCRyzzYk8A7m8qQIlNuQ4ci0qfNUrMF2llQAQ9qyl2EbikAyFvJp
 As14c1lT9GDnO2Tc=
X-Received: by 2002:a05:6214:19e1:b0:5e0:5ea6:69cc with SMTP id
 q1-20020a05621419e100b005e05ea669ccmr4472053qvc.0.1680618054946; 
 Tue, 04 Apr 2023 07:20:54 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZuVpFZmFLuf9mlZSpXqsWixDCQWXeRyUmkYshQKmyIrk5aQxkoR/7cod9nzMldUtgHncPvVA==
X-Received: by 2002:a05:6214:19e1:b0:5e0:5ea6:69cc with SMTP id
 q1-20020a05621419e100b005e05ea669ccmr4472019qvc.0.1680618054668; 
 Tue, 04 Apr 2023 07:20:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 qh30-20020a0562144c1e00b005dd8b9345a0sm3432107qvb.56.2023.04.04.07.20.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 07:20:53 -0700 (PDT)
Message-ID: <58b8efff-0cf3-5138-9291-0fc5b7a1dc10@redhat.com>
Date: Tue, 4 Apr 2023 16:20:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [RFC PATCH] docs/about/deprecated: Deprecate 32-bit host systems
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, libvir-list@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>, Brad Smith <brad@comstyle.com>,
 Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
References: <20230130114428.1297295-1-thuth@redhat.com>
 <CAFEAcA89Onb9Dg4zJXQ0Ys-0kJ2-hz5KYRPXMCE7PWDDxVzDyQ@mail.gmail.com>
 <Y9exrDWT2NUoinu1@redhat.com> <87h6w7694t.fsf@linaro.org>
 <dbc8b2f6-3e9e-65d7-998f-568b6376d25c@ilande.co.uk>
 <4e42ea6b-0f9b-69e0-1593-c3288712d13c@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clegoate@redhat.com>
In-Reply-To: <4e42ea6b-0f9b-69e0-1593-c3288712d13c@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clegoate@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.925, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

> Unrelated to KVM: Do you happen to know whether there are any problems when running 32-bit guests with TCG with the mac99 or g3beige machine while using qemu-system-ppc64 ?

We removed rfi support for 64bit machine in QEMU 2.7.  Commit a2e71b28e8
("ppc: Fix rfi/rfid/hrfi/... emulation"). So a mac99 machine using a 970
CPU needs a 64 bit kernel. The rfi insn was deleted from the ISA ...

C.


