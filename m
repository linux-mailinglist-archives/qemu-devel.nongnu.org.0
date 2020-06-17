Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9051F1FD166
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jun 2020 17:58:09 +0200 (CEST)
Received: from localhost ([::1]:38358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlaRq-00015P-T4
	for lists+qemu-devel@lfdr.de; Wed, 17 Jun 2020 11:57:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jlaQh-0000Kq-0z
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 11:56:47 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:52491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jlaQf-0006Q6-Ab
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 11:56:46 -0400
Received: by mail-wm1-x341.google.com with SMTP id r9so2356644wmh.2
 for <qemu-devel@nongnu.org>; Wed, 17 Jun 2020 08:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=yoQquuCYjDw4FDwopUEQOeBqQE58T/YaWKxPcD9oapo=;
 b=kF2PAsHZ6fCD3etNvQfXJaORlMNgBnN84sNRwAvNx5N1hktSB18Yo8+sNv8SffMdXJ
 NKTPhpPohWC0OAnet6rGXVG6saGHwMoCylrmuUALZLhCgEN47x5gbiMdXzLOTrLmW5VJ
 FQc1Aw8SjlxqQXV564bnf6MjYXCgGQptSOqaQOCyw2Yi0lsF+ErvsYdF45aZ2zMfGeTD
 lJHpn7CABmA0Okpy+ocIvMVWwGdhS6gUPgSmm9gTrxLXFdmBbrGC3e+PzLxaLsv7upa7
 zItfPvDlK/Mj+ArJ2doSsIfIb6un0KlkfMzkg0GGIkSgXXK5QRRfvlW8LrY+oEcTHZl/
 sq2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=yoQquuCYjDw4FDwopUEQOeBqQE58T/YaWKxPcD9oapo=;
 b=rNqKtUtV0XAzzsLwsBKvG5z+7znSgY35m7oBEY4zXCmlO/U6JKU2Sv/j+pIb4qbaV5
 i6AXB4KPHNp7CWipbVS2O9y4w+gi+9TzhnYBANzuCeFbhhg1vUnz3Ec/lUhbkSz69mL5
 p2Xbr9KLzCza0C2Vi2Id/F2fHJpHfTf0H3xkxcoVB1Wh4NOj2dHhwcHV2Zmoj/ndzB9R
 31BTGCKlXaKaL6nOanAqFq51GgUKBhYbWANPk4nmqzdMN8XugMOauHgb91cyfc0z49Ux
 b+2m4WQyuqEvmPUxhWFfAjfOYW45K6yV1zI3s1Uag8Hb5rOqJw9f7gQdyU0cF06Mubps
 FlWg==
X-Gm-Message-State: AOAM530OqZlutcTJsfowkOTsrj64TkOnHVO8+mosSwLvKJizbWuqyc99
 NfssGWIq6shrWdLWHZXdetytNA==
X-Google-Smtp-Source: ABdhPJz4DwlTOF4xeh42RaJYJyKEhmgBXkcIyj8GXfJrj4eP4aoQ+nAk/xtkzPwEGNBDLQsy0M3WwA==
X-Received: by 2002:a7b:c10c:: with SMTP id w12mr8642835wmi.132.1592409403701; 
 Wed, 17 Jun 2020 08:56:43 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l1sm37489wrb.31.2020.06.17.08.56.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 08:56:42 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B3D681FF7E;
 Wed, 17 Jun 2020 16:56:41 +0100 (BST)
References: <20200522160755.886-1-robert.foley@linaro.org>
 <20200522160755.886-2-robert.foley@linaro.org>
 <20200617142407.GH1728005@stefanha-x1.localdomain>
User-agent: mu4e 1.5.3; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Hajnoczi <stefanha@gmail.com>
Subject: Re: [PATCH 01/19] configure: add --enable-tsan flag + fiber
 annotations for coroutine-ucontext
In-reply-to: <20200617142407.GH1728005@stefanha-x1.localdomain>
Date: Wed, 17 Jun 2020 16:56:41 +0100
Message-ID: <87eeqdwurq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.puhov@linaro.org, Lingfeng Yang <lfy@google.com>, cota@braap.org,
 Robert Foley <robert.foley@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Stefan Hajnoczi <stefanha@gmail.com> writes:

> On Fri, May 22, 2020 at 12:07:37PM -0400, Robert Foley wrote:
>> +#define UC_DEBUG 0
>> +#if UC_DEBUG && defined(CONFIG_TSAN)
>> +#define UC_TRACE(fmt, ...) fprintf(stderr, "%s:%d:%p " fmt "\n", \
>> +    __func__, __LINE__, __tsan_get_current_fiber(), ##__VA_ARGS__);
>> +#else
>> +#define UC_TRACE(fmt, ...)
>> +#endif
>
> QEMU has tracing support, see docs/devel/tracing.txt. These fprintfs
> should be trace events defined in the util/trace-events file.

These got dropped on the final version. You might want to check against
the version I pulled:

  Subject: [PATCH v3 00/13] Add Thread Sanitizer support to QEMU
  Date: Tue,  9 Jun 2020 16:07:25 -0400
  Message-Id: <20200609200738.445-1-robert.foley@linaro.org>

--=20
Alex Benn=C3=A9e

