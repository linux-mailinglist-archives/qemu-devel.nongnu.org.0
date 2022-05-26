Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 304AF53542B
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 21:57:27 +0200 (CEST)
Received: from localhost ([::1]:45216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuJbq-0007Vv-4P
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 15:57:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nuJZZ-0004zJ-4A
 for qemu-devel@nongnu.org; Thu, 26 May 2022 15:55:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nuJZT-0000Zl-CF
 for qemu-devel@nongnu.org; Thu, 26 May 2022 15:55:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653594898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YJJw15fmffkbtH/XSexOs6Ld9TUtZdA1IsiAaLlKit8=;
 b=R1LSDC+DvAdAyxpu9Q7iyEVnGRhZcmSYgL0+rL9Ss+FaIAHawwXVM359zkqohMVsy/3fgI
 urZvD4NPIF4W0Nm+a7doWE9v7hEVU5SjtokYnoEnI9m08vhJaQavl69ElNNbjcbANDmOEG
 3qQLSwCGrcWK496c7qXKgeToph7vYwY=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-104-1hj4pGSKO5-KZiryKlAKRg-1; Thu, 26 May 2022 15:54:54 -0400
X-MC-Unique: 1hj4pGSKO5-KZiryKlAKRg-1
Received: by mail-pj1-f70.google.com with SMTP id
 s1-20020a17090a760100b001dfa6169b1eso1599773pjk.0
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 12:54:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YJJw15fmffkbtH/XSexOs6Ld9TUtZdA1IsiAaLlKit8=;
 b=omaEkepmq1DP1RjQgbZ1zDPkSS69+c9/HsobolVmglo8t2EEHkHNJTD4UoNb/qWIus
 8vazju0kiRTE1yHob80BkoTPGuuBNQqEs0P+7V9iyCNeGjq8BAike9U8d8qPSn0rK6nJ
 KiqL9NzzxEQgkj3XA+EgUU14VwThj0MRwpobp04HIhuOK8HBQkWfMTRAWO/iW4a/m3Dk
 UmkyxMMKgi+ejSSrza7dP144m+3WsR9SPvJG4Z3WYimT59A3wkOAEgtJB5b6DJN+B2oU
 C6oAByZnqcWh/8IhHY73ssC1yQWmVWirNRJKdTElj+MZ0UkdEE6DjoL/RTUdYyN3Pe3U
 IjZA==
X-Gm-Message-State: AOAM533OHF611CZF2Bn1AO4PnefycOQ4G/FJe538FpJcVm7ZpdBVm+MC
 eByub3+RKfoOb7EJntngDFJEbpsiSlvoanmEpREXeY/jdVgFnIxLknHYA2MtdqyHtKsFWGS2rP0
 CBv1zi8bzxxFQBKsxmsnjQ+1AAK8LrIs=
X-Received: by 2002:a63:834a:0:b0:3fb:94f7:c681 with SMTP id
 h71-20020a63834a000000b003fb94f7c681mr1835042pge.254.1653594893580; 
 Thu, 26 May 2022 12:54:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3UecQg6IrVjPiGvL8MtO7YuQi6yzr8/U4i75pQ3agrxlvDqalttHz2OuiNXRC3xVIZ3J4G819XP0NZJv+HMU=
X-Received: by 2002:a63:834a:0:b0:3fb:94f7:c681 with SMTP id
 h71-20020a63834a000000b003fb94f7c681mr1835022pge.254.1653594893327; Thu, 26
 May 2022 12:54:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220526000921.1581503-1-jsnow@redhat.com>
 <20220526000921.1581503-6-jsnow@redhat.com>
 <fe05defa-4820-489c-200e-36fc0a3f69f6@redhat.com>
 <CAFn=p-YZ8G0f3JBw0tRHn-cytVUA=z5VS9kzZaH4faqrsx+afA@mail.gmail.com>
In-Reply-To: <CAFn=p-YZ8G0f3JBw0tRHn-cytVUA=z5VS9kzZaH4faqrsx+afA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 26 May 2022 21:54:42 +0200
Message-ID: <CABgObfYYTqf5N3-i9zvKFBZifefFvNhTECqb3tev+t=ArD2HqA@mail.gmail.com>
Subject: Re: [PATCH 5/9] tests: add quiet-venv-pip macro
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, May 26, 2022 at 4:17 PM John Snow <jsnow@redhat.com> wrote:
>> > -     $(call quiet-command, \
>> > -            $(TESTS_PYTHON) -m pip -q --disable-pip-version-check install \
>> > -            -r $(TESTS_VENV_REQ), PIP, $(TESTS_VENV_REQ))
>> > +     $(call quiet-command, $(PYTHON) -m venv $@, VENV, $@)
>> > +     $(call quiet-venv-pip,install -r $(TESTS_VENV_REQ))
>> >       $(call quiet-command, touch $@)
>> >
>> >   $(TESTS_RESULTS_DIR):
>>
>> Sooner or later I'd like quiet-command to be changed to English
>> descriptions like the ones currently emitted during the ninja build, but
>> stuff for later.
>
> If it helps, this is a bit of a stopgap on the way to the configure-driven version; ideally this goes away by the end of this little project.
>
> (I just thought it made the recipes read nicer and reduced the chance for anyone else getting the pip flags wrong in the interim.)

Don't worry, you're at least consistent with the current way the macros work.

Paolo


