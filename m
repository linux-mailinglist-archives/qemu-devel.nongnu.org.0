Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1D36DF7D2
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 15:57:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmawy-0000Ti-1K; Wed, 12 Apr 2023 09:55:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pmawv-0000TT-Od
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 09:55:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pmawt-0000Ci-71
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 09:55:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681307746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Q2hQ4i498BJdY5vu8gQCL4Nof2hOJ/sCKRYBPnKZM8=;
 b=FbDM1uz2chz2NtnEoNESZWOw2CHYNVPEYyR+VmAFty5GBxiqxSFMcWQqjX/w9teYaI3x6a
 WlSZYSBbC6OvKB0aUCE1E2882GEBn8fC0s1tQOjghyBXHwunKbsTZ8BBPkFyLqJI5CoFBw
 VpAVbKKQ2lPcYJaM/lo2PAUTeoR5L+8=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-aTZAKSLJOP-cam3ys6VaHA-1; Wed, 12 Apr 2023 09:55:45 -0400
X-MC-Unique: aTZAKSLJOP-cam3ys6VaHA-1
Received: by mail-vs1-f72.google.com with SMTP id
 n9-20020a67d609000000b0042c6260e024so2497978vsj.21
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 06:55:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681307745; x=1683899745;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6Q2hQ4i498BJdY5vu8gQCL4Nof2hOJ/sCKRYBPnKZM8=;
 b=DFP1njRUExVCTyCrpBxB1yuWwlkkKU+woZVf8v/yx0UIpc0ZveuDl3Fye9KV2ouQzs
 2tsgk+fS6pLF0wbZe3UBYQzhrO/urCmR1WruH3O8F6fDI8KcAG5iSWFRtNgYKtN2SE++
 YZoY6Fuxpa+1FQ7QlxtEPX0TnEcXscFeQqXgCbplizKd5oO97ZW7turtKGFbrH757kYo
 pk4cHCRoR+bDLzFbZUu88gYE0RO5in5oi5jZ7ee4Psl/1BN17RTuKXt43zoy/BUuX3x2
 OsiriQ3I2RxMgn7EXehXrDvjBcmo58uQcpVJdtRcWzxg8KGrVgdEnEYJQrqw9RWUJfDc
 n1zw==
X-Gm-Message-State: AAQBX9cNm384rkIsvYtwmthstfztnZIifuPGy6pzAeBXupSp80AqEd7G
 fZKwzrSVs6vw3F8zTVtGwWPisOyyoW1X8itOK7kJxwQc0Sn9PO9XxXYuoeo3xB0VCIHVrYkkdR+
 BwmSy1CEbf/7+A1LjBV+UGiCJ6QdFnMQ=
X-Received: by 2002:a67:c20d:0:b0:42c:47fa:5b86 with SMTP id
 i13-20020a67c20d000000b0042c47fa5b86mr1362638vsj.1.1681307744723; 
 Wed, 12 Apr 2023 06:55:44 -0700 (PDT)
X-Google-Smtp-Source: AKy350a7FO6/hAaV7CyBUVOVcCKDnRpWMG5crLYqF5K304kxFCawmSb2DeMzZJ7EOJEKiAt3tKrP85XBepOwAHwWaps=
X-Received: by 2002:a67:c20d:0:b0:42c:47fa:5b86 with SMTP id
 i13-20020a67c20d000000b0042c47fa5b86mr1362625vsj.1.1681307744448; Wed, 12 Apr
 2023 06:55:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAEQMSUtx73GosLwzMLERTMkJ=eLiU5NbwZY1K0eOmFbJ-M=4Kw@mail.gmail.com>
 <87y1mxnvlo.fsf@linaro.org>
 <CABgObfZPZ9+CvpPOfaqgFa+hiqW-mYJZ_5AkJorujy0hMiwo6A@mail.gmail.com>
 <CAEQMSUua3kKCfT5yMOLOdT+t39zzRphKpZS0DXBQLPfFQs6i-g@mail.gmail.com>
In-Reply-To: <CAEQMSUua3kKCfT5yMOLOdT+t39zzRphKpZS0DXBQLPfFQs6i-g@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 12 Apr 2023 15:55:32 +0200
Message-ID: <CABgObfbgGvViSAx59e=qbmUc+VwTqsQ8ZEFTJsukQk+DahpVfA@mail.gmail.com>
Subject: Re: AVX-512 instruction set
To: Walid Ghandour <waleedjghandour@gmail.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Eduardo Habkost <eduardo@habkost.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Apr 12, 2023 at 3:41=E2=80=AFPM Walid Ghandour
<waleedjghandour@gmail.com> wrote:
> I will try to work on this.

Even if the individual tasks I listed are not enough to implement
AVX512, I suggest that you post individual pieces of work so that you
can somewhat pipeline the work.

Also, please review the design of the AVX decoder and the
implementation of the translation and the tests. You can find the
patches at https://patchew.org/QEMU/20221013214651.672114-1-pbonzini@redhat=
.com/
(patches 3-4-6-8 especially).

Paolo

> Regards,
> Walid
>
> Le mer. 12 avr. 2023 =C3=A0 15:30, Paolo Bonzini <pbonzini@redhat.com> a =
=C3=A9crit :
>>
>> On Wed, Apr 12, 2023 at 2:17=E2=80=AFPM Alex Benn=C3=A9e <alex.bennee@li=
naro.org> wrote:
>> > I don't think there is currently any active effort to add AVX512
>> > support. There have been various GSoC projects to improve the x86 SIMD
>> > emulation but I don't think they got merged.
>>
>> No, there isn't. However, the recent implementation of AVX in QEMU 7.2
>> is designed to make AVX512 at least doable.
>>
>> Adding support for AVX512 would be a very large work (at least 1
>> months full time plus time to get it merged), but not impossible. The
>> tasks could be something like this:
>>
>> 1. EVEX prefix decoding for AVX and AVX2 instructions
>> 2. operand broadcast
>> 3. VEX encoded mask instruction: kmov, kadd, kxnor, etc
>> 4. other instructions and permutations with mask operands and permutatio=
ns
>> 5. opmask support including merging and zeroing
>> 6. Disp8*N addressing mode
>> 7. rounding control and exception suppression
>>
>> It's important that, at any given step, the new functionality is
>> tested comprehensively.
>>
>> > > 62 f2 7d 48 18 0d fa 0c 00 00 vbroadcastss 0xcfa(%rip),%zmm1
>> > >
>> > > qemu: uncaught target signal 4 (Illegal instruction) - core dumped
>> > >
>> > > I like to add support for broadcast and fmadd avx 512 instructions s=
uch as the following one:
>> > >
>> > > 62 e2 7d 48 b8 c9     vfmadd231ps %zmm1,%zmm0,%zmm17
>>
>> Both of these are using a small subset of AVX512 (step 1 above). Both
>> vbroadcastss and vfmadd231ps are already implemented in QEMU, but not
>> using ZMM registers.
>>
>> Unfortunately the base AVX512 functionality is large, and therefore
>> the above tasks are all needed to claim support for AVX512. On the
>> other hand, for historical reasons AVX512BW and AVX512VL extensions
>> are separate but in practice they are easier to just implement at the
>> same time as basic AVX512; my expectation is that they would come up
>> almost for free with the rest of the work.
>>
>> Paolo
>>


