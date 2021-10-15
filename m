Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CC442EFBF
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 13:31:47 +0200 (CEST)
Received: from localhost ([::1]:37770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbLRA-0007Hf-Qn
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 07:31:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mbLPF-0006XK-94
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 07:29:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mbLPA-0002Tm-Dm
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 07:29:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634297378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xeBrHb7oF0FvpMc/z4tLUqIvAV/pXEy5F3pu5GipU8A=;
 b=V0kXgq47eMEIDweK43W6TSyRrLxW5IVbNKciYF0/CPkhWRig8n80IqljC0/BI1+JWI0BaJ
 CoS9d8OOH6YhMGvcRvcE7GyTCiqPrxGZNe4Qx7BOCj9tqn5UktDHfJJENFTpJzQqGTAeNY
 5cx3uHtkT+av4cbLgH6iwCYE/eQR/Ns=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-oTuIaVOPM7Ci8pDueA4Y0w-1; Fri, 15 Oct 2021 07:29:37 -0400
X-MC-Unique: oTuIaVOPM7Ci8pDueA4Y0w-1
Received: by mail-ed1-f71.google.com with SMTP id
 f4-20020a50e084000000b003db585bc274so7904147edl.17
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 04:29:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xeBrHb7oF0FvpMc/z4tLUqIvAV/pXEy5F3pu5GipU8A=;
 b=3pbHzQUIXEEEVPbSDe7mb92Mq6j7+HzACaxI2bY6xS/ZsRjxCSw2tWnXSYTi3/jBUl
 4qymodIc2of6hYjcneu+q06vdWV2suELuZfXakUzA994upl8KKKFDScaVAkefHfRzEqX
 3Q6uIxValkUT3fOVw7h1xO8eHd3KZVULJZ4huq5gNPiv2vTS2shMAvEA7HjdD2QEKzAL
 +0RevulZhNUio1zAFkivb7iU3/nmA4UMLK5h7+yoHcz1f36bGFK/yabQUFnlqapJJrFh
 l/XQnCucEqKmQ6ZWSZ4T7EzTy73GyEYwIx/j/aYASZYRyVnnYHPv9D7b1enVQmMcu/+h
 ttMg==
X-Gm-Message-State: AOAM531y98zWbZ0VtDXj4VCbj6Fx0+p8SPp8Kx98JG/BkGpbNt72Lugj
 2bJOl4kwdigA/XoJqAuWqixXaBWNXXHd8DBtpIRYFsPWws+2vERD4RCUopdCkbWjVQDJ3Redfw7
 jYn6lfN6zunlMB7Q=
X-Received: by 2002:a17:906:6a2a:: with SMTP id
 qw42mr5926036ejc.561.1634297376157; 
 Fri, 15 Oct 2021 04:29:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzilTWMteZoUXe5ndZit9BmRmRu1w9nz1TzOifOyAMEWcG/VbvTP+6Amp87YsHY0TwhIfFBA==
X-Received: by 2002:a17:906:6a2a:: with SMTP id
 qw42mr5926011ejc.561.1634297375931; 
 Fri, 15 Oct 2021 04:29:35 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id z18sm3879241ejl.67.2021.10.15.04.29.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 04:29:35 -0700 (PDT)
Message-ID: <523fdd5c-09f8-e677-6a3a-2f5829562b77@redhat.com>
Date: Fri, 15 Oct 2021 13:29:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 0/8] Some Sphinx improvements
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20211015105344.152591-1-marcandre.lureau@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211015105344.152591-1-marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/10/21 12:53, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Hi,
> 
> I have collected a few Sphinx-related improvements to improve depfile generation
> and add some keyboard navigation. Hope you'll like it.
> 
> v2:
>   - fix test 'output:' regression
>   - fix javascript indentation (Paolo)
>   - split "meson: remove explicit extensions dependency file list" (Paolo)
> 
> Marc-André Lureau (8):
>    docs/sphinx: add loaded modules to generated depfile
>    docs/sphinx: add static files to generated depfile
>    docs/sphinx: add templates files to generated depfile
>    tests/qapi-schema/meson: add depfile to sphinx doc
>    meson: drop sphinx_extn_depends
>    meson: drop sphinx_template_files
>    docs/sphinx: set navigation_with_keys=True
>    docs/sphinx: add 's' keyboard binding to focus search
> 
>   docs/conf.py                  |  7 ++++++-
>   docs/meson.build              | 10 ----------
>   docs/sphinx-static/custom.js  |  9 +++++++++
>   docs/sphinx/depfile.py        | 19 +++++++++++++++++--
>   tests/qapi-schema/meson.build |  6 ++++--
>   5 files changed, 36 insertions(+), 15 deletions(-)
>   create mode 100644 docs/sphinx-static/custom.js
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

I think the patches could be reorg'ed as 4, 1+5 squashed, 2+6 squashed, 
3, 7, 8, but that is not a requirement.

Paolo


