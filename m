Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B3442BFD4
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 14:23:58 +0200 (CEST)
Received: from localhost ([::1]:56452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1madIb-0005S9-JB
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 08:23:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1madG5-0003LK-DX
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 08:21:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1madG1-0004mm-W9
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 08:21:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634127672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XAl7xF1ePOftur3mM9pSZ5UJ3PI1LWaj4kdFlwRRiaA=;
 b=Ivb9Q7ssikaxw2BZi4f3AAGblk/kz8A5iLC//Slqw0pm6y8bhiv7dm4zev2s88PAF9NXEv
 5+lO5FXMCEa84PUjMI1F19uvzkYj9NC7iDWdJB2SYrrjQYXCO1f0xQR8L3h1uD1niVIgAt
 uHt+4Wau9quc5vGFjIu04nT8gAjoulw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-eCYdSUecMMSePLkeASox0g-1; Wed, 13 Oct 2021 08:21:10 -0400
X-MC-Unique: eCYdSUecMMSePLkeASox0g-1
Received: by mail-wr1-f71.google.com with SMTP id
 j19-20020adfb313000000b00160a9de13b3so1836475wrd.8
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 05:21:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XAl7xF1ePOftur3mM9pSZ5UJ3PI1LWaj4kdFlwRRiaA=;
 b=lI7Nhnt/ECjB2bFyF85yhuS1wFHNevOYHgZ2VI6QlRFtWhWQMnFkev2tKCdgvAUMeW
 XDinskpzIrgq8wmDusBS83JQx0h1iZKaBapleV/uw57dlPHdYccsNa37Va0GmJtNrJx/
 0hjr7IKpxIXHIvrIrOYrVaddpmDz3H8X81dAMl5mV/hPh9criRDonVuedjO8gIkmVHYe
 PgAigjr7h07ZcVKDgbl4DZXvxDfn4ke4yXTeHxkcjc/AB9MIkIO9dEK3sNaKLy7bO2bs
 VCRbsN8h5CBaPpD+ONwFxX2BJPhpEMyZjAJe9e4wM0qDjv8hhZCrlg5CJXwJUuoQCHEE
 M2uA==
X-Gm-Message-State: AOAM531YOE++In1a3pTDWwYpnnZx7cogJYJFmJOQdF0rUPkyJUv7CuFy
 uplko6G79/VabvXKP8LU9JiriLvPeZe9DWhu3PldDr8I0zAOREfrxZyHYFsn0YoQNBR7YqO5uPq
 d8pzYwhFBv4adMiQ=
X-Received: by 2002:adf:bd8a:: with SMTP id l10mr39195907wrh.159.1634127669735; 
 Wed, 13 Oct 2021 05:21:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLWcdvvtmTg0vrIuiNj0IHmYDJpKpBSGrn0WI3PVs9qJS2DeTqIQetakL/8eF5O0zV/8EqAg==
X-Received: by 2002:adf:bd8a:: with SMTP id l10mr39195884wrh.159.1634127669552; 
 Wed, 13 Oct 2021 05:21:09 -0700 (PDT)
Received: from ?IPV6:2a02:908:1e48:3780:4451:9a65:d4e9:9bb6?
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id k10sm12916131wrh.64.2021.10.13.05.21.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 05:21:09 -0700 (PDT)
Message-ID: <e877b7bb-5dbd-65ac-60a6-b3acb398d7fe@redhat.com>
Date: Wed, 13 Oct 2021 14:21:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 12/13] python: Add iotest linters to test suite
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20211004210503.1455391-1-jsnow@redhat.com>
 <20211004210503.1455391-13-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211004210503.1455391-13-jsnow@redhat.com>
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

On 04.10.21 23:05, John Snow wrote:
> Run mypy and pylint on the iotests files directly from the Python CI
> test infrastructure. This ensures that any accidental breakages to the
> qemu.[qmp|aqmp|machine|utils] packages will be caught by that test
> suite.
>
> It also ensures that these linters are run with well-known versions and
> test against a wide variety of python versions, which helps to find
> accidental cross-version python compatibility issues.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   python/tests/iotests-mypy.sh   | 4 ++++
>   python/tests/iotests-pylint.sh | 4 ++++
>   2 files changed, 8 insertions(+)
>   create mode 100755 python/tests/iotests-mypy.sh
>   create mode 100755 python/tests/iotests-pylint.sh

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


