Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 963E5656D66
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Dec 2022 18:24:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pADfW-00023S-5Q; Tue, 27 Dec 2022 12:23:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pADfU-000235-DZ
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 12:23:12 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pADfS-0006wO-UK
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 12:23:12 -0500
Received: by mail-wm1-x32a.google.com with SMTP id ja17so9735321wmb.3
 for <qemu-devel@nongnu.org>; Tue, 27 Dec 2022 09:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=To5dGl4cZG2J8ORF7iOJBNxSFLT+55cRsOQPufl8xlc=;
 b=iAdgMPQxJgoPq1LObmFz239wSWpuDQNpSC5scxYd5v4zKa3jCXXvF9YXLnLYQBVPpV
 p8CZZRkdxHnr7exhUUEz4Za+FIk9nKNbK1ci8Sikl+p+yovZbrZHHPo3/i6Yg8uNR3w1
 fd9ogMoCPGaYvtbsEkQZ+DqIf3aEOBHui7DlGdTOLMEp9kjsBb3GF5yFmTi0u3GY5avb
 KKrxxQhev7P6tHWe8DjzRJKTxnxtIhfN9NwopPUJsdBt3e5iJGvPgHam8HVxqIWRejYQ
 wl80d846BgN6McnwZJVHiGt3gJTuXfve28c8oiAYt3nLDV6rRqBMbQ3IxbDIfmJxgPqs
 nkag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=To5dGl4cZG2J8ORF7iOJBNxSFLT+55cRsOQPufl8xlc=;
 b=P+4nesUwxdOdO9UutOlDoOYGN6bSL2eFwW8IXASzrxHa0FQxhBfTT9EcnkMsuwIg4b
 O7OwUgRWUx0xB1Ygs5W/7klIcrB6unPXMp5C4ET7zi9PbWSQBlASASM38WwvVXv/uKeq
 7rvudX3ve9vsaWWYdgacIhfWQUKP5GLZnLJJuDbXgdC3OoHTv5YWJ5hKQCBJXPgsxP7k
 /rdmsQEVaesTfxfzH3CGNLapcBLSV2x8NuakhemYJacDTohr1bNcX/f0ocTDgNTio0PZ
 QHo+i6/LYDYW28OLfA07IxHg3NbZpfk6tkASkmCaJ/VC34Xa+CNI0KFfbGHAdZBbKCMl
 6S7A==
X-Gm-Message-State: AFqh2kpk3eBtytZUdGmjBeCGMXb0ETzoTgMflME/16xqfNAe8E/GABVA
 fhd/pCMntfGs7ftjhyEV8agrQA==
X-Google-Smtp-Source: AMrXdXsf0iseg5/vm0hauWP4BShfW2iU9rrkZYcoLe+YiOyCEdMDMt907PTPHnDmsaQWXX9DuL76BA==
X-Received: by 2002:a7b:c8ca:0:b0:3cf:728e:c224 with SMTP id
 f10-20020a7bc8ca000000b003cf728ec224mr15911377wml.6.1672161788744; 
 Tue, 27 Dec 2022 09:23:08 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 q2-20020a1cf302000000b003d1cc0464a2sm17933916wmq.8.2022.12.27.09.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Dec 2022 09:23:08 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E86501FFB7;
 Tue, 27 Dec 2022 17:23:07 +0000 (GMT)
References: <20221224151821.464455-1-richard.henderson@linaro.org>
 <20221224151821.464455-5-richard.henderson@linaro.org>
User-agent: mu4e 1.9.7; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: iii@linux.ibm.com, qemu-devel@nongnu.org
Subject: Re: [PATCH 4/4] tests/tcg/multiarch: add vma-pthread.c
Date: Tue, 27 Dec 2022 17:23:03 +0000
In-reply-to: <20221224151821.464455-5-richard.henderson@linaro.org>
Message-ID: <873590n4lg.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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

> From: Ilya Leoshkevich <iii@linux.ibm.com>
>
> Add a test that locklessly changes and exercises page protection bits
> from various threads. This helps catch race conditions in the VMA
> handling.
>
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> Message-Id: <20221223120252.513319-1-iii@linux.ibm.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

