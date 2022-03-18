Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E3B4DDF95
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 18:06:22 +0100 (CET)
Received: from localhost ([::1]:39850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVG3Q-0001TK-Tc
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 13:06:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nVG1e-00085Z-Ey
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 13:04:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nVG1b-0005qq-F4
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 13:04:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647623066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BUYsAWxWpDt79pIZZ85Rg2KX1TE9Of52sFO9g/lPASc=;
 b=Qxhh9U5IHOjdsh8Riac4lNz+drr4n21P9b7nuZW/nxIRqiRH22qiky/R53QtV9O4JkdMY8
 DyBjVZ+D7suZPf5VfE9HzzEopYJSr5nx8jnbuoxqE+3SOBWprKuc3hlOO6std6gcs0Up3E
 q1oL5A/rBkP8/4IAsqHeYC9QfS+/0eI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-vr-e1psHPW-ry8pE3tLsPg-1; Fri, 18 Mar 2022 13:04:22 -0400
X-MC-Unique: vr-e1psHPW-ry8pE3tLsPg-1
Received: by mail-ej1-f70.google.com with SMTP id
 x2-20020a1709065ac200b006d9b316257fso4843608ejs.12
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 10:04:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BUYsAWxWpDt79pIZZ85Rg2KX1TE9Of52sFO9g/lPASc=;
 b=NWoGS28aAFs6G2HJ6jQBnzuecGJfBqUhf+ZIC3dwO9/XvTMmSEFENBHfgWMfegnEN9
 LuOvRtXc2T5qhkws1rtYtIMaFGgk2sovtzCsj0/OxjyTTiVlSrsnh1LnnXbOhPSj7UJC
 KAldj/UkiqQfaDZQAViqIxcIYAC6/Z1dJjPOy6BJC0TMh9dtmuN/G5LKx0Cf8VJ8fHTh
 sgf3zmtuw45lvK9MlqQrhagbtQHOjgFeSAZfqaxJ6UfNuHdclsmKBU5q1JwYY7sud08c
 t++h49iyGd36beTVfKkc3+aaVbO3dnfNETvvqBcvta7cr6V8kW6DhpmxbuAHT3YX+IVH
 fhQA==
X-Gm-Message-State: AOAM533NFlpzMQiPPgtGUBGPAyV9CmYJlUKJiBSqwAIuieUC+rfOjMOR
 W0WKUVj9I1eSXRYSPf6uYWc3Qj50a8xBrqzah13ldNnvngwB7h4T15x85hG+vUkzVqkT8qlJeSI
 5arwXuUaO8XGeY6c=
X-Received: by 2002:a17:907:6e17:b0:6da:83a3:c27a with SMTP id
 sd23-20020a1709076e1700b006da83a3c27amr9601327ejc.415.1647623061231; 
 Fri, 18 Mar 2022 10:04:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKyNCputgeEQT13K9yMoYGMIAYY1Ao15GC9xongohWmePI+ZwbiU2s1aP//DAGRXAMwBNhVQ==
X-Received: by 2002:a17:907:6e17:b0:6da:83a3:c27a with SMTP id
 sd23-20020a1709076e1700b006da83a3c27amr9601289ejc.415.1647623060803; 
 Fri, 18 Mar 2022 10:04:20 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 o5-20020a056402438500b004187851753esm4294194edc.17.2022.03.18.10.04.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Mar 2022 10:04:20 -0700 (PDT)
Message-ID: <2a2dadb8-24ba-50c4-617e-ab6d08166e83@redhat.com>
Date: Fri, 18 Mar 2022 18:04:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4] tests: Do not treat the iotests as separate meson test
 target anymore
To: Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220310075048.2303495-1-thuth@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220310075048.2303495-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10.03.22 08:50, Thomas Huth wrote:
> If there is a failing iotest, the output is currently not logged to
> the console anymore. To get this working again, we need to run the
> meson test runner with "--print-errorlogs" (and without "--verbose"
> due to a current meson bug that will be fixed here:
> https://github.com/mesonbuild/meson/commit/c3f145ca2b9f5.patch ).
> We could update the "meson test" call in tests/Makefile.include,
> but actually it's nicer and easier if we simply do not treat the
> iotests as separate test target anymore and integrate them along
> with the other test suites. This has the disadvantage of not getting
> the detailed progress indication there anymore, but since that was
> only working right in single-threaded "make -j1" mode anyway, it's
> not a huge loss right now.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   v4: updated commit description
>
>   meson.build            | 6 +++---
>   scripts/mtest2make.py  | 4 ----
>   tests/Makefile.include | 9 +--------
>   3 files changed, 4 insertions(+), 15 deletions(-)

I can’t really say I understand what’s going on in this patch and around 
it, but I can confirm that it before this patch, fail diffs aren’t 
printed; but afterwards, they are.  So I’m afraid all I can give is a

Tested-by: Hanna Reitz <hreitz@redhat.com>

If noone else steps up and you need a tree for this to go in, I’d be up 
for it.

Hanna


