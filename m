Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A7F453865
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 18:19:21 +0100 (CET)
Received: from localhost ([::1]:54430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn276-0005Xi-OQ
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 12:19:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mn25P-00047w-9b
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 12:17:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mn25N-0003VL-A5
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 12:17:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637083052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=myb/aT3WSwErf3/qLUjJQIkrTxR5af4oV2FJnEytQXU=;
 b=OVtSIaif6JLq5bYmp9h3H04uHlGLKa6oPCZBixuNNU9wU6gSMIZluEjnU+pJOUrT9N74XU
 /n8l0PxoRhUQcc0gQiyCSCz7LTjT27+eCXgyqQ87/0p78M0iXZUhjSBY6IeLACHkJFAWLD
 kVbhTH1b/HBUK+7tebkqbkUr06uOnf0=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-24-HdkLLNsUOeOGzOF55d4y5w-1; Tue, 16 Nov 2021 12:17:31 -0500
X-MC-Unique: HdkLLNsUOeOGzOF55d4y5w-1
Received: by mail-pf1-f197.google.com with SMTP id
 c21-20020a62e815000000b004a29ebf0aa7so7689pfi.2
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 09:17:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=myb/aT3WSwErf3/qLUjJQIkrTxR5af4oV2FJnEytQXU=;
 b=GfI914+u/piy0anJD3uFa3CxNpCdzvM6kURjRLlU+Hp0QxHmT7rXaGfCuw+GEmmtLT
 ikd22UlNjLWIays/jzhc0l5zGNJP1SQWLLz1jRPgfmOIn2V0GJJHZ4M0EydTBO0Jyb4g
 N/hCIB0gKfaTaHBTDPxtlCFQ5sCSn1pHslWYXNnUSq+Q+zDnJe8PbIHnxaVddRnHdw0K
 XK9C60BNMVSjTKFkQPmrlBsH32sVFiNBGIXcDd8n2oRE+hqgxXD3hgnYK46I9YRd4+IL
 4m/Eaab+SM1mJPvaNl99dRBwJBisKo1q3izPxZ+6HTi90rHRR/5UwEZF+6fAGiN+YY+t
 kKHg==
X-Gm-Message-State: AOAM5336imlOg8RshB1H3VsULDHU2nj4tNu1ODrmh8DiCN6jQw/VqoBp
 0afLPB2OQPsbV8IPHpySMIO6xgslkW/RcHBldGWnRHYARiOKWmVaAftzIW3iiiXDHkkCpOJxyVt
 V4A5oSUxu4r4ZL17d/cGz6/bYcATut7c=
X-Received: by 2002:a05:6a00:1583:b0:49f:dc1c:a0fe with SMTP id
 u3-20020a056a00158300b0049fdc1ca0femr720066pfk.46.1637083049849; 
 Tue, 16 Nov 2021 09:17:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyU5oKQvrwo6K/KqP3UGgS5PH0n9uS0vTNRkT9bWK6ml1Hr18WcKEURQ0DcSsdqoGeMCfM8fL/2pGZd8eGk8y8=
X-Received: by 2002:a05:6a00:1583:b0:49f:dc1c:a0fe with SMTP id
 u3-20020a056a00158300b0049fdc1ca0femr720032pfk.46.1637083049579; Tue, 16 Nov
 2021 09:17:29 -0800 (PST)
MIME-Version: 1.0
References: <20211116163309.246602-1-thuth@redhat.com>
In-Reply-To: <20211116163309.246602-1-thuth@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 16 Nov 2021 14:17:03 -0300
Message-ID: <CAKJDGDanJHKVsJd1me+8=8KLkwAWk8tfWaXWnyAB8-betkbwHw@mail.gmail.com>
Subject: Re: [PATCH] gitlab-ci/cirrus: Increase timeout to 80 minutes
To: Thomas Huth <thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 16, 2021 at 1:33 PM Thomas Huth <thuth@redhat.com> wrote:
>
> The jobs on Cirrus-CI sometimes get delayed quite a bit, waiting to
> be scheduled, so while the build test itself finishes within 60 minutes,
> the total run time of the jobs can be longer due to this waiting time.
> Thus let's increase the timeout on the gitlab side a little bit, so
> that these jobs are not marked as failing just because of the delay.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  .gitlab-ci.d/cirrus.yml | 1 +
>  1 file changed, 1 insertion(+)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


