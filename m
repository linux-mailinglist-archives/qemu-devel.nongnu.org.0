Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7D042BE4E
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 12:59:23 +0200 (CEST)
Received: from localhost ([::1]:56010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mabyk-0000Zs-6R
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 06:59:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mabxd-0008Ch-Ud
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 06:58:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mabxc-0003Qi-GE
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 06:58:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634122691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZnOZo7ynKDgyv9FK1ULiVYcQtkvIzHLK/hSSeit3IIU=;
 b=C+HrzZEkG2Km+3ijUnXOOG7D/CpP/Isq1UNL+/q+PUA2+ae5LOFa5mbpE5ZzEIcyub1h5J
 vE05I3eFEgo1eicQuDmCVNrd4AGu80eUqu1xMuxgxrTA7/xsGIxSGEfRNMLx3XzoGOLH8X
 SO/n6/DR5Y9QCXSGrf6FP2Uus9PMx0s=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-3Fv1adO2NdCJZDC-ENVn6A-1; Wed, 13 Oct 2021 06:58:10 -0400
X-MC-Unique: 3Fv1adO2NdCJZDC-ENVn6A-1
Received: by mail-wr1-f71.google.com with SMTP id
 v15-20020adfa1cf000000b00160940b17a2so1633822wrv.19
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 03:58:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZnOZo7ynKDgyv9FK1ULiVYcQtkvIzHLK/hSSeit3IIU=;
 b=xCOKA0yGq6xLXNzgIKWbJQeHIKwLUB1B33SNPMSMk0cT8ggDAH0K40kOYcejwnwKqN
 M7LLK1dg/N/7mq9OPysFtMKWu61EKf5RvWmo1QPRzJ1E6jBFo8rJ+vNJwbMd9MB/AVj+
 7bfSAWbOC97kRuQh7B5VzdqIpCpACy3t/SfJ9vN+dq1kWDKEKElflzO4Dj9CghnyVXC0
 CUTzntuDFDdk/9GylF2Bb3Avhrx7d1KemzWvYU87cIORT4RIzN4AsJVQymb9IQJ5yZYR
 I26DRe+c0qVxdcqeWSt9sVW5cXNwGabVJOelzrj3PM6c173E/yVOcm6vzabCgxipjGkA
 ftRw==
X-Gm-Message-State: AOAM532CLQfHp+sbqAFkHscV0QjpHi0refQ4IMqLWVyerd7DE1/KtFJF
 fJ42JTqIRSNiWI9CIJmP7tnDXw2CrR9fgeZQZifcax/n7Evvf0V84GU/j9hz/KD4NJ9EUOCweMp
 3nSbgSR4KlJpjwFg=
X-Received: by 2002:a1c:751a:: with SMTP id o26mr12393477wmc.94.1634122689058; 
 Wed, 13 Oct 2021 03:58:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFY4bvqYc5/eCWihlXaCuhPWiLx6tM1aClwj/hWPy7VhNG529P567zt4GZ4ooD3Zjs12VTcQ==
X-Received: by 2002:a1c:751a:: with SMTP id o26mr12393443wmc.94.1634122688768; 
 Wed, 13 Oct 2021 03:58:08 -0700 (PDT)
Received: from ?IPV6:2a02:908:1e48:3780:4451:9a65:d4e9:9bb6?
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id z6sm9029947wro.25.2021.10.13.03.58.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 03:58:08 -0700 (PDT)
Message-ID: <8f162872-5beb-fda3-be28-0cb16a5d6017@redhat.com>
Date: Wed, 13 Oct 2021 12:58:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 03/13] iotests/297: Add get_files() function
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20211004210503.1455391-1-jsnow@redhat.com>
 <20211004210503.1455391-4-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211004210503.1455391-4-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04.10.21 23:04, John Snow wrote:
> Split out file discovery into its own method to begin separating out
> configuration/setup and test execution.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/297 | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


