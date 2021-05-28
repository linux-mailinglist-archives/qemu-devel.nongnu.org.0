Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D06B39451F
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 17:33:04 +0200 (CEST)
Received: from localhost ([::1]:44286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmeTv-0008Ah-FM
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 11:33:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lmeRz-0006oH-NC
 for qemu-devel@nongnu.org; Fri, 28 May 2021 11:31:05 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:43702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lmeRx-0004Lf-6O
 for qemu-devel@nongnu.org; Fri, 28 May 2021 11:31:03 -0400
Received: by mail-wr1-x42d.google.com with SMTP id v23so1361465wrd.10
 for <qemu-devel@nongnu.org>; Fri, 28 May 2021 08:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=uCASVUQIvHI5lYBO5Vhaed/m8mRBsJmKRC1WXrbWaQU=;
 b=hhEDfDXKztIc5uYpE1pnIRZbQj646bgGN4TfDso8YZunkzB5nf2EVBeKat77zzB4BK
 INFqkCfVGOyP+5/MGk3+FB4UBb7m95CPggrPLE9KhuGu/yNkkI9sELgTvBAUqSKjND8k
 of8fNKA1wEaAPRGcc2mP2+hxjij/IH6KzdKnyaCk3OOupE9rbwq0HtSGMjF8wmztEFXs
 GTeB0X6J004AqC7FLihJE+RXjb2qU4m8JPi7B2K+ndjN+7ttIJFYiGIkbDsBtOneGNi3
 MjnOPAsBAAGQ26E1sTxjbArZ4H/M2//XWUhrrkiq77SwHo7yEibF4OgEt2eX7bG4aQ0n
 jhQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=uCASVUQIvHI5lYBO5Vhaed/m8mRBsJmKRC1WXrbWaQU=;
 b=ZkP0HJ7Uu2du4BT2OqwPgpvC0tCKagtBJXKVCrXZxHm/Vqkv7erJGjJLkt/HNs8AUw
 kYsp1msuf7DlHi/25gXC/L9hTBRP7/rOi7Cr1gzqI2ob66ZbtvF/5MGEs2rf88c9PpYf
 GvTwEWEFFt/6brYEJcc5K8xg9YTg6wj38CLgeSA9ayK+KmIWNgdkH8rrGXp6m4aVnncQ
 ueWjMm6znH1dNbEMe6MSMNrn5rpQJbQOFeLHvhmou3iSKLB754hp4QEy5DAqQNOtilRS
 lLWnE1xQ5ZFwFp0nA17pBUnqThizx1o3OxC3lpRSBZ6Nh0QZvd/ycqLavkCvMrdvjlkm
 1u3w==
X-Gm-Message-State: AOAM532qrNfekVS7QQZY/SI93vdppEd/C1fZKUTh/zSHqJPBbrxuKbjA
 gsvQHynYGV0Dt/5Sl2px8lQCkg==
X-Google-Smtp-Source: ABdhPJxzVzq5E4sBzs8HLdIwPJFr39NUVVwViwgBgbQ/FP/UdIGOGzP8I8o3xmQhXAIYGFd4wBTpZA==
X-Received: by 2002:a05:6000:1ac7:: with SMTP id
 i7mr9645794wry.380.1622215859214; 
 Fri, 28 May 2021 08:30:59 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n7sm7257123wrx.7.2021.05.28.08.30.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 08:30:58 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 313991FF7E;
 Fri, 28 May 2021 16:30:57 +0100 (BST)
References: <20210527165034.23562-1-bruno.larsen@eldorado.org.br>
 <20210527191028.24febe7e@bahia.lan>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] HMP: added cpustats to removed_features.rst
Date: Fri, 28 May 2021 16:29:07 +0100
In-reply-to: <20210527191028.24febe7e@bahia.lan>
Message-ID: <87eedq27v2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org,
 luis.pires@eldorado.org.br, qemu-devel@nongnu.org,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Greg Kurz <groug@kaod.org> writes:

> On Thu, 27 May 2021 13:50:34 -0300
> "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br> wrote:
>
>> Documented the removal of the HMP command cpustats
>>=20
>
> It is the 'info cpustats' command.
>
>> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
>> ---
>>  docs/system/removed-features.rst | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>=20
>> diff --git a/docs/system/removed-features.rst b/docs/system/removed-feat=
ures.rst
>> index 5a462ac568..a88ff7aff4 100644
>> --- a/docs/system/removed-features.rst
>> +++ b/docs/system/removed-features.rst
>> @@ -249,6 +249,12 @@ Use ``migrate-set-parameters`` and ``info migrate-p=
arameters`` instead.
>>=20=20
>>  Use ``migrate-set-parameters`` instead.
>>=20=20
>> +``cpustats`` (removed in 6.1)
>> +'''''''''''''''''''''''''''''
>
> ditto
>
>> +
>> +This command didn't produce any output already. Removed to avoid expect=
ations
>> +of maintaining/fixing it.
>> +
>
> s/to avoid... it/with no replacement/ because that's what users
> are interested in.

We could point to alternatives:

  This command hasn't produced any output for some time and the build
  was broken anyway. If users are interested in gathering similar
  information in the future they should investigate collecting it with
  TCG plugins.

?

>
>>  Guest Emulator ISAs
>>  -------------------
>>=20=20


--=20
Alex Benn=C3=A9e

