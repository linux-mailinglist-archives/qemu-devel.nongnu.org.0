Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D623B0F52
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 23:17:24 +0200 (CEST)
Received: from localhost ([::1]:43716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvnlr-0008PR-D4
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 17:17:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lvnk6-0007Q0-7t
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 17:15:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lvnk1-00056b-S1
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 17:15:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624396528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eYV3749xyeF0wvsuFDZc4R7Y/n4xKR38W4LhX0kBE7M=;
 b=cTfcbYg26TyPVBPizTe15SsBFNYiWmJNsAWEKpY34RKIAPImmvxjEWlUhXqT7wWH86HrmQ
 YRNPkMRa2igEOEpi2Ae6TvsSv1H1lJ1G9N5VwRwjWYDExmgMxgbMPbXXMz0zeKVVzKAl8V
 NphGq6QzORAQsB7QQ3VBv4MkrGMZ3TQ=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-C6E-W3HPNbuFrcFA86sArA-1; Tue, 22 Jun 2021 17:15:24 -0400
X-MC-Unique: C6E-W3HPNbuFrcFA86sArA-1
Received: by mail-oo1-f71.google.com with SMTP id
 c25-20020a4a28590000b029024a664285fdso376554oof.23
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 14:15:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eYV3749xyeF0wvsuFDZc4R7Y/n4xKR38W4LhX0kBE7M=;
 b=hTCMPYZXTtnY2WLXIj6uDpnM/mHjJgrGGW0KY0YRjpCWCs7cfXXqpJlTqZCafG79Jf
 qFqIrWeovqQcBKZbMriC1bjNfzVcWhxyMYBUZOdVPCRNLHn2gs/RCVJYX8SIPuu8PNCd
 WVW03rHTRGBkCnaOmXzY7RwdhilATA27uqyc+gxa2XvtD+6Oa4OydycMkaxnH1hy1baG
 lpkLgb+8oMQKzzYpAUpaY9SLmFcqgQtmW6QNBtx7WjzKH0+3+h2aE6R5BPeplOlXChb7
 iT7+j/mkJYmsoQpgdvbv+wMHTMmwYmKpnBNjqq1tSuQiBQZq4ravASkpdLPfabIKVbRS
 l0kA==
X-Gm-Message-State: AOAM530v9bs6JcYYd+m0PPmyxXhS/v4fN5c+kNtyAIicMrDUgDOEj321
 EJto8mx7R2ysmf56ceUF29DjnFVdMnjnK3zSujdCIOabvIu0JrcF8rGMPkobjoB0zywW2qo9pD4
 tK2uHY8YRFgYV8mI=
X-Received: by 2002:a05:6820:315:: with SMTP id
 l21mr4963890ooe.32.1624396523652; 
 Tue, 22 Jun 2021 14:15:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSp8MigI9t7bRZAhxRiBZQPoMDlJdGBGqGiyLlDv6PuwN5Rbd5NTVE+z/SaCNOcVCa62uF9A==
X-Received: by 2002:a05:6820:315:: with SMTP id
 l21mr4963869ooe.32.1624396523442; 
 Tue, 22 Jun 2021 14:15:23 -0700 (PDT)
Received: from [192.168.0.173] (ip68-102-25-99.ks.ok.cox.net. [68.102.25.99])
 by smtp.gmail.com with ESMTPSA id
 w11sm731553oov.19.2021.06.22.14.15.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 14:15:22 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] sev/i386: Introduce sev_add_kernel_loader_hashes
 for measured linux boot
To: Dov Murik <dovmurik@linux.ibm.com>, qemu-devel@nongnu.org
References: <20210621190553.1763020-1-dovmurik@linux.ibm.com>
 <20210621190553.1763020-2-dovmurik@linux.ibm.com>
From: Connor Kuehl <ckuehl@redhat.com>
Message-ID: <de9d8cd5-fcc3-10d2-6dda-003e4ad5524d@redhat.com>
Date: Tue, 22 Jun 2021 16:15:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210621190553.1763020-2-dovmurik@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/21/21 2:05 PM, Dov Murik wrote:
> +static void fill_sev_hash_table_entry(SevHashTableEntry *e, const uint8_t *guid,
> +                                      const uint8_t *hash, size_t hash_len)
> +{
> +    memcpy(e->guid, guid, sizeof(e->guid));
> +    e->len = sizeof(*e);
> +    memcpy(e->hash, hash, hash_len);

Should this memcpy be constrained to MIN(sizeof(e->hash), hash_len)? Or
perhaps an assert statement since I see below that this function's
caller sets this to HASH_SIZE which is currently == sizeof(e->hash).

Actually, the assert statement would be easier to debug if the input
to this function is ever unexpected, especially since it avoids an
outcome where the input is silently truncated; which is a pitfall that
that the memcpy clamping would fall into.

Connor


