Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D7028F941
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Oct 2020 21:10:25 +0200 (CEST)
Received: from localhost ([::1]:46214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kT8ds-00050T-Be
	for lists+qemu-devel@lfdr.de; Thu, 15 Oct 2020 15:10:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kT8cN-0004BB-Jb
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 15:08:51 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:39153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kT8cL-0001zp-Qr
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 15:08:51 -0400
Received: by mail-wr1-x442.google.com with SMTP id y12so4977600wrp.6
 for <qemu-devel@nongnu.org>; Thu, 15 Oct 2020 12:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=fl5dU+rLEpgfw/u3WLX/HhMkyDNpNA+x4xu8mWlK6sY=;
 b=Pai3ITZv2+CBuNv1vSPiCJ42N6+pnIIVZtHmrlbcI4xqtP5/DbP5r5fivI2p3Rj/EE
 N14LphJTiTkgaBOvnFspPA572rnKvFqJkTz2beRjmV5VNzZKx3nPz9l2N3WQOx8l6O5w
 gZYwvnQUqiUhdHazqPYLzoZT/dsMbvQCJpfzGpG0ZA0tALM+p7wdO+2ua7/CDV+Tlwd7
 GMcV10jtGPc5R4YgBeAgmehrjBVgt00bSjuoGoNK0Gf6t7TSb0Kr2Ng2oBkVeoPSgFR0
 7sbeZOtAvlpj5BkRgV1/iiT67DKs1pwWr89XhvdZ74kP7gm88nKkM6sQIxOmdbDVpCYd
 ioPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=fl5dU+rLEpgfw/u3WLX/HhMkyDNpNA+x4xu8mWlK6sY=;
 b=ih37TZUMwGqSFi7wlwKxrx62YYyX+QTv++jaJeIeyEWUtGq8jzJZFSe1NVCqps+94i
 YI86apJajl29nl410vzAMJZlwfnjoPSoLWW42XAFXUgddgxMWt1SZ5P0IfB8bmjx6M/u
 Vz1MoXezTrRoW2ilMN9WlO6cmDH1soQK7C+eR1ogCpcIjLmz3GNEDO9zRlUAKqMPBaIb
 xQkZ/N/PWjEDSMxRAdsL2qI58fRx3qEEoYWQoVDXn94U/4rqgnoabCeIqFprhfXFDiJX
 UxR69g1hheH+6GxUzBqvfLrKnjdR+ZLWhzCtMxmJ8ScPuB8UOz2ZBbQvhooRX2RGYHE9
 /C1A==
X-Gm-Message-State: AOAM530qs0ojIejyi7Nws1wkYwWQr/z4kaWolZsFkRt7oGAQqUyBKyg+
 I3LO5CXJ+JDrYyx+VbSJr5hWwA==
X-Google-Smtp-Source: ABdhPJzI+J7PfH6b/wKVMElJ1++G3aKqIFV9mDWyHYV/ohXeR6FzQ96+O6zato4idNAeSfZSFIcHqw==
X-Received: by 2002:a5d:4c4b:: with SMTP id n11mr5774296wrt.171.1602788927696; 
 Thu, 15 Oct 2020 12:08:47 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e7sm368379wrm.6.2020.10.15.12.08.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2020 12:08:46 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A1A0F1FF7E;
 Thu, 15 Oct 2020 20:08:45 +0100 (BST)
References: <20200925152047.709901-1-richard.henderson@linaro.org>
 <20200925152047.709901-2-richard.henderson@linaro.org>
User-agent: mu4e 1.5.5; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 01/10] softfloat: Use mulu64 for mul64To128
In-reply-to: <20200925152047.709901-2-richard.henderson@linaro.org>
Date: Thu, 15 Oct 2020 20:08:45 +0100
Message-ID: <87pn5jwblu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: bharata@linux.ibm.com, qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Via host-utils.h, we use a host widening multiply for
> 64-bit hosts, and a common subroutine for 32-bit hosts.
>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

