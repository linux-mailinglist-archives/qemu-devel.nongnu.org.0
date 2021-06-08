Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2374C39F5C9
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 13:56:12 +0200 (CEST)
Received: from localhost ([::1]:36348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqaL5-0008CM-86
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 07:56:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqaHQ-0004Y3-ER
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:52:24 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:36831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqaHN-00008i-O7
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:52:24 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 h11-20020a05600c350bb02901b59c28e8b4so1258485wmq.1
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 04:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=r/L9SJndbtdlh+0SWbRUP3MGc54lz0O2mvRRkvdyVGU=;
 b=NU1W5LZSRNARuDziWqmuE23SM9lCc0xFXC/ARnyR3CE+5+pApMkpfDlj29VMkNH1Vk
 ey575nrWuJE8auE8gtr45MXhAP93UvK8eR9IdHYFmWCzygSaL0DVeh/10fHf02XT7uoy
 tMc9cJoUCVea/apY7J+XBw8enOF101YLw5RYldVMTiwbjd5FquCJq9iDULi7drzSXRPr
 H5albAS0gxq5qEk1a0/63q5RZIqTMjKRqnkapqizcC6DSDUvCv05djgIz20KInJ7w3zX
 jPH04JmCIsi3z05FKesKgKU12+38XxX/FCqZQyrJvUJ1cYI02blJSfLy35g57tESiGoe
 9KCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=r/L9SJndbtdlh+0SWbRUP3MGc54lz0O2mvRRkvdyVGU=;
 b=OTMdQbq2rkk/CM2lrEo7lY0YqG7Q4Yn4P5Z99FtlTewfiRDlOtOTaJyk+XGs3qV1pX
 DETmASHPBicL8DkzgMqWTq+dpl76ItY5nYx8wO1yuHVpXffzgTFh/UqM3SCPZnf5oAM6
 B40Nc0ZD87uWlpw/gmCrj/pTvaZxSkOcVql089GpEvKQbyB8fukgR3bUBaO5UOOsPN0G
 B5VX3z6PmHxH9oMGFFFJZbNQSESmnldH9dFcJpzHgYy+nz329fEJon2V/W2H52iYcFex
 OKT4DghAmZUNKxC7hxuoAcuTErInNWEUjuqj+mYwAWhMzy5vsz4gBKoFA84/9g3BFe7e
 loSg==
X-Gm-Message-State: AOAM530S4SUrIXyywBP5Nen3Fndm6Se2oDAXVMhqGjraOS6WHu6i5Znk
 PXaRzsH41BLwA9TFCE6CmXPlDw==
X-Google-Smtp-Source: ABdhPJyc3UfApKO6I/Oe3MavPE+cPKOoMUYJom0ATZ6T/x8zCuKWQ8DJ0ZzlxxBc4WVjdHk9zmG+Vw==
X-Received: by 2002:a1c:193:: with SMTP id 141mr3813360wmb.106.1623153140390; 
 Tue, 08 Jun 2021 04:52:20 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m3sm20628629wrr.32.2021.06.08.04.52.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 04:52:19 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AA61A1FF7E;
 Tue,  8 Jun 2021 12:52:18 +0100 (BST)
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-12-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 11/28] tcg: Create tcg_init
Date: Tue, 08 Jun 2021 12:52:10 +0100
In-reply-to: <20210502231844.1977630-12-richard.henderson@linaro.org>
Message-ID: <87tum8lgjx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Perform both tcg_context_init and tcg_region_init.
> Do not leave this split to the caller.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

