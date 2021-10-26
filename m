Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E5E43AFF0
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 12:21:27 +0200 (CEST)
Received: from localhost ([::1]:55150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfJaB-00075n-1I
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 06:21:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mfJY1-0005CZ-2l
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:19:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mfJXz-0003mb-O5
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:19:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635243551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KLCNbs+r0JavqR2Ym82qx1pceQFlzjoIt7cGqu052xI=;
 b=T3+aspfICt3vtB4BzjX809CeYNTfSIQxJ7lwDTwHY7oEgShmZBvDXq2VDQsO7oJT0vn0QJ
 BYXY7ruoPsk0nLR6K/9noIdGXYNxcXCCPUm5zsX4XEPTwbGjCRHVvKE2Wb1YiPKNidD8r3
 37L55CuumMrAF4DvD7w0sS+95AKwGtc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-7oHlM1n7M6mJckRRqz7nBQ-1; Tue, 26 Oct 2021 06:19:09 -0400
X-MC-Unique: 7oHlM1n7M6mJckRRqz7nBQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 h16-20020a05640250d000b003dd8167857aso1908861edb.0
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 03:19:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KLCNbs+r0JavqR2Ym82qx1pceQFlzjoIt7cGqu052xI=;
 b=mpVEn8hZ3DlbKR5vOFvrR3iYL+ZR9TKxEO4R2aX4MLfeKnCZ1m2AsAx0W2yZEmeXrn
 p7+aSWlJGSJp4C4VNWTrDOegrPqJV5P8ca+mtvlhh3q1GBHhyq3TyK2eS2dbf4e7wnZ+
 y7+HLt9XqyBqEMP/fwVLYb/02nMWZ3Ybu9p9OVZTRI1q2rUc99CdaswtJmZjWOfS9ant
 985uYw9I7TDheCk36B04r7msSItDtGo/p2kaSLg2ECuN04BiCoMTBbZd9rSQ8+wStV1p
 zwbQ36COnZAgebo2F6btiSGZBmFO+QLoQ0AA8Xoy0HqKYQTt5kJRYCOo1mVl2kJ3hx63
 Tviw==
X-Gm-Message-State: AOAM5316R3NccuEC3yPMlgly8c/9I8mCsLfkkPd34k8NLf7P5bpVkQlo
 W6JPV/oy8DvNyZbHHVPYiXu4xg/Vm+UmvWMMceyBy0M4qCwkr18UcByDRlyVwp8lnHRkQryzb5m
 vIl4QVKpt1Ziowyc=
X-Received: by 2002:a05:6402:4389:: with SMTP id
 o9mr35761171edc.38.1635243548763; 
 Tue, 26 Oct 2021 03:19:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaluoqEdaZyA83HcnoQv8aLd+r/Y/evpOOS3mkDCCiCkjQQM9KSlLKpJLAGGgCK4KbRXD3sQ==
X-Received: by 2002:a05:6402:4389:: with SMTP id
 o9mr35761132edc.38.1635243548558; 
 Tue, 26 Oct 2021 03:19:08 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id nc7sm4180719ejc.63.2021.10.26.03.19.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 03:19:08 -0700 (PDT)
Message-ID: <27909f7c-556c-8999-bc6a-f819630fa6ff@redhat.com>
Date: Tue, 26 Oct 2021 12:19:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 09/15] iotests/297: update tool availability checks
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20211019144918.3159078-1-jsnow@redhat.com>
 <20211019144918.3159078-10-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211019144918.3159078-10-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.846, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19.10.21 16:49, John Snow wrote:
> As mentioned in 'iotests/297: Don't rely on distro-specific linter
> binaries', these checks are overly strict. Update them to be in-line
> with how we actually invoke the linters themselves.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/297 | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


