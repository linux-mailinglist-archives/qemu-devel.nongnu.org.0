Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADB132F2A4
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 19:35:15 +0100 (CET)
Received: from localhost ([::1]:51386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIFIA-00082R-EC
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 13:35:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lIEe3-00036Z-NR
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:53:47 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:55353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lIEe2-0002Zc-3G
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:53:47 -0500
Received: by mail-wm1-x332.google.com with SMTP id w7so2198359wmb.5
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 09:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Ma8Ip9UxdUXEslfNPdu9pqBG2V0EwLWeorRwMXY31Wo=;
 b=mX297YFSwwe5ABnaDQyLoM89LCbsSIIuMtwEGOw78hOeZIWbLF9/Kx+hryQYRhMWqK
 uD1CyMRcsilPeg21oTG2Op2QFi/cjHS6rDspcXt6hSIig2VnRXt6U+4khafEUYq6IttU
 QfZK1tMWzyxtEwbPyHSpxRby6x/yKjmaRdK62Jvoys8sIvU6AMa2AUpjJvjdBRYKd1dh
 aOz8pX44JenKkJNoqKwMQI3dJdnVc/ePu+Mo3uw6I1gvJ5UDHsIxM8mIZsCPlb7dXsRG
 zumTlVQfm4anphGMxPXuAu56ofqOB4P6F6+fp1mhUHoun04tpR2GIYQRwXF1XAZdAPum
 DCgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Ma8Ip9UxdUXEslfNPdu9pqBG2V0EwLWeorRwMXY31Wo=;
 b=DTEljG1G1MrndF3HIeupT+GGZLbFQsaEr+OU/0774YEtDjj1j1LNmo9kWrsboE5JD4
 PtJZNLHJg6741svjaxngHGGNk59iD3KjCCp9G+L6qgp6Bm4/6n0pL76pNDmVMkw4/lLQ
 Z4d2pGq94wcqUnmysOOCPc9FG6ImbzZtbdBaVSA3PlDpkrvoosNbQndQBrEsPW7LiMuZ
 YvElz6/kaZg4ceJZY9ziLAclKDWCyBjFZUM6z4V8pkVEzEqZHczzq2yHB2I28eg/bwD/
 5yRdhtPVGuIhfq2gb91F99qrKxRs0bjEkg7BRTWAQuyR7gwZ2vwProPg6FXlEgVpBXe+
 aLlg==
X-Gm-Message-State: AOAM532R0Gt99/+BDG5UUXQ0BzksvpzVzVw6CH/eUA81jgN1IbI/1t4m
 Z9/4BCg+Pk6ZF2rI/yv9JmmGUArO9CisJA==
X-Google-Smtp-Source: ABdhPJyHDaK+UGSXuLpi3AvcklzmiCPbBxXiIsnxbaETudvaM60F9rPJMbuG+KlGreFhi3Cg/T+Zzg==
X-Received: by 2002:a1c:9a47:: with SMTP id c68mr9833698wme.63.1614966824683; 
 Fri, 05 Mar 2021 09:53:44 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s8sm5566859wrn.97.2021.03.05.09.53.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 09:53:43 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 46ABF1FF91;
 Fri,  5 Mar 2021 17:53:42 +0000 (GMT)
References: <20210302175741.1079851-1-richard.henderson@linaro.org>
 <20210302175741.1079851-19-richard.henderson@linaro.org>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 18/27] tcg/tci: Reduce use of tci_read_r64
Date: Fri, 05 Mar 2021 17:53:37 +0000
In-reply-to: <20210302175741.1079851-19-richard.henderson@linaro.org>
Message-ID: <87v9a5cwrd.fsf@linaro.org>
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
Cc: qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> In all cases restricted to 64-bit hosts, tcg_read_r is
> identical.  We retain the 64-bit symbol for the single
> case of INDEX_op_qemu_st_i64.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

