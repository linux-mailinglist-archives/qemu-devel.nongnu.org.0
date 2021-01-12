Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7565F2F2939
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 08:52:09 +0100 (CET)
Received: from localhost ([::1]:39476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzETI-00033g-Hs
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 02:52:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kzEOt-0000Y6-A9
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 02:47:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kzEOr-00027K-Qk
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 02:47:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610437653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U58099DdeDZDRERrEK4a1uuAQGFt6XEIR2jbmXv4QsY=;
 b=OTe7IDMM3thp/oophC/yu6zWcL60USwRRniBlYLoE5rbCJeK1df+FQ+YT3zWffq5nKerjj
 /99zIJ6B4hGMc0BYQt0m+nelnrhn2wXk6Gnj8De8B6xmOLGrempO4xvuO6D1GMCDTqPnCy
 tmuftTzpFP9LReTlJGKe30Ta3WxjrUI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-AXJOimSDMrCLxgn8kvVUXw-1; Tue, 12 Jan 2021 02:47:31 -0500
X-MC-Unique: AXJOimSDMrCLxgn8kvVUXw-1
Received: by mail-wm1-f69.google.com with SMTP id l5so154874wmi.4
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 23:47:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=ZWsMhjnaAexaxrqMlZUmnIsorr1HTLO+5X/TaDVLIbM=;
 b=Nu4XugZO6IO3B5wIzv+zXY4V7SbKrjuFzsLXkbJFs3cWjEPS57/QkEcPqzrOFL7I3Y
 jCdbQZaObfnwB4xvusYw7Bps/GQTvDQUvcgUuVHnQS2X3P80GnND/49PIUcLw6WwQMGk
 N/pG4VtcJu5d6uLfx37s/L4UlFh2SGQLdmEUpyuwHPYUnZaGay0ss1CIizy3DWF2F1X9
 GdtPCI0RWjGPZq5bX8SbK7Yh7bpTcuwpB5wcsTTjpDSH1x0TOKOqJNqmiSANfCGWVvH7
 CYRdo29iKiA6VXSZRyQt15LjcDlgTmDqYfLSL27AxZ9U4SCa30mG9ZpU4Gx19EVHqzrB
 uD3g==
X-Gm-Message-State: AOAM5336yKwMxLVAvRpudJp9zTlA/BLsBOH4bwvB+HI58WQj1gJIx9XY
 ldVBZxjVTsYLWfyXJ6mt6jRXN0HUNtHfdpEPp2W5pvgWvnMpNrhQ3OMeBk4KTOH78EETJDh45Nd
 3YjhCODQya7HPYx8CBZEEh319MoE5LoNH06//GZkTec/jNC2JWaHt8//KFxXwKSM=
X-Received: by 2002:a1c:bd43:: with SMTP id n64mr2225936wmf.169.1610437650130; 
 Mon, 11 Jan 2021 23:47:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJygIu1pSiDiK5kPSUR7jlJOHG7XdVTVQwxt9mPrJzHEwlgxaHCtf52koqh0Fw5hqVYVBM224A==
X-Received: by 2002:a1c:bd43:: with SMTP id n64mr2225910wmf.169.1610437649772; 
 Mon, 11 Jan 2021 23:47:29 -0800 (PST)
Received: from [192.168.3.108] (p5b0c6897.dip0.t-ipconnect.de. [91.12.104.151])
 by smtp.gmail.com with ESMTPSA id f14sm3283479wre.69.2021.01.11.23.47.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 23:47:29 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v3 4/5] tests/tcg/s390x: Fix EXRL tests
Date: Tue, 12 Jan 2021 08:47:28 +0100
Message-Id: <0171718F-8768-49AB-8018-E1307AB19292@redhat.com>
References: <fdb64ad0-463a-3a35-e68d-4ce0d0de95b5@redhat.com>
In-Reply-To: <fdb64ad0-463a-3a35-e68d-4ce0d0de95b5@redhat.com>
To: Thomas Huth <thuth@redhat.com>
X-Mailer: iPhone Mail (18C66)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


> Am 12.01.2021 um 08:41 schrieb Thomas Huth <thuth@redhat.com>:
>=20
> =EF=BB=BFOn 11/01/2021 17.38, David Hildenbrand wrote:
>> The current EXRL tests crash on real machines: we must not use r0 as a b=
ase
>> register for trt/trtr, otherwise the content gets ignored. Also, we must
>> not use r0 for exrl, otherwise it gets ignored.
>> Let's use the "a" constraint so we get a general purpose register !=3D r=
0.
>> For op2, we can simply specify a memory operand directly via "Q" (Memory
>> reference without index register and with short displacement).
>> Fixes: ad8c851d2e77 ("target/s390x: add EX support for TRT and TRTR")
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>  tests/tcg/s390x/exrl-trt.c  | 8 ++++----
>>  tests/tcg/s390x/exrl-trtr.c | 8 ++++----
>>  2 files changed, 8 insertions(+), 8 deletions(-)
>> diff --git a/tests/tcg/s390x/exrl-trt.c b/tests/tcg/s390x/exrl-trt.c
>> index 3c5323aecb..16711a3181 100644
>> --- a/tests/tcg/s390x/exrl-trt.c
>> +++ b/tests/tcg/s390x/exrl-trt.c
>> @@ -19,7 +19,7 @@ int main(void)
>>      }
>>      asm volatile(
>>          "    j 2f\n"
>> -        "1:  trt 0(1,%[op1]),0(%[op2])\n"
>> +        "1:  trt 0(1,%[op1]),%[op2]\n"
>>          "2:  exrl %[op1_len],1b\n"
>>          "    lgr %[r1],%%r1\n"
>>          "    lgr %[r2],%%r2\n"
>> @@ -27,9 +27,9 @@ int main(void)
>>          : [r1] "+r" (r1),
>>            [r2] "+r" (r2),
>>            [cc] "=3Dr" (cc)
>> -        : [op1] "r" (&op1),
>> -          [op1_len] "r" (5),
>> -          [op2] "r" (&op2)
>> +        : [op1] "a" (&op1),
>> +          [op1_len] "a" (5),
>=20
> I think op1_len could still stay with "r" instead of "a" ... OTOH "a" als=
o does not hurt here, so:
>=20

No, otherwise exrl ignores the register content  if it ends up being r0.

Thanks!


> Reviewed-by: Thomas Huth <thuth@redhat.com>


