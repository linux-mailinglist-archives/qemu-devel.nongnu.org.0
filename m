Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEEC4420B1
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 20:19:56 +0100 (CET)
Received: from localhost ([::1]:48372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhcqY-0007Xv-PM
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 15:19:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhc1s-00046D-EH
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:27:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhc1n-00017f-Ay
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:27:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635791246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a7q1gQXHDXPiz8+g5PZWu+5GhMKJjYlDvd0TDi5qbyo=;
 b=HsOgrBIODnvWRpGBHPzUbqlhpjY8p/1WVdJn6OvM94x+uRGBFa3Xi/cFbl49oaERKyKCyT
 VRmw+TVP0OMjdLySdKlieKE5XWdM35wUQoGWFQu8OYr46oROFqlm6Fb4aU1Anb9oS51jxa
 7H6aLHQQ2DNlUElcETd/SvcJUgv0d38=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-KtBjWCoBMHSwJ645Jzm6KQ-1; Mon, 01 Nov 2021 14:27:25 -0400
X-MC-Unique: KtBjWCoBMHSwJ645Jzm6KQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 f1-20020a5d64c1000000b001611832aefeso6533572wri.17
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 11:27:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=a7q1gQXHDXPiz8+g5PZWu+5GhMKJjYlDvd0TDi5qbyo=;
 b=sY6b+NWy6HPszRWWEFXkjQ4muQH2nukZ0jlEdbAtDDmvIzBQMakVFPEZxRa+mUWJd+
 BGsfPwTpwGYuoRYOmYlyM3NNwEhnsgyjLIoNp4CL9IIYQe/8EeFTD6qk5nV1km81o9ri
 gXWOOgm15GJ2XpOJtrHtPmctA6QpL981+9+8Gft07ufEjJWI32mLDi5EsEBEY9I6INpW
 RebPWrRTMHrJ7MbFj/NhfPwudULDOv3UKEb47DJrIibErFtDSegbibppqUukUkzMV4B1
 53rUYVJxk6rmRcpwfiO6Pz22G8sn2ttAyrCmtmr5+DibnmeFjcj9cg8EgP5YafqYtEcf
 tKrA==
X-Gm-Message-State: AOAM530HAlVdbWUhsxI8PNFgrK0lZY4oHFGWZNy14BZtyHTjDKg4R0N1
 dLhqrE91ir0tiF58pp46CiTEY1/mg0jx+CfWK/ZuTMquzmWEMhU5/iAWnLAlVThy/tdHJoEHdFQ
 Jk1ilOJ+LrahV6XE=
X-Received: by 2002:a5d:4b82:: with SMTP id b2mr23195682wrt.419.1635791244166; 
 Mon, 01 Nov 2021 11:27:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykp9OT+HxAM9bleR1buBkg6G78VZSdSjED1sdMCNWGyBbeuLJtkRv0q6tIl/qLaC5L/vca4A==
X-Received: by 2002:a5d:4b82:: with SMTP id b2mr23195649wrt.419.1635791243949; 
 Mon, 01 Nov 2021 11:27:23 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id z6sm346509wmp.1.2021.11.01.11.27.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 11:27:23 -0700 (PDT)
Message-ID: <4d5d8e34-8d82-c0dc-b31e-afaa244e3da8@redhat.com>
Date: Mon, 1 Nov 2021 19:27:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [Qemu-devel] [PATCH 0/4] Remove some qdev_get_machine() calls
 from CONFIG_USER_ONLY
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
References: <20190425200051.19906-1-ehabkost@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20190425200051.19906-1-ehabkost@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) DKIMWL_WL_HIGH=-0.734, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.14,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Like Xu <like.xu@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/25/19 22:00, Eduardo Habkost wrote:

> Eduardo Habkost (4):
>   machine: Move gpio code to hw/core/gpio.c
>   move qdev hotplug code to qdev-hotplug.c
>   qdev: Don't compile hotplug code in user-mode emulation
>   qdev-hotplug: Don't check type of qdev_get_machine()

Patch 1 queued to machine-next.


