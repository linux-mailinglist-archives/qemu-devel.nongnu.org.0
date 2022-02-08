Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8454ADB57
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 15:38:18 +0100 (CET)
Received: from localhost ([::1]:40176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHRdJ-0001pa-Ny
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 09:38:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nHPBL-0001rM-9L
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 07:01:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nHPBG-0005To-0N
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 07:01:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644321661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X29Fw6Ofv/mVdnzoaYbNHmhwi61iYLyBjKwx5XQPTUk=;
 b=iz/T+2urdrKil4ib1Y+f4H6hGls5ZlS7SqVTpd+FOL6bf+KdmYI7L8gcK6jllsdtHNY5U/
 L8kqkhTF1tyMJqpQFJD66HsrGxhlbFrw45RIAFpBAM2Gs3V5i1DRM6CvycO6iY18Z6odYn
 8kVbN51SPYHG8y/gwgMmFA+OkJFmgfs=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-203-NuRoiaG_PyC7PKd1SQz9Bg-1; Tue, 08 Feb 2022 07:01:00 -0500
X-MC-Unique: NuRoiaG_PyC7PKd1SQz9Bg-1
Received: by mail-ed1-f70.google.com with SMTP id
 f6-20020a0564021e8600b0040f662b99ffso3630593edf.7
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 04:01:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=X29Fw6Ofv/mVdnzoaYbNHmhwi61iYLyBjKwx5XQPTUk=;
 b=LmFBaSYfvnKPPGz0uu9Gtw4zN8D9T17tkeMsIujkZPCKsSXHtmOhBV6wqSS942OD7W
 ydhGOIH7zIS4KCI/RpKB5iyv2F/VbhtKp8UH/+gyWw9UiE1RqEqGvOE+hFBKzOj63bYH
 iLUQCOFZbY4mqMQJ4D2p+Hmkv7gQedS4tUJcjF4VsWgF9RfiA+lGz3pIxPjxy8aDSh8u
 MbDNQ1ijcVBs/8HJisez9LFSLAT/0GRt5HUZABVSAmAjhuKWQSD6c5FacpzQ1CGMwR3p
 kfdyz0Yh5A94wPbHG4IzirXg23pR3aiRNc92GSLFjwHPnMixZPQXGJRvvIte2SsrpKyQ
 1vdA==
X-Gm-Message-State: AOAM532z8v+FKBuld7MN2Pu2fl7yYm6XW4Uzw2SP+jpnyVnrioJXP7+D
 7ETdj35v7Emriv0Nne3zGcEW/NPAjabMTadI0Fl3KiQaI9Beu8+9I4L8l4v49yMXjqdtmKIO/TY
 tvIpGRxolPxMn8lI=
X-Received: by 2002:a05:6402:2747:: with SMTP id
 z7mr4051008edd.227.1644321659495; 
 Tue, 08 Feb 2022 04:00:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy8SQflBjJ20EC6whaiAURG3csiIaJ681XQgIEynoxJ9LMFNVDhmlDD5BkF6pAJH25VIlN55Q==
X-Received: by 2002:a05:6402:2747:: with SMTP id
 z7mr4050989edd.227.1644321659186; 
 Tue, 08 Feb 2022 04:00:59 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id j12sm2363549ejc.83.2022.02.08.04.00.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 04:00:58 -0800 (PST)
Message-ID: <bce98d12-813e-d2cd-c634-0d38285b0625@redhat.com>
Date: Tue, 8 Feb 2022 13:00:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/6] tests/qemu-iotests/meson.build: Improve the
 indentation
To: Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>
References: <20220208101311.1511083-1-thuth@redhat.com>
 <20220208101311.1511083-3-thuth@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220208101311.1511083-3-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08.02.22 11:13, Thomas Huth wrote:
> By using subdir_done(), we can get rid of one level of indentation
> in this file. This will make it easier to add more conditions to
> skip the iotests in future patches.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/qemu-iotests/meson.build | 61 ++++++++++++++++++----------------
>   1 file changed, 32 insertions(+), 29 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


