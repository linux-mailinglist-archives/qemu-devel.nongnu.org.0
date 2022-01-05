Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BA4485411
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 15:06:42 +0100 (CET)
Received: from localhost ([::1]:42348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n56w5-00030Z-Gi
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 09:06:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n56jG-0002sh-KK
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 08:53:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n56jC-0004sb-Qg
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 08:53:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641390799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vOpBdy5ANlt7eMrSdCDSnNAUBnUTwMLD/WGSGUXi9Uw=;
 b=JBU3aBiqLN8ADJEs31CSomUvSU1lpAzeIt/g9ZHelzy8XSSfpaf0xxqsi1f8slVMNlt7HW
 O6e53ACETJAT1/yYlPQOy89n5GkRx2enq4yZ3rkhUVGnWV2zJW3oQi2VPJ4CoO5ON/NzzD
 BZXza3AzLWWbDNKpGCcWk6rO3z5VWQo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-246-9lxk5A-0NGiMQVRKiTreFw-1; Wed, 05 Jan 2022 08:53:18 -0500
X-MC-Unique: 9lxk5A-0NGiMQVRKiTreFw-1
Received: by mail-wm1-f69.google.com with SMTP id
 v190-20020a1cacc7000000b0034657bb6a66so2860849wme.6
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 05:53:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vOpBdy5ANlt7eMrSdCDSnNAUBnUTwMLD/WGSGUXi9Uw=;
 b=Z6W/J+vmnic7yrvni8Ke7IH6nSO6pYqcjGq0CBBGdivYH0HTUwjHtXlFlihfp5qJPd
 TPlDEqSg15nbPeQ9RZjhyxccbBfG7uQbYx2vad1LCNA3ocTk9m7/9BIufFbfOyPKmgAF
 V6YcTGyJ7QcHgCwxhvIp7gADZ888Z6W0Kp9BmlGAWU+jAAkSk7lFWCLkqJZeLf3cyFqb
 IoPYJoFnUINTmIhtGmjXNk2cNbpA2MiqIhxaE7LY1MLbLFXgzfBk730F1028QKhJDhqk
 UcyWwRtV47pGyNSZDtcVToqtJYceNhU/QrTg2GzLYss8l+1WnpdVjYU55gBW8iuQR5jF
 8a3w==
X-Gm-Message-State: AOAM533lO4IHum3t5XgExb3A8opdpIKlSCNqLGqkwO/QMSUx6UPbp27N
 3acznTtL24/MsqAww4eiZidfd190q/bes107SynLMTkXRiTobnTYNQGzBqkuCav+DEPTSZda1Un
 KrgO/RNLxSpQYOtg=
X-Received: by 2002:a05:6000:1aca:: with SMTP id
 i10mr46141871wry.453.1641390797469; 
 Wed, 05 Jan 2022 05:53:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwjlXg5M3jySxAZSkM9JoziWc1eXIq/kNmtOrek1+UvmZ21GYzwG8AghNP+chgoOdzfOlD4mw==
X-Received: by 2002:a05:6000:1aca:: with SMTP id
 i10mr46141862wry.453.1641390797348; 
 Wed, 05 Jan 2022 05:53:17 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id l13sm46039210wrs.73.2022.01.05.05.53.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jan 2022 05:53:17 -0800 (PST)
Message-ID: <02e74087-fed3-86da-1987-77deadfbaa1a@redhat.com>
Date: Wed, 5 Jan 2022 14:53:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] ide: Explicitly poll for BHs on cancel
To: qemu-block@nongnu.org
References: <20220105111337.10366-1-hreitz@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220105111337.10366-1-hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.057, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05.01.22 12:13, Hanna Reitz wrote:

[...]

> Perhaps for a lack of being aware of all the kinds of tests we have, I
> found it impossible to write a reproducer in any of our current test
> frameworks: From how I understand the issue, to reproduce it, you need
> to issue a TRIM request and immediately cancel it, before
> ide_trim_bh_cb() (scheduled as a BH) can run.
>
> I wanted to do this via qtest, but that does not work, because every
> port I/O operation is done via a qtest command, and QEMU will happily
> poll the main context between each qtest command, which means that you
> cannot cancel an ongoing IDE request before a BH scheduled by it is run.
>
> Therefore, I wrote an x86 boot sector that sets up a no-op TRIM request
> (i.e. one where all TRIM ranges have length 0) and immediately cancels
> it by setting SRST.

I just realized we could, if we really wanted to, add this to the 
iotests’ sample_images directory, and then run it from an iotest...

Hanna


