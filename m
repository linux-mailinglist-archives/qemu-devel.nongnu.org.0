Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 794C96F7963
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 00:49:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puhlM-0006ur-2X; Thu, 04 May 2023 18:49:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puhlJ-0006uP-9u
 for qemu-devel@nongnu.org; Thu, 04 May 2023 18:49:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puhlH-0000WV-FY
 for qemu-devel@nongnu.org; Thu, 04 May 2023 18:49:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683240558;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+3ekbnQ8XWaxZy5RSz16ZW4WUAMmhHljg1RFNru0SIE=;
 b=KDOxCS60Qdu5UPch/KeBPpzoUvxHbPNkyVtM5YgxUgL7FpBBPEVbLmhvJS5RIlcLfr6+TR
 XwdVqcy3C4Hv6+E45my4znqb4GQFtCiFda1IfSQb2+I4sWDczJSPlxd03EEtZRuVptFaB2
 qmsimyRQxv/1heGB19mmTl4X2TsrUdQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-8-oTTOA1QWNheEb48CGAorLQ-1; Thu, 04 May 2023 18:49:16 -0400
X-MC-Unique: oTTOA1QWNheEb48CGAorLQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f315735edeso50246625e9.1
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 15:49:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683240555; x=1685832555;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+3ekbnQ8XWaxZy5RSz16ZW4WUAMmhHljg1RFNru0SIE=;
 b=QCawHifHDqnkl7s8pyIq+pyza2ByDMYYYIrL+bPzicqSqZLdLTGKqMlBwg5VTMFRXl
 tBIv8yPn77vZ3ZKPEsTdtXfdkK3fGRmAmBy1cLllTT6qc+pRy5/Vz6fuBm+9KRVm3Ep1
 1hg+1oIkzIJdMfUbMNSO+clj8Ih0fRG6kNqt6KYxMMsc0hjyDZWwglaOUAs51W5shX8/
 J93MeV5Fg/My8mEuVXrJ2LpzUl3RnX+1Y+cH49WJc39cIzghY70vIFZQblx8K2zrnTZ8
 SCA6v5FIkupIN9EySELXpBADZZqW0Oxz4PGF2g/C05Alr7zHMo0lSt2e7nazO85q9q+v
 GsMg==
X-Gm-Message-State: AC+VfDwaj3XLyjjtolD9frAOarK56bbf31h/t8rvASVzlfKS83pcLHwi
 q02WxOBW9QxCkn6kfaSEjZD1kNG0s9Iy7gQEsXh9IhIeSDzU3aObXkjtps0GOhdWIMTUm13TfiY
 KHxxXqVXkecHDk18=
X-Received: by 2002:a05:600c:1da6:b0:3f0:a095:7b9 with SMTP id
 p38-20020a05600c1da600b003f0a09507b9mr232611wms.5.1683240555610; 
 Thu, 04 May 2023 15:49:15 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ48seO5WHySvc4tcGlm/Kfjb80FfgwgG6ue4kDke4DFfTHtcxQVpyff8UDT32rvlNXJ2+dUYw==
X-Received: by 2002:a05:600c:1da6:b0:3f0:a095:7b9 with SMTP id
 p38-20020a05600c1da600b003f0a09507b9mr232604wms.5.1683240555300; 
 Thu, 04 May 2023 15:49:15 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 w8-20020a1cf608000000b003f18b942338sm6102186wmc.3.2023.05.04.15.49.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 15:49:14 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  Daniel P . =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>, Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH] migration: Rename xbzrle_enabled xbzrle_started
In-Reply-To: <ZFO+lJoYweoLkkPw@x1n> (Peter Xu's message of "Thu, 4 May 2023
 10:17:56 -0400")
References: <20230504115323.24407-1-quintela@redhat.com> <ZFO+lJoYweoLkkPw@x1n>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 05 May 2023 00:49:13 +0200
Message-ID: <87354bpv9y.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
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

Peter Xu <peterx@redhat.com> wrote:
> On Thu, May 04, 2023 at 01:53:23PM +0200, Juan Quintela wrote:
>> Otherwise it is confusing with the function xbzrle_enabled().
>>=20
>> Suggested-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> ---
>>  migration/ram.c | 14 +++++++-------
>>  1 file changed, 7 insertions(+), 7 deletions(-)
>>=20
>> diff --git a/migration/ram.c b/migration/ram.c
>> index 43338e1f5b..06015eeb0b 100644
>> --- a/migration/ram.c
>> +++ b/migration/ram.c
>> @@ -388,8 +388,8 @@ struct RAMState {
>>      uint64_t xbzrle_pages_prev;
>>      /* Amount of xbzrle encoded bytes since the beginning of the period=
 */
>>      uint64_t xbzrle_bytes_prev;
>> -    /* Start using XBZRLE (e.g., after the first round). */
>> -    bool xbzrle_enabled;
>> +    /* Are we really  using XBZRLE (e.g., after the first round). */
>
> double spaces

Fixed.

>
>> +    bool xbzrle_started;
>
> Reviewed-by: Peter Xu <peterx@redhat.com>

Thanks.


