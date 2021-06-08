Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A480439EECB
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 08:35:10 +0200 (CEST)
Received: from localhost ([::1]:39254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqVKP-0000fk-Lr
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 02:35:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lqVJ6-0007kG-0I
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 02:33:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lqVJ3-0001dm-6I
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 02:33:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623134024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ne07C/kBROvbvD6Ev5HENaKP+LTvHFOFJ7Pq9ailGJk=;
 b=LvV44DxnV07qreXtApswp8I4IQX+jds8BMx2G3A3+xS0lulcqtM2FvUvuFsXhEgO5voyVT
 pwaW73oZMEnLALHT6ZyedcC6UxhWLdyQgj1j9UTs1rZ07Nt3gS9UWuK55ybjk/x65m31Bv
 lyVzcF0ckhklc6bwRp0Fan4iFSLcDqc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-U1W40QNdO9eznAecip9KCQ-1; Tue, 08 Jun 2021 02:33:42 -0400
X-MC-Unique: U1W40QNdO9eznAecip9KCQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 u20-20020a0560001614b02901115c8f2d89so8894151wrb.3
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 23:33:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ne07C/kBROvbvD6Ev5HENaKP+LTvHFOFJ7Pq9ailGJk=;
 b=ulQ0HidG434o32i4T+ltBd8q0nvWvv6fhfLJxoW39655f4USvuXSlxMwABCxF0UChJ
 mlKppXxnDs9cMtZIFlmNnCInCzEahF4MtKHkrlMyYHMPlOj21GrhubuUj8MH80jqFZVP
 Zz+jUjfrU6PdH/0+o/AvpLf9AtPewThcpI9f+rHR67tEEzOpD4YdI+7flAu1dPkIO7ZS
 WkpBL0bAQZmdAWDuiUelDas201sK0ciP19lBuKxS3hauJX3XDSV8003LDEE7ayD5PlWb
 dNzzM+3yyxSMoyKPfB6ZzYYQfH3pdxRFkagFMEawCnSLaN5xrWIt5mSMyeeF+0hngk0j
 6jYw==
X-Gm-Message-State: AOAM5300rOCw9BdQW86SoB1j8aM3+gZCTzBGJlW30ALKzDQlGJgjwjgC
 UN74xNVncrepu1OENhj+pkA/VenzHzOeS6+9ZqOaQ7sK5QxhY/A577+iR4JX17JPFV/RiJDFIxK
 Ztq7RKUXCK4o8EXY=
X-Received: by 2002:adf:b34a:: with SMTP id k10mr20813008wrd.333.1623134021563; 
 Mon, 07 Jun 2021 23:33:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKjN2vreV637F83KwntNg+W48CtJGDO4pHN6ubdmxmBwEGiwk4re7iBs1z+upOS/3K0T1aBw==
X-Received: by 2002:adf:b34a:: with SMTP id k10mr20812988wrd.333.1623134021414; 
 Mon, 07 Jun 2021 23:33:41 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id a12sm16333336wmj.36.2021.06.07.23.33.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 23:33:41 -0700 (PDT)
Subject: Re: [PATCH] docs/tools/virtiofsd.rst: Do not hard-code the QEMU
 binary name
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20210607174250.920226-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3909b15c-c0ec-19f3-cc92-ec95c076830b@redhat.com>
Date: Tue, 8 Jun 2021 08:33:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210607174250.920226-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/21 7:42 PM, Thomas Huth wrote:
> In downstream, we want to use a different name for the QEMU binary,
> and some people might also use the docs for non-x86 binaries, that's
> why we already created the |qemu_system| placeholder in the past.
> Use it now in the virtiofsd doc, too.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  docs/tools/virtiofsd.rst | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


