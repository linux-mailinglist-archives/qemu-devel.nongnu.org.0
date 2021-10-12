Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9728C42AB08
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 19:43:23 +0200 (CEST)
Received: from localhost ([::1]:40642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maLoA-0006IT-13
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 13:43:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1maLm3-0005DB-6F
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 13:41:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1maLlw-0004Td-DF
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 13:41:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634060462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xf8FdQoobGY5wVdWSEEEDJXqeUM7ZxSk8nbx3H8KQfg=;
 b=bSM+O1SvxZqb9BZABXbVI0JWhMI2datnrjcRB2x573rydimMMxrDunbxOZcfXWIPdK9jFN
 zVRbFoepb4T5z+E0kZECWaAtadWrzSf3jbevevHTd9gtFke03TGcjWSPpa+SyfzFtWPQja
 DfwmrQW47Xc25RxQTRLRebgllLz/3Bs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-c2VP21RMNkuqH7umVSr3AA-1; Tue, 12 Oct 2021 13:40:55 -0400
X-MC-Unique: c2VP21RMNkuqH7umVSr3AA-1
Received: by mail-ed1-f71.google.com with SMTP id
 c8-20020a50d648000000b003daa53c7518so581312edj.21
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 10:40:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xf8FdQoobGY5wVdWSEEEDJXqeUM7ZxSk8nbx3H8KQfg=;
 b=kk+bK0aO4OuEw0GuyYOebBeeEWVsLvj0ZYs3dvNaa69+I/ggkiU/V2kWuQ+YNxqz4k
 cFRBuR+RGQ5Gz+JELh+T8ttRsRTGVBPthpDZlddEw9EJ70iwiua4LdehHJbciJd3UvkA
 igtqkPK4aC03OWyQKw2mruHt/IeAbHSCMJ2qwTf3W6EAp9mydHEX66an/dKg82a4ZOV3
 xT6hbZRkT8zX9Dkz/2fUzztCgZ903cz8ft03m7p+Al7apAKcoYA7xnkp3YIig0qmWQzA
 eLy4Fl5SwQmiY2QJoI2MMiamJolxZs47wpaml9v811ZTRZSBmi/HTVk1gVrpyIT9ZwNP
 Gohg==
X-Gm-Message-State: AOAM533MOYr3ZT3+71x8Y1RJk+VkMBbrXY8jAzBj3+ls5RsL3hsGJ+67
 HGJUNUNQY8bGPr31DBqvp49Qd/+xuQPLja5b5BGVxgCaMHbIb+rDMGRcsv+baezN17Qsq+35qtP
 ap4ZJWXd90Y7ZUWM=
X-Received: by 2002:a50:9dc4:: with SMTP id l4mr1533219edk.208.1634060454547; 
 Tue, 12 Oct 2021 10:40:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJys1J+e35Tdmhf/qyPZEvaK0xyoXhrHmOy1eh7KGSS3zNxRu4PlsWswkHOcT5FSpmbT3UPHNQ==
X-Received: by 2002:a50:9dc4:: with SMTP id l4mr1533196edk.208.1634060454364; 
 Tue, 12 Oct 2021 10:40:54 -0700 (PDT)
Received: from thuth.remote.csb (p54886540.dip0.t-ipconnect.de.
 [84.136.101.64])
 by smtp.gmail.com with ESMTPSA id u2sm6242750eda.32.2021.10.12.10.40.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 10:40:53 -0700 (PDT)
Subject: Re: [PATCH v2 12/24] configure, meson: remove CONFIG_GCOV from
 config-host.mak
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211012111302.246627-1-pbonzini@redhat.com>
 <20211012111302.246627-13-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <509fa0e6-123f-68bd-8715-018a5dcb4369@redhat.com>
Date: Tue, 12 Oct 2021 19:40:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211012111302.246627-13-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/10/2021 13.12, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Message-Id: <20211007130829.632254-7-pbonzini@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   configure   | 3 ---
>   meson.build | 1 +
>   2 files changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


