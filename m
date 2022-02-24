Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F104C27D7
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 10:16:14 +0100 (CET)
Received: from localhost ([::1]:56922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNAEL-0003ig-Hp
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 04:16:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nNA8r-00012B-MZ
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 04:10:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nNA8n-0003hq-LB
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 04:10:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645693824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+rdqagwISMbbUFbBupZKEqJKpOvZ7RrKc9RcjpzaC+M=;
 b=Ghaup9fXitus/lZv4tkI4DAKu78I/ppQ3ZMEgmNAd9NkslReHfbf0xLY2ae7jWiu7YfTUD
 +egpP2wicHIXprvUTeojtYCT/Pof3TE0LR4JHkdtfA0XSYStn6quf3rb0qlvkefneZjfqm
 ua6L7Upv6BvH6AE0PQpjUndpk2NB5qA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-348-CqRTWSQQNX-F6_BiVmySxQ-1; Thu, 24 Feb 2022 04:10:23 -0500
X-MC-Unique: CqRTWSQQNX-F6_BiVmySxQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 y10-20020a056402358a00b00410deddea4cso440869edc.16
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 01:10:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+rdqagwISMbbUFbBupZKEqJKpOvZ7RrKc9RcjpzaC+M=;
 b=UAd5PLX5Fpo8l/YLeo52+TayJx+MouKuOJjZnj1MqqcAYYY2GssVIxyln268wxfdlj
 yRrSVqsg0uvjPtYqEPEjK+VnoaYIY44WNIrLCPRKZwDobBRoJpKJNTZPYLv90Ts7hu7u
 k9KMfR8weICy2FhQR6BFUPyIsFwNKsujZ9a8Ncu+/bu2s17+xirDqQtD3uFwdVNq5YQk
 05tKAstice/deSHlAVZBKaQT0X1P4jkmSZXdleyF4wUnAh9m8+3M+F5JCmU5P8igdpXT
 Yj5lp8nqISt1Hrn3p576prrfBwbtVm64nW+alEXbwTJVvfIbqoi0IJyYhKD2HcT0jWzq
 e1iw==
X-Gm-Message-State: AOAM532CI7bLzlVZsAbjmKp9EOueJRxrbrRuihHvpXw46F418XXMJIrN
 EzqcgKhrrqdjF+sao/N8eKtBqU2DFje9I6p1L4BK4SzSCxPv0bPuzafe7LABNtPOKSFgjhNYol0
 DFoVpMsdZFuMpkgo=
X-Received: by 2002:a17:906:280b:b0:6ce:f3c7:688f with SMTP id
 r11-20020a170906280b00b006cef3c7688fmr1473076ejc.468.1645693822177; 
 Thu, 24 Feb 2022 01:10:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyq7ZXnTQV7PnE764A4310Y5Ua9ppvnQ296xoPtJNDupyjjNwyxR/+HM8lX2TbN6Og0tOaR1w==
X-Received: by 2002:a17:906:280b:b0:6ce:f3c7:688f with SMTP id
 r11-20020a170906280b00b006cef3c7688fmr1473046ejc.468.1645693821991; 
 Thu, 24 Feb 2022 01:10:21 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id h5sm1037267ejk.188.2022.02.24.01.10.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 01:10:21 -0800 (PST)
Date: Thu, 24 Feb 2022 10:10:20 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: Analysis of slow distro boots in check-avocado
 (BootLinuxAarch64.test_virt_tcg*)
Message-ID: <20220224101020.2dd35c16@redhat.com>
In-Reply-To: <20220223115042.lvxgrjirr5avzkzw@sirius.home.kraxel.org>
References: <874k4xbqvp.fsf@linaro.org> <878ru2nacq.fsf@linaro.org>
 <YhURfqMvRT4xbiz6@redhat.com>
 <96bafa75-a0c6-f431-a6d8-fe98d438d0f9@gmail.com>
 <CAFEAcA8mNt_-nZoV7RL4_UQUV=nPQsDM8KBTA8qAGmiNtXWx9g@mail.gmail.com>
 <afd92ed6-4392-3181-5875-5e42ad5f41b9@gmail.com>
 <20220223115042.lvxgrjirr5avzkzw@sirius.home.kraxel.org>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Oleg Vasilev <me@svin.in>, Cleber Rosa <cleber@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Idan Horowitz <idan.horowitz@gmail.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 Emilio Cota <cota@braap.org>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philippe.mathieu.daude@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 23 Feb 2022 12:50:42 +0100
Gerd Hoffmann <kraxel@redhat.com> wrote:

>   Hi,
> 
> > > Also, "make install" installs these EDK2 images, which doesn't
> > > seem like the right thing for "this is only for one test case".  
> > 
> > Well I'd prefer we never had them installed. Today I don't remember
> > why it ended that way.  
> 
> Probably to behave simliar to other firmware, which makes sense to me.
> 
> So maybe do non-debug builds for install and debug builds for the test
> cases?  Why do the test cases need debug builds btw?

wrt bios-tables-test, it doesn't need debug version and should work fine
with non-debug builds.
(if memory serves me right it's this test case that prompted to add
uefi images to qemu)


> 
> take care,
>   Gerd
> 


