Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B79DB63F7FD
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 20:16:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0p1O-0005T0-1J; Thu, 01 Dec 2022 14:14:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p0p1L-0005Sr-30
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 14:14:55 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p0p1J-0006Zj-EH
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 14:14:54 -0500
Received: by mail-wr1-x433.google.com with SMTP id y16so4405875wrm.2
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 11:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bd1414GlcXzOt9swK31bwuFzE+U11IfPYY8gQgUgioE=;
 b=XDapDdK0ZpsjF6Uo9Gy8Otzyb6IsP3MMx1wAgUHahyJ9k/VhY4z2nm4UgpTAaC6Uyk
 i2h797IKoQBNEjdAsgUsd6SgWyImsgenZI/jAg4Ratd1CyAZg75PquJ9LYqi9w11xIrh
 278lMzlBFJ11RTPNk4DWEhQo6XcSsTJ3G2RJGxkr2bKffw+SNrPCKSh7V+Fnih+6LT5B
 8DOBc/fRsjShhYOeEcvpmvkXnBsPoUVUIONbzxmdxaaawVxP2fabWdzD/4wSmtRKeI7m
 OmtKHO4mEYtELo7kE43BhWUafUlfnvWjkhXG2LmYM+uMgQGbCxcD5It8wu6xu5fdZoAc
 DHvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=bd1414GlcXzOt9swK31bwuFzE+U11IfPYY8gQgUgioE=;
 b=MgVAfdFB2p88SSTGicaGGNkHJhpRdTzOeamJRr846SNdoxoPfIISxbvQui9fdeu4aW
 b4WK66LHR/v09C+1pwDKmEioGugnkFiU70/OsB1HXNlcfnf488VKom0dlzqwe3dJPYX8
 AiNgs353heVm6PAURYphozAfYxwRbMV/9wHWdZbrK444UTuSXoxjRQhN2Gq1+/IWxSbk
 +BkSovv4MW8bOsJHRhSOa20f3j0e8sp3dg1NFS4F5RVi9ObHu2dcGzQlPgnQTHJfKvXH
 w/APfSFm70r209MEylihnIxAa1/7vVBxc+vi07Md7HeCWjTta+o9o+gYuPlX4jEmf00h
 x0Og==
X-Gm-Message-State: ANoB5pmC9fYy98qxR/iM2q4R3e3ce+nmg4kUggs9vo+Zd8nGoyDQsz3P
 K6o9fvHuojAjmer3hml3FBfdPw==
X-Google-Smtp-Source: AA0mqf7UNlpfgx8x9p/P1XeDy6yylhWvnp3o6Y/TYrvtIeTkOChjyyiStorzFOyIrDHn7AcvyLPq2A==
X-Received: by 2002:a5d:6081:0:b0:242:16ad:fb39 with SMTP id
 w1-20020a5d6081000000b0024216adfb39mr14237376wrt.359.1669922091475; 
 Thu, 01 Dec 2022 11:14:51 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a0560001b0600b002415dd45320sm5163104wrz.112.2022.12.01.11.14.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 11:14:50 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 65FE71FFB7;
 Thu,  1 Dec 2022 19:14:50 +0000 (GMT)
References: <20221006034421.1179141-1-richard.henderson@linaro.org>
 <20221006034421.1179141-25-richard.henderson@linaro.org>
 <20221130180703.dprt7lzmppgfihtp@heavy>
 <5f8d64c4-3ad0-2340-6fe0-86707b41980b@linaro.org>
User-agent: mu4e 1.9.3; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 24/26] tcg: Introduce tcg_temp_ebb_new_*
Date: Thu, 01 Dec 2022 19:13:56 +0000
In-reply-to: <5f8d64c4-3ad0-2340-6fe0-86707b41980b@linaro.org>
Message-ID: <87mt87aqc5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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


Richard Henderson <richard.henderson@linaro.org> writes:

> On 11/30/22 10:07, Ilya Leoshkevich wrote:
>> Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
>> While not directly related to this patch, it would be good to update
>> tcg/README with all the new kinds of temporaries. E.g. the EBB ones are
>> not mentioned there:
>>      TCG instructions operate on variables which are temporaries,
>> local
>>      temporaries or globals.
>
> Thanks for the review on this.
>
> I'm not sure I want to take this anymore.  It's confusing to use.  I
> really think what I should do instead is improve the TCG register
> allocator.

Whats the ultimate aim for the rewrite? Hold values in target registers
over the extended block? What about avoid spills between potential fault
points?

>
>
> r~


--=20
Alex Benn=C3=A9e

