Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9C42F5F81
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 12:09:33 +0100 (CET)
Received: from localhost ([::1]:54580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l00VQ-00039l-Em
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 06:09:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l00Tg-0001qQ-ON
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 06:07:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l00Tf-0006KT-0r
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 06:07:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610622462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iRRi9wZNpnDC6Utz3V0m/Cf3KzZpReguFkpZ+/enGTQ=;
 b=jGgTkxOwc/5lXDwvKWDIvrogUtxRfqNbvEfxUc7t8FUXdVrOHQkmp7G04ffiv6sEAoaBjE
 ojIe2ritg8d0Px9cfAFndqDoEpc4v1RFH5NPeJIC93d3RiQQfrWicCdiMLzOixGDwpWkuj
 h0tEh7sZ+xQqEnSJ9ZO6eLwn6F8RhTM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-KtdaKwIrNlaZJ7Jp76qpZg-1; Thu, 14 Jan 2021 06:07:28 -0500
X-MC-Unique: KtdaKwIrNlaZJ7Jp76qpZg-1
Received: by mail-wr1-f69.google.com with SMTP id v5so2456763wrr.0
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 03:07:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iRRi9wZNpnDC6Utz3V0m/Cf3KzZpReguFkpZ+/enGTQ=;
 b=FxETrN3pD3ABrvqnp2NBaUmfYBo2JjGtLSyddgfS3PoFmLa4RjeWyGEDbfaK0gE4nl
 he+IN/il/SXjnIy77qbq/d5A5cW642WK6cG5hKsZHORXROYUR3IEe5PwTGDFIbSctQD2
 TjsHRzD2wWII90pUv7nCFPOqBFeR2FEGAJCQZbh9cS05JsTHwPca4DJxKWEVzguhK/Bk
 v5eJIgrxJNi8lPAu0AgLLkvSImJXIfoUo1EJWdJdqJPcri0uCBIoS43KWF7hbDtlKoab
 nU/MuclJadi1QTmfUONAuUM/e2Qmb3Z25WJdHL18vmgXVEWyT5NCrZRrQkokDmMYxLuM
 +GkQ==
X-Gm-Message-State: AOAM530z1ePhuT++XeYhO2nLXfNj/C++Z7g3rq0U6ZtHg5C3AhzVpsnz
 cseq+NVLUuZavwhkMeMYQl7KrH9Rr6WShJ/MGkWIL87zITQRce1Wbd9ImETPsMBKHTb1erKVQzH
 OCLggX69xEpTtHzM=
X-Received: by 2002:a5d:6686:: with SMTP id l6mr7330226wru.236.1610622447345; 
 Thu, 14 Jan 2021 03:07:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxXER15x0T+OG682kGuT78M1b1vl8+oZNvhLwh8ITPyJSVX/efyOOv5OIIyRiFnl4p08btJIw==
X-Received: by 2002:a5d:6686:: with SMTP id l6mr7330198wru.236.1610622447112; 
 Thu, 14 Jan 2021 03:07:27 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id r82sm8150887wma.18.2021.01.14.03.07.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 03:07:26 -0800 (PST)
Subject: Re: [qemu-web PATCH v2] Use GitLab repo URLs instead of git.qemu.org
 URLs
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210113185403.276395-1-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <98b537fa-9d9f-9005-359c-b1180b0e8f90@redhat.com>
Date: Thu, 14 Jan 2021 12:07:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210113185403.276395-1-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/13/21 7:54 PM, Stefan Hajnoczi wrote:
> Switch to GitLab repo URLs to reduce qemu.org bandwidth.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
> v2:
>  * Added missing URL in _posts/2018-06-28-tcg-testing.md. Mark
>    Cave-Ayland <mark.cave-ayland@ilande.co.uk> and Alex Bennée
>    <alex.bennee@linaro.org> figured out the issue was that the gitweb
>    link referenced a blob object (not a commit) whereas GitLab needs the
>    commit object. Therefore the hash hash in the URL has changed.
> ---
>  _download/source.html                           | 4 ++--
>  _posts/2017-02-04-the-new-qemu-website-is-up.md | 8 ++++----
>  _posts/2017-10-04-qemu-2-10-1.md                | 4 ++--
>  _posts/2018-02-09-understanding-qemu-devices.md | 2 +-
>  _posts/2018-06-28-tcg-testing.md                | 4 ++--
>  contribute.md                                   | 2 +-
>  contribute/security-process.md                  | 4 ++--
>  documentation.md                                | 2 +-
>  support.md                                      | 2 +-
>  9 files changed, 16 insertions(+), 16 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


