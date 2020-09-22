Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB606273EB1
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Sep 2020 11:40:54 +0200 (CEST)
Received: from localhost ([::1]:33636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKen6-0005qB-Hs
	for lists+qemu-devel@lfdr.de; Tue, 22 Sep 2020 05:40:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kKelJ-0004cB-2c
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 05:39:01 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:53493
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kKelF-0007my-Q9
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 05:39:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600767522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uGoTKRaUsmCpdbYmJ4H6EmDjhYZo5LVd9JG7R8kF4xQ=;
 b=bVhHMX91QftySPzjdqrrsJ6gOe0S4SvAEkFZSWO6PdtGRjr0llBvqv/4JRGSClZj7v5AAx
 /6a1ZP4KEfF059/VqFH7pukdU7gbbHX4YP6GmPdg88hPoB6p/WT6S7AjyS2czrTQWM2mfo
 +paPxC/N8UxVX/aXX8I8VV4D0aUrx8s=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-npRE6xgBOaWILxCqqW-xog-1; Tue, 22 Sep 2020 05:38:40 -0400
X-MC-Unique: npRE6xgBOaWILxCqqW-xog-1
Received: by mail-wm1-f72.google.com with SMTP id p20so448069wmg.0
 for <qemu-devel@nongnu.org>; Tue, 22 Sep 2020 02:38:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uGoTKRaUsmCpdbYmJ4H6EmDjhYZo5LVd9JG7R8kF4xQ=;
 b=esbGL7dnOVJ4yiLpXfaCBEbJimK4+xLSZ03v3Z9thhp+snyIS0FQiUHglQui2OyJFb
 j5Q3sMp+rFzFsAefOacRrxUhTTE/1uuZgPWrNjQWALTFf2ONdkn8dVOqnbQVU2lmfqTC
 82Av+5/598l1T8bAElV6kIFwuZM7S3aEa1FElKoQ1KHCwTFXTTz3qW9fu0Fj0N2wYhh6
 BIPy39fLl9vL4DeD3E/HJ/jtaWAlUJIC0+/QP+SFN1tbZevvtWujwK6ZZFkVWvLtX9u1
 I2u9Db36ZFChnvy1poGT2nFlTewHjkdI6NM5RAK9f9g+OduRyWiT3I50p+CdztRMBg9w
 At7A==
X-Gm-Message-State: AOAM530wlgBRryCmJxcykziwBi+9xzEa5WDN9sN++dAvuLh5neuGb3CV
 9A+XhTqTgDwRNeH29Oi9h2x7P2jYwP1hN4x/SJpVbGJqOqw3O2wCP9DWAANUTOTbSlhEIRTDQxp
 kZ63twngNwSvvKCg=
X-Received: by 2002:adf:e802:: with SMTP id o2mr4218182wrm.309.1600767519215; 
 Tue, 22 Sep 2020 02:38:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFlfFlHlEd9Wq/HNgFy7EK48yyyXR/nZzJfg0ZDBnvbwwb9B1Z/M1v/KXXEqGZA/a0PGGyaA==
X-Received: by 2002:adf:e802:: with SMTP id o2mr4218166wrm.309.1600767519048; 
 Tue, 22 Sep 2020 02:38:39 -0700 (PDT)
Received: from [192.168.10.165] ([93.56.170.5])
 by smtp.gmail.com with ESMTPSA id u2sm3458668wre.7.2020.09.22.02.38.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2020 02:38:38 -0700 (PDT)
Subject: Re: [PATCH 0/9] docs: Convert QOM documentation to kernel-doc + Sphinx
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
References: <20200910221526.10041-1-ehabkost@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <fed836d8-eb1c-fe43-135d-50ac2037f159@redhat.com>
Date: Tue, 22 Sep 2020 11:38:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200910221526.10041-1-ehabkost@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=207.211.31.81; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 04:19:36
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/09/20 00:15, Eduardo Habkost wrote:
> This converts the existing gtk-doc markup in object.h (that
> probably was never rendered into an actual document) to
> kernel-doc + Sphinx syntax, and reference them at
> docs/devel/qom.rst.
> 
> Eduardo Habkost (9):
>   qom: Document all function parameters in doc comments
>   qom: Use kernel-doc private/public tags in structs
>   qom: Use ``code`` Sphinx syntax where appropriate
>   qom: Add kernel-doc markup to introduction doc comment
>   qom: Reformat section titles using Sphinx syntax
>   qom: Indent existing code examples
>   qom: Add code block markup to all code blocks
>   docs: Create docs/devel/qom.rst
>   docs: Move object.h overview doc comment to qom.rst
> 
>  docs/devel/index.rst |   1 +
>  docs/devel/qom.rst   | 378 ++++++++++++++++++++++++++++++
>  include/qom/object.h | 547 ++++++++-----------------------------------
>  3 files changed, 475 insertions(+), 451 deletions(-)
>  create mode 100644 docs/devel/qom.rst
> 

Queued, thanks.

Paolo


