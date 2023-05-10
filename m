Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCA46FE2CF
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 18:56:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwn5p-0003aL-Jw; Wed, 10 May 2023 12:55:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwn5m-0003a5-UW
 for qemu-devel@nongnu.org; Wed, 10 May 2023 12:55:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwn5l-0000yc-6T
 for qemu-devel@nongnu.org; Wed, 10 May 2023 12:55:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683737703;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=2AY/ICJd4BU64HpWp3l0IvbIHG8WFnQecVp6P0s/PlU=;
 b=S95qTFiWhSbXjJmsMqsMGi5fMD/gklr5b09iBOtgwEY3kLV4azVrTyh9lDB5aZT0mq9WdU
 EDYMRhI4wsaywtexHc7z/DtrubbWbhOCoECcVL0TwSv+9kgYMm1G8dHZsCvpYjd4w5VuKQ
 QJd9FWp/4e6q6IK1SS7bQUuLruIAlSY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-196-wcTha_zSMuaaQ9sxmYAIfg-1; Wed, 10 May 2023 12:55:02 -0400
X-MC-Unique: wcTha_zSMuaaQ9sxmYAIfg-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f453ff4cdfso5275425e9.2
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 09:55:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683737701; x=1686329701;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2AY/ICJd4BU64HpWp3l0IvbIHG8WFnQecVp6P0s/PlU=;
 b=AmIBL6XGT4Jjd3mMkqcPa3Ag73pO/Qu4tHgau+4ZCd9iLxJHSL8p8jBxJnXu/x8Bjy
 +j3jLAyQa2FwmKb2zGBieGPbEj0rBJqM3UbhgvfzA1/cbXamWfx2LyIbeC/3bQTCn9eJ
 jERtSBzgZ8QR3L5VIhvLtSLtnc2uLjGgHk83g9rdD1o2Vow5IORvrSVATwqq5VmCao9g
 UoX7PSfGewlnSzTqRKHNEyea9G2CEEf6neIxnIrM1n95xknRjXZ32W7Q8t9Ait+sEBDt
 FDYkYDjh81xWMPVqLmgy/PhSamzA7aUv08CqWJ7dGz31ej8rdSsziruQR/DhMiXcNFYo
 VbkQ==
X-Gm-Message-State: AC+VfDyGbU1zqPxauUL3I05PaaOkQCdvpbl/ErLWR9SFrqTsAXCgIYGX
 iaGhNc6vmUUEORN2QlBD30DCy4vhuhw1FMhKz/ccSnqgoXbsPYa+oCYYKoN0GTYpjNjjjMl1WlX
 UQCK162aJ8LXzsN4=
X-Received: by 2002:a7b:cc15:0:b0:3f4:16bc:bd1b with SMTP id
 f21-20020a7bcc15000000b003f416bcbd1bmr10429150wmh.39.1683737701376; 
 Wed, 10 May 2023 09:55:01 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ50jN4vVBR29edOm18M5IhcjmLJKXm15WGBLzzzr96SRraFBJG6qbQILjwXgtp6b6GmfOZzTQ==
X-Received: by 2002:a7b:cc15:0:b0:3f4:16bc:bd1b with SMTP id
 f21-20020a7bcc15000000b003f416bcbd1bmr10429138wmh.39.1683737701132; 
 Wed, 10 May 2023 09:55:01 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 n3-20020a7bc5c3000000b003f0b1b8cd9bsm23446369wmk.4.2023.05.10.09.54.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 09:54:59 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Andrei Gudkov <gudkov.andrei@huawei.com>
Cc: <qemu-devel@nongnu.org>,  <eblake@redhat.com>,  <armbru@redhat.com>,
 <berrange@redhat.com>,  <zhengchuan@huawei.com>
Subject: Re: [PATCH v2 1/4] migration/calc-dirty-rate: replaced CRC32 with
 xxHash
In-Reply-To: <cd115a89fc81d5f2eeb4ea7d57a98b84f794f340.1682598010.git.gudkov.andrei@huawei.com>
 (Andrei Gudkov's message of "Thu, 27 Apr 2023 15:42:57 +0300")
References: <cover.1682598010.git.gudkov.andrei@huawei.com>
 <cd115a89fc81d5f2eeb4ea7d57a98b84f794f340.1682598010.git.gudkov.andrei@huawei.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 10 May 2023 18:54:58 +0200
Message-ID: <87bkis6s9p.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Andrei Gudkov <gudkov.andrei@huawei.com> wrote:
> This significantly reduces overhead of dirty page
> rate calculation in sampling mode.
> Tested using 32GiB VM on E5-2690 CPU.
>
> With CRC32:
> total_pages=8388608 sampled_pages=16384 millis=71
>
> With xxHash:
> total_pages=8388608 sampled_pages=16384 millis=14
>
> Signed-off-by: Andrei Gudkov <gudkov.andrei@huawei.com>


Reviewed-by: Juan Quintela <quintela@redhat.com>

This changes nothing outside of dirtyrate, and if the hash function is
faster, we should be good.

queued.


