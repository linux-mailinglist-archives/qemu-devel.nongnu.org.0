Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3850E695F16
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 10:27:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRraI-0001vi-7Z; Tue, 14 Feb 2023 04:26:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pRraG-0001vZ-4Y
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 04:26:44 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pRraE-0007xe-GT
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 04:26:43 -0500
Received: by mail-wr1-x436.google.com with SMTP id m10so6010778wrn.4
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 01:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iu1RxOH4qwBBylNhojctBdOtQ94jWZD2dkWUnIBV+aI=;
 b=Mopp3dq6W9664YVsgRr92mZQXE/Zi6Ng3UuL+A7jvvG8vqCVV283gc6gEN/6StSXNU
 PN6CEnqw0kdZL6KnKztQnhc0zAcx+f2LpVXHBAlOWyg4xv/kS01oEMQnB8Gz16CW9YVL
 Falv6t+Qv1BxJQqB/Vj3AKpTVHngeYFJW1zVFH/RHVvuJ/dT0h9j+rbAozuOCqYd0cIr
 zWWGnRnQsgXSzSlPY0mEvLycPmj0KrTqSuOevsceknrQTKX6XzeTHYV+MyW5PQ5zWBDf
 /5+QD/1NL193fVoeip1EnGFc0yCWxEmGiLTUH/1n6rJNwOnLn7iPVNq2LHG4pz1i/Mwo
 jYAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=iu1RxOH4qwBBylNhojctBdOtQ94jWZD2dkWUnIBV+aI=;
 b=R8HFn+IE8ZAjeCdsIQGDq6wLOzNHuQLLQsPc3ouZSJ1G5Q9Wi29jJULEU/+22qiImY
 4dXHyXGm9Bw9H+3X9QJehbpWhZT6Cgl7EVWOv40K4NNVd2qjcOeoI1AVX+AUr4O8527u
 mGfsOnyChm97zmepVAsnkNHR8uLIYw0G90ablDjjWa6dJWF/8VTbBZHsi1vhyTHzhhCd
 PlZnDsI89WDNF0ElnXv2jOn4i5eITz8LMjMxz8XHllIvFlOb3aL7ykDFDx8vvzXdEfGz
 46SoMOiOE4WkCrNQUiv0KW1k3LmCheqTNOY61OLcOz523+gpHE5nbbYRNdrZMajR+qLs
 YGyw==
X-Gm-Message-State: AO0yUKX0IFzY3FVVo1899XfM4zPCfHH4y2+VnrxIcwDFRMcfq6FDMpoC
 wZWkGaL3VoeYKMQ/oEcglBz0MQ==
X-Google-Smtp-Source: AK7set8xqYIJZX+l7BZjmtEcJTNm4Ll6sI7FiegjAcl1CmwbbXbfx+OBAxEM29q3rxXNMGc397DwVQ==
X-Received: by 2002:a5d:5917:0:b0:2c5:5630:585d with SMTP id
 v23-20020a5d5917000000b002c55630585dmr1462567wrd.27.1676366800710; 
 Tue, 14 Feb 2023 01:26:40 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a7bcb92000000b003c6bbe910fdsm19398153wmi.9.2023.02.14.01.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 01:26:40 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D9C021FFB7;
 Tue, 14 Feb 2023 09:26:39 +0000 (GMT)
References: <20230213125238.331881-1-iii@linux.ibm.com>
 <20230213125238.331881-2-iii@linux.ibm.com>
User-agent: mu4e 1.9.20; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?=
 <philmd@linaro.org>, Yanan Wang <wangyanan55@huawei.com>, Laurent Vivier
 <laurent@vivier.eu>, qemu-devel@nongnu.org, Christian Borntraeger
 <borntraeger@linux.ibm.com>
Subject: Re: [PATCH v2 1/4] linux-user: Always exit from exclusive state in
 fork_end()
Date: Tue, 14 Feb 2023 09:26:35 +0000
In-reply-to: <20230213125238.331881-2-iii@linux.ibm.com>
Message-ID: <87h6vobnsg.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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


Ilya Leoshkevich <iii@linux.ibm.com> writes:

> fork()ed processes currently start with
> current_cpu->in_exclusive_context set, which is, strictly speaking, not
> correct, but does not cause problems (even assertion failures).
>
> With one of the next patches, the code begins to rely on this value, so
> fix it by always calling end_exclusive() in fork_end().
>
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

