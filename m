Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2901CB4D8
	for <lists+qemu-devel@lfdr.de>; Fri,  8 May 2020 18:19:08 +0200 (CEST)
Received: from localhost ([::1]:48740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jX5iN-0003M6-KV
	for lists+qemu-devel@lfdr.de; Fri, 08 May 2020 12:19:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jX5fU-00018Q-90
 for qemu-devel@nongnu.org; Fri, 08 May 2020 12:16:08 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:37445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jX5fK-0001Dt-1r
 for qemu-devel@nongnu.org; Fri, 08 May 2020 12:16:07 -0400
Received: by mail-wr1-x442.google.com with SMTP id k1so2552227wrx.4
 for <qemu-devel@nongnu.org>; Fri, 08 May 2020 09:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=sq+GoLjchynk8t32J+othXd0VgtvNDL6SGSvuKJcDng=;
 b=H9Nkyw5+XqBA1JIr8o30sY/nx/OhVQxlrbuoR1MttM6EFCEfrsxEphyBGQhcnE/ACR
 UIpXbYcfWEi99XSST3gN/Zz9/3rBpNrZOxtTBlGakuC9JbUIofvFT748bgGR+P8yV9VN
 Ha0wWQg9/XukoPnkrElvNORgnriuPwvh7+uwmrw+SCX7uMGj+wMy8FowaScdDwPL3wQU
 k504M6D/xHhzz/uPV8GvGDG+8/09ZtDPfX0MBek9W0DagABCiK4HzUkw3f0awHS1gDlo
 vYM2ZBRNv5eno/AWZAkpn6W+EXL5khZPMSMxxwWPBVmcLbK+iDwb6jqkreu3Lp1jB1Qx
 1pQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=sq+GoLjchynk8t32J+othXd0VgtvNDL6SGSvuKJcDng=;
 b=qBSiF0xIfA4jzEQv4tqrNB2NnOxi5dUuf37IEFBjp+c1pm3ksB/+hywwlI2+qLf4zd
 npfBG4FG4NQ9T2XN/luWKchJDFU1+zTTBgCbA4bQRgSX9RAYWjG4IERRMLIITG3sDArI
 Lk7IkUjNRdP85iHMS1UJXn1kpVuTPciiAVZaSWWdGhaGDGYWy7W7LZ6Z05V22HUD77dT
 E8ogHJNfClTryM80CkfypSPzYpBChWQ0BxexyN+6nsd93oqmMyPek3ExEufVIZ7yz3lh
 mHEDC5hKcPTYNJcdoJdMSdYJI6Smk1yZh+injRfJRNkgRgVhJk16StJNvjS/8ICClC98
 Qfqw==
X-Gm-Message-State: AGi0PuZ+WylPhzXr0bDVpUY1g+BVn3dJFExn678W5jVzIpGM1LVUxvDi
 uJXpFat3nClcXWQk0Rwv5N5OPw==
X-Google-Smtp-Source: APiQypKj7F/D+2EYwQKbjw9roNBX58RhacOmHX+xSeJy/gOE5dHRB9WRwZ1Qa7orTtQW6FiHYdFltQ==
X-Received: by 2002:a5d:5642:: with SMTP id j2mr3742750wrw.52.1588954556046;
 Fri, 08 May 2020 09:15:56 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x7sm13184688wmi.17.2020.05.08.09.15.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2020 09:15:53 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EE99E1FF7E;
 Fri,  8 May 2020 17:15:52 +0100 (BST)
References: <20200508151747.6166-1-richard.henderson@linaro.org>
User-agent: mu4e 1.4.4; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 00/19] tcg: Better handling of constants
In-reply-to: <20200508151747.6166-1-richard.henderson@linaro.org>
Date: Fri, 08 May 2020 17:15:52 +0100
Message-ID: <87pnbe4d3b.fsf@linaro.org>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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

> V3 fixes the target/sparc regression during register allocation.

Which patch has the fix in it? I couldn't see any per-patch rev notes.

Also I'm sure I reviewed a bunch of these, did they not count because I
found a bug ;-)

--=20
Alex Benn=C3=A9e

